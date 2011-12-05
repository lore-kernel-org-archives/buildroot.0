From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Dec 2011 12:54:43 +0100
Subject: [Buildroot] [git commit] ruby: bump to version 1.9.2-p290
Message-ID: <20111205134653.EBBC58F7A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a521a0d2e7f0735600e5640be7328f7658ba12ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/ruby-configure2.patch     |   26 ---------------
 package/ruby/ruby-openssl1.0-fix.patch |   53 --------------------------------
 package/ruby/ruby.mk                   |    2 +-
 3 files changed, 1 insertions(+), 80 deletions(-)

diff --git a/package/ruby/ruby-configure2.patch b/package/ruby/ruby-configure2.patch
deleted file mode 100644
index 405fc41..0000000
--- a/package/ruby/ruby-configure2.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From ac89b1414c84dbc038f623591c738b0637745415 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 4 Nov 2010 18:31:38 -0300
-Subject: [PATCH] Fix bad sed in configure.in
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.in |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index e97216f..a978c97 100644
---- a/configure.in
-+++ b/configure.in
-@@ -152,7 +152,7 @@ AC_MSG_RESULT([$ARCH_FLAG])
- AC_DEFUN([RUBY_UNIVERSAL_ARCH], [
- # RUBY_UNIVERSAL_ARCH begin
- test ${CFLAGS+set} && CFLAGS=`echo "$CFLAGS" | sed -e 's/ *-arch  *[^ ]*//g' -e 's/ *-m32//g' -e 's/ *-m64//g'`
--test ${LDFLAGS+set} && LDFLAGS=`echo "$LDFLAGS" | sed 's/ *-arch  *[^ ]*//g' -e 's/ *-m32//g' -e 's/ *-m64//g'`
-+test ${LDFLAGS+set} && LDFLAGS=`echo "$LDFLAGS" | sed -e 's/ *-arch  *[^ ]*//g' -e 's/ *-m32//g' -e 's/ *-m64//g'`
- unset ARCH_FLAG universal_binary universal_archnames
- if test ${target_archs+set}; then
-     AC_MSG_CHECKING([target architectures])
--- 
-1.7.2.2
-
diff --git a/package/ruby/ruby-openssl1.0-fix.patch b/package/ruby/ruby-openssl1.0-fix.patch
deleted file mode 100644
index 5591d99..0000000
--- a/package/ruby/ruby-openssl1.0-fix.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From b983e73adf7a7d3fd07fdf493eee51c22881a6e6 Mon Sep 17 00:00:00 2001
-From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
-Date: Wed, 6 Apr 2011 02:28:09 +0900
-Subject: [PATCH] Add option which enable SSLv2 support
-
-From openssl 1.0, SSLv2 becomes disable by default.
-If you want to use SSLv2 in ruby, you need config with --enable-opensslv2.
-The SSLv2 support is disable by default.
-
-Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
----
- ext/openssl/extconf.rb |    8 ++++++++
- ext/openssl/ossl_ssl.c |    2 ++
- 2 files changed, 10 insertions(+), 0 deletions(-)
-
-diff --git a/ext/openssl/extconf.rb b/ext/openssl/extconf.rb
-index b1f2d88..89c6f19 100644
---- a/ext/openssl/extconf.rb
-+++ b/ext/openssl/extconf.rb
-@@ -33,6 +33,14 @@ if with_config("debug") or enable_config("debug")
-   end
- end
- 
-+## 
-+## From openssl 1.0, SSLv2 becomes disable by default.
-+## If you want to use SSLv2 in ruby, you need config with --enable-opensslv2.
-+##
-+if enable_config("opensslv2")
-+  $defs << "-DENABLE_OPENSSLV2"
-+end
-+
- message "=== Checking for system dependent stuff... ===\n"
- have_library("nsl", "t_open")
- have_library("socket", "socket")
-diff --git a/ext/openssl/ossl_ssl.c b/ext/openssl/ossl_ssl.c
-index d8951fb..d0c9059 100644
---- a/ext/openssl/ossl_ssl.c
-+++ b/ext/openssl/ossl_ssl.c
-@@ -107,9 +107,11 @@ struct {
-     OSSL_SSL_METHOD_ENTRY(TLSv1),
-     OSSL_SSL_METHOD_ENTRY(TLSv1_server),
-     OSSL_SSL_METHOD_ENTRY(TLSv1_client),
-+#if defined(ENABLE_OPENSSLV2)
-     OSSL_SSL_METHOD_ENTRY(SSLv2),
-     OSSL_SSL_METHOD_ENTRY(SSLv2_server),
-     OSSL_SSL_METHOD_ENTRY(SSLv2_client),
-+#endif
-     OSSL_SSL_METHOD_ENTRY(SSLv3),
-     OSSL_SSL_METHOD_ENTRY(SSLv3_server),
-     OSSL_SSL_METHOD_ENTRY(SSLv3_client),
--- 
-1.7.4.1
-
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index d99fd1e..26db931 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-RUBY_VERSION = 1.9.2-p0
+RUBY_VERSION = 1.9.2-p290
 RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/1.9
 RUBY_AUTORECONF = YES
 HOST_RUBY_AUTORECONF = YES
