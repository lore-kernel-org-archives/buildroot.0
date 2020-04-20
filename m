From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 09:53:05 +0200
Subject: [Buildroot] [git commit] package/apparmor: new package
Message-ID: <20200420075435.9215F8EA89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=007ee0765e649d7b6f14fb4f2545cff833f1d2e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The various AppArmor utilities are spread in a few sub-directories of
the apparmor source tree. For now, we build only the parser, but we'll
soon introduce support for a few other utilities, so we prepare the
package to be able to build more than just the parser, hence the
slightly convoluted build and install commands, and the use of the
APPARMOR_TOOLS and APPARMOR_MAKE_OPTS variables, which will come handy
in the following commits.

We must ensure the version matches that of libapparmor, but there is not
much we can do to enforce that, so as we do for various other packages,
we just add a comment to that effect.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998 at free.fr:
  - make it a separate package
  - split into its own patch, write a commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/Config.in                  |  1 +
 package/apparmor/Config.in         | 25 ++++++++++++++++++++
 package/apparmor/apparmor.hash     |  4 ++++
 package/apparmor/apparmor.mk       | 48 ++++++++++++++++++++++++++++++++++++++
 package/libapparmor/libapparmor.mk |  1 +
 5 files changed, 79 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index abe49cac3a..a9c6f6fcbc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2260,6 +2260,7 @@ menu "Real-Time"
 endmenu
 
 menu "Security"
+	source "package/apparmor/Config.in"
 	source "package/checkpolicy/Config.in"
 	source "package/ima-evm-utils/Config.in"
 	source "package/optee-benchmark/Config.in"
diff --git a/package/apparmor/Config.in b/package/apparmor/Config.in
new file mode 100644
index 0000000000..e219507803
--- /dev/null
+++ b/package/apparmor/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_APPARMOR
+	bool "apparmor"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libapparmor
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libapparmor
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16 # libapparmor
+	select BR2_PACKAGE_LIBAPPARMOR
+	help
+	  AppArmor is an effective and easy-to-use Linux application
+	  security system. AppArmor proactively protects the operating
+	  system and applications from external or internal threats,
+	  even zero-day attacks, by enforcing good behavior and
+	  preventing even unknown application flaws from being
+	  exploited.
+
+	  This package builds the parser (which can load profiles).
+
+	  http://wiki.apparmor.net
+
+comment "apparmor needs a toolchain w/ headers >= 3.16, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
new file mode 100644
index 0000000000..91ab51f6ab
--- /dev/null
+++ b/package/apparmor/apparmor.hash
@@ -0,0 +1,4 @@
+# locally computed
+sha256  267053234c68cdb122c5294d7c276b6e2f5fa7e75c6c2d23e3ce69f95d9a7639  apparmor-2.13.3.tar.gz
+sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
+sha256  dd54950fa69a3096fe907a466a454d217ccca9bca77398d5232704766d5a0040  parser/COPYING.GPL
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
new file mode 100644
index 0000000000..cab37d06a6
--- /dev/null
+++ b/package/apparmor/apparmor.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# apparmor
+#
+################################################################################
+
+# When updating the version here, please also update the libapparmor package
+APPARMOR_VERSION_MAJOR = 2.13
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).3
+APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION)/+download
+APPARMOR_DL_SUBDIR = libapparmor
+APPARMOR_LICENSE = GPL-2.0
+APPARMOR_LICENSE_FILES = LICENSE parser/COPYING.GPL
+
+APPARMOR_DEPENDENCIES = libapparmor
+
+APPARMOR_TOOLS = parser
+APPARMOR_MAKE_OPTS = USE_SYSTEM=1
+
+define APPARMOR_BUILD_CMDS
+	$(foreach tool,$(APPARMOR_TOOLS),\
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D)/$(tool) $(APPARMOR_MAKE_OPTS)
+	)
+endef
+
+define APPARMOR_INSTALL_TARGET_CMDS
+	$(foreach tool,$(APPARMOR_TOOLS),\
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D)/$(tool) $(APPARMOR_MAKE_OPTS) \
+			DESTDIR=$(TARGET_DIR) install
+	)
+endef
+
+# Despite its name, apparmor.systemd is a sysv-init compatible startup script
+define APPARMOR_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(@D)/parser/apparmor.systemd \
+		$(TARGET_DIR)/etc/init.d/S00apparmor
+endef
+
+define APPARMOR_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0755 $(@D)/parser/apparmor.systemd \
+		$(TARGET_DIR)/lib/apparmor/apparmor.systemd
+	$(INSTALL) -D -m 0755 $(@D)/parser/apparmor.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/apparmor.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 188ccc0db5..98037c64a6 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating the version here, please also update the apparmor package
 LIBAPPARMOR_VERSION_MAJOR = 2.13
 LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).3
 LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
