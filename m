From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 26 Mar 2016 14:27:36 +0100
Subject: [Buildroot] [PATCH] package/procps-ng: install libprocps.pc in
	staging/usr/lib/pkgconfig/
Message-ID: <1458998856-31289-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 834893a965a993e8a73e30b448426f626419f3c8, pkg-config --libs libprocps
doesn't work anymore because libprocps.pc is installed in
STAGING_DIR/lib/pkgconfig/ instead of STAGING_DIR/usr/lib/pkgconfig/.

Add --libdir=/usr/lib in PROCPS_NG_CONF_OPTS to fixes the issue.
Note that libprocps.so is now installed in /usr/lib/ instead of /lib/.

Fixes:
http://autobuild.buildroot.net/results/2e5/2e5100ccf1ed336c26b83930e7149941c97fc4d2/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/procps-ng/procps-ng.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index fb1b236..51a70a5 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -35,7 +35,11 @@ endif
 
 # Make sure binaries get installed in /bin, so that they overwrite
 # their busybox counterparts.
-PROCPS_NG_CONF_OPTS += --exec-prefix=/
+# Make sure libprocps.pc is installed in STAGING_DIR/usr/lib/pkgconfig/
+# otherwise it's installed in STAGING_DIR/lib/pkgconfig/ breaking
+# pkg-config --libs libprocps.
+PROCPS_NG_CONF_OPTS += --exec-prefix=/ \
+	--libdir=/usr/lib
 
 # Allows unicode characters to show in 'watch'
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-- 
2.5.5
