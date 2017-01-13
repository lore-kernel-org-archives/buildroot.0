From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 13 Jan 2017 01:04:28 +0100
Subject: [Buildroot] [PATCH] boot/uboot: fix build for sunxi targets
Message-ID: <20170113000428.4112-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 2017.01 U-Boot needs to run the binman tool on the host machine
for building the 'u-boot-sunxi-with-spl.bin' target. The binman tool is written
in Python 2 so we need to add the python host package when building this
target, otherwise the build fails:

```
  BINMAN  u-boot-sunxi-with-spl.bin
  File "./tools/binman/binman", line 49
    print result
               ^
SyntaxError: Missing parentheses in call to 'print'
make[1]: *** [Makefile:1090: u-boot-sunxi-with-spl.bin] Error 1
```

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 boot/uboot/uboot.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6b9d54454..02415ef63 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -280,6 +280,15 @@ endif
 UBOOT_DEPENDENCIES += host-uboot-tools
 endif
 
+# Since version 2017.01 U-Boot needs to run the binman tool on the host machine
+# for building the 'u-boot-sunxi-with-spl.bin' target. The binman tool is
+# written in Python 2 so we need to add the python host package here.
+ifeq ($(BR2_TARGET_UBOOT_SPL),y)
+ifeq ($(findstring u-boot-sunxi-with-spl.bin,$(BR2_TARGET_UBOOT_SPL_NAME)),u-boot-sunxi-with-spl.bin)
+UBOOT_DEPENDENCIES += host-python
+endif
+endif
+
 ifeq ($(BR2_TARGET_UBOOT)$(BR_BUILDING),yy)
 
 #
-- 
2.11.0
