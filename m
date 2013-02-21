From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 21 Feb 2013 19:44:31 +0200
Subject: [Buildroot] [PATCH] polkit: bump to version 0.104
Message-ID: <1361468671-9589-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Polkit 0.104.
Also some minor configuration fixes and patch to enable building
with uClibc.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/polkit/polkit-0.104-uclibc-netgroup.patch |   41 +++++++++++++++++++++
 package/polkit/polkit.mk                          |    6 ++-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100755 package/polkit/polkit-0.104-uclibc-netgroup.patch

diff --git a/package/polkit/polkit-0.104-uclibc-netgroup.patch b/package/polkit/polkit-0.104-uclibc-netgroup.patch
new file mode 100755
index 0000000..423cc5d
--- /dev/null
+++ b/package/polkit/polkit-0.104-uclibc-netgroup.patch
@@ -0,0 +1,41 @@
+uClibc netgroup fix
+
+Upstream-Status:	Pending
+URL:			http://repository.timesys.com/buildsources/p/polkit/polkit-0.104/polkit-0.104-uclibc-netgroup.patch
+
+--- polkit-0.104/src/polkitbackend/polkitbackendlocalauthorizationstore.c	2012-01-09 16:50:27.573369343 -0500
++++ polkit-0.104/src/polkitbackend/polkitbackendlocalauthorizationstore.c	2012-01-09 16:34:25.749095408 -0500
+@@ -725,6 +725,7 @@
+             break;
+         }
+ 
++#if !defined(__UCLIBC__)
+       /* if no identity specs matched and identity is a user, match against netgroups */
+       if (ll == NULL && POLKIT_IS_UNIX_USER (identity))
+         {
+@@ -739,6 +740,7 @@
+                 break;
+             }
+         }
++#endif
+ 
+       if (ll == NULL)
+         continue;
+--- polkit-0.104/src/polkitbackend/polkitbackendlocalauthority.c	2012-01-09 16:50:41.703369211 -0500
++++ polkit-0.104/src/polkitbackend/polkitbackendlocalauthority.c	2012-01-09 16:34:11.324619300 -0500
+@@ -698,6 +698,7 @@
+   GList *ret;
+ 
+   ret = NULL;
++#if !defined(__UCLIBC__)
+   name = polkit_unix_netgroup_get_name (POLKIT_UNIX_NETGROUP (group));
+ 
+   if (setnetgrent (name) == 0)
+@@ -739,6 +740,7 @@
+ 
+  out:
+   endnetgrent ();
++#endif
+   return ret;
+ }
+ 
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 54782dd..71f7365 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-POLKIT_VERSION = 0.103
+POLKIT_VERSION = 0.104
 POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases/
 POLKIT_LICENSE = GPLv2
 POLKIT_LICENSE_FILES = COPYING
@@ -18,6 +18,8 @@ POLKIT_CONF_OPT = \
 	--with-authfw=shadow \
 	--with-os-type=unknown \
 	--disable-man-pages \
-	--disable-examples
+	--disable-examples \
+	--localstatedir=/var \
+	--libexecdir=/usr/lib/polkit-1
 
 $(eval $(autotools-package))
-- 
1.7.7.6
