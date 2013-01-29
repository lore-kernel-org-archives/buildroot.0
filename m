From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jan 2013 23:43:57 +0100
Subject: [Buildroot] [PATCH 13/29] package/qemu: add attr/xattr option
In-Reply-To: <cover.1359498903.git.yann.morin.1998@free.fr>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
Message-ID: <445d5c9b105cc107dc7f65ebf36439604fdff728.1359498903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    6 ++++++
 package/qemu/qemu.mk   |    7 ++++++-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 2c46937..8719bde 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -132,6 +132,12 @@ config BR2_PACKAGE_QEMU_CAP
 	help
 	  Say 'y' here if you want QEMU to support capabilities.
 
+config BR2_PACKAGE_QEMU_ATTR
+	bool "Enable attr and xattr"
+	help
+	  Say 'y' here to have QEMU support attributes (attr) and eXtended
+	  attibutes (xattr).
+
 config BR2_PACKAGE_QEMU_BLOBS
 	bool "Install binary blobs"
 	default y
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 7e704b9..c5861f0 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -166,6 +166,12 @@ QEMU_OPTS += --disable-cap-ng
 QEMU_VARS += cap=no
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_ATTR),y)
+QEMU_OPTS += --enable-attr
+else
+QEMU_OPTS += --disable-attr
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
 QEMU_OPTS += --disable-blobs
 endif
@@ -244,7 +250,6 @@ define QEMU_CONFIGURE_CMDS
 	        --audio-card-list=                  \
 	        --enable-kvm                        \
 	        --enable-nptl                       \
-	        --enable-attr                       \
 	        --enable-vhost-net                  \
 	        --disable-bsd-user                  \
 	        --disable-xen                       \
-- 
1.7.2.5
