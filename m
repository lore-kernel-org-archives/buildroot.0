From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Dec 2018 15:27:28 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] swupdate: ensure
 TARGET_CC is used for compiling/linking
Message-ID: <20181218142403.50583817BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73a9f0f8d0f0ff219f7ef54e12526685901ffb58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Fixes:
http://autobuild.buildroot.net/results/e302d0edb59ff7617b5f2d21f06eb65ae04981fe
http://autobuild.buildroot.net/results/dbb69acadc20b4bb559311348eca276c1e6343f7

Swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not available in all
external toolchains, and use CC for linking. Ensure TARGET_CC is used for both.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 291ec1d2be2409fddc897a5f6ab28e6b8b56ce38)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
