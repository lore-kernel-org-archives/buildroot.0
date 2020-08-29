From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 18:34:38 +0200
Subject: [Buildroot] [git commit] package/systemd: disable cryptsetup for
 host package
Message-ID: <20200829164016.767E6805B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04b54138e67e2a6bb6498da201f55b5a109af917
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
