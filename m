From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 21:56:28 +0200
Subject: [Buildroot] [git commit] libcoap: new package
Message-ID: <20160609195646.38E3C81E9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be2d938eb63d2bf15080f19d90c97b3b13736ee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
[Thomas:
 - Adjust license: it is "GPLv2+ or BSD-2c" and not "GPLv2, BSD-2c"
 - Add the COPYING file to the license files, since it indicates
   explictly that the license is GPLv2+ or BSD-2c.
 - Remove the --with-shared configure options, which doesn't exist.
 - Use LIBCOAP_AUTORECONF = YES instead of calling the autogen.sh script
   manually.
 - Add patch to fix build with old gcc versions.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 ...nly-add-Wunused-result-if-supported-by-th.patch | 38 ++++++++++++++++++++++
 package/libcoap/Config.in                          | 10 ++++++
 package/libcoap/libcoap.hash                       |  2 ++
 package/libcoap/libcoap.mk                         | 15 +++++++++
 5 files changed, 66 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 38c8527..d78ffaf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1139,6 +1139,7 @@ menu "Networking"
 	source "package/ibrdtn/Config.in"
 	source "package/libcgi/Config.in"
 	source "package/libcgicc/Config.in"
+	source "package/libcoap/Config.in"
 	source "package/libcurl/Config.in"
 	source "package/libdnet/Config.in"
 	source "package/libeXosip2/Config.in"
diff --git a/package/libcoap/0001-configure-only-add-Wunused-result-if-supported-by-th.patch b/package/libcoap/0001-configure-only-add-Wunused-result-if-supported-by-th.patch
new file mode 100644
index 0000000..bc93890
--- /dev/null
+++ b/package/libcoap/0001-configure-only-add-Wunused-result-if-supported-by-th.patch
@@ -0,0 +1,38 @@
+From d5914ecbb0285aea1eb2b9432d6e91155877fd95 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 9 Jun 2016 21:53:59 +0200
+Subject: [PATCH] configure: only add -Wunused-result if supported by the
+ compiler
+
+Old gcc versions such as 4.3.x do not support -Wunused-result, so
+instead of unconditionally using this warning, only use it if supported
+by the compiler.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+Submitted upstream: https://github.com/obgm/libcoap/pull/32
+
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f4452ac..6354fcf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -110,12 +110,12 @@ WARNING_CFLAGS="\
+ -Wswitch-default \
+ -Wswitch-enum \
+ -Wunused \
+--Wunused-result \
+ "
+ 
+ # check whether or not the compiler supports -Wlogical-op (clang does not...)
+ AX_CHECK_COMPILE_FLAG([-Wlogical-op], [WARNING_CFLAGS="$WARNING_CFLAGS -Wlogical-op"],,[-Werror])
+ AX_CHECK_COMPILE_FLAG([-fdiagnostics-color], [CFLAGS="$CFLAGS -fdiagnostics-color"],,[-Werror])
++AX_CHECK_COMPILE_FLAG([-Wunused-result], [WARNING_CFLAGS="$WARNING_CFLAGS -Wunused-result"])
+ 
+ AC_SUBST([WARNING_CFLAGS])
+ 
+-- 
+2.7.4
+
diff --git a/package/libcoap/Config.in b/package/libcoap/Config.in
new file mode 100644
index 0000000..7aea348
--- /dev/null
+++ b/package/libcoap/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBCOAP
+	bool "libcoap"
+	help
+	 libcoap is a C implementation of a lightweight application-protocol
+	 for devices that are constrained their resources such as computing
+	 power, RF range, memory, bandwith, or network packet sizes. This
+	 protocol, CoAP, is standardized by the IETF as RFC 7252. For further
+	 information related to CoAP, see <http://coap.technology>.
+
+	 https://github.com/obgm/libcoap
diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
new file mode 100644
index 0000000..dce491b
--- /dev/null
+++ b/package/libcoap/libcoap.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f66e91742c2b027fcd7c575d8e7b53d79d3624aad1b3baba481dd88f6e2bc44d libcoap-c909bf802034b7762a2182848304b2530e58444f.tar.gz
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
new file mode 100644
index 0000000..ef9b731
--- /dev/null
+++ b/package/libcoap/libcoap.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libcoap
+#
+################################################################################
+
+LIBCOAP_VERSION = c909bf802034b7762a2182848304b2530e58444f
+LIBCOAP_SITE = $(call github,obgm,libcoap,$(LIBCOAP_VERSION))
+LIBCOAP_INSTALL_STAGING = YES
+LIBCOAP_LICENSE = GPLv2+ or BSD-2c
+LIBCOAP_LICENSE_FILES = COPYING LICENSE.GPL LICENSE.BSD
+LIBCOAP_CONF_OPTS = --disable-examples
+LIBCOAP_AUTORECONF = YES
+
+$(eval $(autotools-package))
