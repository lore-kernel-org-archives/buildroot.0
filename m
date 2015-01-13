From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Jan 2015 10:49:29 -0300
Subject: [Buildroot] [PATCH] iptables: disable connlabel support for static
	builds
Message-ID: <1421156969-30375-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's an extension so it needs libdl and hence breaks. Fixes:
http://autobuild.buildroot.net/results/66ba5f76694d0738b113463579ce6b2fa49a89d6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...igure-disable-connlabel-for-static-builds.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/iptables/0003-configure-disable-connlabel-for-static-builds.patch

diff --git a/package/iptables/0003-configure-disable-connlabel-for-static-builds.patch b/package/iptables/0003-configure-disable-connlabel-for-static-builds.patch
new file mode 100644
index 0000000..974088e
--- /dev/null
+++ b/package/iptables/0003-configure-disable-connlabel-for-static-builds.patch
@@ -0,0 +1,33 @@
+From 292bc7b910727495c5515c6d596f8b98d6daf819 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 13 Jan 2015 10:42:38 -0300
+Subject: [PATCH] configure: disable connlabel for static builds
+
+Disable connlabel for purely static builds since it pulls in libdl which
+isn't available in such cases causing build breakage.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 2521ccc..0f92c48 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -88,8 +88,12 @@ if test "$ac_cv_header_linux_ip_vs_h" != "yes"; then
+ 	blacklist_modules="$blacklist_modules ipvs";
+ fi;
+ 
++if test "$enable_shared" = "yes"; then
+ PKG_CHECK_MODULES([libnetfilter_conntrack], [libnetfilter_conntrack >= 1.0.4],
+ 	[nfconntrack=1], [nfconntrack=0])
++else
++	nfconntrack=0
++fi;
+ AM_CONDITIONAL([HAVE_LIBNETFILTER_CONNTRACK], [test "$nfconntrack" = 1])
+ 
+ if test "$nfconntrack" -ne 1; then
+-- 
+2.0.5
+
-- 
2.0.5
