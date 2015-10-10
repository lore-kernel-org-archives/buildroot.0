From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 12:03:16 +0200
Subject: [Buildroot] [PATCH v3 11/37] package/efl: add wayland dependency
In-Reply-To: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1444471422-15118-12-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/Config.in | 1 +
 package/efl/efl.mk    | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 734cc5e..f8600e4 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_EFL
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG # Emile needs libjpeg
 	select BR2_PACKAGE_LUA # Evas lua 5.1 or 5.2
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
 	help
 	  Enlightenment Foundation Libraries
 
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 2637bbb..2a7083e 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -152,6 +152,13 @@ EFL_CONF_OPTS += --with-crypto=none
 endif
 endif # BR2_PACKAGE_OPENSSL
 
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+EFL_DEPENDENCIES += wayland libxkbcommon
+EFL_CONF_OPTS += --enable-wayland=yes
+else
+EFL_CONF_OPTS += --enable-wayland=no
+endif
+
 # image loader: handle only loaders that requires dependencies.
 # All other loaders are builded by default statically.
 ifeq ($(BR2_PACKAGE_EFL_PNG),y)
-- 
2.4.3
