From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  5 Oct 2014 12:31:14 +0200
Subject: [Buildroot] [PATCH v5] package/nginx: new package
Message-ID: <1412505074-14086-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nginx module selection is, by default, the same as the one sets by
the upstream configure script.

Patches improving the cross-compilation support have already been sent
upstream for integration [1-5].

All these patches are needed because nginx uses its own handwritten
build-system, which is cross-platform, but does not properly support
cross-compilation.

Fixes bug: #3427 [6]

[1] http://mailman.nginx.org/pipermail/nginx-devel/2014-August/005722.html
[2] http://mailman.nginx.org/pipermail/nginx-devel/2014-August/005724.html
[3] http://mailman.nginx.org/pipermail/nginx-devel/2014-August/005725.html
[4] http://mailman.nginx.org/pipermail/nginx-devel/2014-August/005723.html
[5] http://mailman.nginx.org/pipermail/nginx-devel/2014-August/005726.html
[6] https://bugs.uclibc.org/show_bug.cgi?id=3427

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Daniele Salvatore Albano <info@daccii.it>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

---
changes v4 -> v5:
- rebase
- rename NGINX_*_OPT -> NGINX_*_OPTS
- fix missing 'select ...' (GustavoZ)
- add 'mkdir ...' logdir and tmpdir in nginx service files (GustavoZ)

changes v3 -> v4:

- rebase
- bump to latest stable version
- fix sysv init script (JohanO)
- fix misc. paths (prefix, sbin, log, temp., etc) (JohanO)
- update nginx.service

changes v2 -> v3:
- rollback to stable release (1.6.0) instead of latest one (Gustavo)
- add comments in nginx.mk
- extend commit log

changes v1 -> v2:
- add SSL module knobs (ThomasP)
- turn all BR2_PACKAGE_* symbols fully uppercase (ThomasP)
- add pid file option to start-stop-daemon (ThomasP)
- do not pass default "-I..." "-L..." locations (ThomasP)
- fix --prefix (ThomasP)
- fix missing brackets
---
 package/Config.in                                  |   1 +
 package/nginx/Config.in                            | 326 +++++++++++++++++++++
 package/nginx/S50nginx                             |  25 ++
 ...izeof-rework-autotest-to-be-cross-compila.patch |  88 ++++++
 ...e-add-mechanism-allowing-to-force-feature.patch | 135 +++++++++
 ...x_feature_run_force_result-for-each-featu.patch | 209 +++++++++++++
 ...bxslt-conf-allow-to-override-ngx_feature_.patch |  42 +++
 ...nix-make-sys_nerr-guessing-cross-friendly.patch | 133 +++++++++
 package/nginx/nginx.logrotate                      |   9 +
 package/nginx/nginx.mk                             | 236 +++++++++++++++
 package/nginx/nginx.service                        |  15 +
 11 files changed, 1219 insertions(+)
 create mode 100644 package/nginx/Config.in
 create mode 100755 package/nginx/S50nginx
 create mode 100644 package/nginx/nginx-0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
 create mode 100644 package/nginx/nginx-0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
 create mode 100644 package/nginx/nginx-0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
 create mode 100644 package/nginx/nginx-0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch
 create mode 100644 package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
 create mode 100644 package/nginx/nginx.logrotate
 create mode 100644 package/nginx/nginx.mk
 create mode 100644 package/nginx/nginx.service

diff --git a/package/Config.in b/package/Config.in
index 6f55e02..215068f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1036,6 +1036,7 @@ endif
 	source "package/network-manager/Config.in"
 	source "package/nfacct/Config.in"
 	source "package/nftables/Config.in"
+	source "package/nginx/Config.in"
 	source "package/ngircd/Config.in"
 	source "package/ngrep/Config.in"
 	source "package/nmap/Config.in"
diff --git a/package/nginx/Config.in b/package/nginx/Config.in
new file mode 100644
index 0000000..da9fd01
--- /dev/null
+++ b/package/nginx/Config.in
@@ -0,0 +1,326 @@
+comment "nginx needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
+
+menuconfig BR2_PACKAGE_NGINX
+	bool "nginx"
+	depends on BR2_LARGEFILE
+	help
+	  nginx is an HTTP and reverse proxy server, as well as a mail proxy
+	  server.
+
+	  http://nginx.org/
+
+if BR2_PACKAGE_NGINX
+
+config BR2_PACKAGE_NGINX_FILE_AIO
+	bool "file AIO support"
+
+config BR2_PACKAGE_NGINX_HTTP
+	bool "http server"
+	default y
+
+if BR2_PACKAGE_NGINX_HTTP
+
+config BR2_PACKAGE_NGINX_HTTP_CACHE
+	bool "http cache support"
+	select BR2_PACKAGE_OPENSSL
+
+comment "http modules"
+
+config BR2_PACKAGE_NGINX_HTTP_SSL_MODULE
+	bool "ngx_http_ssl_module"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable ngx_http_ssl_module
+
+config BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE
+	bool "ngx_http_spdy_module"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enable ngx_http_spdy_module
+
+config BR2_PACKAGE_NGINX_HTTP_REALIP_MODULE
+	bool "ngx_http_realip_module"
+	help
+	  Enable ngx_http_realip_module
+
+config BR2_PACKAGE_NGINX_HTTP_ADDITION_MODULE
+	bool "ngx_http_addition_module"
+	help
+	  Enable ngx_http_addition_module
+
+config BR2_PACKAGE_NGINX_HTTP_XSLT_MODULE
+	bool "ngx_http_xslt_module"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	help
+	  Enable ngx_http_xslt_module
+
+config BR2_PACKAGE_NGINX_HTTP_IMAGE_FILTER_MODULE
+	bool "ngx_http_image_filter_module"
+	select BR2_PACKAGE_GD
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	help
+	  Enable ngx_http_image_filter_module
+
+config BR2_PACKAGE_NGINX_HTTP_SUB_MODULE
+	bool "ngx_http_sub_module"
+	help
+	  Enable ngx_http_sub_module
+
+config BR2_PACKAGE_NGINX_HTTP_DAV_MODULE
+	bool "ngx_http_dav_module"
+	help
+	  Enable ngx_http_dav_module
+
+config BR2_PACKAGE_NGINX_HTTP_FLV_MODULE
+	bool "ngx_http_flv_module"
+	help
+	  Enable ngx_http_flv_module
+
+config BR2_PACKAGE_NGINX_HTTP_MP4_MODULE
+	bool "ngx_http_mp4_module"
+	help
+	  Enable ngx_http_mp4_module
+
+config BR2_PACKAGE_NGINX_HTTP_GUNZIP_MODULE
+	bool "ngx_http_gunzip_module"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enable ngx_http_gunzip_module
+
+config BR2_PACKAGE_NGINX_HTTP_GZIP_STATIC_MODULE
+	bool "ngx_http_gzip_static_module"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enable ngx_http_gzip_static_module
+
+config BR2_PACKAGE_NGINX_HTTP_AUTH_REQUEST_MODULE
+	bool "ngx_http_auth_request_module"
+	help
+	  Enable ngx_http_auth_request_module
+
+config BR2_PACKAGE_NGINX_HTTP_RANDOM_INDEX_MODULE
+	bool "ngx_http_random_index_module"
+	help
+	  Enable ngx_http_random_index_module
+
+config BR2_PACKAGE_NGINX_HTTP_SECURE_LINK_MODULE
+	bool "ngx_http_secure_link_module"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable ngx_http_secure_link_module
+
+config BR2_PACKAGE_NGINX_HTTP_DEGRADATION_MODULE
+	bool "ngx_http_degradation_module"
+	help
+	  Enable ngx_http_degradation_module
+
+config BR2_PACKAGE_NGINX_HTTP_STUB_STATUS_MODULE
+	bool "ngx_http_stub_status_module"
+	help
+	  Enable ngx_http_stub_status_module
+
+config BR2_PACKAGE_NGINX_HTTP_CHARSET_MODULE
+	bool "ngx_http_charset_module"
+	default y
+	help
+	  Enable ngx_http_charset_module
+
+config BR2_PACKAGE_NGINX_HTTP_GZIP_MODULE
+	bool "ngx_http_gzip_module"
+	select BR2_PACKAGE_ZLIB
+	default y
+	help
+	  Enable ngx_http_gzip_module
+
+config BR2_PACKAGE_NGINX_HTTP_SSI_MODULE
+	bool "ngx_http_ssi_module"
+	default y
+	help
+	  Enable ngx_http_ssi_module
+
+config BR2_PACKAGE_NGINX_HTTP_USERID_MODULE
+	bool "ngx_http_userid_module"
+	default y
+	help
+	  Enable ngx_http_userid_module
+
+config BR2_PACKAGE_NGINX_HTTP_ACCESS_MODULE
+	bool "ngx_http_access_module"
+	default y
+	help
+	  Enable ngx_http_access_module
+
+config BR2_PACKAGE_NGINX_HTTP_AUTH_BASIC_MODULE
+	bool "ngx_http_auth_basic_module"
+	default y
+	help
+	  Enable ngx_http_auth_basic_module
+
+config BR2_PACKAGE_NGINX_HTTP_AUTOINDEX_MODULE
+	bool "ngx_http_autoindex_module"
+	default y
+	help
+	  Enable ngx_http_autoindex_module
+
+config BR2_PACKAGE_NGINX_HTTP_GEO_MODULE
+	bool "ngx_http_geo_module"
+	default y
+	help
+	  Enable ngx_http_geo_module
+
+config BR2_PACKAGE_NGINX_HTTP_MAP_MODULE
+	bool "ngx_http_map_module"
+	default y
+	help
+	  Enable ngx_http_map_module
+
+config BR2_PACKAGE_NGINX_HTTP_SPLIT_CLIENTS_MODULE
+	bool "ngx_http_split_clients_module"
+	default y
+	help
+	  Enable ngx_http_split_clients_module
+
+config BR2_PACKAGE_NGINX_HTTP_REFERER_MODULE
+	bool "ngx_http_referer_module"
+	default y
+	help
+	  Enable ngx_http_referer_module
+
+config BR2_PACKAGE_NGINX_HTTP_REWRITE_MODULE
+	bool "ngx_http_rewrite_module"
+	select BR2_PACKAGE_PCRE
+	default y
+	help
+	  Enable ngx_http_rewrite_module
+
+config BR2_PACKAGE_NGINX_HTTP_PROXY_MODULE
+	bool "ngx_http_proxy_module"
+	default y
+	help
+	  Enable ngx_http_proxy_module
+
+config BR2_PACKAGE_NGINX_HTTP_FASTCGI_MODULE
+	bool "ngx_http_fastcgi_module"
+	default y
+	help
+	  Enable ngx_http_fastcgi_module
+
+config BR2_PACKAGE_NGINX_HTTP_UWSGI_MODULE
+	bool "ngx_http_uwsgi_module"
+	default y
+	help
+	  Enable ngx_http_uwsgi_module
+
+config BR2_PACKAGE_NGINX_HTTP_SCGI_MODULE
+	bool "ngx_http_scgi_module"
+	default y
+	help
+	  Enable ngx_http_scgi_module
+
+config BR2_PACKAGE_NGINX_HTTP_MEMCACHED_MODULE
+	bool "ngx_http_memcached_module"
+	default y
+	help
+	  Enable ngx_http_memcached_module
+
+config BR2_PACKAGE_NGINX_HTTP_LIMIT_CONN_MODULE
+	bool "ngx_http_limit_conn_module"
+	default y
+	help
+	  Enable ngx_http_limit_conn_module
+
+config BR2_PACKAGE_NGINX_HTTP_LIMIT_REQ_MODULE
+	bool "ngx_http_limit_req_module"
+	default y
+	help
+	  Enable ngx_http_limit_req_module
+
+config BR2_PACKAGE_NGINX_HTTP_EMPTY_GIF_MODULE
+	bool "ngx_http_empty_gif_module"
+	default y
+	help
+	  Enable ngx_http_empty_gif_module
+
+config BR2_PACKAGE_NGINX_HTTP_BROWSER_MODULE
+	bool "ngx_http_browser_module"
+	default y
+	help
+	  Enable ngx_http_browser_module
+
+config BR2_PACKAGE_NGINX_HTTP_UPSTREAM_IP_HASH_MODULE
+	bool "ngx_http_upstream_ip_hash_module"
+	default y
+	help
+	  Enable ngx_http_upstream_ip_hash_module
+
+config BR2_PACKAGE_NGINX_HTTP_UPSTREAM_LEAST_CONN_MODULE
+	bool "ngx_http_upstream_least_conn_module"
+	default y
+	help
+	  Enable ngx_http_upstream_least_conn_module
+
+config BR2_PACKAGE_NGINX_HTTP_UPSTREAM_KEEPALIVE_MODULE
+	bool "ngx_http_upstream_keepalive_module"
+	default y
+	help
+	  Enable ngx_http_upstream_keepalive_module
+
+endif #BR2_PACKAGE_NGINX_HTTP
+
+config BR2_PACKAGE_NGINX_MAIL
+	bool "mail proxy modules"
+
+if BR2_PACKAGE_NGINX_MAIL
+
+config BR2_PACKAGE_NGINX_MAIL_SSL_MODULE
+	bool "ngx_mail_ssl_module"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable ngx_mail_ssl_module
+
+config BR2_PACKAGE_NGINX_MAIL_POP3_MODULE
+	bool "ngx_mail_pop3_module"
+	default y
+	help
+	  Enable ngx_mail_pop3_module
+
+config BR2_PACKAGE_NGINX_MAIL_IMAP_MODULE
+	bool "ngx_mail_imap_module"
+	default y
+	help
+	  Enable ngx_mail_imap_module
+
+config BR2_PACKAGE_NGINX_MAIL_SMTP_MODULE
+	bool "ngx_mail_smtp_module"
+	default y
+	help
+	  Enable ngx_mail_smtp_module
+
+endif #BR2_PACKAGE_NGINX_MAIL
+
+comment "misc. modules"
+
+config BR2_PACKAGE_NGINX_RTSIG_MODULE
+	bool "ngx_rtsig_module"
+	help
+	  Enable ngx_rtsig_module
+
+config BR2_PACKAGE_NGINX_SELECT_MODULE
+	bool "ngx_select_module"
+	help
+	  Enable ngx_select_module
+
+config BR2_PACKAGE_NGINX_POLL_MODULE
+	bool "ngx_poll_module"
+	help
+	  Enable ngx_poll_module
+
+config BR2_PACKAGE_NGINX_ADD_MODULES
+	string "additional modules"
+	help
+	  Space separated list of urls of the additional modules
+
+endif
diff --git a/package/nginx/S50nginx b/package/nginx/S50nginx
new file mode 100755
index 0000000..f555d93
--- /dev/null
+++ b/package/nginx/S50nginx
@@ -0,0 +1,25 @@
+#!/bin/sh
+#
+# Start/stop nginx
+#
+
+PIDFILE=/var/run/nginx.pid
+
+case "$1" in
+  start)
+	echo "Starting nginx..."
+	mkdir -p /var/log/nginx /var/tmp/nginx
+	start-stop-daemon -S -x /usr/sbin/nginx -p $PIDFILE
+	;;
+  stop)
+	echo -n "Stopping nginx..."
+	start-stop-daemon -K -o -p $PIDFILE
+	;;
+  restart|reload)
+	"$0" stop
+	"$0" start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
diff --git a/package/nginx/nginx-0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch b/package/nginx/nginx-0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
new file mode 100644
index 0000000..5b9e913
--- /dev/null
+++ b/package/nginx/nginx-0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
@@ -0,0 +1,88 @@
+From 81289d1d1adaf5a767a4b4d1309c286468cfd37f Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Thu, 24 Apr 2014 23:27:32 +0200
+Subject: [PATCH 1/5] auto/type/sizeof: rework autotest to be cross-compilation
+ friendly
+
+Rework the sizeof test to do the checks at compile time instead of at
+runtime. This way, it does not break when cross-compiling for a
+different CPU architecture.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ auto/types/sizeof | 42 ++++++++++++++++++++++++++++--------------
+ 1 file changed, 28 insertions(+), 14 deletions(-)
+
+diff --git a/auto/types/sizeof b/auto/types/sizeof
+index 9215a54..c2c3ede 100644
+--- a/auto/types/sizeof
++++ b/auto/types/sizeof
+@@ -14,7 +14,7 @@ END
+ 
+ ngx_size=
+ 
+-cat << END > $NGX_AUTOTEST.c
++cat << _EOF > $NGX_AUTOTEST.c
+ 
+ #include <sys/types.h>
+ #include <sys/time.h>
+@@ -25,29 +25,43 @@ $NGX_INCLUDE_UNISTD_H
+ $NGX_INCLUDE_INTTYPES_H
+ $NGX_INCLUDE_AUTO_CONFIG_H
+ 
+-int main() {
+-    printf("%d", (int) sizeof($ngx_type));
++#if !defined( PASTE)
++#define PASTE2( x, y) x##y
++#define PASTE( x, y)  PASTE2( x, y)
++#endif /* PASTE */
++
++#define SAY_IF_SIZEOF( typename, type, size)   \\
++    static char PASTE( PASTE( PASTE( sizeof_, typename), _is_), size) \\
++    [(sizeof(type) == (size)) ? 1 : -1]
++
++SAY_IF_SIZEOF(TEST_TYPENAME, TEST_TYPE, TEST_SIZE);
++
++int main(void)
++{
+     return 0;
+ }
+ 
+-END
+-
++_EOF
+ 
+-ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
+-          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
++_ngx_typename=`echo "$ngx_type" | sed 's/ /_/g;s/\*/p/'`
++ngx_size="-1"
++ngx_size=`for i in 1 2 4 8 16 ; do \
++    $CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
++    -DTEST_TYPENAME="$_ngx_typename" -DTEST_TYPE="$ngx_type" -DTEST_SIZE="$i" \
++    $NGX_AUTOTEST.c -o $NGX_AUTOTEST \
++    $NGX_LD_OPT $ngx_feature_libs >/dev/null 2>&1 || continue ;\
++    echo $i ; break ; done`
+ 
+-eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
++rm -rf $NGX_AUTOTEST*
+ 
++if test -z $ngx_size ; then
++    ngx_size=-1
++fi
+ 
+-if [ -x $NGX_AUTOTEST ]; then
+-    ngx_size=`$NGX_AUTOTEST`
++if [ $ngx_size -gt 0 ]; then
+     echo " $ngx_size bytes"
+ fi
+ 
+-
+-rm -rf $NGX_AUTOTEST*
+-
+-
+ case $ngx_size in
+     4)
+         if [ "$ngx_type"="long" ]; then
+-- 
+1.9.2
+
diff --git a/package/nginx/nginx-0002-auto-feature-add-mechanism-allowing-to-force-feature.patch b/package/nginx/nginx-0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
new file mode 100644
index 0000000..7eb4a5d
--- /dev/null
+++ b/package/nginx/nginx-0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
@@ -0,0 +1,135 @@
+From ef72be22ad6d58e230f75553d80b470b80c3303a Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 4 May 2014 00:40:49 +0200
+Subject: [PATCH 2/5] auto/feature: add mechanism allowing to force feature run
+ test result
+
+Whenever a feature needs to run a test, the ngx_feature_run_force_result
+variable can be set to the desired test result, and thus skip the test.
+
+Therefore, the generated config.h file will honor these presets.
+
+This mechanism aims to make easier cross-compilation support.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ auto/feature | 80 ++++++++++++++++++++++++++++++++++++++++++++----------------
+ 1 file changed, 59 insertions(+), 21 deletions(-)
+
+diff --git a/auto/feature b/auto/feature
+index 1145f28..a194b85 100644
+--- a/auto/feature
++++ b/auto/feature
+@@ -52,50 +52,88 @@ if [ -x $NGX_AUTOTEST ]; then
+     case "$ngx_feature_run" in
+ 
+         yes)
+-            # /bin/sh is used to intercept "Killed" or "Abort trap" messages
+-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
+-                echo " found"
++            if test -n "$ngx_feature_run_force_result" ; then
++                echo " not tested (maybe cross-compiling)"
++                if test -n "$ngx_feature_name" ; then
++                    if test "$ngx_feature_run_force_result" = "yes" ; then
++                        have=$ngx_have_feature . auto/have
++                    fi
++                fi
+                 ngx_found=yes
++            else
+ 
+-                if test -n "$ngx_feature_name"; then
+-                    have=$ngx_have_feature . auto/have
++                # /bin/sh is used to intercept "Killed" or "Abort trap" messages
++                if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
++                    echo " found"
++                    ngx_found=yes
++
++                    if test -n "$ngx_feature_name"; then
++                        have=$ngx_have_feature . auto/have
++                    fi
++
++                else
++                    echo " found but is not working"
+                 fi
+ 
+-            else
+-                echo " found but is not working"
+             fi
+         ;;
+ 
+         value)
+-            # /bin/sh is used to intercept "Killed" or "Abort trap" messages
+-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
+-                echo " found"
++            if test -n "$ngx_feature_run_force_result" ; then
++                echo " not tested (maybe cross-compiling)"
++                cat << END >> $NGX_AUTO_CONFIG_H
++
++#ifndef $ngx_feature_name
++#define $ngx_feature_name  $ngx_feature_run_force_result
++#endif
++
++END
+                 ngx_found=yes
++            else
+ 
+-                cat << END >> $NGX_AUTO_CONFIG_H
++                # /bin/sh is used to intercept "Killed" or "Abort trap" messages
++                if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
++                    echo " found"
++                    ngx_found=yes
++
++                    cat << END >> $NGX_AUTO_CONFIG_H
+ 
+ #ifndef $ngx_feature_name
+ #define $ngx_feature_name  `$NGX_AUTOTEST`
+ #endif
+ 
+ END
+-            else
+-                echo " found but is not working"
++                else
++                    echo " found but is not working"
++                fi
++
+             fi
+         ;;
+ 
+         bug)
+-            # /bin/sh is used to intercept "Killed" or "Abort trap" messages
+-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
+-                echo " not found"
+-
+-            else
+-                echo " found"
++            if test -n "$ngx_feature_run_force_result" ; then
++                echo " not tested (maybe cross-compiling)"
++                if test -n "$ngx_feature_name"; then
++                    if test "$ngx_feature_run_force_result" = "yes" ; then
++                        have=$ngx_have_feature . auto/have
++                    fi
++                fi
+                 ngx_found=yes
++            else
+ 
+-                if test -n "$ngx_feature_name"; then
+-                    have=$ngx_have_feature . auto/have
++                # /bin/sh is used to intercept "Killed" or "Abort trap" messages
++                if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
++                    echo " not found"
++
++                else
++                    echo " found"
++                    ngx_found=yes
++
++                    if test -n "$ngx_feature_name"; then
++                        have=$ngx_have_feature . auto/have
++                    fi
+                 fi
++
+             fi
+         ;;
+ 
+-- 
+1.9.2
+
diff --git a/package/nginx/nginx-0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch b/package/nginx/nginx-0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
new file mode 100644
index 0000000..81578a3
--- /dev/null
+++ b/package/nginx/nginx-0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
@@ -0,0 +1,209 @@
+From 7d1bc0364feab22299abeeb29ae2cfdcabd7e2c0 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Thu, 29 May 2014 18:52:10 +0200
+Subject: [PATCH 3/5] auto/*: set ngx_feature_run_force_result for each feature
+ requiring run test
+
+Each feature requiring a run test has a matching preset variable (called
+ngx_force_*) used to set ngx_feature_run_force_result.
+
+These ngx_force_* variables are passed through the environment at configure
+time.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ auto/cc/conf            | 3 +++
+ auto/cc/name            | 1 +
+ auto/lib/libatomic/conf | 1 +
+ auto/os/darwin          | 3 +++
+ auto/os/linux           | 4 ++++
+ auto/unix               | 8 ++++++++
+ 6 files changed, 20 insertions(+)
+
+diff --git a/auto/cc/conf b/auto/cc/conf
+index edc6d74..a61ade4 100644
+--- a/auto/cc/conf
++++ b/auto/cc/conf
+@@ -159,6 +159,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
+     ngx_feature="gcc builtin atomic operations"
+     ngx_feature_name=NGX_HAVE_GCC_ATOMIC
+     ngx_feature_run=yes
++    ngx_feature_run_force_result="$ngx_force_gcc_have_atomic"
+     ngx_feature_incs=
+     ngx_feature_path=
+     ngx_feature_libs=
+@@ -179,6 +180,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
+         ngx_feature="C99 variadic macros"
+         ngx_feature_name="NGX_HAVE_C99_VARIADIC_MACROS"
+         ngx_feature_run=yes
++        ngx_feature_run_force_result="$ngx_force_c99_have_variadic_macros"
+         ngx_feature_incs="#include <stdio.h>
+ #define var(dummy, ...)  sprintf(__VA_ARGS__)"
+         ngx_feature_path=
+@@ -193,6 +195,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
+     ngx_feature="gcc variadic macros"
+     ngx_feature_name="NGX_HAVE_GCC_VARIADIC_MACROS"
+     ngx_feature_run=yes
++    ngx_feature_run_force_result="$ngx_force_gcc_have_variadic_macros"
+     ngx_feature_incs="#include <stdio.h>
+ #define var(dummy, args...)  sprintf(args)"
+     ngx_feature_path=
+diff --git a/auto/cc/name b/auto/cc/name
+index 51a7ed9..d237d47 100644
+--- a/auto/cc/name
++++ b/auto/cc/name
+@@ -8,6 +8,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
+     ngx_feature="C compiler"
+     ngx_feature_name=
+     ngx_feature_run=yes
++    ngx_feature_run_force_result="$ngx_force_c_compiler"
+     ngx_feature_incs=
+     ngx_feature_path=
+     ngx_feature_libs=
+diff --git a/auto/lib/libatomic/conf b/auto/lib/libatomic/conf
+index d1e484a..3724916 100644
+--- a/auto/lib/libatomic/conf
++++ b/auto/lib/libatomic/conf
+@@ -15,6 +15,7 @@ else
+     ngx_feature="atomic_ops library"
+     ngx_feature_name=NGX_HAVE_LIBATOMIC
+     ngx_feature_run=yes
++    ngx_feature_run_force_result="$ngx_force_have_libatomic"
+     ngx_feature_incs="#define AO_REQUIRE_CAS
+                       #include <atomic_ops.h>"
+     ngx_feature_path=
+diff --git a/auto/os/darwin b/auto/os/darwin
+index b97518a..30f323c 100644
+--- a/auto/os/darwin
++++ b/auto/os/darwin
+@@ -27,6 +27,7 @@ NGX_KQUEUE_CHECKED=YES
+ ngx_feature="kqueue's EVFILT_TIMER"
+ ngx_feature_name="NGX_HAVE_TIMER_EVENT"
+ ngx_feature_run=yes
++ngx_feature_run_force_result="$ngx_force_have_timer_event"
+ ngx_feature_incs="#include <sys/event.h>
+                   #include <sys/time.h>"
+ ngx_feature_path=
+@@ -57,6 +58,7 @@ ngx_feature_test="int      kq;
+ ngx_feature="Darwin 64-bit kqueue millisecond timeout bug"
+ ngx_feature_name=NGX_DARWIN_KEVENT_BUG
+ ngx_feature_run=bug
++ngx_feature_run_force_result="$ngx_force_kevent_bug"
+ ngx_feature_incs="#include <sys/event.h>
+                   #include <sys/time.h>"
+ ngx_feature_path=
+@@ -87,6 +89,7 @@ CC_AUX_FLAGS="$CC_AUX_FLAGS"
+ ngx_feature="sendfile()"
+ ngx_feature_name="NGX_HAVE_SENDFILE"
+ ngx_feature_run=yes
++ngx_feature_run_force_result="$ngx_force_have_sendfile"
+ ngx_feature_incs="#include <sys/types.h>
+                   #include <sys/socket.h>
+                   #include <sys/uio.h>
+diff --git a/auto/os/linux b/auto/os/linux
+index 19bf832..16848b2 100644
+--- a/auto/os/linux
++++ b/auto/os/linux
+@@ -49,6 +49,7 @@ fi
+ ngx_feature="epoll"
+ ngx_feature_name="NGX_HAVE_EPOLL"
+ ngx_feature_run=yes
++ngx_feature_run_force_result="$ngx_force_have_epoll"
+ ngx_feature_incs="#include <sys/epoll.h>"
+ ngx_feature_path=
+ ngx_feature_libs=
+@@ -106,6 +107,7 @@ CC_AUX_FLAGS="$cc_aux_flags -D_GNU_SOURCE"
+ ngx_feature="sendfile()"
+ ngx_feature_name="NGX_HAVE_SENDFILE"
+ ngx_feature_run=yes
++ngx_feature_run_force_result="$ngx_force_have_sendfile"
+ ngx_feature_incs="#include <sys/sendfile.h>
+                   #include <errno.h>"
+ ngx_feature_path=
+@@ -127,6 +129,7 @@ CC_AUX_FLAGS="$cc_aux_flags -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64"
+ ngx_feature="sendfile64()"
+ ngx_feature_name="NGX_HAVE_SENDFILE64"
+ ngx_feature_run=yes
++ngx_feature_run_force_result="$ngx_force_have_sendfile64"
+ ngx_feature_incs="#include <sys/sendfile.h>
+                   #include <errno.h>"
+ ngx_feature_path=
+@@ -145,6 +148,7 @@ ngx_include="sys/prctl.h"; . auto/include
+ ngx_feature="prctl(PR_SET_DUMPABLE)"
+ ngx_feature_name="NGX_HAVE_PR_SET_DUMPABLE"
+ ngx_feature_run=yes
++ngx_feature_run_force_result="$ngx_force_have_pr_set_dumpable"
+ ngx_feature_incs="#include <sys/prctl.h>"
+ ngx_feature_path=
+ ngx_feature_libs=
+diff --git a/auto/unix b/auto/unix
+index 10fd3d2..b7cc9cb 100755
+--- a/auto/unix
++++ b/auto/unix
+@@ -99,6 +99,7 @@ if test -z "$NGX_KQUEUE_CHECKED"; then
+         ngx_feature="kqueue's EVFILT_TIMER"
+         ngx_feature_name="NGX_HAVE_TIMER_EVENT"
+         ngx_feature_run=yes
++        ngx_feature_run_force_result="$ngx_force_have_timer_event"
+         ngx_feature_incs="#include <sys/event.h>
+                           #include <sys/time.h>"
+         ngx_feature_path=
+@@ -544,6 +545,7 @@ ngx_feature_test="char buf[1]; ssize_t n; n = pwrite(1, buf, 1, 0);
+ ngx_feature="sys_nerr"
+ ngx_feature_name="NGX_SYS_NERR"
+ ngx_feature_run=value
++ngx_feature_run_force_result="$ngx_force_sys_nerr"
+ ngx_feature_incs='#include <errno.h>
+                   #include <stdio.h>'
+ ngx_feature_path=
+@@ -558,6 +560,7 @@ if [ $ngx_found = no ]; then
+     ngx_feature="_sys_nerr"
+     ngx_feature_name="NGX_SYS_NERR"
+     ngx_feature_run=value
++    ngx_feature_run_force_result="$ngx_force_sys_nerr"
+     ngx_feature_incs='#include <errno.h>
+                       #include <stdio.h>'
+     ngx_feature_path=
+@@ -573,6 +576,7 @@ if [ $ngx_found = no ]; then
+     ngx_feature='maximum errno'
+     ngx_feature_name=NGX_SYS_NERR
+     ngx_feature_run=value
++    ngx_feature_run_force_result="$ngx_force_sys_nerr"
+     ngx_feature_incs='#include <errno.h>
+                       #include <string.h>
+                       #include <stdio.h>'
+@@ -631,6 +635,7 @@ ngx_feature_test="void *p; p = memalign(4096, 4096);
+ ngx_feature="mmap(MAP_ANON|MAP_SHARED)"
+ ngx_feature_name="NGX_HAVE_MAP_ANON"
+ ngx_feature_run=yes
++ngx_feature_run_force_result="$ngx_force_have_map_anon"
+ ngx_feature_incs="#include <sys/mman.h>"
+ ngx_feature_path=
+ ngx_feature_libs=
+@@ -644,6 +649,7 @@ ngx_feature_test="void *p;
+ ngx_feature='mmap("/dev/zero", MAP_SHARED)'
+ ngx_feature_name="NGX_HAVE_MAP_DEVZERO"
+ ngx_feature_run=yes
++ngx_feature_run_force_result="$ngx_force_have_map_devzero"
+ ngx_feature_incs="#include <sys/mman.h>
+                   #include <sys/stat.h>
+                   #include <fcntl.h>"
+@@ -659,6 +665,7 @@ ngx_feature_test='void *p; int  fd;
+ ngx_feature="System V shared memory"
+ ngx_feature_name="NGX_HAVE_SYSVSHM"
+ ngx_feature_run=yes
++ngx_feature_run_force_result="$ngx_force_have_sysvshm"
+ ngx_feature_incs="#include <sys/ipc.h>
+                   #include <sys/shm.h>"
+ ngx_feature_path=
+@@ -673,6 +680,7 @@ ngx_feature_test="int  id;
+ ngx_feature="POSIX semaphores"
+ ngx_feature_name="NGX_HAVE_POSIX_SEM"
+ ngx_feature_run=yes
++ngx_feature_run_force_result="$ngx_force_have_posix_sem"
+ ngx_feature_incs="#include <semaphore.h>"
+ ngx_feature_path=
+ ngx_feature_libs=
+-- 
+1.9.2
+
diff --git a/package/nginx/nginx-0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch b/package/nginx/nginx-0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch
new file mode 100644
index 0000000..a125a78
--- /dev/null
+++ b/package/nginx/nginx-0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch
@@ -0,0 +1,42 @@
+From 5d281572d0afbf69d934737e1ee4c553670a46cc Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Thu, 29 May 2014 19:22:27 +0200
+Subject: [PATCH 4/5] auto/lib/libxslt/conf: allow to override ngx_feature_path
+ and ngx_feature_libs
+
+Because libxml2 headers are not in /usr/include by default, hardcoding the
+include directory to /usr/include/libxml2 does not play well when
+cross-compiling, or if libxml2 has been installed somewhere else.
+
+This patch allows to define/override the libxslt include directory, and
+the libxslt libs flags.
+
+Being able to override the include location is especially useful when
+cross-compiling to prevent gcc from complaining about unsafe include
+location for cross-compilation (-Wpoision-system-directories).
+
+So far, this warning is only triggered by libxslt.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ auto/lib/libxslt/conf | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/auto/lib/libxslt/conf b/auto/lib/libxslt/conf
+index bc19d83..386f1a0 100644
+--- a/auto/lib/libxslt/conf
++++ b/auto/lib/libxslt/conf
+@@ -12,8 +12,8 @@
+                       #include <libxslt/xsltInternals.h>
+                       #include <libxslt/transform.h>
+                       #include <libxslt/xsltutils.h>"
+-    ngx_feature_path="/usr/include/libxml2"
+-    ngx_feature_libs="-lxml2 -lxslt"
++    ngx_feature_path="${ngx_feature_path_libxslt:=/usr/include/libxml2}"
++    ngx_feature_libs="${ngx_feature_libs_libxslt:=-lxml2 -lxslt}"
+     ngx_feature_test="xmlParserCtxtPtr    ctxt = NULL;
+                       xsltStylesheetPtr   sheet = NULL;
+                       xmlDocPtr           doc;
+--
+1.9.2
+
diff --git a/package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch b/package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
new file mode 100644
index 0000000..4c00755
--- /dev/null
+++ b/package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
@@ -0,0 +1,133 @@
+From 8c19cea5e667f325ececdc1678bfddf063af0da2 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 1 Jun 2014 16:05:04 +0200
+Subject: [PATCH 5/5] auto/unix: make sys_nerr guessing cross-friendly
+
+This patch replaces the default sys_nerr runtest with a test done at
+buildtime.
+
+The idea behind this buildtime test is finding the value of the ERR_MAX
+macro if defined, or the EHWPOISON (which is currently the last errno)
+otherwise.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ auto/os/sys_nerr | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ auto/unix        | 10 ++++++++
+ 2 files changed, 87 insertions(+)
+ create mode 100644 auto/os/sys_nerr
+
+diff --git a/auto/os/sys_nerr b/auto/os/sys_nerr
+new file mode 100644
+index 0000000..25e7c22
+--- /dev/null
++++ b/auto/os/sys_nerr
+@@ -0,0 +1,77 @@
++
++# Copyright (C) Samuel Martin <s.martin49@gmail.com>
++
++
++echo $ngx_n "checking for sys_nerr value...$ngx_c"
++
++# sys_nerr guessing is done using a (very) poor (but working)
++# heuristics, by checking for the value of ERR_MAX if defined, or
++# EHWPOISON otherwise.
++
++cat << END >> $NGX_AUTOCONF_ERR
++
++----------------------------------------
++checking for sys_nerr value
++
++END
++
++ngx_sys_nerr=
++
++cat << _EOF > $NGX_AUTOTEST.c
++
++#include <stdio.h>
++#include <errno.h>
++
++static char sys_nerr_test[ERR_MAX];
++int main(void)
++{
++    return 0;
++}
++
++_EOF
++
++if $CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
++        $NGX_AUTOTEST.c -o $NGX_AUTOTEST \
++        $NGX_LD_OPT $ngx_feature_libs >/dev/null 2>&1 ; then
++    _ngx_max_err_macro=ERR_MAX
++else
++    # the +2 has been empirically found!
++    _ngx_max_err_macro="EHWPOISON + 2"
++fi
++
++cat << _EOF > $NGX_AUTOTEST.c
++
++#include <stdio.h>
++#include <errno.h>
++
++static char sys_nerr_test[(TEST_ERR_MAX == $_ngx_max_err_macro) ? 1 : -1];
++int main(void)
++{
++    return 0;
++}
++
++_EOF
++
++
++ngx_sys_nerr=`for i in $(seq 0 2000) ; do \
++    $CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
++    -DTEST_ERR_MAX="$i" \
++    $NGX_AUTOTEST.c -o $NGX_AUTOTEST \
++    $NGX_LD_OPT $ngx_feature_libs >/dev/null 2>&1 || continue ;\
++    echo $i ; break ; done`
++
++rm -rf $NGX_AUTOTEST*
++
++if test -z $ngx_sys_nerr ; then
++    ngx_size=0
++fi
++
++cat << END >> $NGX_AUTO_CONFIG_H
++
++#ifndef $ngx_feature_name
++#define $ngx_feature_name $ngx_sys_nerr
++#endif
++
++END
++
++echo " $ngx_sys_nerr"
+diff --git a/auto/unix b/auto/unix
+index b7cc9cb..1a49ba3 100755
+--- a/auto/unix
++++ b/auto/unix
+@@ -550,6 +550,10 @@ ngx_feature_incs='#include <errno.h>
+                   #include <stdio.h>'
+ ngx_feature_path=
+ ngx_feature_libs=
++
++if false ; then
++# Disabled because only valid for native build.
++
+ ngx_feature_test='printf("%d", sys_nerr);'
+ . auto/feature
+ 
+@@ -598,6 +602,12 @@ if [ $ngx_found = no ]; then
+     . auto/feature
+ fi
+ 
++else
++    # Cross-compilation support
++    . auto/os/sys_nerr
++
++fi
++
+ 
+ ngx_feature="localtime_r()"
+ ngx_feature_name="NGX_HAVE_LOCALTIME_R"
+-- 
+1.9.2
+
diff --git a/package/nginx/nginx.logrotate b/package/nginx/nginx.logrotate
new file mode 100644
index 0000000..e0fa9ec
--- /dev/null
+++ b/package/nginx/nginx.logrotate
@@ -0,0 +1,9 @@
+/var/log/nginx/*log {
+	missingok
+	create 640 http log
+	sharedscripts
+	compress
+	postrotate
+		test ! -r /var/run/nginx.pid || kill -USR1 `cat /var/run/nginx.pid`
+	endscript
+}
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
new file mode 100644
index 0000000..b59f0e0
--- /dev/null
+++ b/package/nginx/nginx.mk
@@ -0,0 +1,236 @@
+################################################################################
+#
+# nginx
+#
+################################################################################
+
+NGINX_VERSION = 1.6.2
+NGINX_SITE = http://nginx.org/download
+NGINX_LICENSE = BSD-2c
+NGINX_LICENSE_FILES = LICENSE
+
+NGINX_CONF_OPTS = \
+	--crossbuild=Linux::$(BR2_ARCH) \
+	--with-cc="$(TARGET_CC)" \
+	--with-cpp="$(TARGET_CC)" \
+	--with-cc-opt="$(TARGET_CFLAGS)" \
+	--with-ld-opt="$(TARGET_LDFLAGS)"
+
+# www-data user and group are used for nginx. Because these user and group
+# are already set by buildroot, it is not necessary to redefine them.
+# See system/skeleton/passwd
+#   username: www-data    uid: 33
+#   groupname: www-data   gid: 33
+#
+# So, we just need to create the directories used by nginx with the right
+# ownership.
+define NGINX_PERMISSIONS
+	/var/lib/nginx	d	755	33	33	-	-	-	-	-
+endef
+
+# disable external libatomic_ops because its detection fails.
+NGINX_CONF_ENV += \
+	ngx_force_c_compiler=yes \
+	ngx_force_c99_have_variadic_macros=yes \
+	ngx_force_gcc_have_variadic_macros=yes \
+	ngx_force_gcc_have_atomic=yes \
+	ngx_force_have_libatomic=no \
+	ngx_force_have_epoll=yes \
+	ngx_force_have_sendfile=yes \
+	ngx_force_have_sendfile64=$(if $(BR2_LARGEFILE),yes,no) \
+	ngx_force_have_pr_set_dumpable=yes \
+	ngx_force_have_timer_event=yes \
+	ngx_force_have_map_anon=yes \
+	ngx_force_have_map_devzero=yes \
+	ngx_force_have_sysvshm=yes \
+	ngx_force_have_posix_sem=yes
+
+# prefix: nginx root configuration location
+NGINX_CONF_OPTS += \
+	--prefix=/usr \
+	--conf-path=/etc/nginx/nginx.conf \
+	--sbin-path=/usr/sbin/nginx \
+	--pid-path=/var/run/nginx.pid \
+	--lock-path=/var/run/lock/nginx.lock \
+	--user=www-data \
+	--group=www-data \
+	--error-log-path=/var/log/nginx/error.log \
+	--http-log-path=/var/log/nginx/access.log \
+	--http-client-body-temp-path=/var/tmp/nginx/client-body \
+	--http-proxy-temp-path=/var/tmp/nginx/proxy \
+	--http-fastcgi-temp-path=/var/tmp/nginx/fastcgi \
+	--http-scgi-temp-path=/var/tmp/nginx/scgi \
+	--http-uwsgi-temp-path=/var/tmp/nginx/uwsgi
+
+NGINX_CONF_OPTS += \
+	$(if $(BR2_PACKAGE_NGINX_FILE_AIO),--with-file-aio) \
+	$(if $(BR2_INET_IPV6),--with-ipv6)
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+NGINX_DEPENDENCIES += pcre
+NGINX_CONF_OPTS += --with-pcre
+else
+NGINX_CONF_OPTS += --without-pcre
+endif
+
+# modules disabled or not activated because of missing dependencies:
+# - google_perftools  (googleperftools)
+# - http_geoip_module (geoip)
+# - http_perl_module  (host-perl)
+# - pcre-jit          (want to rebuild pcre)
+
+# Notes:
+# * Feature/module option are *not* symetric.
+#   If a feature is on by default, only its --without-xxx option exists;
+#   if a feature is off by default, only its --with-xxx option exists.
+# * The configure script fails if unknown options are passed on the command
+#   line.
+
+# misc. modules
+NGINX_CONF_OPTS += \
+	$(if $(BR2_PACKAGE_NGINX_RTSIG_MODULE),--with-rtsig_module) \
+	$(if $(BR2_PACKAGE_NGINX_SELECT_MODULE),--with-select_module,--without-select_module) \
+	$(if $(BR2_PACKAGE_NGINX_POLL_MODULE),--with-poll_module,--without-poll_module)
+
+ifneq ($(BR2_PACKAGE_NGINX_ADD_MODULES),)
+NGINX_CONF_OPTS += \
+	$(addprefix --add-module=,$(call qstrip,$(BR2_PACKAGE_NGINX_ADD_MODULES)))
+endif
+
+# http server modules
+ifeq ($(BR2_PACKAGE_NGINX_HTTP),y)
+ifeq ($(BR2_PACKAGE_NGINX_HTTP_CACHE),y)
+NGINX_DEPENDENCIES += openssl
+else
+NGINX_CONF_OPTS += --without-http-cache
+endif
+
+ifeq ($(BR2_PACKAGE_NGINX_HTTP_SSL_MODULE),y)
+NGINX_DEPENDENCIES += openssl
+NGINX_CONF_OPTS += --with-http_ssl_module
+endif
+
+ifeq ($(BR2_PACKAGE_NGINX_HTTP_XSLT_MODULE),y)
+NGINX_DEPENDENCIES += libxml2 libxslt
+NGINX_CONF_OPTS += --with-http_xslt_module
+NGINX_CONF_ENV += \
+	ngx_feature_path_libxslt=$(STAGING_DIR)/usr/include/libxml2
+endif
+
+ifeq ($(BR2_PACKAGE_NGINX_HTTP_IMAGE_FILTER_MODULE),y)
+NGINX_DEPENDENCIES += gd jpeg libpng
+NGINX_CONF_OPTS += --with-http_image_filter_module
+endif
+
+ifeq ($(BR2_PACKAGE_NGINX_HTTP_GUNZIP_MODULE),y)
+NGINX_DEPENDENCIES += zlib
+NGINX_CONF_OPTS += --with-http_gunzip_module
+endif
+
+ifeq ($(BR2_PACKAGE_NGINX_HTTP_GZIP_STATIC_MODULE),y)
+NGINX_DEPENDENCIES += zlib
+NGINX_CONF_OPTS += --with-http_gzip_static_module
+endif
+
+ifeq ($(BR2_PACKAGE_NGINX_HTTP_SECURE_LINK_MODULE),y)
+NGINX_DEPENDENCIES += openssl
+NGINX_CONF_OPTS += --with-http_secure_link_module
+endif
+
+ifeq ($(BR2_PACKAGE_NGINX_HTTP_GZIP_MODULE),y)
+NGINX_DEPENDENCIES += zlib
+else
+NGINX_CONF_OPTS += --without-http_gzip_module
+endif
+
+ifeq ($(BR2_PACKAGE_NGINX_HTTP_REWRITE_MODULE),y)
+NGINX_DEPENDENCIES += pcre
+else
+NGINX_CONF_OPTS += --without-http_rewrite_module
+endif
+
+NGINX_CONF_OPTS += \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE),--with-http_spdy_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_REALIP_MODULE),--with-http_realip_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_ADDITION_MODULE),--with-http_addition_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_SUB_MODULE),--with-http_sub_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_DAV_MODULE),--with-http_dav_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_FLV_MODULE),--with-http_flv_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_MP4_MODULE),--with-http_mp4_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_AUTH_REQUEST_MODULE),--with-http_auth_request_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_RANDOM_INDEX_MODULE),--with-http_random_index_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_DEGRADATION_MODULE),--with-http_degradation_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_STUB_STATUS_MODULE),--with-http_stub_status_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_CHARSET_MODULE),,--without-http_charset_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_SSI_MODULE),,--without-http_ssi_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_USERID_MODULE),,--without-http_userid_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_ACCESS_MODULE),,--without-http_access_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_AUTH_BASIC_MODULE),,--without-http_auth_basic_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_AUTOINDEX_MODULE),,--without-http_autoindex_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_GEO_MODULE),,--without-http_geo_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_MAP_MODULE),,--without-http_map_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_SPLIT_CLIENTS_MODULE),,--without-http_split_clients_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_REFERER_MODULE),,--without-http_referer_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_PROXY_MODULE),,--without-http_proxy_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_FASTCGI_MODULE),,--without-http_fastcgi_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_UWSGI_MODULE),,--without-http_uwsgi_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_SCGI_MODULE),,--without-http_scgi_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_MEMCACHED_MODULE),,--without-http_memcached_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_LIMIT_CONN_MODULE),,--without-http_limit_conn_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_LIMIT_REQ_MODULE),,--without-http_limit_req_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_EMPTY_GIF_MODULE),,--without-http_empty_gif_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_BROWSER_MODULE),,--without-http_browser_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_UPSTREAM_IP_HASH_MODULE),,--without-http_upstream_ip_hash_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_UPSTREAM_LEAST_CONN_MODULE),,--without-http_upstream_least_conn_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_UPSTREAM_KEEPALIVE_MODULE),,--without-http_upstream_keepalive_module)
+
+else # !BR2_PACKAGE_NGINX_HTTP
+NGINX_CONF_OPTS += --without-http
+endif # BR2_PACKAGE_NGINX_HTTP
+
+# mail modules
+ifeq ($(BR2_PACKAGE_NGINX_MAIL),y)
+
+ifeq ($(BR2_PACKAGE_NGINX_MAIL_SSL_MODULE),y)
+NGINX_DEPENDENCIES += openssl
+NGINX_CONF_OPTS += --with-mail_ssl_module
+endif
+
+NGINX_CONF_OPTS += \
+	$(if $(BR2_PACKAGE_NGINX_MAIL_POP3_MODULE),,--without-mail_pop3_module) \
+	$(if $(BR2_PACKAGE_NGINX_MAIL_IMAP_MODULE),,--without-mail_imap_module) \
+	$(if $(BR2_PACKAGE_NGINX_MAIL_SMTP_MODULE),,--without-mail_smtp_module)
+
+endif # BR2_PACKAGE_NGINX_MAIL
+define NGINX_DISABLE_WERROR
+	$(SED) 's/-Werror//g' -i $(@D)/auto/cc/*
+endef
+
+NGINX_PRE_CONFIGURE_HOOKS += NGINX_DISABLE_WERROR
+
+define NGINX_CONFIGURE_CMDS
+	cd $(@D) ; $(NGINX_CONF_ENV) ./configure $(NGINX_CONF_OPTS)
+endef
+
+define NGINX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define NGINX_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	-$(RM) $(TARGET_DIR)/usr/bin/nginx.old
+	$(INSTALL) -D -m 0664 package/nginx/nginx.logrotate \
+		$(TARGET_DIR)/etc/logrotate.d/nginx
+endef
+
+define NGINX_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/nginx/nginx.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/nginx.service
+endef
+
+define NGINX_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/nginx/S50nginx \
+		$(TARGET_DIR)/etc/init.d/S50nginx
+endef
+
+$(eval $(generic-package))
diff --git a/package/nginx/nginx.service b/package/nginx/nginx.service
new file mode 100644
index 0000000..619755f
--- /dev/null
+++ b/package/nginx/nginx.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=A high performance web server and a reverse proxy server
+After=syslog.target network.target
+
+[Service]
+Type=forking
+PIDFile=/var/run/nginx.pid
+ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx; /usr/sbin/nginx -t -q -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
+ExecStart=/usr/sbin/nginx -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
+ExecReload=/usr/sbin/nginx -g 'pid /var/run/nginx.pid; daemon on; master_process on;' -s reload
+ExecStop=/usr/sbin/nginx -g 'pid /var/run/nginx.pid;' -s quit
+PrivateDevices=yes
+
+[Install]
+WantedBy=multi-user.target
-- 
2.1.2
