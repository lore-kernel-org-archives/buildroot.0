From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Feb 2010 09:19:30 +0100
Subject: [Buildroot] [git commit master] xfont_font-util: install in staging
	as it used to be
Message-ID: <20100225081946.28CFF7771D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=39d38a08a1428e3b48114741dbe92fadfbe04927
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Before the autotools conversion, xfont_font-util was installed in
staging, so keep this.

However, the current way of handling xfont_font-util is ugly. The
post-install.sh script removes the binaries compiled for the target
from the staging directory and replaces them by symbolic links to
utils installed on the host (making the incorrect assumption that they
are available).

It looks like xfont_font-util needs to be built for the host (using
the new infrastructure for host autotools package). This is certainly
post-2010.02 though.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                          |    2 +-
 package/x11r7/xfont_font-util/xfont_font-util.mk |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4b8a544..402c947 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	Fixes all over the tree.
 
 	Updated/fixed packages: busybox, ipsec-tools, libgtk2, madplay,
-	netsnmp, pango, sylpheed, qt
+	netsnmp, pango, sylpheed, qt, xfont_font-util
 
 	Removed packages: openmotif, xpdf
 
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 88dce38..82e220f 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -8,6 +8,8 @@ XFONT_FONT_UTIL_VERSION = 1.0.1
 XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
 XFONT_FONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
+XFONT_FONT_UTIL_INSTALL_STAGING = YES
+XFONT_FONT_UTIL_INSTALL_TARGET = NO
 
 define XFONT_FONT_UTIL_POST_INSTALL_FIXES
  $(@D)/post-install.sh $(STAGING_DIR)
@@ -15,4 +17,4 @@ endef
 
 XFONT_FONT_UTIL_POST_INSTALL_STAGING_HOOKS += XFONT_FONT_UTIL_POST_INSTALL_FIXES
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util))
\ No newline at end of file
+$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util))
-- 
1.6.3.3
