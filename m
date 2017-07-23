From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 22 Jul 2017 23:00:43 -0500
Subject: [Buildroot] [PATCH 1/1] nginx-upload-module: add openssl lib
	dependency
Message-ID: <1500782443-1515-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 ...-upload-module-add-openssl-lib-dependency.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/nginx-upload/0001-nginx-upload-module-add-openssl-lib-dependency.patch

diff --git a/package/nginx-upload/0001-nginx-upload-module-add-openssl-lib-dependency.patch b/package/nginx-upload/0001-nginx-upload-module-add-openssl-lib-dependency.patch
new file mode 100644
index 0000000..6cf3063
--- /dev/null
+++ b/package/nginx-upload/0001-nginx-upload-module-add-openssl-lib-dependency.patch
@@ -0,0 +1,61 @@
+From dcfb052988b333382fc7696fd811eb547734797a Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Sat, 22 Jul 2017 22:24:50 -0500
+Subject: [PATCH 1/1] nginx-upload-module: add openssl lib dependency
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
+ config | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/config b/config
+index cabd4f1..4a77858 100644
+--- a/config
++++ b/config
+@@ -1,14 +1,13 @@
+-USE_MD5=YES
+-USE_SHA1=YES
+ ngx_addon_name=ngx_http_upload_module
+ 
+ if test -n "$ngx_module_link"; then
+     ngx_module_type=HTTP
+     ngx_module_name=$ngx_addon_name
+     ngx_module_srcs="$ngx_addon_dir/ngx_http_upload_module.c"
++    ngx_module_libs=-lcrypto
+ 
+     . auto/module
+ else
+     HTTP_MODULES="$HTTP_MODULES ngx_http_upload_module"
+     NGX_ADDON_SRCS="$NGX_ADDON_SRCS $ngx_addon_dir/ngx_http_upload_module.c"
+-fi
+\ No newline at end of file
++fi
+-- 
+1.9.1
+
-- 
1.9.1
