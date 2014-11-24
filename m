From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 22:04:29 +0100
Subject: [Buildroot] [git commit] ushare: do not allow building in static
	lib situations
Message-ID: <20141124211427.E3CFE7FAF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fce6527af360ff0fe6acfe73ead37aa57e153025
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ushare configure script is a custom shell script, and it is not
designed to understand that the library order is important when doing
static linking.

Fixes:

  http://autobuild.buildroot.org/results/32e/32ed2a521043f929cc290145c8a651e69042e104/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ushare/Config.in |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index 981f081..d961434 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -4,6 +4,10 @@ config BR2_PACKAGE_USHARE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
 	select BR2_PACKAGE_LIBUPNP
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	# ushare has a completely custom configure script that does
+	# broken things with library ordering, which breaks static
+	# linking.
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  uShare is a UPnP (TM) A/V & DLNA Media Server.
 	  It implements the server component that provides UPnP media devices
@@ -11,5 +15,6 @@ config BR2_PACKAGE_USHARE
 
 	  http://ushare.geexbox.org/
 
-comment "ushare needs a toolchain w/ largefile, threads"
-	depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS)
+comment "ushare needs a toolchain w/ largefile, threads, dynamic library"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_PREFER_STATIC_LIB
