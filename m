From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Feb 2012 23:35:48 +0100
Subject: [Buildroot] [PATCH 1/1] libecore: fix build of host-libecore when
	X11 not available
In-Reply-To: <cover.1330468539.git.thomas.petazzoni@free-electrons.com>
References: <cover.1330468539.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0d07a1bdbd78622e222cb06ddfd0a8bb43d63bef.1330468539.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host-libecore build tries to build the X11 backend. This works if
you have X11 headers/libraries installed on your build machine, but
fails if you don't, and Buildroot shouldn't depend on such things
being installed.

Therefore, we force host-libecore to not build any of the graphical
backends (X, XCB or DirectFB).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libecore/libecore.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index 0088480..83d1fff 100644
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
-- 
1.7.4.1
