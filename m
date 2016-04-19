From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Tue, 19 Apr 2016 11:54:24 +1000
Subject: [Buildroot] [PATCH V2 1/1] nvme: Allow libudev support
Message-ID: <1461030864-11359-1-git-send-email-sam@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commands like 'nvme list' require libudev but support for libudev is
decided at compile time, and in buildroot this is hard disabled.
Add a check for udev and if it is available build nvme with udev
support.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
v2: Use BR2_PACKAGE_HAS_UDEV and NVME_MAKE_OPTS instead of a new option
as suggested by Thomas Petazzoni

 package/nvme/nvme.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 7c4bd8e..3571494 100755
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -8,11 +8,17 @@ NVME_VERSION = v0.3
 NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
 NVME_LICENSE = GPLv2+
 NVME_LICENSE_FILES = LICENSE
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+NVME_DEPENDENCIES += udev
+NVME_MAKE_OPTS = LIBUDEV=0
+else
+NVME_MAKE_OPTS = LIBUDEV=1
+endif
 
 # LIBUDEV=1 means that libudev is _disabled_
 define NVME_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		LIBUDEV=1 -C $(@D)
+		$(NVME_MAKE_OPTS) -C $(@D)
 endef
 
 define NVME_INSTALL_TARGET_CMDS
-- 
2.8.0
