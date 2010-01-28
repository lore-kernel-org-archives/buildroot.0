From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jan 2010 17:50:54 +0100
Subject: [Buildroot] [git commit master] bash: fix configuration
Message-ID: <20100128165121.8A6C277750@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5082e476d1af0c1f5977a138146c9634f0b2f994
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch bash32-011 modifies the configure.in script. Therefor we need to
run autoconf before launching the configure script. Otherwise, once
the configure script called, the makefile's dependencies over
configure.in will relaunch autoconf without options/environnement
variables we usually set when calling configure.

[Peter: use our own host-autoconf instead of what's on the host]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bash/bash.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 705ce8d..b7fc716 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -32,6 +32,7 @@ $(BASH_DIR)/.unpacked: $(DL_DIR)/$(BASH_SOURCE)
 $(BASH_DIR)/.configured: $(BASH_DIR)/.unpacked
 	# bash_cv_have_mbstate_t=yes
 	(cd $(BASH_DIR); rm -rf config.cache; \
+		$(AUTOCONF) && \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		CCFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
@@ -92,9 +93,9 @@ endif
 # If both bash and busybox are selected, make certain bash wins
 # the fight over who gets to own the /bin/sh symlink.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-bash: ncurses busybox $(TARGET_DIR)/$(BASH_TARGET_BINARY)
+bash: ncurses busybox host-autoconf $(TARGET_DIR)/$(BASH_TARGET_BINARY)
 else
-bash: ncurses $(TARGET_DIR)/$(BASH_TARGET_BINARY)
+bash: ncurses host-autoconf $(TARGET_DIR)/$(BASH_TARGET_BINARY)
 endif
 
 # If both bash and busybox are selected, the /bin/sh symlink
-- 
1.6.3.3
