From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 09:33:18 +0200
Subject: [Buildroot] [git commit] nvme: add optional udev support
Message-ID: <20160419073327.CD215802A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0293c3cc9f99b81c78ed193a7ce6187c6c4c78d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commands like 'nvme list' require libudev but support for libudev is
decided at compile time, and in buildroot this is hard disabled.
Add a check for udev and if it is available build nvme with udev
support.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
[Thomas:
 - add comment to explain the LIBUDEV variable value
 - use += instead of = to assign <pkg>_MAKE_OPTS.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nvme/nvme.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 7c4bd8e..b745025 100755
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -9,10 +9,19 @@ NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
 NVME_LICENSE = GPLv2+
 NVME_LICENSE_FILES = LICENSE
 
+# Yes LIBUDEV=0 means udev support enabled, LIBUDEV=1 means udev
+# support disabled.
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+NVME_DEPENDENCIES += udev
+NVME_MAKE_OPTS += LIBUDEV=0
+else
+NVME_MAKE_OPTS += LIBUDEV=1
+endif
+
 # LIBUDEV=1 means that libudev is _disabled_
 define NVME_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		LIBUDEV=1 -C $(@D)
+		$(NVME_MAKE_OPTS) -C $(@D)
 endef
 
 define NVME_INSTALL_TARGET_CMDS
