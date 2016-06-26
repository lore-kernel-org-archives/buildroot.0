From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 26 Jun 2016 16:03:16 -0400
Subject: [Buildroot] [3/8 v5] audit: Add the ability to compile as a host
	package.
In-Reply-To: <1466971401-29360-1-git-send-email-Aduskett@gmail.com>
References: <1466971401-29360-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1466971401-29360-4-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Along with the aforementioned version bump to 2.6, this will allow
the audit package to compile as a host package.  This is needed for
the upcomming policycoreutils package which is required for the
upcomming refpolicy package.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v2 -> v5:
 - Patch series version bump.

Changes v1 -> v2:
 - Changed libcap-ng to host-libcap-ng

 package/audit/audit.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 9589c06..e5c55ff 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -56,4 +56,25 @@ define AUDIT_INSTALL_CLEANUP
 endef
 AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_INSTALL_CLEANUP
 
+HOST_AUDIT_CONF_OPTS = --without-python --without-python3 --disable-zos-remote
+ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
+HOST_AUDIT_DEPENDENCIES += host-libcap-ng
+HOST_AUDIT_CONF_OPTS += --with-libcap-ng=yes
+else
+HOST_AUDIT_CONF_OPTS += --with-libcap-ng=no
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+HOST_AUDIT_CONF_OPTS += --enable-systemd
+else
+HOST_AUDIT_CONF_OPTS += --disable-systemd
+endif
+
+define AUDIT_INSTALL_CLEANUP
+	$(RM) -rf $(HOST_DIR)/etc/rc.d
+	$(RM) -rf $(HOST_DIR)/etc/sysconfig
+endef
+
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.4
