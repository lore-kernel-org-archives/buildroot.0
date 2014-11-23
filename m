From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Nov 2014 09:44:05 +0100
Subject: [Buildroot] [git commit] heirloom-mailx: disable static build
Message-ID: <20141123084424.55D3D7FE94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f1d4189b54d6366296f71f9031a426b740db3a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

heirloom-mailx implements its own version of getopt() that collides with the C
library when linking statically.

Fixes:
http://autobuild.buildroot.net/results/f67/f67eb63a9a8bb25fb0c071f1aac271e9798d95d1/
http://autobuild.buildroot.net/results/722/722f65c4fcc093d6a6a2200c06b2ecb3ee35bc06/
http://autobuild.buildroot.net/results/1cc/1cce267cc4b0a7d6bf5ff10f5429ae7dfe96960a/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/heirloom-mailx/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/heirloom-mailx/Config.in b/package/heirloom-mailx/Config.in
index ca83dc3..a2521ef 100644
--- a/package/heirloom-mailx/Config.in
+++ b/package/heirloom-mailx/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HEIRLOOM_MAILX
 	bool "heirloom-mailx"
 	# uses fork()
 	depends on BR2_USE_MMU
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Heirloom mailx (previously known as nail) is a mail user
 	  agent for Unix systems.
@@ -13,3 +14,7 @@ config BR2_PACKAGE_HEIRLOOM_MAILX
 	  cram-md5), SMTPS, MIME encoding of attachements, and more.
 
 	  http://heirloom.sourceforge.net/mailx.html
+
+comment "heirloom-mailx needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
