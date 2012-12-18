From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Dec 2012 21:38:46 +0100
Subject: [Buildroot] [PATCH] matchbox-desktop: fix link issue against libdl
Message-ID: <1355863126-17526-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

matchbox-desktop uses dlopen(), so it needs to link against libdl. The
configure.ac and Makefile.am have the necessary provisions to do so,
but the included configure script does not replace LIBADD_DL in
src/Makefile.am as it should.

Therefore, we force the autoreconf of the package, which solves the
problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../matchbox/matchbox-desktop/matchbox-desktop.mk  |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index d180d1d..f8e854c 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -13,6 +13,11 @@ MATCHBOX_DESKTOP_LICENSE_FILES = COPYING
 MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib
 MATCHBOX_DESKTOP_CONF_OPT = --enable-expat
 
+# The bundled configure script does not properly replace LIBADD_DL, so
+# we force an autoreconf even if we don't have any patches touching
+# configure.ac/Makefile.am.
+MATCHBOX_DESKTOP_AUTORECONF = YES
+
 #############################################################
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
-- 
1.7.9.5
