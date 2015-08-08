From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 17:31:13 +0200
Subject: [Buildroot] [git commit] netatalk: needs dynamic library
Message-ID: <20150808153248.8866980776@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af84025bc84fe56f1328bb96bb0676c22fce7c5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though netatalk checks if dlfcn.h is available and has some code
that supposedly copes with non-dynamic library cases, it in fact does
not build. Since there is probably little interest in using netatalk
in pure statically linked environments, let's simply require dynamic
library support.

Fixes:

  http://autobuild.buildroot.net/results/79e55e64885d64392407e830560175c556953a20/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netatalk/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index cdb2039..ec6ec2c 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NETATALK
 	bool "netatalk"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBEVENT
@@ -13,6 +14,6 @@ config BR2_PACKAGE_NETATALK
 
 	  http://netatalk.sourceforge.net/
 
-comment "netatalk needs a toolchain w/ threads"
+comment "netatalk needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
