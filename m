From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 09:48:07 +0100
Subject: [Buildroot] [git commit] open-lldp: add patch to remove -Werror
Message-ID: <20180118084941.6B19783E9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c38853d708a70208859fa056d527b4cf40a9265a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-Werror causes a number of build failures with recent versions of gcc
 that have additional warnings (turned into error due to -Werror). So
 let's remove -Werror.

Fixes:

  http://autobuild.buildroot.net/results/a06feb8616b98d4931145ea5079650e06bd1a61d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-Makefile.am-disable-Werror.patch          | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/open-lldp/0003-Makefile.am-disable-Werror.patch b/package/open-lldp/0003-Makefile.am-disable-Werror.patch
new file mode 100644
index 0000000..d6393bd
--- /dev/null
+++ b/package/open-lldp/0003-Makefile.am-disable-Werror.patch
@@ -0,0 +1,38 @@
+From c350f263136801fd54d42322a07a3b5ad2181dd9 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 18 Jan 2018 09:29:32 +0100
+Subject: [PATCH] Makefile.am: disable -Werror
+
+Due to additional warnings in recent gcc versions and the use of
+-Werror the build fails for reasons that are not that important. For
+example:
+
+clif.c:54:2: error: implicit declaration of function 'memset' [-Werror=implicit-function-declaration]
+  memset(clif, 0, sizeof(*clif));
+
+or:
+
+log.c:46:30: error: format '%ld' expects argument of type 'long int', but argument 5 has type '__suseconds_t {aka int}' [-Werror=format=]
+   printf("%02d:%02d:%02d.%06ld ",
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 551d4c7..62a52a5 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -16,7 +16,7 @@ ACLOCAL_AMFLAGS = -I m4
+ parse_cli.o: CFLAGS+=-U_FORTIFY_SOURCE -Wno-error
+ 
+ ## system requires a shared libconfig
+-AM_CFLAGS = -Wall -Werror -Wextra -Wformat=2 $(LIBCONFIG_CFLAGS) $(LIBNL_CFLAGS)
++AM_CFLAGS = -Wall -Wextra -Wformat=2 $(LIBCONFIG_CFLAGS) $(LIBNL_CFLAGS)
+ AM_LDFLAGS = $(LIBCONFIG_LIBS) $(LIBNL_LIBS) -lrt
+ 
+ ## header files to be installed, for programs using the client interface to lldpad 
+-- 
+2.14.3
+
