From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 22:56:21 +0200
Subject: [Buildroot] [git commit] package/qemu: Compare host/target Linux
	version only during build phase
Message-ID: <20150521205633.ECA9F81E1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b1657621668ee8160f896cddc3009fc803b25ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes an error during source-check.

Thanks to Thomas for the hint:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/116183

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/qemu.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 04df79f..0620804 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -85,10 +85,12 @@ HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(
 # built with kernel headers that are older or the same as the kernel
 # version running on the host machine.
 #
+ifeq ($(BR_BUILDING),y)
 ifneq ($(HOST_QEMU_COMPARE_VERSION),OK)
 $(error "Refusing to build qemu-user: target Linux version newer than host's.")
 endif
 endif
+endif
 
 define HOST_QEMU_CONFIGURE_CMDS
 	cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure    \
