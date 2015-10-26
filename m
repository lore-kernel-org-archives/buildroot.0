From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 17:48:02 +0100
Subject: [Buildroot] [git commit] kmod: Fix tool links when
	BR2_ROOTFS_MERGED_USR
Message-ID: <20151026164906.2106E81EA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2aca24c4d124025fcb5ab1596867e37d31855a59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use KMOD_BIN_PATH instead of doubling logic, add comment explaining
	why this is needed]
Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kmod/kmod.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index e07e601..3742a03 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -46,9 +46,16 @@ KMOD_LICENSE_FILES += COPYING
 # take precedence over busybox implementation
 KMOD_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 
+# /sbin is really /usr/sbin with merged /usr, so adjust relative symlink
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+KMOD_BIN_PATH = ../bin/kmod
+else
+KMOD_BIN_PATH = ../usr/bin/kmod
+endif
+
 define KMOD_INSTALL_TOOLS
 	for i in depmod insmod lsmod modinfo modprobe rmmod; do \
-		ln -sf ../usr/bin/kmod $(TARGET_DIR)/sbin/$$i; \
+		ln -sf $(KMOD_BIN_PATH) $(TARGET_DIR)/sbin/$$i; \
 	done
 endef
 
