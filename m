From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jan 2013 23:43:58 +0100
Subject: [Buildroot] [PATCH 14/29] package/qemu: add support for virtfs
In-Reply-To: <cover.1359498903.git.yann.morin.1998@free.fr>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
Message-ID: <ea4d462bd6c6a937d9fbfc3d58470d606ea2353e.1359498903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   16 ++++++++++++++++
 package/qemu/qemu.mk   |    7 ++++++-
 2 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 8719bde..75df82b 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -113,6 +113,22 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical window
 	  presenting the VM's display.
 
+comment "Block backends"
+
+config BR2_PACKAGE_QEMU_VIRTFS
+	bool "Enable plan9 ressources using VirtFS"
+	select BR2_PACKAGE_QEMU_CAP
+	select BR2_PACKAGE_QEMU_ATTR
+	help
+	  Say 'y' here if you want QEMU to provide a plan9 virtual "share"
+	  accessible from the guest OS for relatively fast access to host
+	  files.
+	  
+	  This requires that the guest OS is capable of accessing plan9
+	  ressources (typically, in Linux, this is done by a network
+	  file-system called 9p, and can be accelerated by using the 9p
+	  virtio).
+
 comment "Misc. features"
 
 config BR2_PACKAGE_QEMU_UUID
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c5861f0..39e5c49 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -149,6 +149,12 @@ else
 QEMU_OPTS += --disable-sdl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_VIRTFS),y)
+QEMU_OPTS += --enable-virtfs
+else
+QEMU_OPTS += --disable-virtfs
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_UUID),y)
 QEMU_OPTS += --enable-uuid
 QEMU_DEPENDENCIES += util-linux
@@ -255,7 +261,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-xen                       \
 	        --disable-slirp                     \
 	        --disable-vnc-sasl                  \
-	        --disable-virtfs                    \
 	        --disable-brlapi                    \
 	        --disable-curses                    \
 	        --disable-curl                      \
-- 
1.7.2.5
