From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 16:45:27 +0100
Subject: [Buildroot] [PATCH v2] sslh: new package
In-Reply-To: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
References: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <1483371929-13907-6-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
Changes v1 -> v2:
  - Fix version in .mk file
  - Fix source url in .mk file
  - Fix hash file
---
 package/Config.in                               |  1 +
 package/sslh/0100-version-messup-with-git.patch | 47 +++++++++++++++++++++++++
 package/sslh/Config.in                          | 14 ++++++++
 package/sslh/S35sslh                            | 41 +++++++++++++++++++++
 package/sslh/sslh.default                       | 14 ++++++++
 package/sslh/sslh.hash                          |  4 +++
 package/sslh/sslh.mk                            | 29 +++++++++++++++
 7 files changed, 150 insertions(+)
 create mode 100644 package/sslh/0100-version-messup-with-git.patch
 create mode 100644 package/sslh/Config.in
 create mode 100644 package/sslh/S35sslh
 create mode 100644 package/sslh/sslh.default
 create mode 100644 package/sslh/sslh.hash
 create mode 100644 package/sslh/sslh.mk

diff --git a/package/Config.in b/package/Config.in
index 59fa851..ea1eb59 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1614,6 +1614,7 @@ endif
 	source "package/spice-protocol/Config.in"
 	source "package/squid/Config.in"
 	source "package/sshpass/Config.in"
+	source "package/sslh/Config.in"
 	source "package/strongswan/Config.in"
 	source "package/stunnel/Config.in"
 	source "package/tcpdump/Config.in"
diff --git a/package/sslh/0100-version-messup-with-git.patch b/package/sslh/0100-version-messup-with-git.patch
new file mode 100644
index 0000000..f4bc7c9
--- /dev/null
+++ b/package/sslh/0100-version-messup-with-git.patch
@@ -0,0 +1,47 @@
+diff --git a/genver.sh b/genver.sh
+index 4d6e76a..7e9176f 100755
+--- a/genver.sh
++++ b/genver.sh
+@@ -7,7 +7,7 @@ else
+ 	QUIET=0
+ fi
+ 
+-if ! `(git status | grep -q "On branch") 2> /dev/null`; then
++#if ! `(git status | grep -q "On branch") 2> /dev/null`; then
+         # If we don't have git, we can't work out what
+         # version this is. It must have been downloaded as a
+         # zip file. 
+@@ -23,20 +23,20 @@ if ! `(git status | grep -q "On branch") 2> /dev/null`; then
+             # release number
+             release=head-`perl -MPOSIX -e 'print strftime "%Y-%m-%d",localtime((stat "Makefile")[9])'`
+         fi
+-fi
+-
+-if head=`git rev-parse --verify HEAD 2>/dev/null`; then
+-	# generate the version info based on the tag
+-	release=`(git describe --tags || git --describe || git describe --all --long) \
+-		2>/dev/null | tr -d '\n'`
++#fi
+ 
+-	# Are there uncommitted changes?
+-	git update-index --refresh --unmerged > /dev/null
+-	if git diff-index --name-only HEAD | grep -v "^scripts/package" \
+-	    | read dummy; then
+-		release="$release-dirty"
+-	fi
+-fi
++#if head=`git rev-parse --verify HEAD 2>/dev/null`; then
++#	# generate the version info based on the tag
++#	release=`(git describe --tags || git --describe || git describe --all --long) \
++#		2>/dev/null | tr -d '\n'`
++#
++#	# Are there uncommitted changes?
++#	git update-index --refresh --unmerged > /dev/null
++#	if git diff-index --name-only HEAD | grep -v "^scripts/package" \
++#	    | read dummy; then
++#		release="$release-dirty"
++#	fi
++#fi
+ 
+ 
+ if [ $QUIET -ne 1 ]; then
diff --git a/package/sslh/Config.in b/package/sslh/Config.in
new file mode 100644
index 0000000..3794175
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
+comment "iperf needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/sslh/S35sslh b/package/sslh/S35sslh
new file mode 100644
index 0000000..63a16da
--- /dev/null
+++ b/package/sslh/S35sslh
@@ -0,0 +1,41 @@
+#!/bin/sh
+#
+# Starts the SSLH server
+#
+
+NAME=sslh
+DAEMON=/usr/sbin/$NAME
+PIDFILE=/var/run/$NAME.pid
+
+. /etc/default/sslh
+
+start()
+{
+	echo -n "Starting $NAME: "
+	start-stop-daemon -S -q --exec $DAEMON -- $DAEMON_OPTS --pidfile $PIDFILE && echo "OK" || echo "Failed"
+}
+
+stop()
+{
+	echo -n "Stopping $NAME: "
+	start-stop-daemon -K -q -x $DAEMON && echo "OK" || echo "Failed"
+	rm -f $PIDFILE
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart|reload)
+		stop
+		start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/sslh/sslh.default b/package/sslh/sslh.default
new file mode 100644
index 0000000..2d2a1b1
--- /dev/null
+++ b/package/sslh/sslh.default
@@ -0,0 +1,14 @@
+# Default options for sslh initscript
+# sourced by /etc/init.d/sslh
+
+# Disabled by default, to force yourself
+# to read the configuration:
+# - /usr/share/doc/sslh/README.Debian (quick start)
+# - /usr/share/doc/sslh/README, at "Configuration" section
+# - sslh(8) via "man sslh" for more configuration details.
+# Once configuration ready, you *must* set RUN to yes here
+# and try to start sslh (standalone mode only)
+
+RUN=yes
+
+DAEMON_OPTS="--user root --listen 0.0.0.0:8090 --ssh 127.0.0.1:22 --http 127.0.0.1:80"
diff --git a/package/sslh/sslh.hash b/package/sslh/sslh.hash
new file mode 100644
index 0000000..4560b84
--- /dev/null
+++ b/package/sslh/sslh.hash
@@ -0,0 +1,4 @@
+# Locally computed
+md5 0e3568d5d234516c634d4df156473298    sslh-v1.18.tar.gz
+sha1    b2e3a4314f62fc8200ecfbadefebe809a84d8099    sslh-v1.18.tar.gz
+sha256  1601a5b377dcafc6b47d2fbb8d4d25cceb83053a4adcc5874d501a2d5a7745ad    sslh-v1.18.tar.gz
diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
new file mode 100644
index 0000000..962300f
--- /dev/null
+++ b/package/sslh/sslh.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# sslh
+#
+################################################################################
+
+SSLH_VERSION = 1.18
+SSLH_SITE = http://www.rutschle.net/tech/sslh
+SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz
+SSLH_LICENSE = GPL-v2+
+SSLH_LICENSE_FILES = COPYING
+
+SSLH_DEPENDENCIES = libconfig
+
+define SSLH_BUILD_CMDS
+  $(TARGET_MAKE_ENV) make CC=$(TARGET_CC) -C $(SSLH_DIR)
+endef
+
+define SSLH_INSTALL_TARGET_CMDS
+  $(INSTALL) -m 755 -D $(@D)/sslh-fork $(TARGET_DIR)/usr/sbin/sslh
+  $(INSTALL) -m 644 -D package/sslh/sslh.default $(TARGET_DIR)/etc/default/sslh
+endef
+
+define SSLH_INSTALL_INIT_SYSV
+  $(INSTALL) -m 755 -D package/sslh/S35sslh $(TARGET_DIR)/etc/init.d/S35sslh
+endef
+
+$(eval $(generic-package))
+
-- 
2.1.4
