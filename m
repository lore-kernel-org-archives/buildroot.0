From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 25 Jul 2014 17:31:41 +0200
Subject: [Buildroot] [PATCH 2/2] systemd: add hook to disable
	ldconfig.service
In-Reply-To: <1406302301-9382-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1406302301-9382-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1406302301-9382-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 215, systemd installs a service to execute /sbin/ldconfig
when the sysinit target is reached.

Unfortunately, /sbin/ldconfig is not installed on a target built using a
glibc-based toolchain.

As this service is not mandatory, it is now disabled, thus avoiding a
warning in the journal.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/systemd.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a5e1bd4..125b2fd 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -149,10 +149,17 @@ define SYSTEMD_SANITIZE_PATH_IN_UNITS
 		-exec $(SED) 's,$(HOST_DIR),,g' {} \;
 endef
 
+# Disable ldconfig.service, as /sbin/ldconfig is not available when the
+# target is built with a glibc-based toolchain.
+define SYSTEMD_DISABLE_LDCONFIG_SERVICE_HOOK
+	rm -f $(TARGET_DIR)/lib/systemd/system/sysinit.target.wants/ldconfig.service
+endef
+
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK \
+	SYSTEMD_DISABLE_LDCONFIG_SERVICE_HOOK \
 	SYSTEMD_SANITIZE_PATH_IN_UNITS
 
 define SYSTEMD_USERS
-- 
1.7.10.4
