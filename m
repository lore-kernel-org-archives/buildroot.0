From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 21:35:19 +1300
Subject: [Buildroot] [git commit] sslh: new package
Message-ID: <20170127083709.DE03881911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddbc51b2478c9e62bdc084c7aaac973bb9824eb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
[Thomas:
 - fix download location
 - remove <pkg>_SOURCE variable, it was the default value
 - remove trailing space
 - keep only sha256 hash.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 ...ion-while-building-sslh-in-a-larger-git-t.patch | 43 +++++++++++++++++++
 package/sslh/Config.in                             | 14 +++++++
 package/sslh/S35sslh                               | 48 ++++++++++++++++++++++
 package/sslh/sslh.hash                             |  2 +
 package/sslh/sslh.mk                               | 26 ++++++++++++
 6 files changed, 134 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ae35c9b..f52a1eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1636,6 +1636,7 @@ endif
 	source "package/spice-protocol/Config.in"
 	source "package/squid/Config.in"
 	source "package/sshpass/Config.in"
+	source "package/sslh/Config.in"
 	source "package/strongswan/Config.in"
 	source "package/stunnel/Config.in"
 	source "package/tcpdump/Config.in"
diff --git a/package/sslh/0001-secure-version-while-building-sslh-in-a-larger-git-t.patch b/package/sslh/0001-secure-version-while-building-sslh-in-a-larger-git-t.patch
new file mode 100644
index 0000000..5cb8ce2
--- /dev/null
+++ b/package/sslh/0001-secure-version-while-building-sslh-in-a-larger-git-t.patch
@@ -0,0 +1,43 @@
+From 0c39699da9a3d6534b6d26e7c9686ee76d81b64a Mon Sep 17 00:00:00 2001
+From: David Bachelart <david.bachelart@bbright.com>
+Date: Thu, 26 Jan 2017 10:07:47 +0100
+Subject: [PATCH] fix version extraction when building in a larger git tree
+
+sslh uses host git to extract its own version number. In buildroot, this
+is an issue since extracted information is conflicting with buildroot git
+status if we use git as VCS for buildroot.
+
+Since these git calls are legitimate only if git is used for the sslh
+subtree only, this patch adds a check : a .git directory has to exist at
+the root of the project to enable git-extracted version string.
+
+Signed-off-by: David Bachelart <david.bachelart@bbright.com>
+---
+ genver.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/genver.sh b/genver.sh
+index 79fd0a0..051e57b 100755
+--- a/genver.sh
++++ b/genver.sh
+@@ -7,7 +7,7 @@ else
+ 	QUIET=0
+ fi
+ 
+-if ! `(git status | grep -q "On branch") 2> /dev/null`; then
++if [ ! -d .git ] || ! `(git status | grep -q "On branch") 2> /dev/null`; then
+         # If we don't have git, we can't work out what
+         # version this is. It must have been downloaded as a
+         # zip file. 
+@@ -25,7 +25,7 @@ if ! `(git status | grep -q "On branch") 2> /dev/null`; then
+         fi
+ fi
+ 
+-if head=`git rev-parse --verify HEAD 2>/dev/null`; then
++if [ -d .git ]??&& head=`git rev-parse --verify HEAD 2>/dev/null`; then
+ 	# generate the version info based on the tag
+ 	release=`(git describe --tags || git --describe || git describe --all --long) \
+ 		2>/dev/null | tr -d '\n'`
+-- 
+2.1.4
+
diff --git a/package/sslh/Config.in b/package/sslh/Config.in
new file mode 100644
index 0000000..21bd65f
--- /dev/null
+++ b/package/sslh/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_SSLH
+	bool "sslh"
+	depends on BR2_INSTALL_LIBSTDCPP
+	# uses fork()
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_LIBCONFIG
+	help
+	  Applicative protocol multiplexer
+
+	  http://www.rutschle.net/tech/sslh.shtml
+
+comment "sslh needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/sslh/S35sslh b/package/sslh/S35sslh
new file mode 100644
index 0000000..4a613f8
--- /dev/null
+++ b/package/sslh/S35sslh
@@ -0,0 +1,48 @@
+#!/bin/sh
+#
+# Starts the SSLH server
+#
+
+# default setup : listen on port 8090 forward ssh traffic to
+# localhost:22 and http traffic to localhost:80
+SSLH_ARGS="--listen 0.0.0.0:8090 --ssh 127.0.0.1:22 --http 127.0.0.1:80"
+
+# Allow a few customizations from a config file (overrides
+# default setup)
+test -r /etc/default/sslh && . /etc/default/sslh
+
+start() {
+	SSLH_ARGS="$SSLH_ARGS --user root"
+	echo -n "Starting sslh: "
+	start-stop-daemon -S -q -p /var/run/sslh.pid \
+		--exec /usr/sbin/sslh -- $SSLH_ARGS
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf "Stopping sslh: "
+	start-stop-daemon -K -q -p /var/run/sslh.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/sslh/sslh.hash b/package/sslh/sslh.hash
new file mode 100644
index 0000000..757005d
--- /dev/null
+++ b/package/sslh/sslh.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  1601a5b377dcafc6b47d2fbb8d4d25cceb83053a4adcc5874d501a2d5a7745ad    sslh-v1.18.tar.gz
diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
new file mode 100644
index 0000000..3177444
--- /dev/null
+++ b/package/sslh/sslh.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# sslh
+#
+################################################################################
+
+SSLH_VERSION = v1.18
+SSLH_SITE = http://www.rutschle.net/tech/sslh
+SSLH_LICENSE = GPLv2+
+SSLH_LICENSE_FILES = COPYING
+
+SSLH_DEPENDENCIES = libconfig
+
+define SSLH_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define SSLH_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define SSLH_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/sslh/S35sslh $(TARGET_DIR)/etc/init.d/S35sslh
+endef
+
+$(eval $(generic-package))
