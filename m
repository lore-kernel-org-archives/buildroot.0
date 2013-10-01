From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 21:37:21 +0200
Subject: [Buildroot] [git commit] pppd: needs mmu and shared objects
Message-ID: <20131001193835.727809B585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cfb3fc26723211c16dd2793295d6674858ca4e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The plugin infrastructure is based on shared objects so it won't build
for static-only scenarios.
And the daemon uses fork() so MMU is required.

[Peter: move below suboptions]
Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pppd/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 879b263..ba35fed 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PPPD
 	bool "pppd"
+	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
 	help
 	  An implementation of the Point-to-point protocol.
 
@@ -19,3 +21,7 @@ config BR2_PACKAGE_PPPD_RADIUS
 	bool "radius"
 	help
 	  Install RADIUS support for pppd
+
+comment "pppd requires a toolchain with dynamic library support"
+	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
