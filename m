From: Gregory Dymarek <gregd72002@gmail.com>
Date: Fri, 12 Dec 2014 15:42:43 +0000
Subject: [Buildroot] [PATCH v2 3/7] Adding libnice
In-Reply-To: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
References: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
Message-ID: <1418398967-2183-4-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/Config.in                                    |  1 +
 package/libnice/Config.in                            |  6 ++++++
 .../libnice/libnice-0001-build-IPV6_RECVERR.patch    | 20 ++++++++++++++++++++
 package/libnice/libnice.hash                         |  1 +
 package/libnice/libnice.mk                           | 11 +++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/libnice/Config.in
 create mode 100644 package/libnice/libnice-0001-build-IPV6_RECVERR.patch
 create mode 100644 package/libnice/libnice.hash
 create mode 100644 package/libnice/libnice.mk

diff --git a/package/Config.in b/package/Config.in
index 49fb8b3..e8c973e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -824,6 +824,7 @@ menu "Networking"
 	source "package/libmnl/Config.in"
 	source "package/libmodbus/Config.in"
 	source "package/libndp/Config.in"
+	source "package/libnice/Config.in"
 	source "package/libnetfilter_acct/Config.in"
 	source "package/libnetfilter_conntrack/Config.in"
 	source "package/libnetfilter_cthelper/Config.in"
diff --git a/package/libnice/Config.in b/package/libnice/Config.in
new file mode 100644
index 0000000..1ff8560
--- /dev/null
+++ b/package/libnice/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBNICE
+	bool "libnice"
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	Adds libnice - The GLib ICE implementation
+	http://nice.freedesktop.org/wiki/
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
diff --git a/package/libnice/libnice.hash b/package/libnice/libnice.hash
new file mode 100644
index 0000000..39f15d9
--- /dev/null
+++ b/package/libnice/libnice.hash
@@ -0,0 +1 @@
+sha256,9da7f09909902d535389d929c3e4d69129528fb18438a6c8565ec812d9904ddf
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
new file mode 100644
index 0000000..dd7f7a4
--- /dev/null
+++ b/package/libnice/libnice.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# libnice 
+#
+#############################################################
+LIBNICE_VERSION = 0.1.8
+LIBNICE_SITE = http://nice.freedesktop.org/releases/
+LIBNICE_DEPENDENCIES = libglib2
+LIBNICE_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.9.1
