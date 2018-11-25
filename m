From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:14:51 +0100
Subject: [Buildroot] [git commit] qemu: enable seccomp if libseccomp is
 selected
Message-ID: <20181202071558.E9119815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3940e27462ef28053b4c779643f18918812309d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is required to use qemu with libvirt and allows us to resume working
on the libvirt package (https://patchwork.ozlabs.org/patch/841613).

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/qemu.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 5ee6abf731..66b74467b9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -81,6 +81,13 @@ else
 QEMU_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+QEMU_OPTS += --enable-seccomp
+QEMU_DEPENDENCIES += libseccomp
+else
+QEMU_OPTS += --disable-seccomp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 QEMU_OPTS += --enable-libssh2
 QEMU_DEPENDENCIES += libssh2
@@ -121,7 +128,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-libiscsi \
 			--disable-usb-redir \
 			--disable-strip \
-			--disable-seccomp \
 			--disable-sparse \
 			--disable-mpath \
 			--disable-sanitizers \
