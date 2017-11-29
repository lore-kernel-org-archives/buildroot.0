From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 22:11:53 +0100
Subject: [Buildroot] [git commit] rauc: select host-squashfs as a host
 dependency
Message-ID: <20171129210644.C2457803E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e8e3e0fd556aeb62a5426506262fb1f9fe8a5fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rauc host tool (used to generate update bundles) runs mksquashfs so
host-squashfs is required for it to work at runtime.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rauc/Config.in.host | 1 +
 package/rauc/rauc.mk        | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rauc/Config.in.host b/package/rauc/Config.in.host
index a58685a..1bd9a79 100644
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
index 479a583..67ef155 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -29,7 +29,7 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 RAUC_DEPENDENCIES += systemd
 endif
 
-HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2
+HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2 host-squashfs
 HOST_RAUC_CONF_OPTS += --disable-network --disable-json --disable-service
 
 $(eval $(autotools-package))
