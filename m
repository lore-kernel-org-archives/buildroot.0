From: Frank Bergmann <frank@frajasalo.de>
Date: Sun, 16 Feb 2014 23:16:34 +0100
Subject: [Buildroot] [PATCH 1/1] crda: fix build failure for nios2
Message-ID: <530138C2.7010109@frajasalo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgcrypt depends on libgpg-error and this isn't accounted for in
crda makefile, but it is in libgcrypt-config script (in the correct
order for linking), so set LDLIBS calling this script not only for
static linking.

Fixes http://autobuild.buildroot.org/results/156/15656ef0187b0a8db6c66fc7a7fcb58a99999fa1

Signed-off-by: Frank Bergmann <frank@frajasalo.de>
---
  package/crda/crda.mk |    6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index ce87d44..c7e9b2d 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -16,12 +16,12 @@ CRDA_LICENSE_FILES = LICENSE
  # And library order matters hence stick -lnl-3 first since it's appended
  # in the crda Makefiles as in NLLIBS+=-lnl-3 ... thus failing.
  #
-# libgcrypt needs -lgpg-error if linking statically, which is correctly
-# set by the libgcrypt-config script (and in the right order).
  ifeq ($(BR2_PREFER_STATIC_LIB),y)
  CRDA_NLLIBS += -lnl-3 -lm -lpthread
-CRDA_LDLIBS += `$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`
  endif
+# libgcrypt needs -lgpg-error, which is correctly
+# set by the libgcrypt-config script (and in the right order).
+CRDA_LDLIBS += `$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`

  define CRDA_BUILD_CMDS
         $(TARGET_CONFIGURE_OPTS) \
-- 
1.7.10.4
