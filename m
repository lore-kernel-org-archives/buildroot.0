From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 21:58:00 +0200
Subject: [Buildroot] [git commit] nginx-upload-module: add openssl lib
	dependency
Message-ID: <20170725195358.9F8E182156@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c90b9732391b3eec2a8cb9af273585a17fb2cece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building against nginx 1.11.2+, requires additional
-lcrypto dependency. (Nginx changed crypto approach
and dependencies for openssl are no longer default)

Upstream pull request:
https://github.com/vkholodkov/nginx-upload-module/pull/93

Fixes:
http://autobuild.buildroot.net/results/e25f8ba8d8743e47a77707cf582e58477e1860e6
http://autobuild.buildroot.net/results/c4aa6e22033be934bd311cd9761f646d44618dc0
http://autobuild.buildroot.net/results/75e935d248b46df11c32c95526423a2287ac8c62

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-upload-module-add-openssl-lib-dependency.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/nginx-upload/0001-nginx-upload-module-add-openssl-lib-dependency.patch b/package/nginx-upload/0001-nginx-upload-module-add-openssl-lib-dependency.patch
new file mode 100644
index 0000000..1161751
--- /dev/null
+++ b/package/nginx-upload/0001-nginx-upload-module-add-openssl-lib-dependency.patch
@@ -0,0 +1,56 @@
+From 600d0a36c2af785c8284acadeb062d73247281af Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Sun, 23 Jul 2017 09:21:23 -0500
+Subject: [PATCH] nginx-upload-module: add openssl lib dependency
+
+When building against nginx 1.11.2+, requires additional
+-lcrypto dependency. (Nginx changed crypto approach
+and dependencies for openssl are no longer default)
+
+More details found here:
+https://github.com/vkholodkov/nginx-upload-module/issues/79
+
+Upstream pull request:
+https://github.com/vkholodkov/nginx-upload-module/pull/93
+
+Resolves build failure:
+objs/addon/nginx-upload-70bee48f1811eecd255ed094ce9f0fb560c390c3/ngx_http_upload_module.o \
+objs/ngx_modules.o \
+-ldl -lpthread -lpthread -lpcre -lz -latomic_ops \
+-Wl,-E
+ngx_http_upload_module.o: In function `ngx_http_upload_flush_output_buffer':
+ngx_http_upload_module.c:1625: undefined reference to `MD5_Update'
+ngx_http_upload_module.c:1628: undefined reference to `SHA1_Update'
+ngx_http_upload_module.c:1631: undefined reference to `SHA256_Update'
+ngx_http_upload_module.c:1634: undefined reference to `SHA512_Update'
+
+Fixes:
+http://autobuild.buildroot.net/results/e25f8ba8d8743e47a77707cf582e58477e1860e6
+http://autobuild.buildroot.net/results/c4aa6e22033be934bd311cd9761f646d44618dc0
+http://autobuild.buildroot.net/results/75e935d248b46df11c32c95526423a2287ac8c62
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ config | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/config b/config
+index cabd4f1..293529f 100644
+--- a/config
++++ b/config
+@@ -1,11 +1,10 @@
+-USE_MD5=YES
+-USE_SHA1=YES
+ ngx_addon_name=ngx_http_upload_module
+ 
+ if test -n "$ngx_module_link"; then
+     ngx_module_type=HTTP
+     ngx_module_name=$ngx_addon_name
+     ngx_module_srcs="$ngx_addon_dir/ngx_http_upload_module.c"
++    ngx_module_libs="$(${PKG_CONFIG:=pkg-config} --libs openssl)"
+ 
+     . auto/module
+ else
+-- 
+1.9.1
+
