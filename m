From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 15:47:09 +0200
Subject: [Buildroot] [git commit] log4cpp: new package
Message-ID: <20160611134803.D78E5805E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a4922c6b9bab00e1a9dc353d1c7f3d77bbc7044
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Damien Lanson <damien@kal-host.com>
[Thomas:
 - Rewrap Config.in help text.
 - Add missing new line at the end of the Config.in help text.
 - Use 80 # signs for the .mk file header.
 - Use <pkg>_SUBDIR = log4cpp instead of moving things around during the
   extract step.
 - Fix typo in the license (it's LGPL, not GLPL), and make it LGPLv2.1+,
   since it's what the HTML documentation says.
 - In addition to removing the log4cpp-config script from the target,
   tweak the variant installed in staging so that it behaves properly
   for cross-compilation. Unfortunately, the <pkg>_CONFIG_SCRIPTS
   generic mechanism doesn't work for this config script.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/log4cpp/Config.in    | 13 +++++++++++++
 package/log4cpp/log4cpp.hash |  3 +++
 package/log4cpp/log4cpp.mk   | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f9afbc0..bfad543 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1083,6 +1083,7 @@ menu "Logging"
 	source "package/liblog4c-localtime/Config.in"
 	source "package/liblogging/Config.in"
 	source "package/log4cplus/Config.in"
+	source "package/log4cpp/Config.in"
 	source "package/log4cxx/Config.in"
 	source "package/zlog/Config.in"
 endmenu
diff --git a/package/log4cpp/Config.in b/package/log4cpp/Config.in
new file mode 100755
index 0000000..8bae7a5
--- /dev/null
+++ b/package/log4cpp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LOG4CPP
+	bool "log4cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Log4cpp is library of C++ classes for flexible logging to
+	  files, syslog, IDSA and other destinations.  It is modeled
+	  after the Log4j Java library, staying as close to their API
+	  as is reasonable.
+
+	  http://log4cpp.sourceforge.net/
+
+comment "log4cpp needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/log4cpp/log4cpp.hash b/package/log4cpp/log4cpp.hash
new file mode 100755
index 0000000..6467aab
--- /dev/null
+++ b/package/log4cpp/log4cpp.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/log4cpp/files/log4cpp-1.1.x%20%28new%29/log4cpp-1.1/
+md5		1e173df8ee97205f412ff84aa93b8fbe	log4cpp-1.1.1.tar.gz
+sha1	23aa5bd7d6f79992c92bad3e1c6d64a34f8fcf68	log4cpp-1.1.1.tar.gz
diff --git a/package/log4cpp/log4cpp.mk b/package/log4cpp/log4cpp.mk
new file mode 100755
index 0000000..18cc6c8
--- /dev/null
+++ b/package/log4cpp/log4cpp.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# log4cpp
+#
+################################################################################
+
+LOG4CPP_VERSION_MAJOR = 1.1
+LOG4CPP_VERSION = $(LOG4CPP_VERSION_MAJOR).1
+LOG4CPP_SOURCE = log4cpp-$(LOG4CPP_VERSION).tar.gz
+LOG4CPP_SITE = http://downloads.sourceforge.net/project/log4cpp/log4cpp-1.1.x%20%28new%29/log4cpp-$(LOG4CPP_VERSION_MAJOR)
+LOG4CPP_SUBDIR = log4cpp
+# The "or later" is indicated in the HTML documentation
+LOG4CPP_LICENSE = LGPLv2.1+
+LOG4CPP_LICENSE_FILES = COPYING
+LOG4CPP_INSTALL_STAGING = YES
+
+# The default <pkg>_CONFIG_SCRIPTS handling does not apply
+define LOG4CPP_STAGING_CONFIG_SCRIPT_FIXUP
+	$(SED) 's,prefix="/usr",prefix="$(STAGING_DIR)/usr",' \
+		-e 's,exec_prefix="/usr",prefix="$(STAGING_DIR)/usr",' \
+		$(STAGING_DIR)/usr/bin/log4cpp-config
+endef
+
+LOG4CPP_POST_INSTALL_STAGING_HOOKS += LOG4CPP_STAGING_CONFIG_SCRIPT_FIXUP
+
+define LOG4CPP_TARGET_CONFIG_SCRIPT_REMOVE
+	$(RM) $(TARGET_DIR)/usr/bin/log4cpp-config
+endef
+
+LOG4CPP_POST_INSTALL_TARGET_HOOKS += LOG4CPP_TARGET_CONFIG_SCRIPT_REMOVE
+
+$(eval $(autotools-package))
