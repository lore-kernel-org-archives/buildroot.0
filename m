From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:15:23 +0200
Subject: [Buildroot] [git commit] systemd: add hook to disable
	ldconfig.service
Message-ID: <20140726071532.9C21F9D063@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a86ff3bbd0f6982180a2f52f626f0fa22915310
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 215, systemd installs a service to execute /sbin/ldconfig
when the sysinit target is reached.

Unfortunately, /sbin/ldconfig is not installed on a target built using a
glibc-based toolchain.

As this service is not mandatory, it is now disabled, thus avoiding a
warning in the journal.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
