From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Jul 2010 10:02:06 +0200
Subject: [Buildroot] [git commit master 1/1] diffutils: fix configure cache
	issue with BR2_NEEDS_GETTEXT
Message-ID: <20100727200331.1F6FC826B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=03bb359cb7c3bae307b6facc45aa95ccfaedfb48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like flex, diffutils doesn't NEED gettext/libintl, but it's configure script
checks for it, so make sure those a built before diffutils, otherwise it
will populate tgt-config.cache with invalid values, breaking the build of
other packages needing it (like libglib2).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/diffutils/diffutils.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index c0b3830..6ce71c9 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -9,6 +9,10 @@ DIFFUTILS_SITE:=$(BR2_GNU_MIRROR)/diffutils
 
 DIFFUTILS_INSTALL_STAGING = YES
 
+DIFFUTILS_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
+	$(if $(BR2_PACKAGE_LIBINTL),libintl)
+
 DIFFUTILS_CONF_ENV = ac_cv_func_strtod=yes
 		ac_fsusage_space=yes \
 		fu_cv_sys_stat_statfs2_bsize=yes \
-- 
1.7.1
