From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 May 2019 22:18:27 +0200
Subject: [Buildroot] [git commit] package/rpm: fix build with NLS
Message-ID: <20190512201314.0182888592@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=653bf9383721a2e2d3313ae08a3019b8643263b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add TARGET_NLS_LIBS to LIBS to definitely fix linking with lintl instead
of calling autoreconf

Fixes:
 - http://autobuild.buildroot.org/results/a1446b419f5f59f65fe80849182e38457de203b5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpm/rpm.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 6d1068194a..bcdc8c5fee 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -20,8 +20,6 @@ RPM_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
-# Needed to fix an issue with -lintl linking
-RPM_AUTORECONF = YES
 
 RPM_CONF_OPTS = \
 	--disable-python \
@@ -95,6 +93,7 @@ endif
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
-	CFLAGS="$(TARGET_CFLAGS) $(RPM_CFLAGS)"
+	CFLAGS="$(TARGET_CFLAGS) $(RPM_CFLAGS)" \
+	LIBS=$(TARGET_NLS_LIBS)
 
 $(eval $(autotools-package))
