From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:14:20 +0100
Subject: [Buildroot] [git commit] libpjsip: needs threads
Message-ID: <20160308201425.5D9B17FBB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c449a7d1182a3c8cf8a0c0259d7dde737de1414
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Builds without thread support fail with the following error:

  ../src/pj/os_core_unix.c:45:21: fatal error: pthread.h: No such file or directory
   #include <pthread.h>
                       ^
  compilation terminated.

Fixes:
  http://autobuild.buildroot.org/results/744/744431e1b47d22222c4d0b48d5d20649dfeed929/
  http://autobuild.buildroot.org/results/a10/a10aca9139054502e055cb61f3925637fc515e12/

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpjsip/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 45387c4..980fada 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBPJSIP
 	bool "libpjsip"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  PJSIP is a free and open source multimedia communication
 	  library written in C language implementing standard based
@@ -8,5 +9,5 @@ config BR2_PACKAGE_LIBPJSIP
 
 	  http://www.pjsip.org
 
-comment "libpjsip needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libpjsip needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
