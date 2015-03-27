From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 27 Mar 2015 15:20:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/powertop: needs gettextize, 2nd try
Message-ID: <1427466030-10274-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If host-gettext was compiled before powertop it is picked up by autoreconf which
leads to a broken compile. To fix this unconditionally include host-gettext as
dependency and move

POWERTOP_GETTEXTIZE = YES

outside the if-clause for BR2_NEEDS_GETTEXT

Fixes
http://autobuild.buildroot.net/results/24e/24e312271cf07a8dd966b43f153a06ddc858a786/
http://autobuild.buildroot.net/results/511/511a1c76bfd0ebf637e5abcd6fecc4d6a683ed3e/
http://autobuild.buildroot.net/results/652/65246f6f71e67c2637efbe8bb6e501750629d5fb/

and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/powertop/powertop.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index 4446bc9..331edc9 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -6,14 +6,14 @@
 
 POWERTOP_VERSION = 2.7
 POWERTOP_SITE = https://01.org/sites/default/files/downloads/powertop/
-POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-pkgconf
+POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-gettext host-pkgconf
 POWERTOP_LICENSE = GPLv2
 POWERTOP_LICENSE_FILES = COPYING
 # We're patching Makefile.am
 POWERTOP_AUTORECONF = YES
+POWERTOP_GETTEXTIZE = YES
 
 ifeq ($(BR2_NEEDS_GETTEXT),y)
-POWERTOP_GETTEXTIZE = YES
 POWERTOP_DEPENDENCIES += gettext
 POWERTOP_CONF_ENV += LIBS='-lintl'
 endif
-- 
1.7.10.4
