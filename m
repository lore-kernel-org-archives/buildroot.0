From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 21:52:00 +0200
Subject: [Buildroot] [git commit] libglob: new package
Message-ID: <20161025195332.67A0F81789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26d2b410c0321782f6912d8125ace86811ded28e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libglob is the OpenBSD implementation of glob(3).

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas: slightly rework how the make targets are calculated.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/libglob/Config.in    |  4 ++++
 package/libglob/libglob.hash |  2 ++
 package/libglob/libglob.mk   | 48 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e8ec723..f90336b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1308,6 +1308,7 @@ menu "Other"
 	source "package/libffi/Config.in"
 	source "package/libgee/Config.in"
 	source "package/libglib2/Config.in"
+	source "package/libglob/Config.in"
 	source "package/libical/Config.in"
 	source "package/libite/Config.in"
 	source "package/liblinear/Config.in"
diff --git a/package/libglob/Config.in b/package/libglob/Config.in
new file mode 100644
index 0000000..029ed6a
--- /dev/null
+++ b/package/libglob/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_LIBGLOB
+	bool "libglob"
+	help
+	  OpenBSD implementation of glob(3).
diff --git a/package/libglob/libglob.hash b/package/libglob/libglob.hash
new file mode 100644
index 0000000..0b39407
--- /dev/null
+++ b/package/libglob/libglob.hash
@@ -0,0 +1,2 @@
+# Locally calculated:
+sha256  4f1b204dad065689941c64828a92441fb316c9c7539b39525fa728125da65e22  libglob-1.0.tar.gz
diff --git a/package/libglob/libglob.mk b/package/libglob/libglob.mk
new file mode 100644
index 0000000..534f936
--- /dev/null
+++ b/package/libglob/libglob.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# libglob
+#
+################################################################################
+
+LIBGLOB_VERSION = 1.0
+LIBGLOB_SITE = $(call github,voidlinux,libglob,$(LIBGLOB_VERSION))
+LIBGLOB_LICENSE = BSD-3c
+LIBGLOB_LICENSE_FILE = LICENSE
+LIBGLOB_INSTALL_STAGING = YES
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+LIBGLOB_MAKE_TARGETS += libglob.so
+# $1: destination directory
+define LIBGLOB_INSTALL_SHARED
+	$(INSTALL) -m 0755 -D $(@D)/libglob.so.0.0.0 \
+		$(1)/usr/lib/libglob.so.0.0.0
+	ln -sf libglob.so.0.0.0 $(1)/usr/lib/libglob.so.0
+	ln -sf libglob.so.0.0.0 $(1)/usr/lib/libglob.so
+endef
+endif
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+LIBGLOB_MAKE_TARGETS += libglob.a
+# $1: destination directory
+define LIBGLOB_INSTALL_STATIC
+	$(INSTALL) -m 0644 -D $(@D)/libglob.a $(1)/usr/lib/libglob.a
+endef
+endif
+
+define LIBGLOB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(LIBGLOB_MAKE_TARGETS)
+endef
+
+define LIBGLOB_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/glob.h \
+		$(STAGING_DIR)/usr/include/libglob/glob.h
+	$(call LIBGLOB_INSTALL_SHARED,$(STAGING_DIR))
+	$(call LIBGLOB_INSTALL_STATIC,$(STAGING_DIR))
+endef
+
+define LIBGLOB_INSTALL_TARGET_CMDS
+	$(call LIBGLOB_INSTALL_SHARED,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
