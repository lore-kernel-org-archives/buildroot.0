From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 May 2021 22:32:12 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/nginx: add
 libxcrypt optional dependency
Message-ID: <20210502200602.DE85081132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8efa1a303f0b36e990cb1240f7ddeaf410360aea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix build failure on uclibc with libxcrypt which has been added in
commit 464bbe26ff5fb9e5bfe26a26ea65c700b90598f5

Fixes:
 - http://autobuild.buildroot.org/results/79a51b0d348e756517b5c9ce815a67f5c657e7e6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d4f166d9513187066a04a294e7adc324ea04af90)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...09-auto-os-linux-fix-build-with-libxcrypt.patch | 38 ++++++++++++++++++++++
 package/nginx/nginx.mk                             |  4 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch b/package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch
new file mode 100644
index 0000000000..7e430ffc37
--- /dev/null
+++ b/package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch
@@ -0,0 +1,38 @@
+From 79f1fe5251afc4e22a138b0c8f44fc9c94093b8b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 2 Apr 2021 09:18:26 +0200
+Subject: [PATCH] auto/os/linux: fix build with libxcrypt
+
+If crypt_r is found in libcrypt, add -lcrypt to CORE_LIBS to avoid the
+following build failure with libxcrypt:
+
+objs/ngx_modules.o \
+-lpcre -L/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib -lssl -lcrypto -L/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib -lxslt -lxml2 -lGeoIP \
+-Wl,-E
+/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: objs/src/os/unix/ngx_user.o:/home/giuliobenetti/autobuild/run/instance-3/output-1/build/nginx-1.18.0/src/os/unix/ngx_user.c:18: undefined reference to `crypt_r'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/79a51b0d348e756517b5c9ce815a67f5c657e7e6
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ auto/os/linux | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/auto/os/linux b/auto/os/linux
+index 5e280eca..04682812 100644
+--- a/auto/os/linux
++++ b/auto/os/linux
+@@ -203,6 +203,9 @@ ngx_feature_test="struct crypt_data  cd;
+                   crypt_r(\"key\", \"salt\", &cd);"
+ . auto/feature
+ 
++if [ $ngx_found = yes ]; then
++    CORE_LIBS="$CORE_LIBS $ngx_feature_libs"
++fi
+ 
+ ngx_include="sys/vfs.h";     . auto/include
+ 
+-- 
+2.30.2
+
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 9c32546835..8a371a2cc8 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -9,7 +9,9 @@ NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
 NGINX_CPE_ID_VENDOR = nginx
-NGINX_DEPENDENCIES = host-pkgconf
+NGINX_DEPENDENCIES = \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 
 NGINX_CONF_OPTS = \
 	--crossbuild=Linux::$(BR2_ARCH) \
