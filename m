From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 30 Oct 2019 10:22:45 +0100
Subject: [Buildroot] [PATCH 2/2] package/matchbox-desktop: needs -ldl
In-Reply-To: <20191030092245.10235-1-fontaine.fabrice@gmail.com>
References: <20191030092245.10235-1-fontaine.fabrice@gmail.com>
Message-ID: <20191030092245.10235-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For an unknown reason, autoreconf does not work anymore to link with
-ldl, probably because of a change in the behavior of the deprecated
AC_LIBTOOL_DLOPEN macro

As matchox-desktop is not active, just add -ldl to LIBS

Fixes:
 - http://autobuild.buildroot.org/results/382a5041b628328808083085f87016547a680478

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/matchbox-desktop/matchbox-desktop.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/matchbox-desktop/matchbox-desktop.mk b/package/matchbox-desktop/matchbox-desktop.mk
index 9054dd80c6..82d8a44f77 100644
--- a/package/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox-desktop/matchbox-desktop.mk
@@ -11,11 +11,7 @@ MATCHBOX_DESKTOP_SITE = http://downloads.yoctoproject.org/releases/matchbox/matc
 MATCHBOX_DESKTOP_LICENSE = GPL-2.0+
 MATCHBOX_DESKTOP_LICENSE_FILES = COPYING
 MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib zlib
-
-# The bundled configure script does not properly replace LIBADD_DL, so
-# we force an autoreconf even if we don't have any patches touching
-# configure.ac/Makefile.am.
-MATCHBOX_DESKTOP_AUTORECONF = YES
+MATCHBOX_DESKTOP_CONF_ENV = LIBS=-ldl
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
 MATCHBOX_DESKTOP_CONF_OPTS += --enable-startup-notification
-- 
2.23.0
