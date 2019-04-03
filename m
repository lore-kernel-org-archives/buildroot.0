From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  3 Apr 2019 22:13:25 +0200
Subject: [Buildroot] [PATCH] fs/common.mk: disable real chown calls in
 fakeroot
Message-ID: <20190403201325.31664-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fakeroot by default forwards {f,l,}chown calls to libc and ignores
permission issues, which may cause issues when building in restricted
environments like user namespaces as set up with bubblewrap where a chown
call with a uid/gid not mapped in the user namespace instead returns EINVAL.
This error is not masked by fakeroot and returned to the caller, causing
failures.

There is no real reason to really perform the *chown calls in the context of
Buildroot (as the calls will likely just fail and files are not accessed
outside the fakeroot environment any way).

This forwarding can be disabled by setting the FAKEROOTDONTTRYCHOWN
environment variable, so set it when fakeroot is executed.

Reported-by: Esben Nielsen <nielsen.esben@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index daa43efd75..4ad51fdd0a 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -146,7 +146,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
-	PATH=$$(BR_PATH) $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
+	PATH=$$(BR_PATH) FAKEROOTDONTTRYCHOWN=1 $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 	$(Q)rm -rf $$(TARGET_DIR)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
-- 
2.11.0
