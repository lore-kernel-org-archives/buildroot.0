From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:56:21 +0100
Subject: [Buildroot] [git commit] Revert "package/aespipe: fix host compile"
Message-ID: <20161217145658.B580B8167F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57b628a932b9b4a3c4bf80f4c82a81da5adcb173
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit cb33a7d6bd89306635749b497cd004e986bcd7e5, as it
causes build failures on platforms where gcc does not understand the
"-no-pie" option.

Fixes:

  http://autobuild.buildroot.net/results/51be9526300b3d03e2e304dec9cae953f2f59de4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aespipe/aespipe.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index 8c7cd21..6a38556 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -9,12 +9,5 @@ AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
 AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
 
-# Debian enables -fPIE by default, breaking the build:
-# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=837393
-# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=835148
-HOST_AESPIPE_CONF_ENV = \
-	CFLAGS="$(HOST_CFLAGS) -no-pie" \
-	LDFLAGS="$(HOST_LDFLAGS) -no-pie"
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
