From: Norbert Lange <nolange79@gmail.com>
Date: Thu,  6 Feb 2020 10:36:25 +0100
Subject: [Buildroot] [PATCH 02/10] package/systemd: add libnss-systemd to
 name resolution
In-Reply-To: <20200206093633.251413-1-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
Message-ID: <20200206093633.251413-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The feature DynamicUser creates users/groups without
touching the /etc/{passwd,group} files on disk.
Adding the dynamic resolver to /etc/nsswitch.conf
ensures the Names are resolved consistently.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 05b07cfd1b..a390cdd1a9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -409,7 +409,15 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
 	touch $(TARGET_DIR)/etc/machine-id
 endef
 
+define SYSTEMD_ADD_NSSCONFIG_HOOK
+	grep >/dev/null '^passwd:.*systemd' $(TARGET_DIR)/etc/nsswitch.conf || \
+		sed '/^passwd:/ s/$$/ systemd/' $(TARGET_DIR)/etc/nsswitch.conf
+	grep >/dev/null '^group:.*systemd' $(TARGET_DIR)/etc/nsswitch.conf || \
+		sed '/^group:/ s/$$/ systemd/' $(TARGET_DIR)/etc/nsswitch.conf
+endef
+
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
+	SYSTEMD_ADD_NSSCONFIG_HOOK \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
2.24.1
