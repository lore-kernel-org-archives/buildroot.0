From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 11:19:03 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/rpm: fix build
 with NLS
Message-ID: <20190526091608.004A280F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78001e54cd68b855d16d2a925c3f6700663165a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add TARGET_NLS_LIBS to LIBS to definitely fix linking with lintl instead
of calling autoreconf

Fixes:
 - http://autobuild.buildroot.org/results/a1446b419f5f59f65fe80849182e38457de203b5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 653bf9383721a2e2d3313ae08a3019b8643263b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpm/rpm.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 246c0d0695..b1ce4ad44b 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -12,8 +12,6 @@ RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib \
 	$(TARGET_NLS_DEPENDENCIES)
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
-# Needed to fix an issue with -lintl linking
-RPM_AUTORECONF = YES
 
 RPM_CONF_OPTS = \
 	--disable-python \
@@ -74,6 +72,7 @@ endif
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
-	CFLAGS="$(TARGET_CFLAGS) $(RPM_CFLAGS)"
+	CFLAGS="$(TARGET_CFLAGS) $(RPM_CFLAGS)" \
+	LIBS=$(TARGET_NLS_LIBS)
 
 $(eval $(autotools-package))
