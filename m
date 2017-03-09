From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  9 Mar 2017 12:52:47 +0100
Subject: [Buildroot] [PATCH v3] boot/uboot: fix build for sunxi targets
Message-ID: <20170309115247.16981-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 2017.01 U-Boot needs to run the binman tool on the host machine
for building the 'u-boot-sunxi-with-spl.bin' target. The binman tool is written
in Python 2 and therefore needs a Python 2 interpreter. The python
scripts sets the shebang to: `#!/usr/bin/env python`. For modern Linux
distributions `python` is set to the Python 3 interpreter. In this
case, building U-Boot for a sunxi-based target fails:

```
  BINMAN  u-boot-sunxi-with-spl.bin
  File "./tools/binman/binman", line 49
    print result
               ^
SyntaxError: Missing parentheses in call to 'print'
make[1]: *** [Makefile:1090: u-boot-sunxi-with-spl.bin] Error 1
```

Add a post patch hook to force the shebang to python2 in case the binman
file exists.

Reported upstream:
https://lists.denx.de/pipermail/u-boot/2017-March/283164.html

Tested for U-Boot versions:
 * 2016.07 (no binman tool, custom version)
 * 2017.01 (binman tool, latest version)
 * 2017.03-rc3 (binman tool, custom version)

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v3:
 * use a post patch hook to support custom U-Boot versions (suggested by Thomas)
v2:
 * add patch to fix shebang instead of adding a host dependency for
   python (suggested by Peter Korsgaard)
---
 boot/uboot/uboot.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1e22eaa8e..bbf61fca5 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -36,6 +36,18 @@ BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 endif
 endif
 
+# The binman tool was introduced in version 2017.01. The tool is a set
+# python scripts and requires a python2 interpreter. Force the shebang
+# python2 to ensure the correct interpreter is used on host systems
+# where python defaults to the python3 interpreter. 
+define UBOOT_TRY_SED_SHEBANG_BINMAN
+	if test -f $(@D)/tools/binman/binman; then \
+		sed -i '1s_^\(#!/usr/bin/env \).*_\1python2_' \
+			$(@D)/tools/binman/binman; \
+	fi
+endef
+UBOOT_POST_PATCH_HOOKS += UBOOT_TRY_SED_SHEBANG_BINMAN
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_BIN),y)
 UBOOT_BINS += u-boot.bin
 endif
-- 
2.12.0
