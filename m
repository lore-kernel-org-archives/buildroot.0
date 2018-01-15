From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 21:11:04 +0100
Subject: [Buildroot] [git commit] armbian-firmware: fail build for missing
 file
Message-ID: <20180115201154.C8CF083570@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05e377ce0e8e57f107353f32cc1ad70f7a3afeee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a file is listed to be installed but is missing from the package
source currently the first tar command exits with error code but it is
ignored and the build succeeds.
This issue by itself is minor because those listed files that are
present in the package source get installed to the target.
But the code is currently error prone, e.g. to a typo in the file list.

Fix this by first creating a tarball in the build directory and then
installing it, instead of using a pipe between the two tar invocations.
Also use && between the commands, so the first command that exits with
error code fails the build.
Since the two tar invocations remain in use, the desired behavior
remains the same:
 - list of files can contain *;
 - list of files can contain file inside path, and the path is then
   replicated in the target;
 - symlinks are not followed but are installed.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/armbian-firmware/armbian-firmware.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
index 48b0372..77e5185 100644
--- a/package/armbian-firmware/armbian-firmware.mk
+++ b/package/armbian-firmware/armbian-firmware.mk
@@ -23,9 +23,9 @@ endif
 
 ifneq ($(ARMBIAN_FIRMWARE_FILES),)
 define ARMBIAN_FIRMWARE_INSTALL_FILES
-	cd $(@D) ; \
-	$(TAR) c $(sort $(ARMBIAN_FIRMWARE_FILES)) | \
-		$(TAR) x -C $(TARGET_DIR)/lib/firmware
+	cd $(@D) && \
+		$(TAR) cf install.tar $(sort $(ARMBIAN_FIRMWARE_FILES)) && \
+		$(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware
 endef
 endif
 
