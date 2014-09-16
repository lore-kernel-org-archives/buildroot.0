From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Sep 2014 22:07:38 +0200
Subject: [Buildroot] [PATCH] mesa3d: Add missing dependencies
In-Reply-To: <1410883118-57489-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 16 Sep 2014 16:58:38 +0100")
References: <1410883118-57489-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87sijr8h2t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Add xcb-dri3, xcb-present and xshmfence to mesa3d's dependencies.
 > Otherwise it will fail during the configure phase.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

hmm, but we also have optional dri3 support since:

commit 1fcc621f0344c11ebaf7903545cd99d2f5b8ec9b
Author: Bernd Kuhls <bernd.kuhls@t-online.de>
Date:   Thu Jul 17 07:42:54 2014 +0200

    package/mesa3d: Fix optional DRI3 support

Looking at configure.ac, I think we should just disable dri support if
no dri drivers are enabled, E.G.:

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f986d0e..31bbacf 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -75,7 +75,7 @@ endif
 
 ifeq ($(MESA3D_DRI_DRIVERS-y),)
 MESA3D_CONF_OPT += \
-       --without-dri-drivers
+       --without-dri-drivers --disable-dri
 else
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto

What do the mesa3d experts say?

-- 
Bye, Peter Korsgaard
