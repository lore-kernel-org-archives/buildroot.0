From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 23:24:07 +0100
Subject: [Buildroot] [git commit] madplay: fix build on noMMU platforms
Message-ID: <20161207222539.5004F81E48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb4a41c62e45c1942a603ec176ba7d6d9ee18b95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A recent change in uClibc-ng removed the MADV_* definitions for
madvise(), but kept the madvise() function itself. This defeats the
logic used in madplay: it checks if madvise() is available, and if it
is, uses it and assumes the MADV_* definitions exist.

This inconsistency has been reported to upstream uClibc-ng, but in the
mean time, we can simply tell madplay to not use madvise(), which is
anyway useless on noMMU platforms.

Fixes:

  http://autobuild.buildroot.net/results/3291554ea013e5f4a8f3447e10e664dffa8b131b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/madplay/madplay.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index 2606ac8..6b13819 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -11,6 +11,14 @@ MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
 MADPLAY_LIBTOOL_PATCH = NO
 MADPLAY_DEPENDENCIES = libmad libid3tag $(if $(BR2_PACKAGE_GETTEXT),gettext)
 
+# Workaround a bug in uClibc-ng, which exposes madvise() but doesn't
+# provide the corresponding MADV_* definitions. Bug reported at
+# http://mailman.uclibc-ng.org/pipermail/devel/2016-December/001306.html. madvise()
+# is anyway useless on noMMU.
+ifeq ($(BR2_USE_MMU),)
+MADPLAY_CONF_ENV += ac_cv_func_madvise=no
+endif
+
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
