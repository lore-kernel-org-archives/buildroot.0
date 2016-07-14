From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 14 Jul 2016 13:47:01 -0400
Subject: [Buildroot] [PATCH 1/4] package/audit: Allow Host compilation.
Message-ID: <1468518424-11785-1-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Policycoreutils requires audit as a host package.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/audit/audit.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 4cc87d1..aa77eab 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -58,4 +58,13 @@ define AUDIT_INSTALL_CLEANUP
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
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.4
