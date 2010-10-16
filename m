From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 16 Oct 2010 16:46:44 -0400
Subject: [Buildroot] [git commit master 1/1] toolchain: do not require full
	path
Message-ID: <20101016204702.67E958D282@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d2f7323f78e449cf195df73e334fa39440127a9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the toolchain can be found via $PATH, then requiring the full path to
it is unnecessary.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/Makefile.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 85e6550..fb09083 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -116,7 +116,11 @@ TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
+ifneq ($(TOOLCHAIN_EXTERNAL_PATH),)
 TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
+else
+TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PREFIX)-
+endif
 else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(TOOLCHAIN_DIR)/bin/$(REAL_GNU_TARGET_NAME)-
 endif
-- 
1.7.1
