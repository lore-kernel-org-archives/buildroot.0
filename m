From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2012 17:35:06 +0100
Subject: [Buildroot] [PATCH 33/51] package/qemu: add support for capabilities
In-Reply-To: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355070924-8009-34-git-send-email-yann.morin.1998@free.fr>
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
index 6daaf98..4045e85 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -126,6 +126,13 @@ config BR2_PACKAGE_QEMU_UUID
 comment "UUID support requires libuuid (from util-linux)"
 	depends on !BR2_PACKAGE_UTIL_LINUX_LIBUUID
 
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
index 29e01d4..12c08e7 100644
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
@@ -248,7 +258,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-guest-base                \
 	        --disable-vde                       \
 	        --disable-linux-aio                 \
-	        --disable-cap-ng                    \
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-- 
1.7.2.5
