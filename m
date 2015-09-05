From: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Date: Sat,  5 Sep 2015 18:33:29 +0200
Subject: [Buildroot] [PATCH 2/3] Fix elf2flt build when LTO is enabled
Message-ID: <1441470809-23403-1-git-send-email-public.douglas.raillard@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Douglas RAILLARD <public.douglas.raillard@gmail.com>
---
 package/elf2flt/elf2flt.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 3fcada4..d028259 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -21,6 +21,12 @@ HOST_ELF2FLT_CONF_OPTS = \
 	--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
 	--target=$(GNU_TARGET_NAME)
 
+
 HOST_ELF2FLT_CONF_ENV = LIBS=-lz
 
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+	HOST_ELF2FLT_CONF_ENV = LIBS="-lz -ldl"
+endif
+
+
 $(eval $(host-autotools-package))
-- 
2.5.1
