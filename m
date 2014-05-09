From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 May 2014 13:55:59 +0200
Subject: [Buildroot] [git commit] iptraf-ng: new package
Message-ID: <20140509115646.2F7239CB4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5ece69cd34ddbe5e28a97720decf353637b727f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs IPv6, doesn't need threads. Fix ncurses library handling]
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |    1 +
 package/iptraf-ng/Config.in    |   16 ++++++++++++++++
 package/iptraf-ng/iptraf-ng.mk |   15 +++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2da27ce..3bc8d24 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -933,6 +933,7 @@ source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
 source "package/ipset/Config.in"
 source "package/iptables/Config.in"
+source "package/iptraf-ng/Config.in"
 source "package/iputils/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
diff --git a/package/iptraf-ng/Config.in b/package/iptraf-ng/Config.in
new file mode 100644
index 0000000..fa369b3
--- /dev/null
+++ b/package/iptraf-ng/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_IPTRAF_NG
+	bool "iptraf-ng"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_PANEL
+	depends on BR2_INET_IPV6
+	help
+	  IPTraf-ng is a ncurses-based network monitoring utility. It gathers
+	  data like TCP connection packet and byte counts, interface statistics
+	  and activity indicators.
+
+	  https://fedorahosted.org/iptraf-ng/
+
+	  IPTraf-ng is a fork of original IPTraf v3.0.0 (http://iptraf.seul.org).
+
+comment "iptraf-ng needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/iptraf-ng/iptraf-ng.mk b/package/iptraf-ng/iptraf-ng.mk
new file mode 100644
index 0000000..ae69680
--- /dev/null
+++ b/package/iptraf-ng/iptraf-ng.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# iptraf-ng
+#
+################################################################################
+
+IPTRAF_NG_VERSION = 1.1.4
+IPTRAF_NG_SITE = https://fedorahosted.org/releases/i/p/iptraf-ng/
+IPTRAF_NG_LICENSE = GPLv2+
+IPTRAF_NG_LICENSE_FILES = LICENSE
+IPTRAF_NG_DEPENDENCIES = ncurses
+
+IPTRAF_NG_MAKE_ENV = NCURSES_LDFLAGS="-lpanel -lncurses"
+
+$(eval $(autotools-package))
