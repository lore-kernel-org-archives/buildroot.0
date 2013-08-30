From: Michael Rommel <rommel@layer-7.net>
Date: Fri, 30 Aug 2013 23:47:16 +0200
Subject: [Buildroot] [PATCH 1/1] knock: new package
Message-ID: <1377899236-1659-1-git-send-email-rommel@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

sorry for the last post, where I combined two separate packages in one
submission. I now moved them to different branches, cleaned up the 72
char line break as suggested in the other replies to submissions and
this hopefully is more in line with what you expect. Altered title as
well. The pyzmq package will follow shortly.

Cheers,

  Michael.


A port knocking implementation with daemon and user application.

Signed-off-by: Michael Rommel <rommel@layer-7.net>
---
 package/Config.in       |    2 ++
 package/knock/Config.in |   13 +++++++++++++
 package/knock/knock.mk  |   15 +++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/knock/Config.in
 create mode 100644 package/knock/knock.mk

diff --git a/package/Config.in b/package/Config.in
index 97cd7da..2f636b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -363,6 +363,7 @@ source "package/python-protobuf/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
+source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 source "package/python-thrift/Config.in"
@@ -754,6 +755,7 @@ source "package/ipset/Config.in"
 source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
+source "package/knock/Config.in"
 source "package/lighttpd/Config.in"
 source "package/linknx/Config.in"
 source "package/links/Config.in"
diff --git a/package/knock/Config.in b/package/knock/Config.in
new file mode 100644
index 0000000..f02ecc0
--- /dev/null
+++ b/package/knock/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_KNOCK
+	bool "knock"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  A port knocking implementation.
+	  Provides a daemon and a user application. Port knocking can be
+	  used to run an arbitrary application, once the daemon detects
+	  a predefined sequence of incoming TCP/UDP packets on a network
+	  interface. This can be used, e.g. to open up ports in a
+	  firewall.
+
+	  See also: http://www.zeroflux.org/projects/knock
+
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
new file mode 100644
index 0000000..4483e8f
--- /dev/null
+++ b/package/knock/knock.mk
@@ -0,0 +1,15 @@
+##########################################
+#
+# knock
+#
+##########################################
+
+KNOCK_VERSION=7666f2e86e18d482eaad5fe1fea46d87d80b0555
+KNOCK_SITE=https://github.com/jvinet/knock/tarball/master
+KNOCK_LICENSE = GPLv2
+KNOCK_LICENSE_FILES = COPYING
+KNOCK_AUTORECONF = YES
+KNOCK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-sbinPROGRAMS
+
+$(eval $(autotools-package))
+
-- 
1.7.9.5
