From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Apr 2021 18:58:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: add required python deps
 for AD DC support
Message-ID: <20210404165823.954492-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed due to upstream commit:
https://gitlab.com/samba-team/samba/-/commit/2420b7c6d2038aca33759ca3a7d41240c5f19bf7

Fixes:
http://autobuild.buildroot.net/results/12a/12a74665a2349eacb28c3035bb36a4dce1d740d1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/Config.in | 2 ++
 package/samba4/samba4.mk | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index a34eaa8088..e890313b71 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -32,6 +32,8 @@ config BR2_PACKAGE_SAMBA4_AD_DC
 	bool "AD DC"
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_PYTHON_DNSPYTHON
+	select BR2_PACKAGE_PYTHON_MARKDOWN
 	help
 	  Enable Active Directory Domain Controller functionality.
 
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 99c8af9ab2..ed38af020c 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -149,7 +149,12 @@ define SAMBA4_INSTALL_TARGET_CMDS
 endef
 
 ifeq ($(BR2_PACKAGE_SAMBA4_AD_DC),y)
-SAMBA4_DEPENDENCIES += jansson
+SAMBA4_DEPENDENCIES += \
+	jansson \
+	host-python-dnspython \
+	host-python-markdown \
+	python-dnspython \
+	python-markdown
 else
 SAMBA4_CONF_OPTS += --without-ad-dc --without-json
 endif
-- 
2.29.2
