From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Dec 2018 10:11:06 +0100
Subject: [Buildroot] [PATCH] swupdate: ensure TARGET_CC is used for
 compiling/linking
Message-ID: <20181218091106.18688-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.net/results/e302d0edb59ff7617b5f2d21f06eb65ae04981fe
    http://autobuild.buildroot.net/results/dbb69acadc20b4bb559311348eca276c1e6343f7

Swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not available in all
external toolchains, and use CC for linking. Ensure TARGET_CC is used for both.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/swupdate/swupdate.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 6285437aaa..08d6ba9372 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -9,6 +9,11 @@ SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0+, LGPL-2.1+, MIT
 SWUPDATE_LICENSE_FILES = COPYING
 
+# swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
+# available in all external toolchains, and use CC for linking. Ensure
+# TARGET_CC is used for both.
+SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)"
+
 # swupdate bundles its own version of mongoose (version 6.11)
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
-- 
2.11.0
