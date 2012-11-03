From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 19:13:51 +0100
Subject: [Buildroot] [git commit] ulogd: add new package
Message-ID: <20121103182342.8016199A6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3770a8dc2c93c0a97786846e4c60037e52e7579
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                 |    1 +
 package/ulogd/Config.in                           |   16 +++++++++++
 package/ulogd/ulogd-fix-libpcap-conditional.patch |   29 +++++++++++++++++++++
 package/ulogd/ulogd.mk                            |   17 ++++++++++++
 4 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ab0c205..3b7458f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -647,6 +647,7 @@ source "package/tn5250/Config.in"
 source "package/transmission/Config.in"
 source "package/ttcp/Config.in"
 source "package/udpcast/Config.in"
+source "package/ulogd/Config.in"
 source "package/ushare/Config.in"
 source "package/vpnc/Config.in"
 source "package/vsftpd/Config.in"
diff --git a/package/ulogd/Config.in b/package/ulogd/Config.in
new file mode 100644
index 0000000..7dc4f11
--- /dev/null
+++ b/package/ulogd/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_ULOGD
+	bool "ulogd"
+	depends on BR2_INET_IPV6
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBMNL
+	select BR2_PACKAGE_LIBNETFILTER_ACCT
+	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
+	select BR2_PACKAGE_LIBNETFILTER_LOG
+	select BR2_PACKAGE_LIBNFNETLINK
+	help
+	  ulogd is a userspace logging daemon for netfilter/iptables related logging.
+
+	  http://www.netfilter.org/projects/ulogd/
+
+comment "ulogd requires a toolchain with IPV6 and LARGEFILE support"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE
diff --git a/package/ulogd/ulogd-fix-libpcap-conditional.patch b/package/ulogd/ulogd-fix-libpcap-conditional.patch
new file mode 100644
index 0000000..3d73d37
--- /dev/null
+++ b/package/ulogd/ulogd-fix-libpcap-conditional.patch
@@ -0,0 +1,29 @@
+From 08387386821f356834bac14c7c5ea7296fb0f428 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 9 Oct 2012 16:23:12 -0300
+Subject: [PATCH] autoconf/ulogd: fix broken libpcap AM_CONDITIONAL
+
+The AM_CONDITIONAL lacks the opening bracket, hence it always evaluates
+as true, even if there's no libpcap found thus causing build breakage.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 10b6e1f..57c596c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -21,7 +21,7 @@ AC_SEARCH_LIBS([dlopen], [dl], [libdl_LIBS="$LIBS"; LIBS=""])
+ AC_SUBST([libdl_LIBS])
+ AC_SEARCH_LIBS([pcap_close], [pcap], [libpcap_LIBS="-lpcap"; LIBS=""])
+ AC_SUBST([libpcap_LIBS])
+-AM_CONDITIONAL([HAVE_PCAP], test -n "$libpcap_LIBS"])
++AM_CONDITIONAL([HAVE_PCAP],[test -n "$libpcap_LIBS"])
+ 
+ dnl Checks for header files.
+ AC_HEADER_DIRENT
+-- 
+1.7.8.6
+
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
new file mode 100644
index 0000000..7d31b73
--- /dev/null
+++ b/package/ulogd/ulogd.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# ulogd
+#
+#############################################################
+
+ULOGD_VERSION = 2.0.1
+ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
+ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
+ULOGD_AUTORECONF = YES
+ULOGD_DEPENDENCIES = host-pkgconf \
+	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
+	libnfnetlink
+ULOGD_LICENSE = GPLv2
+ULOGD_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
