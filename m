From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 24 Oct 2015 23:00:47 +0200
Subject: [Buildroot] [PATCH v5 07/36] package/efl/libefl: add wayland
	dependency
In-Reply-To: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445720476-21517-8-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See:
https://www.enlightenment.org/about-wayland

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: rename to libefl
---
 package/efl/libefl/Config.in | 1 +
 package/efl/libefl/libefl.mk | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index 2b758f0..07aee42 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBEFL
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG # Emile needs libjpeg
 	select BR2_PACKAGE_LUA # Evas lua 5.1 or 5.2
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
 	help
 	  Enlightenment Foundation Libraries
 
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index 2e42bb7..c697e41 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -153,6 +153,13 @@ LIBEFL_CONF_OPTS += --with-crypto=none
 endif
 endif # BR2_PACKAGE_OPENSSL
 
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+LIBEFL_DEPENDENCIES += wayland libxkbcommon
+LIBEFL_CONF_OPTS += --enable-wayland=yes
+else
+LIBEFL_CONF_OPTS += --enable-wayland=no
+endif
+
 # image loader: handle only loaders that requires dependencies.
 # All other loaders are builded by default statically.
 ifeq ($(BR2_PACKAGE_LIBEFL_PNG),y)
-- 
2.4.3
