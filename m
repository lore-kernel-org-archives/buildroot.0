From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 22:59:31 +0100
Subject: [Buildroot] [git commit] iftop: new package
Message-ID: <20130121220054.124E8818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30a198196a40ce469cc53f1e261a27acd35b8968
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added the iftop package which is really useful to see quickly
what uses the bandwidth on your machine.

[Peter: move to 'Networking applications', fix license]
Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/iftop/Config.in |   15 +++++++++++++++
 package/iftop/iftop.mk  |   15 +++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2bb3d29..39e2ec7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -637,6 +637,7 @@ source "package/httping/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/ifplugd/Config.in"
 endif
+source "package/iftop/Config.in"
 source "package/igh-ethercat/Config.in"
 source "package/inadyn/Config.in"
 source "package/iperf/Config.in"
diff --git a/package/iftop/Config.in b/package/iftop/Config.in
new file mode 100644
index 0000000..99ea973
--- /dev/null
+++ b/package/iftop/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_IFTOP
+	bool "iftop"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_LIBPCAP
+	depends on BR2_INET_IPV6
+	help
+	  iftop does for network usage what top(1) does for CPU usage.
+	  It listens to network traffic on a named interface and displays
+	  a table of current bandwidth usage by pairs of hosts. Handy for
+	  answering the question "why is our ADSL link so slow?".
+
+	  http://www.ex-parrot.com/pdw/iftop/
+
+comment "iftop requires IPv6 support in toolchain"
+	depends on !BR2_INET_IPV6
diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
new file mode 100644
index 0000000..f6f2af2
--- /dev/null
+++ b/package/iftop/iftop.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# iftop
+#
+#############################################################
+
+IFTOP_VERSION = 1.0pre2
+IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download/
+
+IFTOP_DEPENDENCIES = ncurses libpcap
+
+IFTOP_LICENSE = GPLv2+
+IFTOP_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
