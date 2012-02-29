From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Feb 2012 10:00:24 +0100
Subject: [Buildroot] [git commit] libecore: fix build of host-libecore when
	X11 not available
Message-ID: <20120229090809.03DBB90B39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=def11d79227d42976ae7c918f4a0ba44c94a0813
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-libecore build tries to build the X11 backend. This works if
you have X11 headers/libraries installed on your build machine, but
fails if you don't, and Buildroot shouldn't depend on such things
being installed.

Therefore, we force host-libecore to not build any of the graphical
backends (X, XCB or DirectFB).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libecore/libecore.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index db14356..c76b3ff 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -12,7 +12,13 @@ LIBECORE_INSTALL_STAGING = YES
 LIBECORE_DEPENDENCIES = host-pkg-config libeina
 
 HOST_LIBECORE_DEPENDENCIES = host-pkg-config host-libeina host-libevas
-HOST_LIBECORE_CONF_OPT += --enable-ecore-evas
+HOST_LIBECORE_CONF_OPT += 		\
+	--enable-ecore-evas 		\
+	--disable-simple-x11 		\
+	--disable-ecore-directfb 	\
+	--disable-ecore-x 		\
+	--disable-ecore-x-xcb 		\
+	--disable-ecore-imf-xim
 
 # default options
 LIBECORE_CONF_OPT = --disable-simple-x11
