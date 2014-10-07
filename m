From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:34 +0200
Subject: [Buildroot] [PATCH 25/30] package/qemu: add support for libseccomp
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <2c73f40896468224e8901a32fb6fcf87eff675ef.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 7 +++++++
 package/qemu/qemu.mk   | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 549e0ac..2f9d032 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -237,6 +237,13 @@ config BR2_PACKAGE_QEMU_ATTR
 	  Say 'y' here to have QEMU support attributes (attr) and eXtended
 	  attibutes (xattr).
 
+config BR2_PACKAGE_QEMU_SECCOMP
+	bool "Enable seccomp filter"
+	select BR2_PACKAGE_LIBSECCOMP
+	help
+	  Say 'y' here to have QEMU to use the Linux kernel's seccomp filter,
+	  to more tightly confine the VMs.
+
 config BR2_PACKAGE_QEMU_BLOBS
 	bool "Install binary blobs"
 	default y
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 6ae1592..b79e60f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -249,6 +249,13 @@ else
 QEMU_OPTS += --disable-attr
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_SECCOMP),y)
+QEMU_OPTS += --enable-seccomp
+QEMU_DEPENDENCIES += libseccomp
+else
+QEMU_OPTS += --disable-seccomp
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
 QEMU_OPTS += --disable-blobs
 endif
@@ -331,7 +338,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-rbd                       \
 	        --disable-smartcard-nss             \
 	        --disable-strip                     \
-	        --disable-seccomp                   \
 	        --disable-sparse                    \
 	        --disable-tools                     \
 	        $(QEMU_OPTS)                        \
-- 
1.9.1
