From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Aug 2020 15:59:40 +0200
Subject: [Buildroot] [PATCH 1/2] package/systemd: disable cryptsetup for
 host package
Message-ID: <20200829135941.1862456-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build with cryptsetup and without libblkid will fail on:

../src/shared/dissect-image.c:1336:34: error: 'N_DEVICE_NODE_LIST_ATTEMPTS' undeclared (first use in this function)
 1336 |         for (unsigned i = 0; i < N_DEVICE_NODE_LIST_ATTEMPTS; i++) {
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~

This bug has been reported upstream:
https://github.com/systemd/systemd/pull/16901
and is not an issue for the target variant as libblkid is select by
BR2_PACKAGE_UTIL_LINUX_MOUNT

As cryptsetup does not seem needed for host-systemd, just disable it

Fixes:
 - http://autobuild.buildroot.org/results/67782c225c08387c1bbcbea9eee3ca12bc6577cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e356cb1add..115ccbda06 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -699,7 +699,8 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dinitrd=false \
 	-Dxdg-autostart=false \
 	-Dkernel-install=false \
-	-Dsystemd-analyze=false
+	-Dsystemd-analyze=false \
+	-Dlibcryptsetup=false
 
 HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
-- 
2.28.0
