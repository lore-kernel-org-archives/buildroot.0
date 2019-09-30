From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:31:45 +0200
Subject: [Buildroot] [git commit] package/libsodium: add config for full
 build
Message-ID: <20190930212640.210468404C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad7963ea90ce1d762e2b3d8a0c76b4d0bc1fa805
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A new option is added to build all functions.

This option was implicitly used before, so it is activated by default to
avoid unpleasant surprises.

Signed-off-by: Adrien Gallou??t <adrien@gallouet.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsodium/Config.in    | 12 ++++++++++++
 package/libsodium/libsodium.mk |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/package/libsodium/Config.in b/package/libsodium/Config.in
index 47b9bb350c..518b0532ed 100644
--- a/package/libsodium/Config.in
+++ b/package/libsodium/Config.in
@@ -4,3 +4,15 @@ config BR2_PACKAGE_LIBSODIUM
 	  A modern and easy-to-use crypto library.
 
 	  http://libsodium.org/
+
+if BR2_PACKAGE_LIBSODIUM
+
+config BR2_PACKAGE_LIBSODIUM_FULL
+	bool "all functions"
+	default y
+	help
+	  Build all seldom used and obsolete functions. Without
+	  this option, only the minimal set of normally used
+	  functions is built.
+
+endif
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index a94a8271c5..a8e0f79149 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -14,5 +14,11 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LIBSODIUM_CONF_OPTS += --disable-pie
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSODIUM_FULL),y)
+LIBSODIUM_CONF_OPTS += --disable-minimal
+else
+LIBSODIUM_CONF_OPTS += --enable-minimal
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
