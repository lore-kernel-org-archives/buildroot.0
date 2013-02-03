From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Feb 2013 15:06:50 +0100
Subject: [Buildroot] [PATCH 13/29] package/qemu: add attr/xattr option
In-Reply-To: <cover.1359899108.git.yann.morin.1998@free.fr>
References: <cover.1359899108.git.yann.morin.1998@free.fr>
Message-ID: <c2919c899352f0d923c1e0a4406395e3764af7e7.1359899108.git.yann.morin.1998@free.fr>
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
index 60a0b32..8a724cf 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -118,6 +118,12 @@ config BR2_PACKAGE_QEMU_CAP
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
index 7c6a7b9..6d7407e 100644
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
@@ -239,7 +245,6 @@ define QEMU_CONFIGURE_CMDS
 	        --audio-card-list=                  \
 	        --enable-kvm                        \
 	        --enable-nptl                       \
-	        --enable-attr                       \
 	        --enable-vhost-net                  \
 	        --disable-bsd-user                  \
 	        --disable-xen                       \
-- 
1.7.2.5
