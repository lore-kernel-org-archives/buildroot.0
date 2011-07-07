From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Jul 2011 08:37:19 +0200
Subject: [Buildroot] [git commit] ruby: fix build with openssl 1.0
Message-ID: <20110707063813.125738A341@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a78063a616d43d854f0984a0ffaeb694227e41af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch from Debian bug #620998

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/ruby-openssl1.0-fix.patch |   53 ++++++++++++++++++++++++++++++++
 1 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 package/ruby/ruby-openssl1.0-fix.patch

diff --git a/package/ruby/ruby-openssl1.0-fix.patch b/package/ruby/ruby-openssl1.0-fix.patch
new file mode 100644
index 0000000..5591d99
--- /dev/null
+++ b/package/ruby/ruby-openssl1.0-fix.patch
@@ -0,0 +1,53 @@
+From b983e73adf7a7d3fd07fdf493eee51c22881a6e6 Mon Sep 17 00:00:00 2001
+From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
+Date: Wed, 6 Apr 2011 02:28:09 +0900
+Subject: [PATCH] Add option which enable SSLv2 support
+
+From openssl 1.0, SSLv2 becomes disable by default.
+If you want to use SSLv2 in ruby, you need config with --enable-opensslv2.
+The SSLv2 support is disable by default.
+
+Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
+---
+ ext/openssl/extconf.rb |    8 ++++++++
+ ext/openssl/ossl_ssl.c |    2 ++
+ 2 files changed, 10 insertions(+), 0 deletions(-)
+
+diff --git a/ext/openssl/extconf.rb b/ext/openssl/extconf.rb
+index b1f2d88..89c6f19 100644
+--- a/ext/openssl/extconf.rb
++++ b/ext/openssl/extconf.rb
+@@ -33,6 +33,14 @@ if with_config("debug") or enable_config("debug")
+   end
+ end
+ 
++## 
++## From openssl 1.0, SSLv2 becomes disable by default.
++## If you want to use SSLv2 in ruby, you need config with --enable-opensslv2.
++##
++if enable_config("opensslv2")
++  $defs << "-DENABLE_OPENSSLV2"
++end
++
+ message "=== Checking for system dependent stuff... ===\n"
+ have_library("nsl", "t_open")
+ have_library("socket", "socket")
+diff --git a/ext/openssl/ossl_ssl.c b/ext/openssl/ossl_ssl.c
+index d8951fb..d0c9059 100644
+--- a/ext/openssl/ossl_ssl.c
++++ b/ext/openssl/ossl_ssl.c
+@@ -107,9 +107,11 @@ struct {
+     OSSL_SSL_METHOD_ENTRY(TLSv1),
+     OSSL_SSL_METHOD_ENTRY(TLSv1_server),
+     OSSL_SSL_METHOD_ENTRY(TLSv1_client),
++#if defined(ENABLE_OPENSSLV2)
+     OSSL_SSL_METHOD_ENTRY(SSLv2),
+     OSSL_SSL_METHOD_ENTRY(SSLv2_server),
+     OSSL_SSL_METHOD_ENTRY(SSLv2_client),
++#endif
+     OSSL_SSL_METHOD_ENTRY(SSLv3),
+     OSSL_SSL_METHOD_ENTRY(SSLv3_server),
+     OSSL_SSL_METHOD_ENTRY(SSLv3_client),
+-- 
+1.7.4.1
+
-- 
1.7.3.4
