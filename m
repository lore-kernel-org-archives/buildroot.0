From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 14 Jan 2018 21:41:21 -0200
Subject: [Buildroot] [PATCH 3/3] armbian-firmware: fail build for missing
 file
In-Reply-To: <1515973281-3997-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1515973281-3997-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1515973281-3997-3-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
This package copied the install commands from linux-firmware.
So let's copy the fix and also the commit log.
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
 
-- 
2.7.4
