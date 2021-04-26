From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 20:06:01 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/samba4: add
 required python deps for AD DC support
Message-ID: <20210426173954.5710186360@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a26f6b8f90f16697273f9a429d64aaeda78b0650
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Needed due to upstream commit:
https://gitlab.com/samba-team/samba/-/commit/2420b7c6d2038aca33759ca3a7d41240c5f19bf7

Fixes:
http://autobuild.buildroot.net/results/12a/12a74665a2349eacb28c3035bb36a4dce1d740d1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0025d931f3ac5abc738c8ba5cb5177ff2b367cab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/Config.in |  2 ++
 package/samba4/samba4.mk | 10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 552afe90cd..e114a7e13f 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -32,6 +32,8 @@ config BR2_PACKAGE_SAMBA4_AD_DC
 	bool "AD DC"
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_PYTHON_DNSPYTHON
+	select BR2_PACKAGE_PYTHON_MARKDOWN
 	select BR2_PACKAGE_SAMBA4_ADS
 	help
 	  Enable Active Directory Domain Controller functionality.
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 99c8af9ab2..ce41208981 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -149,7 +149,15 @@ define SAMBA4_INSTALL_TARGET_CMDS
 endef
 
 ifeq ($(BR2_PACKAGE_SAMBA4_AD_DC),y)
-SAMBA4_DEPENDENCIES += jansson
+# host-python-dnspython and host-python-markdown are not strictly
+# needed on the host, but on the target. however, samba's configure
+# tests for their availability on the host.
+SAMBA4_DEPENDENCIES += \
+	jansson \
+	host-python-dnspython \
+	host-python-markdown \
+	python-dnspython \
+	python-markdown
 else
 SAMBA4_CONF_OPTS += --without-ad-dc --without-json
 endif
