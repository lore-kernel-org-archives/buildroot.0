From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 14 Jul 2016 16:10:39 -0500
Subject: [Buildroot] [PATCH] xapp_init: Point to target's "mcookie"
Message-ID: <1468530639-38934-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: ynadupur <yugendra.sai.babu.nadupuru@rockwellcollins.com>

Description:
    The X11 package builds the "mcookie" executable, when selected, into the
    directory output/host/usr/bin/mcookie. The xapp_init's "configure"
    attempts to find the "mcookie" executable using the host's path. If the
    host has an installed "mcookie" application in their /bin folder, it
    can influence the build. The following patch forces the expected
    mcookie location.

    Related:
    http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/50310

Signed-off-by:[YUGENDRA SAI BABU NADUPURU]<yugendra.sai.babu.nadupuru@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/x11r7/xapp_xinit/xapp_xinit.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index a67ba14..bf5cbbb 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -11,4 +11,8 @@ XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
 XAPP_XINIT_LICENSE = MIT
 XAPP_XINIT_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_MCOOKIE),y)
+XAPP_XINIT_CONF_OPTS += MCOOKIE=/usr/bin/mcookie
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
