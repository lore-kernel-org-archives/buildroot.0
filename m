From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 17:02:19 +0100
Subject: [Buildroot] [git commit] libnice: new package
Message-ID: <20141231160442.61AC5807C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89502b9d56ad4f06954fae55684ef21525ad2515
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Rename patch to the proper naming convention
 - Reduce patch to only take care of the IPv6 case
 - Add description in the patch
 - Propagate libglib2 dependencies in Config.in + added the
   corresponding comment.
 - Added a real help text, and fixed the help text indentation.
 - Fixed the comment header in the .mk file to have the right number
   of # signs.
 - Added the license informations
 - Added a dependency on host-pkgconf, used by the configure script
 - Added --without-gstreamer and --without-gstreamer-0.10 to be
   explicit about the fact that we don't support GStreamer in libnice
   for now.
 - Fixed the hash file to have the proper format.]

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                             |    1 +
 package/libnice/0001-build-IPV6_RECVERR.patch |   20 ++++++++++++++++++++
 package/libnice/Config.in                     |   20 ++++++++++++++++++++
 package/libnice/libnice.hash                  |    2 ++
 package/libnice/libnice.mk                    |   17 +++++++++++++++++
 5 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3b37bb2..b49145f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -827,6 +827,7 @@ menu "Networking"
 	source "package/libmnl/Config.in"
 	source "package/libmodbus/Config.in"
 	source "package/libndp/Config.in"
+	source "package/libnice/Config.in"
 	source "package/libnetfilter_acct/Config.in"
 	source "package/libnetfilter_conntrack/Config.in"
 	source "package/libnetfilter_cthelper/Config.in"
diff --git a/package/libnice/0001-build-IPV6_RECVERR.patch b/package/libnice/0001-build-IPV6_RECVERR.patch
new file mode 100644
index 0000000..af55bb9
--- /dev/null
+++ b/package/libnice/0001-build-IPV6_RECVERR.patch
@@ -0,0 +1,20 @@
+Make libnice build in non-IPv6 configurations
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/stun/usages/bind.c
+===================================================================
+--- a/stun/usages/bind.c
++++ b/stun/usages/bind.c
+@@ -260,9 +260,11 @@
+       case AF_INET:
+         setsockopt (fd, SOL_IP, IP_RECVERR, &yes, sizeof (yes));
+         break;
++#ifdef IPV6_RECVERR
+       case AF_INET6:
+         setsockopt (fd, SOL_IPV6, IPV6_RECVERR, &yes, sizeof (yes));
+         break;
++#endif
+       default:
+         /* Nothing to do. */
+         break;
diff --git a/package/libnice/Config.in b/package/libnice/Config.in
new file mode 100644
index 0000000..1d7c341
--- /dev/null
+++ b/package/libnice/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBNICE
+	bool "libnice"
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # fork()
+	help
+	  Libnice is an implementation of the IETF's Interactive
+	  Connectivity Establishment (ICE) standard (RFC 5245) and the
+	  Session Traversal Utilities for NAT (STUN) standard (RFC
+	  5389).
+
+	  It provides a GLib-based library, libnice and a Glib-free
+	  library, libstun as well as GStreamer elements.
+
+	  http://nice.freedesktop.org/wiki/
+
+comment "libnice needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnice/libnice.hash b/package/libnice/libnice.hash
new file mode 100644
index 0000000..bb419b9
--- /dev/null
+++ b/package/libnice/libnice.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 9da7f09909902d535389d929c3e4d69129528fb18438a6c8565ec812d9904ddf libnice-0.1.8.tar.gz
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
new file mode 100644
index 0000000..10abe86
--- /dev/null
+++ b/package/libnice/libnice.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libnice
+#
+################################################################################
+
+LIBNICE_VERSION = 0.1.8
+LIBNICE_SITE = http://nice.freedesktop.org/releases/
+LIBNICE_LICENSE = MPLv1.1 or LGPLv2.1
+LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
+LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
+LIBNICE_INSTALL_STAGING = YES
+LIBNICE_CONF_OPTS = \
+	--without-gstreamer \
+	--without-gstreamer-0.10 \
+
+$(eval $(autotools-package))
