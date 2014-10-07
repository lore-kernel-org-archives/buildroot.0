From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:23 +0200
Subject: [Buildroot] [PATCH 14/30] package/qemu: add attr/xattr option
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <6e034c87b40e05c78a881f57d1d061eae96b567e.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 6 ++++++
 package/qemu/qemu.mk   | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 7fa09cb..90e78a2 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -124,6 +124,12 @@ config BR2_PACKAGE_QEMU_CAP
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
index df8c324..edc83f8 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -168,6 +168,12 @@ QEMU_OPTS += --disable-cap-ng
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
 	        --with-system-pixman                \
 	        --audio-drv-list=                   \
 	        --enable-kvm                        \
-	        --enable-attr                       \
 	        --enable-vhost-net                  \
 	        --disable-bsd-user                  \
 	        --disable-xen                       \
-- 
1.9.1
