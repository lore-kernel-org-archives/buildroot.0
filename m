From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Tue, 21 Nov 2017 20:17:47 -0800
Subject: [Buildroot] [PATCH v2] rauc: bump to version 0.2
In-Reply-To: <20171114043141.8245-1-ayurovsky@impinj.com>
References: <20171114043141.8245-1-ayurovsky@impinj.com>
Message-ID: <20171122041747.11363-1-yurovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 0.2 provides various bug fixes and feature enhancements.

Also the rauc host tool needs mksquashfs so it must select the squashfs
package.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
---
 package/rauc/Config.in.host | 1 +
 package/rauc/rauc.hash      | 4 ++--
 package/rauc/rauc.mk        | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

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
diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 78c3e27..a0503b2 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v0.1.1/rauc-0.1.1.tar.xz.asc
-sha256 d2901d493f1d3210aef6411e83b02edac3a678d6d825d71a1c61b5b6afc7e478 rauc-0.1.1.tar.xz
+# https://github.com/rauc/rauc/releases/download/v0.2/rauc-0.2.tar.xz.asc
+sha256 83aa3ac3716e1c29315162e3cbf5d4db79f26dd95efe1bc634bbce364b95491a rauc-0.2.tar.xz
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 479a583..4909062 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 0.1.1
+RAUC_VERSION = 0.2
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
@@ -29,7 +29,7 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 RAUC_DEPENDENCIES += systemd
 endif
 
-HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2
+HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2 host-squashfs
 HOST_RAUC_CONF_OPTS += --disable-network --disable-json --disable-service
 
 $(eval $(autotools-package))
-- 
2.9.5
