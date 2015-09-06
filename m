From: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Date: Sun,  6 Sep 2015 17:48:19 +0200
Subject: [Buildroot] [PATCH v2 2/3] elf2flt: fix build when LTO is enabled
In-Reply-To: <20150906152401.67d5df05@free-electrons.com>
References: <20150906152401.67d5df05@free-electrons.com>
Message-ID: <1441554499-23595-1-git-send-email-public.douglas.raillard@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Douglas RAILLARD <public.douglas.raillard@gmail.com>
---
 package/elf2flt/elf2flt.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 3fcada4..bec270b 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -21,6 +21,12 @@ HOST_ELF2FLT_CONF_OPTS = \
 	--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
 	--target=$(GNU_TARGET_NAME)
 
-HOST_ELF2FLT_CONF_ENV = LIBS=-lz
+HOST_ELF2FLT_LIBS = -lz
+
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+HOST_ELF2FLT_LIBS += -ldl
+endif
+
+HOST_ELF2FLT_CONF_ENV = LIBS="$(HOST_ELF2FLT_LIBS)"
 
 $(eval $(host-autotools-package))
-- 
2.5.1
