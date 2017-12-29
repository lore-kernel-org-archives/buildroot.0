From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 23:32:31 +0100
Subject: [Buildroot] [git commit] nginx: fix patch using pkg-config
Message-ID: <20171229223438.F246283845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c110d79560213b9245696059eafcc43f13ae147
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The regular expression that drops the -I flag from the output of
pkg-config --cflags-only-I doesn't work properly as it is too naive:
it breaks a path if it contains -I:

$ echo "-I/usr/Some-Install-Location/include" | sed 's/-I//g'
/usr/Somenstall-Location/include
$ echo "-I/usr/Some-Install-Location/include" | sed -re 's/(^|\s)-I\s*(\S+)/\1\2/g'
/usr/Some-Install-Location/include

Signed-off-by: Ignacy Gaw??dzki <ignacy.gawedzki@green-communications.fr>
[Thomas: improved commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch | 5 +++--
 package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch b/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
index b315909..103f90b 100644
--- a/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
+++ b/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
@@ -15,13 +15,14 @@ diff --git a/auto/lib/libxslt/conf b/auto/lib/libxslt/conf
 index 3a0f37b..3c2a60e 100644
 --- a/auto/lib/libxslt/conf
 +++ b/auto/lib/libxslt/conf
-@@ -12,8 +12,8 @@
+@@ -12,8 +12,9 @@
                        #include <libxslt/xsltInternals.h>
                        #include <libxslt/transform.h>
                        #include <libxslt/xsltutils.h>"
 -    ngx_feature_path="/usr/include/libxml2"
 -    ngx_feature_libs="-lxml2 -lxslt"
-+    ngx_feature_path="$(${PKG_CONFIG:=pkg-config} --cflags-only-I libxslt|sed 's/-I//g')"
++    ngx_feature_path="$(${PKG_CONFIG:=pkg-config} --cflags-only-I libxslt|
++			 sed -re 's/(^|\s)-I\s*(\S+)/\1\2/g')"
 +    ngx_feature_libs="$(${PKG_CONFIG:=pkg-config} --libs libxslt)"
      ngx_feature_test="xmlParserCtxtPtr    ctxt = NULL;
                        xsltStylesheetPtr   sheet = NULL;
diff --git a/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch b/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
index 0c94890..0bd4d33 100644
--- a/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
+++ b/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
@@ -15,13 +15,14 @@ diff --git a/auto/lib/openssl/conf b/auto/lib/openssl/conf
 index 39d9602..995c6f3 100644
 --- a/auto/lib/openssl/conf
 +++ b/auto/lib/openssl/conf
-@@ -58,8 +58,8 @@ else
+@@ -58,8 +58,9 @@ else
          ngx_feature_name="NGX_OPENSSL"
          ngx_feature_run=no
          ngx_feature_incs="#include <openssl/ssl.h>"
 -        ngx_feature_path=
 -        ngx_feature_libs="-lssl -lcrypto $NGX_LIBDL"
-+        ngx_feature_path="$(${PKG_CONFIG:=pkg-config} --cflags-only-I openssl|sed 's/-I//g')"
++        ngx_feature_path="$(${PKG_CONFIG:=pkg-config} --cflags-only-I openssl|
++			     sed -re 's/(^|\s)-I\s*(\S+)/\1\2/g')"
 +        ngx_feature_libs="$(${PKG_CONFIG:=pkg-config} --libs openssl)"
          ngx_feature_test="SSL_CTX_set_options(NULL, 0)"
          . auto/feature
