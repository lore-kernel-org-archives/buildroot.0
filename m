From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 22:56:21 +0100
Subject: [Buildroot] [PATCH] uclibc: do not enable DODEBUG
Message-ID: <1386798981-17924-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The DODEBUG configuration option in uClibc is broken, even for widely
used architectures like ARM. Therefore, any Buildroot configuration
that has BR2_ENABLE_DEBUG enabled and uses uClibc with the internal
toolchain backend will fail, with an error like:

  http://autobuild.buildroot.net/results/d34/d34238c209cf2ef63371a598ab9218165c90f864/build-end.log

This error was also reported recently by a Buildroot user.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index de9011f..9e04771 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -391,14 +391,6 @@ UCLIBC_WCHAR_CONFIG = $(call UCLIBC_OPT_UNSET,UCLIBC_HAS_WCHAR,$(@D))
 endif
 
 #
-# debug
-#
-
-ifeq ($(BR2_ENABLE_DEBUG),y)
-UCLIBC_DEBUG_CONFIG = $(call UCLIBC_OPT_SET,DODEBUG,y,$(@D))
-endif
-
-#
 # strip
 #
 
@@ -448,7 +440,6 @@ define UCLIBC_SETUP_DOT_CONFIG
 	$(UCLIBC_LOCALE_CONFIG)
 	$(UCLIBC_WCHAR_CONFIG)
 	$(UCLIBC_STRIP_CONFIG)
-	$(UCLIBC_DEBUG_CONFIG)
 	yes "" | $(MAKE1) -C $(@D) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
-- 
1.8.1.2
