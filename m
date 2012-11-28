From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:47 +0100
Subject: [Buildroot] [PATCH 48/51] package/qemu: add support for libseccomp
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-49-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    7 +++++++
 package/qemu/qemu.mk   |    7 ++++++-
 2 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 6c50746..68d3464 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -274,6 +274,13 @@ config BR2_PACKAGE_QEMU_ATTR
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
index 80424e6..4a157de 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -273,6 +273,12 @@ else
 QEMU_OPTS += --disable-attr
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_SECCOMP),y)
+QEMU_OPTS += --enable-seccomp
+else
+QEMU_OPTS += --disable-seccomp
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
 QEMU_OPTS += --disable-blobs
 endif
@@ -363,7 +369,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-rbd                       \
 	        --disable-smartcard                 \
 	        --disable-strip                     \
-	        --disable-seccomp                   \
 	        --disable-sparse                    \
 	        $(QEMU_OPTS)                        \
 	)
-- 
1.7.2.5
