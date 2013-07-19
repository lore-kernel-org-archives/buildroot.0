From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Jul 2013 23:46:33 +0200
Subject: [Buildroot] [git commit] eglibc/arm: doesn't build in thumb(1) mode
Message-ID: <20130719220803.1223B9A294@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=103045534abe3a58bcec67fa4cf604f25ad88b38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It runs out of registers, so build it in ARM mode, EABI mandates
interworking so this isn't an issue.
Tested in an arm920t board.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/eglibc/eglibc.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/eglibc/eglibc.mk b/package/eglibc/eglibc.mk
index 5431ac5..253dabd 100644
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
