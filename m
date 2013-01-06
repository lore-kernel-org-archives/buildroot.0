From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 22:07:06 +0100
Subject: [Buildroot] [git commit] libdvdnav: requires thread support in
	toolchain
Message-ID: <20130106210746.C1F689A633@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c199fb727e838bab2a8ab359ce3432776ef51db9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libdvdnav requires thread support. The only package that depends on
libdvdnav is mplayer, and it is an optional dependency, only activated
when libdvdnav is enabled. So we don't have to push this thread
support dependency to any other package.

Fixes:

  http://autobuild.buildroot.org/results/54d6a737ae805ef1dbf77e5d11b4dd5366873ec0/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libdvdnav/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
index 5ba31e8..4585be9 100644
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBDVDNAV
 	bool "libdvdnav"
 	depends on BR2_LARGEFILE # libdvdread
+	depends on BR2_TOOLCHAIN_HAS_THREADS
         select BR2_PACKAGE_LIBDVDREAD
 	help
 	  libdvdnav is a library that allows easy use of sophisticated
@@ -9,5 +10,5 @@ config BR2_PACKAGE_LIBDVDNAV
 
 	  http://www.mplayerhq.hu
 
-comment "libdvdnav requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "libdvdnav requires a toolchain with LARGEFILE and thread support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
