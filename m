From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 2 Apr 2017 05:37:08 +0200
Subject: [Buildroot] [PATCH] portmap: remove package as it is obsolete
Message-ID: <20170402033708.GA24554@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upstream tarball isn't available, no releases since ten
years. The latest change to upstream git is from 2014.
Better use rpcbind for any RPC portmapper service.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 Config.in.legacy                                   |  8 ++
 package/Config.in                                  |  1 -
 .../0001-README-fix-typo-in-tcp-wrapper-doc.patch  | 26 ------
 ...0002-NO_PIE-make-PIE-support-controllable.patch | 53 ------------
 ...K-control-usage-of-fork-for-nommu-systems.patch | 95 ----------------------
 ...ERROR-control-overriding-of-perror-symbol.patch | 65 ---------------
 package/portmap/0005-tcpd.patch                    | 18 ----
 package/portmap/Config.in                          | 16 ----
 package/portmap/S13portmap                         | 44 ----------
 package/portmap/portmap.hash                       |  2 -
 package/portmap/portmap.mk                         | 33 --------
 11 files changed, 8 insertions(+), 353 deletions(-)
 delete mode 100644 package/portmap/0001-README-fix-typo-in-tcp-wrapper-doc.patch
 delete mode 100644 package/portmap/0002-NO_PIE-make-PIE-support-controllable.patch
 delete mode 100644 package/portmap/0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
 delete mode 100644 package/portmap/0004-NO_PERROR-control-overriding-of-perror-symbol.patch
 delete mode 100644 package/portmap/0005-tcpd.patch
 delete mode 100644 package/portmap/Config.in
 delete mode 100755 package/portmap/S13portmap
 delete mode 100644 package/portmap/portmap.hash
 delete mode 100644 package/portmap/portmap.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index dfd4d67..1da91f6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_PACKAGE_PORTMAP
+	bool "portmap has been removed"
+	select BR2_LEGACY
+	help
+	  The portmap upstream tarball is removed, no releases since
+	  ten years and latest change in upstream git in 2014.
+	  You should better use rpcbind as a RPC portmapper.
+
 config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS
 	int "extra size in blocks has been removed"
 	default 0
diff --git a/package/Config.in b/package/Config.in
index d6d134d..71bd44a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1636,7 +1636,6 @@ endif
 	source "package/openvpn/Config.in"
 	source "package/p910nd/Config.in"
 	source "package/phidgetwebservice/Config.in"
-	source "package/portmap/Config.in"
 	source "package/pound/Config.in"
 	source "package/pppd/Config.in"
 	source "package/pptp-linux/Config.in"
diff --git a/package/portmap/0001-README-fix-typo-in-tcp-wrapper-doc.patch b/package/portmap/0001-README-fix-typo-in-tcp-wrapper-doc.patch
deleted file mode 100644
index 01aa7bf..0000000
--- a/package/portmap/0001-README-fix-typo-in-tcp-wrapper-doc.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From af4a27a17bbdbe941f2462e116c2e4c8ade110e3 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Fri, 19 Nov 2010 23:35:20 -0500
-Subject: [PATCH 1/4] README: fix typo in tcp wrapper doc
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
----
- README |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/README b/README
-index 0da54cc..916de7e 100644
---- a/README
-+++ b/README
-@@ -18,7 +18,7 @@ There is no "./configure", just use "make".
- 
- Some make variable can be used to control compilation.
- 
-- NO_TCP_WRAPPER=  if non-empty, doen't use tcp_wrappers
-+ NO_TCP_WRAPPER=  if non-empty, don't use tcp_wrappers
-  USE_DNS=	  if set, tcp_wrappers can check peers based on hostname
- 		  as well as IP address.  This should only be used if you
- 		  are certain that gethostbyname will never trigger a
--- 
-1.7.3.1
-
diff --git a/package/portmap/0002-NO_PIE-make-PIE-support-controllable.patch b/package/portmap/0002-NO_PIE-make-PIE-support-controllable.patch
deleted file mode 100644
index 6e544bf..0000000
--- a/package/portmap/0002-NO_PIE-make-PIE-support-controllable.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 087874b15367a04fd482541d1832696d7163d1ac Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Fri, 19 Nov 2010 23:35:47 -0500
-Subject: [PATCH 2/4] NO_PIE: make PIE support controllable
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
----
- Makefile |    8 ++++++--
- README   |    1 +
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 5343428..cfcfdbb 100644
---- a/Makefile
-+++ b/Makefile
-@@ -106,6 +106,10 @@ CPPFLAGS += -DIGNORE_SIGCHLD	# AIX 4.x, HP-UX 9.x
- #
- # LDLIBS	+= -m
- # CFLAGS	+= -arch m68k -arch i386 -arch hppa
-+ifeq ($(NO_PIE),)
-+CFLAGS_PIE  = -fpie
-+LDFLAGS_PIE = -pie
-+endif
- 
- # Auxiliary libraries that you may have to specify
- #
-@@ -125,9 +129,9 @@ CFLAGS   += -Wall -Wstrict-prototypes
- all:	portmap pmap_dump pmap_set portmap.man
- 
- CPPFLAGS += $(HOSTS_ACCESS)
--portmap: CFLAGS   += -fpie
-+portmap: CFLAGS   += $(CFLAGS_PIE)
- portmap: LDLIBS   += $(WRAP_LIB)
--portmap: LDFLAGS  += -pie
-+portmap: LDFLAGS  += $(LDFLAGS_PIE)
- portmap: portmap.o pmap_check.o from_local.o
- 
- from_local: CPPFLAGS += -DTEST
-diff --git a/README b/README
-index 916de7e..e0b561a 100644
---- a/README
-+++ b/README
-@@ -18,6 +18,7 @@ There is no "./configure", just use "make".
- 
- Some make variable can be used to control compilation.
- 
-+ NO_PIE=	  if non-empty, don't build portmap as a PIE
-  NO_TCP_WRAPPER=  if non-empty, don't use tcp_wrappers
-  USE_DNS=	  if set, tcp_wrappers can check peers based on hostname
- 		  as well as IP address.  This should only be used if you
--- 
-1.7.3.1
-
diff --git a/package/portmap/0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch b/package/portmap/0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
deleted file mode 100644
index 41396b6..0000000
--- a/package/portmap/0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From b3afea5757af1a7356ba30d2e0a7d5909ca18121 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Fri, 19 Nov 2010 23:48:20 -0500
-Subject: [PATCH 3/4] NO_FORK: control usage of fork() for nommu systems
-
-nommu systems lack a fork() function, so add a NO_FORK flag to control
-its usage.  We don't lose a ton of functionality in doing so, and on an
-embedded system, this is OK.
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
----
- Makefile     |    5 +++++
- README       |    1 +
- pmap_check.c |    6 ++++--
- portmap.c    |    6 ++++++
- 4 files changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index cfcfdbb..9df5574 100644
---- a/Makefile
-+++ b/Makefile
-@@ -27,6 +27,11 @@ MAN_SED += -e 's/USE_DNS/yes/'
- endif
- endif
- 
-+# For no-mmu systems, we have to disable the fork() functions.
-+ifneq ($(NO_FORK),)
-+CPPFLAGS += -DNO_FORK
-+endif
-+
- # Comment out if your RPC library does not allocate privileged ports for
- # requests from processes with root privilege, or the new portmap will
- # always reject requests to register/unregister services on privileged
-diff --git a/README b/README
-index e0b561a..bda1707 100644
---- a/README
-+++ b/README
-@@ -18,6 +18,7 @@ There is no "./configure", just use "make".
- 
- Some make variable can be used to control compilation.
- 
-+ NO_FORK=	  if non-empty, don't use fork (good for nommu systems)
-  NO_PIE=	  if non-empty, don't build portmap as a PIE
-  NO_TCP_WRAPPER=  if non-empty, don't use tcp_wrappers
-  USE_DNS=	  if set, tcp_wrappers can check peers based on hostname
-diff --git a/pmap_check.c b/pmap_check.c
-index 6b3e490..983414e 100644
---- a/pmap_check.c
-+++ b/pmap_check.c
-@@ -302,8 +302,10 @@ static void logit(int severity, struct sockaddr_in *addr,
-      * getrpcbynumber() or syslog() does its thing.
-      */
- 
--    if (fork() == 0) {
--
-+#ifndef NO_FORK
-+    if (fork() == 0)
-+#endif
-+    {
- 	/* Try to map program number to name. */
- 
- 	if (prognum == 0) {
-diff --git a/portmap.c b/portmap.c
-index 2a98881..94abc64 100644
---- a/portmap.c
-+++ b/portmap.c
-@@ -753,6 +755,7 @@ static void callit(struct svc_req *rqstp, SVCXPRT *xprt)
- 	if ((pml = find_service(a.rmt_prog, a.rmt_vers,
- 	    (u_long)IPPROTO_UDP)) == NULL)
- 		return;
-+#ifndef NO_FORK
- 	/*
- 	 * fork a child to do the work.  Parent immediately returns.
- 	 * Child exits upon completion.
-@@ -763,6 +766,7 @@ static void callit(struct svc_req *rqstp, SVCXPRT *xprt)
- 			    a.rmt_prog);
- 		return;
- 	}
-+#endif
- 	port = pml->pml_map.pm_port;
- 	get_myaddress(&me);
- 	me.sin_port = htons(port);
-@@ -783,7 +787,9 @@ static void callit(struct svc_req *rqstp, SVCXPRT *xprt)
- 		clnt_destroy(client);
- 	}
- 	(void)close(so);
-+#ifndef NO_FORK
- 	exit(0);
-+#endif
- }
- 
- #ifndef IGNORE_SIGCHLD			/* Lionel Cons <cons@dxcern.cern.ch> */
--- 
-1.7.3.1
-
diff --git a/package/portmap/0004-NO_PERROR-control-overriding-of-perror-symbol.patch b/package/portmap/0004-NO_PERROR-control-overriding-of-perror-symbol.patch
deleted file mode 100644
index 665d6a1..0000000
--- a/package/portmap/0004-NO_PERROR-control-overriding-of-perror-symbol.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 8cea0778f0fb838a7bd764be08f15e1494e5a0b2 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Fri, 19 Nov 2010 23:50:27 -0500
-Subject: [PATCH 4/4] NO_PERROR: control overriding of perror() symbol
-
-Doing static builds of portmap might fail when the C library's perror()
-function is pulled in and collides with portmap's definition.  So add a
-flag to control the local override.
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
----
- Makefile |    5 +++++
- README   |    1 +
- 2 files changed, 6 insertions(+), 0 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 9df5574..1635107 100644
---- a/Makefile
-+++ b/Makefile
-@@ -32,6 +32,11 @@ ifneq ($(NO_FORK),)
- CPPFLAGS += -DNO_FORK
- endif
- 
-+# For static builds, we might hit perror() symbol clashes
-+ifneq ($(NO_PERROR),)
-+CPPFLAGS += -DNO_PERROR
-+endif
-+
- # Comment out if your RPC library does not allocate privileged ports for
- # requests from processes with root privilege, or the new portmap will
- # always reject requests to register/unregister services on privileged
-diff --git a/README b/README
-index bda1707..05861a8 100644
---- a/README
-+++ b/README
-@@ -19,6 +19,7 @@ There is no "./configure", just use "make".
- Some make variable can be used to control compilation.
- 
-  NO_FORK=	  if non-empty, don't use fork (good for nommu systems)
-+ NO_PERROR=	  if non-empty, don't override the perror() func
-  NO_PIE=	  if non-empty, don't build portmap as a PIE
-  NO_TCP_WRAPPER=  if non-empty, don't use tcp_wrappers
-  USE_DNS=	  if set, tcp_wrappers can check peers based on hostname
-diff --git a/portmap.c b/portmap.c
-index 2a98881..94abc64 100644
---- a/portmap.c
-+++ b/portmap.c
-@@ -391,12 +391,14 @@ main(int argc, char **argv)
- 	abort();
- }
- 
-+#ifndef NO_PERROR
- /* need to override perror calls in rpc library */
- void perror(const char *what)
- {
- 
- 	syslog(LOG_ERR, "%s: %m", what);
- }
-+#endif
- 
- static struct pmaplist *
- find_service(u_long prog, u_long vers, u_long prot)
--- 
-1.7.3.1
-
diff --git a/package/portmap/0005-tcpd.patch b/package/portmap/0005-tcpd.patch
deleted file mode 100644
index c6af8f8..0000000
--- a/package/portmap/0005-tcpd.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Enable compile without tcp-wrappers
-
-Patch by Timothy Redaelli <drizzt@gentoo.org>
-
-http://bugs.gentoo.org/178242
-
---- portmap_6.0/pmap_check.c
-+++ portmap_6.0/pmap_check.c
-@@ -44,7 +44,9 @@
- #include <netinet/in.h>
- #include <rpc/rpcent.h>
- #endif
-+#ifdef HOSTS_ACCESS
- #include <tcpd.h>
-+#endif
- #include <arpa/inet.h>
- #include <grp.h>
- 
diff --git a/package/portmap/Config.in b/package/portmap/Config.in
deleted file mode 100644
index d960690..0000000
--- a/package/portmap/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_PORTMAP
-	bool "portmap"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	# portmap and rpcbind provide the same feature, so they are
-	# mutually exclusive. rpcbind is the newer, preferred
-	# implementation.
-	depends on !BR2_PACKAGE_RPCBIND
-	help
-	  The standard portmapper for RPC services.
-
-	  Note that portmap is being deprecated in favour of rpcbind.
-
-	  http://neil.brown.name/portmap/
-
-comment "portmap needs a toolchain w/ RPC"
-	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/portmap/S13portmap b/package/portmap/S13portmap
deleted file mode 100755
index 9aa6adf..0000000
--- a/package/portmap/S13portmap
+++ /dev/null
@@ -1,44 +0,0 @@
-#! /bin/sh
-
-[ -f /sbin/portmap ] || exit 0
-
-start() {
-	printf "Starting portmap: "
-	portmap
-	mkdir -p /var/lock/subsys
-	touch /var/lock/subsys/portmap
-	echo "done"
-}
-
-
-stop() {
-        printf "Stopping portmap: "
-	echo
-        killall portmap
-        rm -rf /var/lock/subsys
-	echo "done"
-}
-
-restart() {
-	stop
-	start
-	rm -f /var/run/portmap.state
-}
-
-# See how we were called.
-case "$1" in
-  start)
-	start
-	;;
-  stop)
-	stop
-	;;
-  restart|reload)
-	restart
-	;;
-  *)
-	echo "Usage: $0 {start|stop|reload|restart}"
-	exit 1
-esac
-
-exit $?
diff --git a/package/portmap/portmap.hash b/package/portmap/portmap.hash
deleted file mode 100644
index e542b2d..0000000
--- a/package/portmap/portmap.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256 02c820d39f3e6e729d1bea3287a2d8a6c684f1006fb9612f97dcad4a281d41de  portmap-6.0.tgz
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
deleted file mode 100644
index c3e319b..0000000
--- a/package/portmap/portmap.mk
+++ /dev/null
@@ -1,33 +0,0 @@
-################################################################################
-#
-# portmap
-#
-################################################################################
-
-PORTMAP_VERSION = 6.0
-PORTMAP_SOURCE = portmap-$(PORTMAP_VERSION).tgz
-PORTMAP_SITE = http://neil.brown.name/portmap
-PORTMAP_LICENSE = BSD-4-Clause (portmap.c) SunRPC License (portmap.c from_local.c)
-PORTMAP_LICENSE_FILES = portmap.c from_local.c
-PORTMAP_SBINS = portmap pmap_dump pmap_set
-
-PORTMAP_FLAGS = NO_TCP_WRAPPER=1 NO_PIE=1 NO_PERROR=1
-ifeq ($(BR2_USE_MMU),)
-PORTMAP_FLAGS += NO_FORK=1
-endif
-
-define PORTMAP_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(PORTMAP_FLAGS)
-endef
-
-define PORTMAP_INSTALL_TARGET_CMDS
-	for sbin in $(PORTMAP_SBINS); do \
-		$(INSTALL) -D -m 0755 $(@D)/$$sbin $(TARGET_DIR)/sbin/$$sbin || exit 1; \
-	done
-endef
-
-define PORTMAP_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/portmap/S13portmap $(TARGET_DIR)/etc/init.d/S13portmap
-endef
-
-$(eval $(generic-package))
-- 
2.1.4
