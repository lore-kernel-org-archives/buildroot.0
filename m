From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 22:58:52 +0100
Subject: [Buildroot] [git commit] checkpolicy: new package
Message-ID: <20150108215942.6E21E805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37d78971061754b9101a9e19739ce4906ae29506
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Indicate in the Config.in help text that this policy compiler is
   SELinux related.
 - Rewrap Config.in help text and remove trailing white space.
 - Add a comment in the .mk file to indicate why we're passing
   DESTDIR= at build time.]

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host               |    1 +
 package/checkpolicy/Config.in.host   |   10 ++++++++++
 package/checkpolicy/checkpolicy.hash |    2 ++
 package/checkpolicy/checkpolicy.mk   |   27 +++++++++++++++++++++++++++
 4 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 9b127c8..94981ad 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+	source "package/checkpolicy/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
diff --git a/package/checkpolicy/Config.in.host b/package/checkpolicy/Config.in.host
new file mode 100644
index 0000000..240a5b6
--- /dev/null
+++ b/package/checkpolicy/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_CHECKPOLICY
+	bool "host checkpolicy"
+	help
+	  checkpolicy is the SELinux policy compiler. It uses libsepol
+	  to generate the binary policy. checkpolicy uses the static
+	  libsepol since it deals with low level details of the policy
+	  that have not been encapsulated/abstracted by a proper
+	  shared library interface.
+
+	  http://selinuxproject.org/page/Main_Page
diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
new file mode 100644
index 0000000..32b5ff6
--- /dev/null
+++ b/package/checkpolicy/checkpolicy.hash
@@ -0,0 +1,2 @@
+# https://github.com/SELinuxProject/selinux/wiki/Releases
+sha256 e6a0ac539b74859b4262b317eb90d9914deb15e7aa509659f47724d50fe2ecc6  checkpolicy-2.1.12.tar.gz
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
new file mode 100644
index 0000000..4b7b2f3
--- /dev/null
+++ b/package/checkpolicy/checkpolicy.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# checkpolicy
+#
+################################################################################
+
+CHECKPOLICY_VERSION = 2.1.12
+CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
+CHECKPOLICY_LICENSE = GPLv2
+CHECKPOLICY_LICENSE_FILES = COPYING
+
+HOST_CHECKPOLICY_DEPENDENCIES = host-libselinux host-flex host-bison
+
+HOST_CHECKPOLICY_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
+	LEX="$(HOST_DIR)/usr/bin/flex" \
+	YACC="$(HOST_DIR)/usr/bin/bison -y"
+
+# DESTDIR is used at build time to find host-libselinux
+define HOST_CHECKPOLICY_BUILD_CMDS
+	$(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_CHECKPOLICY_INSTALL_CMDS
+	$(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(HOST_DIR) install
+endef
+
+$(eval $(host-generic-package))
