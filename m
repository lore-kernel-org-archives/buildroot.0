From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jan 2013 23:44:08 +0100
Subject: [Buildroot] [PATCH 24/29] package/qemu: add support for libseccomp
In-Reply-To: <cover.1359498903.git.yann.morin.1998@free.fr>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
Message-ID: <1d3245c7cfee8b363a141ab9b6080a63d7c30294.1359498903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    7 +++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index d6b2f95..f71311d 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -264,6 +264,13 @@ config BR2_PACKAGE_QEMU_ATTR
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
index 0cd1a37..ddee260 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -251,6 +251,13 @@ else
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
@@ -339,7 +346,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-rbd                       \
 	        --disable-smartcard                 \
 	        --disable-strip                     \
-	        --disable-seccomp                   \
 	        --disable-sparse                    \
 	        --disable-tools                     \
 	        $(QEMU_OPTS)                        \
-- 
1.7.2.5
