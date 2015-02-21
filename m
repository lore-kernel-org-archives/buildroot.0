From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 21 Feb 2015 09:45:29 -0300
Subject: [Buildroot] [PATCH] iodine: new package
Message-ID: <1424522729-22692-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                  |  1 +
 .../iodine/0001-disable-systemd-and-selinux.patch  | 29 ++++++++++++++++++++++
 package/iodine/Config.in                           |  9 +++++++
 package/iodine/iodine.hash                         |  2 ++
 package/iodine/iodine.mk                           | 21 ++++++++++++++++
 5 files changed, 62 insertions(+)
 create mode 100644 package/iodine/0001-disable-systemd-and-selinux.patch
 create mode 100644 package/iodine/Config.in
 create mode 100644 package/iodine/iodine.hash
 create mode 100644 package/iodine/iodine.mk

diff --git a/package/Config.in b/package/Config.in
index a93faab..2894379 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1102,6 +1102,7 @@ endif
 	source "package/igh-ethercat/Config.in"
 	source "package/igmpproxy/Config.in"
 	source "package/inadyn/Config.in"
+	source "package/iodine/Config.in"
 	source "package/iperf/Config.in"
 	source "package/iperf3/Config.in"
 	source "package/iproute2/Config.in"
diff --git a/package/iodine/0001-disable-systemd-and-selinux.patch b/package/iodine/0001-disable-systemd-and-selinux.patch
new file mode 100644
index 0000000..965abb7
--- /dev/null
+++ b/package/iodine/0001-disable-systemd-and-selinux.patch
@@ -0,0 +1,29 @@
+Disable selinux and systemd support since they check for host headers.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura iodine-0.7.0.orig/src/osflags iodine-0.7.0/src/osflags
+--- iodine-0.7.0.orig/src/osflags	2015-02-20 14:59:00.799958145 -0300
++++ iodine-0.7.0/src/osflags	2015-02-20 15:05:54.791135141 -0300
+@@ -18,8 +18,8 @@
+ 		;;
+ 		Linux)
+ 			FLAGS="";
+-			[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -lselinux";
+-			[ -e /usr/include/systemd/sd-daemon.h ] && FLAGS="$FLAGS -lsystemd-daemon";
++			#[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -lselinux";
++			#[ -e /usr/include/systemd/sd-daemon.h ] && FLAGS="$FLAGS -lsystemd-daemon";
+ 			echo $FLAGS;
+ 		;;
+ 	esac
+@@ -34,8 +34,8 @@
+ 		;;
+ 		Linux)
+ 			FLAGS="-D_GNU_SOURCE"
+-			[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -DHAVE_SETCON";
+-			[ -e /usr/include/systemd/sd-daemon.h ] && FLAGS="$FLAGS -DHAVE_SYSTEMD";
++			#[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -DHAVE_SETCON";
++			#[ -e /usr/include/systemd/sd-daemon.h ] && FLAGS="$FLAGS -DHAVE_SYSTEMD";
+ 			echo $FLAGS;
+ 		;;
+ 	esac
diff --git a/package/iodine/Config.in b/package/iodine/Config.in
new file mode 100644
index 0000000..6962cb8
--- /dev/null
+++ b/package/iodine/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_IODINE
+	bool "iodine"
+	select BR2_PACKAGE_ZLIB
+	help
+	  iodine lets you tunnel IPv4 data through a DNS server.
+	  This can be usable in different situations where
+	  internet access is firewalled, but DNS queries are allowed.
+
+	  http://code.kryo.se/iodine/
diff --git a/package/iodine/iodine.hash b/package/iodine/iodine.hash
new file mode 100644
index 0000000..94eb5aa
--- /dev/null
+++ b/package/iodine/iodine.hash
@@ -0,0 +1,2 @@
+# From http://code.kryo.se/iodine/
+md5	fdbf3b81cd69caf5230d76a8b039fd99	iodine-0.7.0.tar.gz
diff --git a/package/iodine/iodine.mk b/package/iodine/iodine.mk
new file mode 100644
index 0000000..57deb9e
--- /dev/null
+++ b/package/iodine/iodine.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# iodine
+#
+################################################################################
+
+IODINE_VERSION = 0.7.0
+IODINE_SITE = http://code.kryo.se/iodine
+IODINE_DEPENDENCIES = zlib
+IODINE_LICENSE = MIT
+IODINE_LICENSE_FILES = README
+
+define IODINE_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" ARCH=$(BR2_ARCH) -C $(@D)
+endef
+
+define IODINE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install DESTDIR="$(TARGET_DIR)" prefix=/usr
+endef
+
+$(eval $(generic-package))
-- 
2.0.5
