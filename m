From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 May 2021 14:36:39 +0200
Subject: [Buildroot] [git commit] package/nginx: add upstream CVE-2021-23017
 security fix
Message-ID: <20210528120731.642648AF1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab9ceea782c770acdb9a25d8601b12af261c8ccb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following vulnerability:

- CVE-2021-23017: 1-byte memory overwrite in resolver

For more details, see the advisories:
https://mailman.nginx.org/pipermail/nginx-announce/2021/000300.html
https://www.openwall.com/lists/oss-security/2021/05/25/5

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998 at free.fr: annotate the patch, that it is a backport]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...xed-off-by-one-write-in-ngx_resolver_copy.patch | 40 ++++++++++++++++++++++
 package/nginx/nginx.mk                             |  3 ++
 2 files changed, 43 insertions(+)

diff --git a/package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch b/package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch
new file mode 100644
index 0000000000..ba47768fe5
--- /dev/null
+++ b/package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch
@@ -0,0 +1,40 @@
+From 9f1dcb0c0473641730b871dee984016ff19d2c53 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Tue, 25 May 2021 15:17:36 +0300
+Subject: [PATCH] Resolver: fixed off-by-one write in ngx_resolver_copy().
+
+Reported by Luis Merino, Markus Vervier, Eric Sesterhenn, X41 D-Sec GmbH.
+
+[peter at korsgaard.com: backport from upstream]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/core/ngx_resolver.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/core/ngx_resolver.c b/src/core/ngx_resolver.c
+index 79390701..63b26193 100644
+--- a/src/core/ngx_resolver.c
++++ b/src/core/ngx_resolver.c
+@@ -4008,15 +4008,15 @@ done:
+             n = *src++;
+ 
+         } else {
++            if (dst != name->data) {
++                *dst++ = '.';
++            }
++
+             ngx_strlow(dst, src, n);
+             dst += n;
+             src += n;
+ 
+             n = *src++;
+-
+-            if (n != 0) {
+-                *dst++ = '.';
+-            }
+         }
+ 
+         if (n == 0) {
+-- 
+2.20.1
+
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 8a371a2cc8..e93e802fd3 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -13,6 +13,9 @@ NGINX_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 
+# 0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch
+NGINX_IGNORE_CVES += CVE-2021-23017
+
 NGINX_CONF_OPTS = \
 	--crossbuild=Linux::$(BR2_ARCH) \
 	--with-cc="$(TARGET_CC)" \
