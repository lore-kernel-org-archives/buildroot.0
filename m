From: kiwi <gregd72002@gmail.com>
Date: Tue,  9 Dec 2014 21:23:23 +0000
Subject: [Buildroot] [PATCH 3/8] Adding libnice
In-Reply-To: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
References: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
Message-ID: <1418160208-1569-3-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gregory Dymarek <gregd72002@gmail.com>

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/libnice/Config.in                            |  8 ++++++++
 .../libnice/libnice-0001-build-IPV6_RECVERR.patch    | 20 ++++++++++++++++++++
 package/libnice/libnice.mk                           | 13 +++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 package/libnice/Config.in
 create mode 100644 package/libnice/libnice-0001-build-IPV6_RECVERR.patch
 create mode 100644 package/libnice/libnice.mk

diff --git a/package/libnice/Config.in b/package/libnice/Config.in
new file mode 100644
index 0000000..240e3e7
--- /dev/null
+++ b/package/libnice/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBNICE
+	bool "libnice"
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Adds libnice - The GLib ICE implementation
+	  Libnice is an implementation of the IETF's Interactive Connectivity Establishment (ICE) standard (RFC 5245) and the Session Traversal Utilities for NAT (STUN) standard (RFC 5389).
+	  
+	  http://nice.freedesktop.org/wiki/
diff --git a/package/libnice/libnice-0001-build-IPV6_RECVERR.patch b/package/libnice/libnice-0001-build-IPV6_RECVERR.patch
new file mode 100644
index 0000000..39ef617
--- /dev/null
+++ b/package/libnice/libnice-0001-build-IPV6_RECVERR.patch
@@ -0,0 +1,20 @@
+diff -rupN libnice-0.1.8.orig/stun/usages/bind.c libnice-0.1.8/stun/usages/bind.c
+--- libnice-0.1.8.orig/stun/usages/bind.c	2014-09-22 18:01:28.000000000 +0100
++++ libnice-0.1.8/stun/usages/bind.c	2014-12-01 13:28:32.144707407 +0000
+@@ -257,12 +257,16 @@ static int stun_socket (int family, int
+     int yes = 1;
+     switch (family)
+     {
++#ifdef IP_RECVERR
+       case AF_INET:
+         setsockopt (fd, SOL_IP, IP_RECVERR, &yes, sizeof (yes));
++#endif
+         break;
++#ifdef IPV6_RECVERR
+       case AF_INET6:
+         setsockopt (fd, SOL_IPV6, IPV6_RECVERR, &yes, sizeof (yes));
+         break;
++#endif
+       default:
+         /* Nothing to do. */
+         break;
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
new file mode 100644
index 0000000..f3339bb
--- /dev/null
+++ b/package/libnice/libnice.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libnice 
+#
+#############################################################
+LIBNICE_VERSION = 0.1.8
+LIBNICE_SITE = http://nice.freedesktop.org/releases/
+LIBNICE_DEPENDENCIES = libglib2
+LIBNICE_INSTALL_STAGING = YES
+LIBNICE_LICENSE = LGPLv2.1+
+LIBNICE_LICENSE_FILE = COPYING.MPL COPYING.LGPL
+
+$(eval $(autotools-package))
-- 
1.9.1
