From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Feb 2013 15:07:03 +0100
Subject: [Buildroot] [PATCH 26/29] package/qemu: add option to install tools
	on the target
In-Reply-To: <cover.1359899108.git.yann.morin.1998@free.fr>
References: <cover.1359899108.git.yann.morin.1998@free.fr>
Message-ID: <49e279c4ee2a0b5d540811f1b82aad1eba848329.1359899108.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Usually, tools on the target are not needed, so they are disabled
by default. Add an option to install them on the target.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    6 ++++++
 package/qemu/qemu.mk   |    7 ++++++-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 5f4bee3..e0d5825 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -257,6 +257,12 @@ config BR2_PACKAGE_QEMU_SECCOMP
 	  Say 'y' here to have QEMU to use the Linux kernel's seccomp filter,
 	  to more tightly confine the VMs.
 
+config BR2_PACKAGE_QEMU_TOOLS_ON_TARGET
+	bool "tools on target"
+	help
+	  Say 'y' here to also install QEMU tools (qemu-{img,io,nbd}) on the
+	  target.
+
 config BR2_PACKAGE_QEMU_BLOBS
 	bool "Install binary blobs"
 	default y
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3a09cdc..d3541cf 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -258,6 +258,12 @@ else
 QEMU_OPTS += --disable-seccomp
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_TOOLS_ON_TARGET),y)
+QEMU_OPTS += --enable-tools
+else
+QEMU_OPTS += --disable-tools
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
 QEMU_OPTS += --disable-blobs
 endif
@@ -347,7 +353,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-smartcard                 \
 	        --disable-strip                     \
 	        --disable-sparse                    \
-	        --disable-tools                     \
 	        $(QEMU_OPTS)                        \
 	)
 endef
-- 
1.7.2.5
