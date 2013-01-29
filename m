From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jan 2013 23:43:56 +0100
Subject: [Buildroot] [PATCH 12/29] package/qemu: add support for capabilities
In-Reply-To: <cover.1359498903.git.yann.morin.1998@free.fr>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
Message-ID: <6042e25313acb80ec5c0d2d1cbad9ef057535282.1359498903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    7 +++++++
 package/qemu/qemu.mk   |   11 ++++++++++-
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 4952c34..2c46937 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -125,6 +125,13 @@ config BR2_PACKAGE_QEMU_UUID
 comment "UUID support requires util-linux (for libuuid)"
 	depends on !BR2_PACKAGE_UTIL_LINUX
 
+config BR2_PACKAGE_QEMU_CAP
+	bool "Enable capabilities"
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBCAP_NG
+	help
+	  Say 'y' here if you want QEMU to support capabilities.
+
 config BR2_PACKAGE_QEMU_BLOBS
 	bool "Install binary blobs"
 	default y
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index bdccbf5..7e704b9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -156,6 +156,16 @@ else
 QEMU_OPTS += --disable-uuid
 endif
 
+# There's no configure flag to disable use of libcap
+# so we must use an environment variable
+ifeq ($(BR2_PACKAGE_QEMU_CAP),y)
+QEMU_OPTS += --enable-cap-ng
+QEMU_DEPENDENCIES += libcap libcap-ng
+else
+QEMU_OPTS += --disable-cap-ng
+QEMU_VARS += cap=no
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
 QEMU_OPTS += --disable-blobs
 endif
@@ -249,7 +259,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-guest-base                \
 	        --disable-vde                       \
 	        --disable-linux-aio                 \
-	        --disable-cap-ng                    \
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-- 
1.7.2.5
