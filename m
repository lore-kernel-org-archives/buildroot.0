From: christoph.muellner at theobroma-systems.com <christoph.muellner@theobroma-systems.com>
Date: Sun, 19 Jul 2020 00:44:44 +0200
Subject: [Buildroot] [PATCH] initscripts: Make installation of S20urandom
 optional.
Message-ID: <20200718224444.2748609-1-christoph.muellner@theobroma-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christoph M?llner <christoph.muellner@theobroma-systems.com>

S20urandom is a nice script. However, there are systems, which
cannot make use of that script for some reasons (e.g. systems that
only have read-only partitions).

So let's install S20urandom only if configured to do so
(with default y to keep backwards-compatibility).

Signed-off-by: Christoph M?llner <christoph.muellner@theobroma-systems.com>
Change-Id: I85f3fafd4c2b1c3f25eee32e4c311613fcc0294e
---
 package/initscripts/Config.in               | 10 ++++++++++
 package/initscripts/{init.d => }/S20urandom |  0
 package/initscripts/initscripts.mk          |  8 ++++++++
 3 files changed, 18 insertions(+)
 rename package/initscripts/{init.d => }/S20urandom (100%)

diff --git a/package/initscripts/Config.in b/package/initscripts/Config.in
index 82cbd5c678..f60d4da4e6 100644
--- a/package/initscripts/Config.in
+++ b/package/initscripts/Config.in
@@ -2,3 +2,13 @@ config BR2_PACKAGE_INITSCRIPTS
 	bool
 	help
 	  The basics startup scripts for both SysV and Busybox
+
+if BR2_PACKAGE_INITSCRIPTS
+
+config BR2_PACKAGE_INITSCRIPTS_URANDOM
+	bool "Initscript to preserve random seeed between reboots"
+	default y
+	help
+	  An init script, that preserves the random seed between reboots.
+
+endif
diff --git a/package/initscripts/init.d/S20urandom b/package/initscripts/S20urandom
similarity index 100%
rename from package/initscripts/init.d/S20urandom
rename to package/initscripts/S20urandom
diff --git a/package/initscripts/initscripts.mk b/package/initscripts/initscripts.mk
index cfee155570..d5f20f469d 100644
--- a/package/initscripts/initscripts.mk
+++ b/package/initscripts/initscripts.mk
@@ -4,6 +4,14 @@
 #
 ################################################################################
 
+define INITSCRIPTS_INSTALL_URANDOM
+	$(INSTALL) -D -m 0755 package/initscripts/S20urandom $(TARGET_DIR)/etc/init.d/
+endef
+
+ifeq ($(BR2_PACKAGE_INITSCRIPTS_URANDOM),y)
+INITSCRIPTS_INSTALL_TARGET_HOOKS += INITSCRIPTS_INSTALL_URANDOM
+endif
+
 define INITSCRIPTS_INSTALL_TARGET_CMDS
 	mkdir -p  $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -D -m 0755 package/initscripts/init.d/* $(TARGET_DIR)/etc/init.d/
-- 
2.26.2
