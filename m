From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:38 +0200
Subject: [Buildroot] [PATCH 27/30] package/matchbox: xlib-libXcursor is an
	optional dependency
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <14d4c02b30caadb404949b98238f87ba3b509e40.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

matchbox selects xlib-libXcursor, but does not build-depend on it.

But xlib-libXcursor is only an optional dependency.

Fix that by removing the select, and properly build-depend on it when
it is enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/Config.in   | 1 -
 package/matchbox/matchbox.mk | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index fa186e9..ad68718 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -4,7 +4,6 @@ menuconfig BR2_PACKAGE_MATCHBOX
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_MATCHBOX_LIB
 	help
 	  Matchbox is an Open Source base environment for the X Window
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index bce9520..d2c3451 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -38,6 +38,10 @@ else
 MATCHBOX_CONF_OPTS += --disable-session
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+MATCHBOX_DEPENDENCIES += xlib_libXcursor
+endif
+
 $(eval $(autotools-package))
 
 # After we called a package infra, w ecan include more files
-- 
1.9.1
