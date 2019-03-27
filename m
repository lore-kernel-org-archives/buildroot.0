From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 15:34:39 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libpcap: fix
 bluez5_utils-headers dependency
Message-ID: <20190327143425.4D7758033D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9896bd300072f39e7ee6d5f7be1a3f95f5ccea1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Commit c46afc37dc877f1e94ffde0d77585290711b27ec changed bluez5-utils
dependency by bluez5_utils-headers without replacing the test on
BR2_PACKAGE_BLUEZ5_UTILS by BR2_PACKAGE_BLUEZ5_UTILS_HEADERS

Fix this mistake and also add a select on
BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS is set
so the user does not have to do it

Fixes:
 - http://autobuild.buildroot.org/results/c6828df1f3782564451ddd4187ff026679bf37d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3033e83d1224c1710cb6f5e0691b80cd62b1c657)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpcap/Config.in  | 1 +
 package/libpcap/libpcap.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libpcap/Config.in b/package/libpcap/Config.in
index 643acbef6e..74429f209a 100644
--- a/package/libpcap/Config.in
+++ b/package/libpcap/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBPCAP
 	bool "libpcap"
+	select BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS
 	select BR2_PACKAGE_ZLIB
 	help
 	  A system-independent library for user-level network packet
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 2f46426d37..ebceca5273 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -26,7 +26,7 @@ define LIBPCAP_CONFIG_REMOVE_RPATH
 endef
 LIBPCAP_POST_BUILD_HOOKS = LIBPCAP_CONFIG_REMOVE_RPATH
 
-ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_HEADERS),y)
 LIBPCAP_DEPENDENCIES += bluez5_utils-headers
 else
 LIBPCAP_CONF_OPTS += --disable-bluetooth
