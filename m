From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:31:26 +0100
Subject: [Buildroot] [git commit] clamav: add optional systemd dependency
Message-ID: <20181213202729.5DE5C8B40A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70992f5b690516ff993068f5088d4fc4ae1fd7d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

clamav has an optional systemd dependency

Moreover, since the bump to 1.5.3, pkgconf prepends the sysroot to all
absolute paths found in the .pc file. This is correct when the paths
refer to something in STAGING_DIR (e.g. libdir, includedir), but not
when it refers to something used for the target.

clamav uses the systemdsystemunitdir variable from systemd.pc to decide
where to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the
systemdsystemunitdir to use explicitly instead of relying on systemd.pc.

Fixes:
 - http://autobuild.buildroot.org/results/fe526c60542527112e6441e453b4df5de49242d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/clamav/clamav.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 50990abad6..25ae240545 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -85,4 +85,11 @@ else
 CLAMAV_CONF_OPTS += --without-pcre
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+CLAMAV_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+CLAMAV_DEPENDENCIES += systemd
+else
+CLAMAV_CONF_OPTS += --with-systemdsystemunitdir=no
+endif
+
 $(eval $(autotools-package))
