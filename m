From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 15:33:58 +0200
Subject: [Buildroot] [git commit] elf2flt: fix build when LTO is enabled
Message-ID: <20150920133427.496827FA16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dab6765150e0eb5016869f3c0c0e0047745560e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elf2flt/elf2flt.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

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
