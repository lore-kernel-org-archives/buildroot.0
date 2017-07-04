From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:49:10 +0200
Subject: [Buildroot] [PATCH 090/100] oprofile: remove libintl static linking
	handling
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-91-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer support building the full-blown libintl in static linking
scenarios, as it causes too many problems. Therefore, remove the
special code that was handling this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/oprofile/oprofile.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index d86b8c5..4e0278e 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -41,12 +41,6 @@ ifeq ($(BR2_PACKAGE_LIBPFM4),y)
 OPROFILE_DEPENDENCIES += libpfm4
 endif
 
-# When gettext is enabled, popt links with -lintl, specifies it in its
-# popt.pc and has done so for the past 6+ years. But oprofile does not
-# use pkconfig to find popt, so misses -lintl, which is important for
-# a static build. We have to do the call to pkgconfig manually...
-OPROFILE_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
-
 ifeq ($(BR2_STATIC_LIBS),)
 define OPROFILE_INSTALL_SHARED_LIBRARY
 	$(INSTALL) -m 755 $(@D)/libopagent/.libs/*.so* $(TARGET_DIR)/usr/lib/oprofile
-- 
2.9.4
