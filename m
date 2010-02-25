From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2010 08:41:30 +0100
Subject: [Buildroot] [PATCH 1/1] xfont_font-util: install in staging as it
	used to be
In-Reply-To: <cover.1267083682.git.thomas.petazzoni@free-electrons.com>
References: <cover.1267083682.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2972d5ebc84ea1e641e3c10c38854dbd5ab563d7.1267083682.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/x11r7/xfont_font-util/xfont_font-util.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 88dce38..015e98b 100644
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
@@ -15,4 +17,5 @@ endef
 
 XFONT_FONT_UTIL_POST_INSTALL_STAGING_HOOKS += XFONT_FONT_UTIL_POST_INSTALL_FIXES
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util))
\ No newline at end of file
+$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util))
+
-- 
1.6.3.3
