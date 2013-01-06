From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:24 +0100
Subject: [Buildroot] [PATCH 12/28] xserver_xorg-server: provide more options
	for SHA1 library
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <089f2d9cb8d7b83db4f512f3a62b1d98fc5693e3.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, the X.org server was forcefully selecting OpenSSL, just to
have a SHA1 implementation. However, in fact, the X.org server is
capable of using a SHA1 implementation from multiple libraries:
OpenSSL, libgcrypt and libsha1 amongst others.

So, this patch changes the X.org server package so that we use the
SHA1 functions from OpenSSL is OpenSSL is already available, or the
SHA1 functions from libgcrypt is libgcrypt is already available, or if
neither OpenSSL nor libgcrypt are enabled in the configuration, we
select the much smaller libsha1, that has been specifically written to
fulfill the X.org server requirements.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in        |    5 ++++-
 .../xserver_xorg-server/xserver_xorg-server.mk     |   12 +++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 6c70196..de601e9 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -2,7 +2,10 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	select BR2_PACKAGE_MCOOKIE
-	select BR2_PACKAGE_OPENSSL
+	# We need a SHA1 implementation. If either openssl or
+	# libgcrypt are already part of the build, we'll use one of
+	# them, otherwise, use the small libsha1 library.
+	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XFONT_FONT_MISC_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 552d8e8..f6c6cab 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -51,7 +51,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xproto_xproto 			\
 	xkeyboard-config		\
 	pixman 				\
-	openssl 			\
 	mcookie 			\
 	host-pkgconf
 
@@ -178,4 +177,15 @@ else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-glx
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+XSERVER_XORG_SERVER_CONF_OPT += --with-sha1=libcrypto
+XSERVER_XORG_SERVER_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+XSERVER_XORG_SERVER_CONF_OPT += --with-sha1=libgcrypt
+XSERVER_XORG_SERVER_DEPENDENCIES += libgcrypt
+else
+XSERVER_XORG_SERVER_CONF_OPT += --with-sha1=libsha1
+XSERVER_XORG_SERVER_DEPENDENCIES += libsha1
+endif
+
 $(eval $(autotools-package))
-- 
1.7.9.5
