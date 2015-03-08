From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 22:21:36 +0100
Subject: [Buildroot] [git commit] fs: Bail out on errors in fakeroot script
Message-ID: <20150308212300.29B65807E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b577b3c3adf7de2582985160ab2906c8dabf22c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the generated fakeroot script has no error checking causing
make to continue building even if some of the fakeroot script commands
have failed. This can cause e.g. using an invalid device tables to go
unnoticed.

So add a "set -e" to the start of the fakeroot script so it will exit
with a failure code as soon as one of the script commands fails.

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 13bf4ad..1d3926f 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -72,6 +72,7 @@ $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	rm -f $$(FAKEROOT_SCRIPT)
 	rm -f $$(TARGET_DIR_WARNING_FILE)
 	rm -f $$(USERS_TABLE)
+	echo "set -e" >> $$(FAKEROOT_SCRIPT)
 	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 ifneq ($$(ROOTFS_DEVICE_TABLES),)
 	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
