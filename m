From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 23:21:14 +0200
Subject: [Buildroot] [git commit] package/nginx: add libatomic_ops support
Message-ID: <20160513212128.E5BB081FAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ab21916e17be3434023deaf9cb74dcdd4f172c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Force the use of libatomics_ops on the sparc v8 and leon3 platforms to
allow nginx to build.  Optionally use libatomic_ops on other platforms.

This fixes:
 http://autobuild.buildroot.net/results/20dc41cd62887222d2569d81b5865893baeafaae/
 http://autobuild.buildroot.net/results/eb47af0c8df6fae82859865fb8b9912f45960444/

Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx/Config.in |  1 +
 package/nginx/nginx.mk  | 16 +++++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 9f3c218..e6f2d96 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_NGINX
 	bool "nginx"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBATOMIC_OPS if BR2_sparc_v8 || BR2_sparc_leon3
 	help
 	  nginx is an HTTP and reverse proxy server, as well as a mail proxy
 	  server.
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 9cc2326..fecef7b 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -14,7 +14,6 @@ NGINX_CONF_OPTS = \
 	--crossbuild=Linux::$(BR2_ARCH) \
 	--with-cc="$(TARGET_CC)" \
 	--with-cpp="$(TARGET_CC)" \
-	--with-cc-opt="$(TARGET_CFLAGS)" \
 	--with-ld-opt="$(TARGET_LDFLAGS)" \
 	--with-ipv6
 
@@ -36,7 +35,6 @@ NGINX_CONF_ENV += \
 	ngx_force_c99_have_variadic_macros=yes \
 	ngx_force_gcc_have_variadic_macros=yes \
 	ngx_force_gcc_have_atomic=yes \
-	ngx_force_have_libatomic=no \
 	ngx_force_have_epoll=yes \
 	ngx_force_have_sendfile=yes \
 	ngx_force_have_sendfile64=yes \
@@ -68,6 +66,17 @@ NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_FILE_AIO),--with-file-aio) \
 	$(if $(BR2_PACKAGE_NGINX_THREADS),--with-threads)
 
+ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
+NGINX_DEPENDENCIES += libatomic_ops
+NGINX_CONF_OPTS += --with-libatomic
+NGINX_CONF_ENV += ngx_force_have_libatomic=yes
+ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
+NGINX_CFLAGS += "-DAO_NO_SPARC_V9"
+endif
+else
+NGINX_CONF_ENV += ngx_force_have_libatomic=no
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE),y)
 NGINX_DEPENDENCIES += pcre
 NGINX_CONF_OPTS += --with-pcre
@@ -238,7 +247,8 @@ define NGINX_CONFIGURE_CMDS
 	cd $(@D) ; $(NGINX_CONF_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		GDLIB_CONFIG=$(STAGING_DIR)/usr/bin/gdlib-config \
-		./configure $(NGINX_CONF_OPTS)
+		./configure $(NGINX_CONF_OPTS) \
+			--with-cc-opt="$(TARGET_CFLAGS) $(NGINX_CFLAGS)"
 endef
 
 define NGINX_BUILD_CMDS
