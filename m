From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 15:13:58 +0200
Subject: [Buildroot] [git commit] boost: do not allow boost-log on PowerPC
	with uClibc
Message-ID: <20150516131759.C901781768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7aaa9bee2e6009c6c00fa2a356b8f014999e9a54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of boost-log with a uClibc toolchain on PowerPC fails with
some weird C++ issues. Since nobody ever looked into this problem,
let's "fix" the autobuilder issue by not allowing to select boost-log
in such a situation.

Fixes:

   http://autobuild.buildroot.net/results/13b43105caf4d3952de70030b51f8d96cf6604ee/
   (and many, many similar build failures)

[Peter: also add dependency to comment]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 0ed8dd2..92d59c2 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -99,9 +99,13 @@ comment "boost-locale needs a toolchain w/ wchar"
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	# for some reason, uClibc on PowerPC fails to build the boost
+	# log module
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
 
 comment "boost-log needs a toolchain w/ NPTL"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
 
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
