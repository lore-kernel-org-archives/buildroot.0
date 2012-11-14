From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 23:00:29 +0100
Subject: [Buildroot] [git commit] rpcbind: allow build without NSS support
Message-ID: <20121114220322.D435499FD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d4bc3790250d757876e42fcb78fd41fdab63707
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc doesn't provide NSS support, so we shouldn't try to include nss
related headers or call nss related functions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...to-use-NSS-support-when-not-available-in-.patch |   60 ++++++++++++++++++++
 1 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/package/rpcbind/rpcbind-0002-Do-not-try-to-use-NSS-support-when-not-available-in-.patch b/package/rpcbind/rpcbind-0002-Do-not-try-to-use-NSS-support-when-not-available-in-.patch
new file mode 100644
index 0000000..f7cc4a6
--- /dev/null
+++ b/package/rpcbind/rpcbind-0002-Do-not-try-to-use-NSS-support-when-not-available-in-.patch
@@ -0,0 +1,60 @@
+From cfc70fb4c54e044f724516e9352f974187adb448 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 10 Nov 2012 22:04:12 +0100
+Subject: [PATCH] Do not try to use NSS support when not available in the C
+ library
+
+uClibc does not have NSS support, so it is unnecessary to tell the C
+library to use the "files" as the source for "services", since it is
+the only possible choice.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/rpcbind.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/rpcbind.c b/src/rpcbind.c
+index 525ffba..cde8685 100644
+--- a/src/rpcbind.c
++++ b/src/rpcbind.c
+@@ -67,7 +67,9 @@
+ #include <pwd.h>
+ #include <string.h>
+ #include <errno.h>
++#ifdef HAVE_NSS_H
+ #include <nss.h>
++#endif
+ #include "config.h"
+ #include "rpcbind.h"
+ 
+@@ -156,11 +158,13 @@ main(int argc, char *argv[])
+ 		exit(1);
+ 	}
+ 
++#ifdef HAVE_NSS_H
+ 	/*
+ 	 * Make sure we use the local service file 
+ 	 * for service lookkups
+ 	 */
+ 	__nss_configure_lookup("services", "files");
++#endif
+ 
+ 	nc_handle = setnetconfig(); 	/* open netconfig file */
+ 	if (nc_handle == NULL) {
+@@ -222,11 +226,13 @@ main(int argc, char *argv[])
+ 		struct passwd *p;
+ 		char *id = runasdaemon ? RUN_AS : rpcbinduser;
+ 
++#ifdef HAVE_NSS_H
+ 		/*
+ 		 * Make sure we use the local password file
+ 		 * for these lookups.
+ 		 */
+ 		__nss_configure_lookup("passwd", "files");
++#endif
+ 
+ 		if((p = getpwnam(id)) == NULL) {
+ 			syslog(LOG_ERR, "cannot get uid of '%s': %m", id);
+-- 
+1.7.9.5
+
