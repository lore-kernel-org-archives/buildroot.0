From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 May 2010 22:18:44 +0200
Subject: [Buildroot] [git commit master] package/games/vice: remove
Message-ID: <20100510202711.58E878A4AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=13de2613a3ccd301761f66c03db805dbea9a5a04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Has been marked broken since Nov 2009, so removing as announced.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                         |    2 ++
 package/Config.in                               |    1 -
 package/games/Config.in                         |    1 -
 package/games/vice/Config.in                    |    8 --------
 package/games/vice/vice-1.22-remove-bzero.patch |   20 --------------------
 package/games/vice/vice.mk                      |   15 ---------------
 6 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 package/games/vice/Config.in
 delete mode 100644 package/games/vice/vice-1.22-remove-bzero.patch
 delete mode 100644 package/games/vice/vice.mk

diff --git a/CHANGES b/CHANGES
index bd76981..70ae9d7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,6 +8,8 @@
 	xapp_mkfontdir, xfont_encodings, xlib_libX11, xlib_libXfont,
 	xlib_xtrans, xproto_fontcacheproto, xproto_fontsproto.
 
+	Removed packages: vice
+
 	Issues resolved (http://bugs.uclibc.org):
 
 	#849: "customize" package copies files to wrong place in target tree
diff --git a/package/Config.in b/package/Config.in
index 6848f9f..d3c4316 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -81,7 +81,6 @@ source "package/games/lxdoom/Config.in"
 source "package/games/magiccube4d/Config.in"
 source "package/games/prboom/Config.in"
 source "package/games/rubix/Config.in"
-source "package/games/vice/Config.in"
 endmenu
 
 menu "Graphic libraries and applications (graphic/text)"
diff --git a/package/games/Config.in b/package/games/Config.in
index 16924a4..ed799ab 100644
--- a/package/games/Config.in
+++ b/package/games/Config.in
@@ -6,5 +6,4 @@ source "package/games/lxdoom/Config.in"
 source "package/games/magiccube4d/Config.in"
 source "package/games/prboom/Config.in"
 source "package/games/rubix/Config.in"
-source "package/games/vice/Config.in"
 endmenu
diff --git a/package/games/vice/Config.in b/package/games/vice/Config.in
deleted file mode 100644
index e4c5621..0000000
--- a/package/games/vice/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_VICE
-	bool "vice"
-	depends on BROKEN # doesn't build, wrong dependencies
-	# remove before 2010.02 release
-	help
-	  VICE is a Commodore emulator
-
-	  http://www.viceteam.org/online
diff --git a/package/games/vice/vice-1.22-remove-bzero.patch b/package/games/vice/vice-1.22-remove-bzero.patch
deleted file mode 100644
index 5836a9f..0000000
--- a/package/games/vice/vice-1.22-remove-bzero.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- a/src/network.c	2007-07-15 18:49:24.000000000 -0400
-+++ b/src/network.c	2008-03-01 21:29:40.000000000 -0500
-@@ -742,7 +742,7 @@ int network_start_server(void)
- 
- #ifdef HAVE_IPV6
-     if (netplay_ipv6) {
--        bzero((char*)&server_addr6, sizeof(struct sockaddr_in6));
-+        memset((char*)&server_addr6, 0, sizeof(struct sockaddr_in6));
-         server_addr6.sin6_port = htons(server_port);
-         server_addr6.sin6_family = PF_INET6;
-         server_addr6.sin6_addr=in6addr_any;
-@@ -853,7 +853,7 @@ int network_connect_client(void)
-     }
- #ifdef HAVE_IPV6
-     if (netplay_ipv6) {
--        bzero((char*)&server_addr6, sizeof(struct sockaddr_in6));
-+        memset((char*)&server_addr6, 0, sizeof(struct sockaddr_in6));
-         server_addr6.sin6_port = htons(server_port);
-         server_addr6.sin6_family = PF_INET6;
-         memcpy(&server_addr6.sin6_addr, server_hostent->h_addr, server_hostent->h_length);
diff --git a/package/games/vice/vice.mk b/package/games/vice/vice.mk
deleted file mode 100644
index 305809d..0000000
--- a/package/games/vice/vice.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-#############################################################
-#
-# vice
-#
-#############################################################
-VICE_VERSION = 1.22
-VICE_SOURCE = vice-$(VICE_VERSION).tar.gz
-VICE_SITE = http://www.viceteam.org/online
-VICE_INSTALL_STAGING = NO
-VICE_INSTALL_TARGET = YES
-
-VICE_CONF_OPT = --without-resid --with-alsa
-
-$(eval $(call AUTOTARGETS,package/games,vice))
-
-- 
1.6.3.3
