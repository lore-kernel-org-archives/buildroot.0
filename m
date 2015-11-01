From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  1 Nov 2015 19:07:51 +0100
Subject: [Buildroot] [PATCH v6 15/33] package/efl/libefl: add systemd
	dependency
In-Reply-To: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
References: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1446401289-9059-16-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd it one of the "highly recommended" dependecies
according to the README [1] but disabling it doesn't need
the --enable-i-really-know-what-i-am-doing... option.
That's why systemd is not added to
BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG.

[1] https://git.enlightenment.org/core/efl.git/tree/README?h=efl-1.15#n491

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v6: use --enable/disable option
v4: rename to libefl
    improve commit log
v3: new patch
---
 package/efl/libefl/libefl.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index d2537dc..5907cf0 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -32,7 +32,6 @@ LIBEFL_GETTEXTIZE = YES
 # Configure options:
 # --disable-cxx-bindings: disable C++11 bindings.
 # --disable-sdl: disable sdl2 support.
-# --disable-systemd: disable systemd support.
 # --enable-lua-old: disable Elua and remove luajit dependency.
 # --with-opengl=none: disable opengl support.
 # --with-x11=none: remove dependency on X.org.
@@ -41,7 +40,6 @@ LIBEFL_CONF_OPTS = \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--disable-cxx-bindings \
 	--disable-sdl \
-	--disable-systemd \
 	--enable-lua-old
 
 # Disable untested configuration warning.
@@ -56,6 +54,13 @@ else
 LIBEFL_CONF_OPTS += --disable-libmount
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+LIBEFL_CONF_OPTS += --enable-systemd
+LIBEFL_DEPENDENCIES += systemd
+else
+LIBEFL_CONF_OPTS += --disable-systemd
+endif
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 LIBEFL_CONF_OPTS += --enable-fontconfig
 LIBEFL_DEPENDENCIES += fontconfig
-- 
2.4.3
