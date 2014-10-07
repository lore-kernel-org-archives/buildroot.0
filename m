From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:22 +0200
Subject: [Buildroot] [PATCH 13/30] package/qemu: add support for capabilities
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <4a88cbdf37fc1a5dd3866b0c94412bb0ca9681be.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |  7 +++++++
 package/qemu/qemu.mk   | 11 ++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 83d9d76..7fa09cb 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -117,6 +117,13 @@ config BR2_PACKAGE_QEMU_UUID
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
index d10d7dd..df8c324 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -158,6 +158,16 @@ else
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
@@ -244,7 +254,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-guest-base                \
 	        --disable-vde                       \
 	        --disable-linux-aio                 \
-	        --disable-cap-ng                    \
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-- 
1.9.1
