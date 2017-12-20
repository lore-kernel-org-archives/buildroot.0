From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 21:49:09 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] mtools: do not link to
 libbsd
Message-ID: <20171220210024.7FE1A835D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08d6d8538d7ddf0082fe29c7fe40b8120e86b284
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

If libbsd is found by the configuration process, mtools unnecessarily
adds a NEEDED field with libbsd to its dynamic section, but it does not
actually use anything from libbsd under Linux. The same may happen to
host-mtools if some libbsd package is installed on the host machine.

Prevent this by forcing configure to bypass the checking for the
existence of a gethostbyname function in libbsd.

I stumbled on this problem when I built host-mtools and later removed
libbsd to upgrade to Fedora 27, due to Bug 1504831[1]. The previously
built host/bin/mtools started to fail due to the missing libbsd.so.0.

1. https://bugzilla.redhat.com/show_bug.cgi?id=1504831

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f5ef363732fd6092b132cc21573efafea3f1d4ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtools/mtools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index adba1fc..1ba1e98 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -13,9 +13,13 @@ MTOOLS_CONF_OPTS = --without-x
 # info documentation not needed
 MTOOLS_CONF_ENV = \
 	ac_cv_func_setpgrp_void=yes \
+	ac_cv_lib_bsd_gethostbyname=no \
+	ac_cv_lib_bsd_main=no \
 	ac_cv_path_INSTALL_INFO=
 
 HOST_MTOOLS_CONF_ENV = \
+	ac_cv_lib_bsd_gethostbyname=no \
+	ac_cv_lib_bsd_main=no \
 	ac_cv_path_INSTALL_INFO=
 
 # link with iconv if enabled
