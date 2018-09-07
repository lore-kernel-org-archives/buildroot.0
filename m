From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:15:56 -0000
Subject: [Buildroot] [git commit] tini: new package
Message-ID: <20180907111503.E62A87F950@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6098d2e498f8b76858e78cb0b10ae475ea14c96f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tini is a minimal init process to act as PID 1 for containers.

Note: it is not necessary to compile Tini statically for many
non-docker container environments, and Docker now statically links to
Tini internally (as of 1.13).

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Christian Stewart <christian@paral.in>
[Thomas: add entry to DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/tini/Config.in | 16 ++++++++++++++++
 package/tini/tini.hash |  3 +++
 package/tini/tini.mk   | 35 +++++++++++++++++++++++++++++++++++
 5 files changed, 56 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f96a18a5f7..f530158c21 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -471,6 +471,7 @@ F:	package/docker-proxy/
 F:	package/mosh/
 F:	package/rtl8821au/
 F:	package/runc/
+F:	package/tini/
 
 N:	Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 F:	package/drbd-utils/
diff --git a/package/Config.in b/package/Config.in
index 7a7142802a..7b4637900f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2019,6 +2019,7 @@ comment "Utilities"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
+	source "package/tini/Config.in"
 	source "package/tmux/Config.in"
 	source "package/which/Config.in"
 	source "package/xmlstarlet/Config.in"
diff --git a/package/tini/Config.in b/package/tini/Config.in
new file mode 100644
index 0000000000..235fc1a8fb
--- /dev/null
+++ b/package/tini/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_TINI
+	bool "tini"
+	help
+	  tini is a simple but valid init binary to
+	  act as PID 1 for containers.
+
+	  https://github.com/krallin/tini
+
+if BR2_PACKAGE_TINI
+
+config BR2_PACKAGE_TINI_MINIMAL
+	bool "build minimal variant"
+	help
+	  Disables argument parsing and verbose output.
+
+endif
diff --git a/package/tini/tini.hash b/package/tini/tini.hash
new file mode 100644
index 0000000000..34f919f068
--- /dev/null
+++ b/package/tini/tini.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	e5f46bca81266bdd511cf08018d66866870531794569c04f9b45f50dd23c28b0	LICENSE
+sha256	1097675352d6317b547e73f9dc7c6839fd0bb0d96dafc2e5c95506bb324049a2  tini-v0.18.0.tar.gz
diff --git a/package/tini/tini.mk b/package/tini/tini.mk
new file mode 100644
index 0000000000..132bfc99dd
--- /dev/null
+++ b/package/tini/tini.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# tini
+#
+################################################################################
+
+TINI_VERSION = v0.18.0
+TINI_SITE = $(call github,krallin,tini,$(TINI_VERSION))
+TINI_LICENSE = MIT
+TINI_LICENSE_FILES = LICENSE
+
+TINI_CFLAGS = $(TARGET_CFLAGS) \
+	-DTINI_VERSION=\"$(TINI_VERSION)\" \
+	-DTINI_GIT=\"\"
+
+ifeq ($(BR2_PACKAGE_TINI_MINIMAL),y)
+TINI_CFLAGS += -DTINI_MINIMAL
+endif
+
+define TINI_CONFIGURE_CMDS
+	printf "#pragma once\n" > $(@D)/src/tiniConfig.h
+endef
+
+define TINI_BUILD_CMDS
+	mkdir -p $(@D)/bin
+	$(TARGET_CC) $(TINI_CFLAGS) \
+		-o $(@D)/bin/tini $(@D)/src/tini.c
+endef
+
+define TINI_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/tini $(TARGET_DIR)/usr/bin/tini
+endef
+
+# Tini's CMakeLists.txt is not suitable for Buildroot.
+$(eval $(generic-package))
