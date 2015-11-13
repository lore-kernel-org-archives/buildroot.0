From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2015 09:08:10 +0100
Subject: [Buildroot] [git commit] ranger: propagate python3 wchar dependency
Message-ID: <20151113081058.6778581EC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24ecac5562aed872371297d2225bb62a25ed3e5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/da1/da1a4cac055ab4b1a301cf719233ff00d1e793a2/
http://autobuild.buildroot.net/results/8bb/8bbfd91d1d972b5d382e7355a8a36ab532510745/
http://autobuild.buildroot.net/results/05c/05c7691c0cc1ef4cfa842643ab564a3958e66542/
http://autobuild.buildroot.net/results/dfd/dfdbb574708393b627b1244a627444478155c70f/

Python3 needs wchar, so ranger needs to depend on that as well before we can
safely select python3.

While we're at it, also add a comment about the toolchain dependencies.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ranger/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/ranger/Config.in b/package/ranger/Config.in
index 3d77107..ee0ffec 100644
--- a/package/ranger/Config.in
+++ b/package/ranger/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RANGER
 	bool "ranger"
 	depends on BR2_USE_MMU # python3
+	depends on BR2_USE_WCHAR # python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
 	depends on !BR2_STATIC_LIBS # python3
 	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
@@ -14,3 +15,7 @@ config BR2_PACKAGE_RANGER
 	  which program to use for what file type.
 
 	  http://ranger.nongnu.org
+
+comment "ranger needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
