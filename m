From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 19:40:47 +0100
Subject: [Buildroot] [PATCH-NEXT 2/4] package/linux-firmware.mk: get rid of
 temporary tarball for file installation
In-Reply-To: <20210212184049.13202-1-peter@korsgaard.com>
References: <20210212184049.13202-1-peter@korsgaard.com>
Message-ID: <20210212184049.13202-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the upcoming addition of the images-install step,
LINUX_FIRMWARE_INSTALl_FILES is called twice, for installing to the target
and to the images directory - Which may race with each other and cause
problems with the temporary install.tar tarball.

There is no specific reason to use a temporary file, we can just as well
pipe the two tar invocations together, so do that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 3420266335..b6549ad371 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -641,8 +641,8 @@ endif
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) && \
-		$(TAR) cf install.tar $(sort $(LINUX_FIRMWARE_FILES)) && \
-		$(TAR) xf install.tar -C $(1)
+		$(TAR) c $(sort $(LINUX_FIRMWARE_FILES)) | \
+		$(TAR) x -C $(1)
 endef
 endif
 
-- 
2.20.1
