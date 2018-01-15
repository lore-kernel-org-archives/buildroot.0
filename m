From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 21:03:28 +0100
Subject: [Buildroot] [git commit] linux-firmware: fail build for missing file
Message-ID: <20180115201154.976E283CD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21a283ffb0d0f492443b9281d338574eebbf8d8d
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
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
