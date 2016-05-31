From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 22:10:29 +0200
Subject: [Buildroot] [git commit] mtools: ensure install-info isn't used
Message-ID: <20160531201047.1180381D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=102c4a4bad747221191a67fdced8d077e31aeb2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mtools calls install-info at 'make install' time if available after
installing the mtools info page - But as we don't use the info pages for
anything / remove in target-finalize, this is a waste of time and a
potential cause of build failures as reported on the list:

http://lists.busybox.net/pipermail/buildroot/2016-May/160604.html

So ensure configure doesn't find it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtools/mtools.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index d331af2..fc145c0 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -9,8 +9,14 @@ MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.bz2
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPLv3+
 MTOOLS_LICENSE_FILES = COPYING
-MTOOLS_CONF_ENV = ac_cv_func_setpgrp_void=yes
 MTOOLS_CONF_OPTS = --without-x
+# info documentation not needed
+MTOOLS_CONF_ENV = \
+	ac_cv_func_setpgrp_void=yes \
+	ac_cv_path_INSTALL_INFO=
+
+HOST_MTOOLS_CONF_ENV = \
+	ac_cv_path_INSTALL_INFO=
 
 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
