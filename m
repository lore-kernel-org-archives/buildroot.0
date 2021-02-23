From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2021 13:49:09 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: rationalise
 install step
Message-ID: <20210308072135.2B44788974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1c9c07b54dba2f2ffe9915207aca7cfedd5d10a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The logic we have for the installation of the firmware files is, to say
the least, non conventional. It is split in two parts:

  - one that copies files via an intermediate tarball: the tarball
    creation is used to detect if firmware files are missing (i.e. on
    a version bump) and fail the build if so, while the tarball
    extraction is the actual firmware installation;

  - one that copies directories one by one in a loop, removing the
    destination before the copy, to maintain a proper layout.

Needless to say, this is not very clean. First, there is no reason why
the directories can not be copied with the same mechanism as the files
themselves; not sure what I had in mind with b55bd5a9e25e...

Second, we're soon going to need the same installation step to copy the
firmware files in the images/ directory, to ease embedding in the kernel
image.

Rationalise this installation procedure.

Cherry-picking files and directories with cp, while still maintaining
the directory layout, is not trivial; rsync is not one of our
pre-requisites. So we're left with tar, which makes it easy. So we keep
using an intermediate tarball, but we use it for both files and
directories, and we generate it at build time, not install time.

That archive is then extracted during the installation.

Now the installation complexity is mostly located in the creation of the
symlinks, so we merge all of that directly into the _INSTALL_TARGET_CMDS
and drop the intermediate macros that have no longer any reason to exist.

This will also make it pretty simple to later install in the images/
directory.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index f23da171c6..9bc59435ef 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -638,22 +638,10 @@ LINUX_FIRMWARE_FILES += ti_3410.fw ti_5052.fw \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.moxa
 endif
 
-ifneq ($(LINUX_FIRMWARE_FILES),)
-define LINUX_FIRMWARE_INSTALL_FILES
+ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
+define LINUX_FIRMWARE_BUILD_CMDS
 	cd $(@D) && \
-		$(TAR) cf install.tar $(sort $(LINUX_FIRMWARE_FILES)) && \
-		$(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware
-endef
-endif
-
-ifneq ($(LINUX_FIRMWARE_DIRS),)
-# We need to rm-rf the destination directory to avoid copying
-# into it in itself, should we re-install the package.
-define LINUX_FIRMWARE_INSTALL_DIRS
-	$(foreach d,$(LINUX_FIRMWARE_DIRS), \
-		rm -rf $(TARGET_DIR)/lib/firmware/$(d); \
-		mkdir -p $(dir $(TARGET_DIR)/lib/firmware/$(d)); \
-		cp -a $(@D)/$(d) $(TARGET_DIR)/lib/firmware/$(d)$(sep))
+	$(TAR) cf br-firmware.tar $(sort $(LINUX_FIRMWARE_FILES) $(LINUX_FIRMWARE_DIRS))
 endef
 endif
 
@@ -686,7 +674,9 @@ endif
 # sure we canonicalize the pointed-to file, to cover the symlinks of the form
 # a/foo -> ../b/foo  where a/ (the directory where to put the symlink) does
 # not yet exist.
-define LINUX_FIRMWARE_CREATE_SYMLINKS
+define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware
+	$(TAR) xf $(@D)/br-firmware.tar -C $(TARGET_DIR)/lib/firmware/
 	cd $(TARGET_DIR)/lib/firmware/ ; \
 	sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE | \
 	while read f d; do \
@@ -697,11 +687,4 @@ define LINUX_FIRMWARE_CREATE_SYMLINKS
 	done
 endef
 
-define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/lib/firmware
-	$(LINUX_FIRMWARE_INSTALL_FILES)
-	$(LINUX_FIRMWARE_INSTALL_DIRS)
-	$(LINUX_FIRMWARE_CREATE_SYMLINKS)
-endef
-
 $(eval $(generic-package))
