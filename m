From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:45 +0200
Subject: [Buildroot] [PATCH 28/32 v2] package/matchbox: xlib-libXcursor is
	an optional dependency
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <f7c6e95de7426b275ab0ac16977993636d751404.1433362840.git.yann.morin.1998@free.fr>
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
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox/Config.in   | 1 -
 package/matchbox/matchbox.mk | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 0c7e5ea..3a9f118 100644
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
index 1abcfd8..3b6a0eb 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -35,4 +35,8 @@ else
 MATCHBOX_CONF_OPTS += --disable-session
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+MATCHBOX_DEPENDENCIES += xlib_libXcursor
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
