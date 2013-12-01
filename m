From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  1 Dec 2013 20:13:38 +0100
Subject: [Buildroot] [PATCH] crda: fix static build failure
Message-ID: <1385925218-640-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libnl-3 uses threads and this isn't accounted for in crda or
libnl-3*.pc files since crda doesn't use pkg-config.

Since linking order matters for static scenarios also throw in -lnl-3
into NLLIBS first since it gets appended to in crda makefiles to add
libnl-3.

libgcrypt depends on libgpg-error and this isn't accounted for in
crda makefile, but it is in libgcrypt-config script (in the correct
order for static linking), so set LDLIBS calling this script.

Fixes:
  http://autobuild.humanoidz.org/results/31c/31c54e16b60f41e2aa9ea6cd43ced694d3ce3ce0/
  http://autobuild.humanoidz.org/results/a45/a4548583aa63fbf6db9dbdf7e1556b0d23800de5/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/crda/crda.mk | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index 44fd0f2..ce87d44 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -12,8 +12,22 @@ CRDA_DEPENDENCIES = host-pkgconf host-python-m2crypto \
 CRDA_LICENSE = ISC
 CRDA_LICENSE_FILES = LICENSE
 
+# libnl-3 needs -lm (for rint) and -lpthread if linking statically.
+# And library order matters hence stick -lnl-3 first since it's appended
+# in the crda Makefiles as in NLLIBS+=-lnl-3 ... thus failing.
+#
+# libgcrypt needs -lgpg-error if linking statically, which is correctly
+# set by the libgcrypt-config script (and in the right order).
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+CRDA_NLLIBS += -lnl-3 -lm -lpthread
+CRDA_LDLIBS += `$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`
+endif
+
 define CRDA_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) all_noverify -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) \
+		LDLIBS="$(CRDA_LDLIBS)" \
+		NLLIBS="$(CRDA_NLLIBS)" \
+		$(MAKE) all_noverify -C $(@D)
 endef
 
 define CRDA_INSTALL_TARGET_CMDS
-- 
1.8.4.2
