From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Nov 2012 09:00:00 +0100
Subject: [Buildroot] [git commit] qemu: needs pkg-config
Message-ID: <20121105081344.BA27999BE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9874442ee2492944fd78305dd96cd25a63fa1fbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes

  http://autobuild.buildroot.org/results/ccb7d6da503a81015275ff1e4ba9a564203932ec/build-end.log

Even though the build failure happens on host-qemu, adding
host-pkgconf to QEMU_DEPENDENCIES seems like the right thing to do
since that this dependency will also be needed for the target qemu
once it gets included.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qemu/qemu.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index de72e04..c2c4103 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -8,6 +8,8 @@ QEMU_VERSION = 1.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 
+QEMU_DEPENDENCIES = host-pkgconf
+
 #       BR ARCH         qemu
 #       -------         ----
 #       arm             arm
@@ -53,7 +55,7 @@ endif
 HOST_QEMU_TARGETS=$(QEMU_ARCH)-linux-user
 
 define HOST_QEMU_CONFIGURE_CMDS
-	(cd $(@D); ./configure                          \
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure   \
 		--target-list="$(HOST_QEMU_TARGETS)"    \
 		--prefix="$(HOST_DIR)/usr"              \
 		--interp-prefix=$(STAGING_DIR)          \
