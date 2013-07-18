From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Jul 2013 13:07:39 -0300
Subject: [Buildroot] [PATCH 3/3] eglibc/arm: doesn't build in thumb(1) mode
In-Reply-To: <1374163659-22748-1-git-send-email-gustavo@zacarias.com.ar>
References: <1374163659-22748-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1374163659-22748-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It runs out of registers, so build it in ARM mode, EABI mandates
interworking so this isn't an issue.
Tested in an arm920t board.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/eglibc/eglibc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/eglibc/eglibc.mk b/package/eglibc/eglibc.mk
index ccdc210..d91a2e2 100644
--- a/package/eglibc/eglibc.mk
+++ b/package/eglibc/eglibc.mk
@@ -23,6 +23,11 @@ EGLIBC_INSTALL_STAGING = YES
 
 EGLIBC_INSTALL_STAGING_OPT = install_root=$(STAGING_DIR) install
 
+# Thumb build is broken, build in ARM mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+EGLIBC_EXTRA_CFLAGS += -marm
+endif
+
 # Even though we use the autotools-package infrastructure, we have to
 # override the default configure commands for several reasons:
 #
@@ -36,7 +41,8 @@ define EGLIBC_CONFIGURE_CMDS
 	# Do the configuration
 	(cd $(@D)/build; \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="-O2" CPPFLAGS="" CXXFLAGS="-O2" \
+		CFLAGS="-O2 $(EGLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
+		CXXFLAGS="-O2 $(EGLIBC_EXTRA_CFLAGS)" \
 		$(SHELL) $(@D)/libc/configure \
 		ac_cv_path_BASH_SHELL=/bin/bash \
 		libc_cv_forced_unwind=yes \
-- 
1.8.1.5
