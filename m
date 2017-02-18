From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Feb 2017 14:18:05 +0100
Subject: [Buildroot] [PATCHv2 3/3] gstreamer1: drop unused configure time
	unaligned access handling logic
In-Reply-To: <20170218131805.20242-1-peter@korsgaard.com>
References: <20170218131805.20242-1-peter@korsgaard.com>
Message-ID: <20170218131805.20242-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gstreamer has moved to build time unaligned access support detection using
ifdefs in gstconfig.h since 1.9.2:

commit 6ef601367e0f5adb7a8b02cec94dec04fccf701a
Author: Nirbheek Chauhan <nirbheek@centricular.com>
Date:   Tue Jun 21 18:59:49 2016 +0530

    gstconfig.h: Detect unaligned access support at compile-time

    This makes gstconfig.h completely arch-independent. Should cover all
    compilers that gstreamer is known to build on, and all architectures
    that I could find information on. People are encouraged to file bugs if
    their platform/arch is missing.

So ac_cv_unaligned_access is no longer used and our logic can be removed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index ac2c98870..e110dee7d 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -11,16 +11,6 @@ GSTREAMER1_INSTALL_STAGING = YES
 GSTREAMER1_LICENSE_FILES = COPYING
 GSTREAMER1_LICENSE = LGPLv2+, LGPLv2.1+
 
-# Checking if unaligned memory access works correctly cannot be done when cross
-# compiling. For the following architectures there is no information available
-# in the configure script.
-ifeq ($(BR2_arc)$(BR2_xtensa)$(BR2_microblaze)$(BR2_nios2),y)
-GSTREAMER1_CONF_ENV = as_cv_unaligned_access=no
-endif
-ifeq ($(BR2_aarch64),y)
-GSTREAMER1_CONF_ENV = as_cv_unaligned_access=yes
-endif
-
 GSTREAMER1_CONF_OPTS = \
 	--disable-examples \
 	--disable-tests \
-- 
2.11.0
