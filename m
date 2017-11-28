From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Mon, 27 Nov 2017 19:27:22 -0800
Subject: [Buildroot] [PATCH 1/2] rauc: select host-squashfs as a host
 dependency
Message-ID: <20171128032723.14081-1-yurovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rauc host tool (used to generate update bundles) runs mksquashfs so
host-squashfs is required for it to work at runtime.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
---
 package/rauc/Config.in.host | 1 +
 package/rauc/rauc.mk        | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rauc/Config.in.host b/package/rauc/Config.in.host
index a58685a2e6..1bd9a7935a 100644
--- a/package/rauc/Config.in.host
+++ b/package/rauc/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_RAUC
 	bool "host rauc"
+	select BR2_PACKAGE_HOST_SQUASHFS # run-time dependency
 	help
 	  RAUC is the Robust Auto-Update Controller developed by
 	  Pengutronix. Enable this option to build the rauc
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 479a583206..67ef1556e7 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -29,7 +29,7 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 RAUC_DEPENDENCIES += systemd
 endif
 
-HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2
+HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2 host-squashfs
 HOST_RAUC_CONF_OPTS += --disable-network --disable-json --disable-service
 
 $(eval $(autotools-package))
-- 
2.14.3
