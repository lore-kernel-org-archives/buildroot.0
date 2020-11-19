From: Mike Frampton <mikeframpo@gmail.com>
Date: Thu, 19 Nov 2020 22:08:53 +1300
Subject: [Buildroot] [PATCH v2 2/3] package/abootimg: add host build
In-Reply-To: <20201119090854.48955-1-mikeframpo@gmail.com>
References: <20201119090854.48955-1-mikeframpo@gmail.com>
Message-ID: <20201119090854.48955-3-mikeframpo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enabling package host build for abootimg so that boot images can be
created for boards which boot from this format.

Signed-off-by: Mike Frampton <mikeframpo@gmail.com>
---
 package/Config.in.host          |  1 +
 package/abootimg/Config.in.host |  8 ++++++++
 package/abootimg/abootimg.mk    | 10 ++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/abootimg/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index c69c756f3a..4f69785810 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+	source "package/abootimg/Config.in.host"
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
 	source "package/asn1c/Config.in.host"
diff --git a/package/abootimg/Config.in.host b/package/abootimg/Config.in.host
new file mode 100644
index 0000000000..1e178bc8bf
--- /dev/null
+++ b/package/abootimg/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_ABOOTIMG
+	bool "host abootimg"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
+	help
+	  Tool to manipulate Android Boot Images, either on files
+	  or directly on /dev block devices.
+	  
+	  https://github.com/ggrandou/abootimg
diff --git a/package/abootimg/abootimg.mk b/package/abootimg/abootimg.mk
index e906546948..64cee13c32 100644
--- a/package/abootimg/abootimg.mk
+++ b/package/abootimg/abootimg.mk
@@ -11,6 +11,7 @@ ABOOTIMG_LICENSE_FILES = LICENSE
 
 # depends on libblkid from util-linux
 ABOOTIMG_DEPENDENCIES = util-linux
+ABOOTIMG_HOST_DEPENDENCIES = host-util-linux
 
 define ABOOTIMG_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
@@ -20,4 +21,13 @@ define ABOOTIMG_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/abootimg $(TARGET_DIR)/usr/bin/abootimg
 endef
 
+define HOST_ABOOTIMG_BUILD_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define HOST_ABOOTIMG_INSTALL_CMDS
+	$(INSTALL) -m 0755 $(@D)/abootimg $(HOST_DIR)/usr/bin/abootimg
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.25.1
