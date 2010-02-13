From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2010 16:13:58 +0100
Subject: [Buildroot] [PATCH 2/3] Fix dependencies for TrapProto
In-Reply-To: <cover.1266074036.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266074036.git.thomas.petazzoni@free-electrons.com>
Message-ID: <60ff66d8075184855fbffee65cc3506aa12c8a75.1266074036.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The .pc file of TrapProto says that it depends on xt, even through it
doesn't depend on it at compile time. However, if xt isn't present
when TrapProto has been installed, the compilation of Xserver fails
telling that there is a missing dependency in TrapProto on Xt.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xproto_trapproto/Config.in           |    1 +
 package/x11r7/xproto_trapproto/xproto_trapproto.mk |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xproto_trapproto/Config.in b/package/x11r7/xproto_trapproto/Config.in
index 3d2868f..0f9c470 100644
--- a/package/x11r7/xproto_trapproto/Config.in
+++ b/package/x11r7/xproto_trapproto/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XPROTO_TRAPPROTO
 	bool "trapproto"
+	select BR2_PACKAGE_XLIB_LIBXT
 	help
 	  trapproto 3.4.3
 	  X.Org Trap protocol headers
diff --git a/package/x11r7/xproto_trapproto/xproto_trapproto.mk b/package/x11r7/xproto_trapproto/xproto_trapproto.mk
index 5ef5fa5..29c4356 100644
--- a/package/x11r7/xproto_trapproto/xproto_trapproto.mk
+++ b/package/x11r7/xproto_trapproto/xproto_trapproto.mk
@@ -10,5 +10,6 @@ XPROTO_TRAPPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_TRAPPROTO_AUTORECONF = NO
 XPROTO_TRAPPROTO_INSTALL_STAGING = YES
 XPROTO_TRAPPROTO_INSTALL_TARGET = NO
+XPROTO_TRAPPROTO_DEPENDENCIES = xlib_libXt
 
 $(eval $(call AUTOTARGETS,package/x11r7,xproto_trapproto))
-- 
1.6.3.3
