From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun, 17 Jan 2010 23:40:54 +0100
Subject: [Buildroot] [PATCH 06/15] bash: fix configuration
In-Reply-To: <1263768063-24133-1-git-send-email-llandwerlin@gmail.com>
References: <1263768063-24133-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1263768063-24133-7-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Patch bash32-011 modifies the configure.in script. Therefor we need to
run autoconf before launching the configure script. Otherwise, once
the configure script called, the makefile's dependencies over
configure.in will relaunch autoconf without options/environnement
variables we usually set when calling configure.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/bash/bash.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 705ce8d..08039e2 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -32,7 +32,8 @@ $(BASH_DIR)/.unpacked: $(DL_DIR)/$(BASH_SOURCE)
 $(BASH_DIR)/.configured: $(BASH_DIR)/.unpacked
 	# bash_cv_have_mbstate_t=yes
 	(cd $(BASH_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
+                autoconf && \
+	        $(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		CCFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 		ac_cv_func_setvbuf_reversed=no \
-- 
1.6.5.7
