From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Sep 2014 23:50:15 +0200
Subject: [Buildroot] [PATCH] libsvg-cairo: explicitly disable X support
Message-ID: <1410472215-19818-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our libsvg-cairo package doesn't have any dependency on X, and the
source code doesn't seem to be using X. However, the configure script
checks for X headers and libraries. If they are found on the host,
/usr/lib and /usr/include get added to the library/header paths
causing weird build failures. This commit should fix this problem by
explicitly disabling the X support.

Should fix:

  http://autobuild.buildroot.org/results/d0f/d0fc233bb97c2ea18344746a5b7c63c8de65330a/
  http://autobuild.buildroot.org/results/0b3/0b3fb2ee9916aa265df5b6e4f04f6dfa25d1fc84/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsvg-cairo/libsvg-cairo.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsvg-cairo/libsvg-cairo.mk b/package/libsvg-cairo/libsvg-cairo.mk
index 93b8f76..fd1dbee 100644
--- a/package/libsvg-cairo/libsvg-cairo.mk
+++ b/package/libsvg-cairo/libsvg-cairo.mk
@@ -11,4 +11,6 @@ LIBSVG_CAIRO_INSTALL_STAGING = YES
 LIBSVG_CAIRO_LICENSE         = LGPLv2.1+
 LIBSVG_CAIRO_LICENSE_FILES   = COPYING
 
+LIBSVG_CAIRO_CONF_OPT = --without-x
+
 $(eval $(autotools-package))
-- 
2.0.0
