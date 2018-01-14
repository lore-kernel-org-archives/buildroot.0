From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 14 Jan 2018 21:41:19 -0200
Subject: [Buildroot] [PATCH 1/3] linux-firmware: fail build for missing file
Message-ID: <1515973281-3997-1-git-send-email-ricardo.martincoski@gmail.com>
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
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
Should it go to 2017.11.x and 2017.08.x too? See next patch
---
 package/linux-firmware/linux-firmware.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index cf79e56..03704d8 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -443,9 +443,9 @@ endif
 
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
-	cd $(@D) ; \
-	$(TAR) c $(sort $(LINUX_FIRMWARE_FILES)) | \
-		$(TAR) x -C $(TARGET_DIR)/lib/firmware
+	cd $(@D) && \
+		$(TAR) cf install.tar $(sort $(LINUX_FIRMWARE_FILES)) && \
+		$(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware
 endef
 endif
 
-- 
2.7.4
