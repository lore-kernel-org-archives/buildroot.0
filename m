From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:09 +0200
Subject: [Buildroot] [PATCH 21/36] package/qemu: add support for capabilities
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-21-git-send-email-yann.morin.1998@free.fr>
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
index ea85e5f..8cdcd08 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -118,6 +118,13 @@ config BR2_PACKAGE_QEMU_UUID
 	help
 	  Say 'y' here to have QEMU support UUIDs for VMs.
 
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
index 3806fa7..17459ba 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -88,6 +88,16 @@ else
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
@@ -185,7 +195,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-guest-base                \
 	        --disable-vde                       \
 	        --disable-linux-aio                 \
-	        --disable-cap-ng                    \
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-- 
1.7.2.5
