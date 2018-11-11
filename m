From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sun, 11 Nov 2018 16:06:51 +0100
Subject: [Buildroot] [PATCH] acpid: Make bundled event files optional
In-Reply-To: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
Message-ID: <20181111150652.17459-6-alexander.sverdlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On one hand the preinstalled /etc/acpi/events/powerbtn is not part of
acpid, one other hand others might want to implement more complicated logic
on power button. Therefore, make it optional.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 package/acpid/Config.in | 10 ++++++++++
 package/acpid/acpid.mk  |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/package/acpid/Config.in b/package/acpid/Config.in
index 0c8ecf2473..f6fb0ae1fc 100644
--- a/package/acpid/Config.in
+++ b/package/acpid/Config.in
@@ -9,3 +9,13 @@ config BR2_PACKAGE_ACPID
 	  specific events.
 
 	  http://sourceforge.net/projects/acpid2/
+
+if BR2_PACKAGE_ACPID
+
+config BR2_PACKAGE_ACPID_SUPPLEMENTARY
+	bool "Supplementary event handlers"
+	default y
+	help
+	  Install additional event handlers such as power button handler
+
+endif
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index c5ed3bfbeb..21bed5c220 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -35,6 +35,8 @@ define ACPID_SET_EVENTS
 		>$(TARGET_DIR)/etc/acpi/events/powerbtn
 endef
 
+ifeq ($(BR2_PACKAGE_ACPID_SUPPLEMENTARY),y)
 ACPID_POST_INSTALL_TARGET_HOOKS += ACPID_SET_EVENTS
+endif
 
 $(eval $(autotools-package))
-- 
2.19.1
