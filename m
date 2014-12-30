From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Dec 2014 23:22:08 +0100
Subject: [Buildroot] [PATCH 2/4] package/libssp-fake: new package
In-Reply-To: <cover.1419977553.git.yann.morin.1998@free.fr>
References: <cover.1419977553.git.yann.morin.1998@free.fr>
Message-ID: <f20710e06eef8ad48d635c71ab3ad74c1218cab3.1419977553.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This installs a fake, empty libssp for those packages (mostly
proprietary) that want to link with -lssp or -lssp_nonshared.

This is a prompt-less symbol, because it should only be selected
when the toolchain does not have it (i.e. it is provided by the
C library).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/libssp-fake/Config.in      | 12 ++++++++++
 package/libssp-fake/libssp-fake.mk | 47 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 package/libssp-fake/Config.in
 create mode 100644 package/libssp-fake/libssp-fake.mk

diff --git a/package/Config.in b/package/Config.in
index 3b37bb2..21f34b3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -914,6 +914,7 @@ menu "Other"
 	source "package/libseccomp/Config.in"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
+	source "package/libssp-fake/Config.in"
 	source "package/libtasn1/Config.in"
 	source "package/libtpl/Config.in"
 	source "package/libubox/Config.in"
diff --git a/package/libssp-fake/Config.in b/package/libssp-fake/Config.in
new file mode 100644
index 0000000..cac5269
--- /dev/null
+++ b/package/libssp-fake/Config.in
@@ -0,0 +1,12 @@
+# This is a no-prompt package, because it is automatically selected
+# by the toolchains that need it.
+# We need the sumbol for legal-info.
+config BR2_PACKAGE_LIBSSP_FAKE
+	bool
+	default y if !BR2_TOOLCHAIN_HAS_LIBSSP
+	help
+	  This installs a fake (aka empty) libssp.
+
+	  Usually, SSP support is provided by the C library, but some
+	  programs may insist on linking to libssp, most notably because
+	  they also link to a pre-built library that is linked to libssp.
diff --git a/package/libssp-fake/libssp-fake.mk b/package/libssp-fake/libssp-fake.mk
new file mode 100644
index 0000000..2c52a94
--- /dev/null
+++ b/package/libssp-fake/libssp-fake.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# libssp
+#
+################################################################################
+
+LIBSSP_FAKE_SOURCE =
+LIBSSP_FAKE_INSTALL_STAGING = YES
+
+# We'll be handling the dependency ourselves, since we want to be built
+# after any toolchain backend, but we are a dependency of the virtual
+# package 'toolchain'.
+LIBSSP_FAKE_ADD_TOOLCHAIN_DEPENDENCY = NO
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+LIBSSP_FAKE_DEPENDENCIES = toolchain-buildroot
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+LIBSSP_FAKE_DEPENDENCIES = toolchain-external
+endif
+
+# Build both static and shared variants
+define LIBSSP_FAKE_BUILD_CMDS
+	$(TARGET_AR) rcs $(@D)/libssp_nonshared.a /dev/null
+	$(TARGET_CC_NOCCACHE) -shared -fPIC -Wl,-soname,libssp.so.1 -o $(@D)/libssp.so.1 -x c /dev/null
+endef
+
+# Install the non-shared variant in staging, so programs can link to it
+# at build time. Provide a variant without the _nonshared extension for
+# those that are brain-damaged enough to link with -lssp.
+#
+# Since they are really empty libraries, we do not need to condition the
+# install with the usual BR2_STATIC_LIBS or BR2_SHARED_STATIC_LIBS; neither
+# of them would add any code whatsoever to anything that links to either.
+define LIBSSP_FAKE_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/libssp_nonshared.a $(STAGING_DIR)/usr/lib/libssp_nonshared.a
+	ln -sf libssp_nonshared.a $(STAGING_DIR)/usr/lib/libssp.a
+endef
+
+# Install the shared variant in target, so pre-built binaries can link to it
+# at runtime, but only if we want shared library support.
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+define LIBSSP_FAKE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/libssp.so.1 $(TARGET_DIR)/usr/lib/libssp.so.1
+endef
+endif
+
+$(eval $(generic-package))
-- 
1.9.1
