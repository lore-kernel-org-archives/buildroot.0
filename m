From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 15:20:14 +0200
Subject: [Buildroot] [git commit branch/next] package/libpsl: new package
Message-ID: <20210524125319.840E0888BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47acda3a95bd4310f884e741f20785d374af7b22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Package libpsl is a new non-optional dependency of future libsoup
versions.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[yann.morin.1998 at free.fr: reorder some variables]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libpsl/Config.in   |  8 ++++++++
 package/libpsl/libpsl.hash |  6 ++++++
 package/libpsl/libpsl.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 979813c1dd..845089736b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -35,6 +35,7 @@ F:	package/bubblewrap/
 F:	package/cage/
 F:	package/cog/
 F:	package/libepoxy/
+F:	package/libpsl/
 F:	package/libwpe/
 F:	package/webkitgtk/
 F:	package/wlroots/
diff --git a/package/Config.in b/package/Config.in
index 3c99ba8030..4dac63ab90 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1792,6 +1792,7 @@ menu "Networking"
 	source "package/libpagekite/Config.in"
 	source "package/libpcap/Config.in"
 	source "package/libpjsip/Config.in"
+	source "package/libpsl/Config.in"
 	source "package/librelp/Config.in"
 	source "package/librsync/Config.in"
 	source "package/libshairplay/Config.in"
diff --git a/package/libpsl/Config.in b/package/libpsl/Config.in
new file mode 100644
index 0000000000..dd484799e7
--- /dev/null
+++ b/package/libpsl/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBPSL
+	bool "libpsl"
+	select BR2_PACKAGE_LIBIDN2 if !BR2_PACKAGE_ICU && !BR2_PACKAGE_LIBIDN
+	select BR2_PACKAGE_LIBUNISTRING if !BR2_PACKAGE_ICU
+	help
+	  C library to handle the Public Suffix List of TLDs.
+
+	  https://github.com/rockdaboot/libpsl
diff --git a/package/libpsl/libpsl.hash b/package/libpsl/libpsl.hash
new file mode 100644
index 0000000000..552935e9ec
--- /dev/null
+++ b/package/libpsl/libpsl.hash
@@ -0,0 +1,6 @@
+# Locally generated
+sha256  ac6ce1e1fbd4d0254c4ddb9d37f1fa99dec83619c1253328155206b896210d4c  libpsl-0.21.1.tar.gz
+
+# Hashes for license files:
+sha256  7903413e7aa0bbcb77aa19150a3f1034edc0a760cff174f9a53efe4de6f056a4  COPYING
+sha256  1d7f52747a9169751cdf2641a8299c0098e9ecdf9429296ffd55bdb14c9ed5b3  src/LICENSE.chromium
diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
new file mode 100644
index 0000000000..69e5da4ca4
--- /dev/null
+++ b/package/libpsl/libpsl.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libpsl
+#
+################################################################################
+
+LIBPSL_VERSION = 0.21.1
+LIBPSL_SITE = https://github.com/rockdaboot/libpsl/releases/download/$(LIBPSL_VERSION)
+LIBPSL_LICENSE = MIT, BSD-3-Clause
+LIBPSL_LICENSE_FILES = COPYING src/LICENSE.chromium
+LIBPSL_DEPENDENCIES = host-pkgconf
+LIBPSL_INSTALL_STAGING = YES
+LIBPSL_CONF_OPTS = -Ddocs=false
+
+# The order of checks is the same as done by libpsl when configured.
+ifeq ($(BR2_PACKAGE_LIBIDN2)$(BR2_PACKAGE_LIBUNISTRING),yy)
+LIBPSL_CONF_OPTS += -Druntime=libidn2 -Dbuiltin=libidn2
+LIBPSL_DEPENDENCIES += libidn2 libunistring
+else ifeq ($(BR2_PACKAGE_ICU),y)
+LIBPSL_CONF_OPTS += -Druntime=libicu -Dbuiltin=libicu
+LIBPSL_DEPENDENCIES += icu
+else
+LIBPSL_CONF_OPTS += -Druntime=libidn -Dbuiltin=libidn
+LIBPSL_DEPENDENCIES += libidn libunistring
+endif
+
+$(eval $(meson-package))
