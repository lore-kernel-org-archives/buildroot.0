From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 14:38:21 +0100
Subject: [Buildroot] [git commit] open-lldp: requires dynamic linking
 interface (dlopen, ...)
Message-ID: <20180129134202.786C887F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd46df68085c2bfdfcf2c04d77da6d31114b11be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/516456c8e21759e1ecee4ef9f9689a8f720ecd90/

This patch is to fix the following build error:
weak_readline.c:30:19: fatal error: dlfcn.h: No such file or directory
 #include <dlfcn.h>
                   ^
compilation terminated.
Makefile:890: recipe for target 'weak_readline.o' failed

Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/open-lldp/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/open-lldp/Config.in b/package/open-lldp/Config.in
index d54cf181d3..b40bff8996 100644
--- a/package/open-lldp/Config.in
+++ b/package/open-lldp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPEN_LLDP
 	bool "open-lldp"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	select BR2_PACKAGE_LIBCONFIG
 	select BR2_PACKAGE_LIBNL
@@ -11,5 +12,5 @@ config BR2_PACKAGE_OPEN_LLDP
 
 	  http://open-lldp.org/
 
-comment "open-lldp needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "open-lldp needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
