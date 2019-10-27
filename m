From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 14:17:32 +0100
Subject: [Buildroot] [git commit] package/libkcapi: support building
 kcapi-enc application
Message-ID: <20191027131831.5177A89118@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c5e5b66229735347b309111dc4ad6dee4b1edc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just add a new Kconfig option in order to support building kcapi-enc
application.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkcapi/Config.in   | 3 +++
 package/libkcapi/libkcapi.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/libkcapi/Config.in b/package/libkcapi/Config.in
index 1dbcdc381b..8243f6b738 100644
--- a/package/libkcapi/Config.in
+++ b/package/libkcapi/Config.in
@@ -8,6 +8,9 @@ config BR2_PACKAGE_LIBKCAPI
 
 if BR2_PACKAGE_LIBKCAPI
 
+config BR2_PACKAGE_LIBKCAPI_ENCAPP
+	bool "build enc application"
+
 config BR2_PACKAGE_LIBKCAPI_HASHER
 	bool "build hasher application"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 48d34ffc40..dceacc0016 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -16,6 +16,12 @@ LIBKCAPI_CONF_ENV = \
 	ac_cv_path_DB2PS="" \
 	ac_cv_path_XMLTO=""
 
+ifeq ($(BR2_PACKAGE_LIBKCAPI_ENCAPP),y)
+LIBKCAPI_CONF_OPTS += --enable-kcapi-encapp
+else
+LIBKCAPI_CONF_OPTS += --disable-kcapi-encapp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBKCAPI_HASHER),y)
 LIBKCAPI_CONF_OPTS += --enable-kcapi-hasher
 else
