From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 11 Jan 2011 13:00:17 -0500
Subject: [Buildroot] [PATCH 4/7 v2] portmap: add nommu support
In-Reply-To: <87lj2r3f8m.fsf@macbook.be.48ers.dk>
References: <87lj2r3f8m.fsf@macbook.be.48ers.dk>
Message-ID: <1294768817-1904-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- tweak perror patch

 ...0-0001-README-fix-typo-in-tcp-wrapper-doc.patch |   26 ++++++
 ...0002-NO_PIE-make-PIE-support-controllable.patch |   53 +++++++++++
 ...K-control-usage-of-fork-for-nommu-systems.patch |   95 ++++++++++++++++++++
 ...ERROR-control-overriding-of-perror-symbol.patch |   65 +++++++++++++
 package/portmap/portmap.mk                         |    7 ++-
 5 files changed, 245 insertions(+), 1 deletions(-)
 create mode 100644 package/portmap/portmap-6.0-0001-README-fix-typo-in-tcp-wrapper-doc.patch
 create mode 100644 package/portmap/portmap-6.0-0002-NO_PIE-make-PIE-support-controllable.patch
 create mode 100644 package/portmap/portmap-6.0-0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
 create mode 100644 package/portmap/portmap-6.0-0004-NO_PERROR-control-overriding-of-perror-symbol.patch

diff --git a/package/portmap/portmap-6.0-0001-README-fix-typo-in-tcp-wrapper-doc.patch b/package/portmap/portmap-6.0-0001-README-fix-typo-in-tcp-wrapper-doc.patch
new file mode 100644
index 0000000..01aa7bf
--- /dev/null
+++ b/package/portmap/portmap-6.0-0001-README-fix-typo-in-tcp-wrapper-doc.patch
@@ -0,0 +1,26 @@
+From af4a27a17bbdbe941f2462e116c2e4c8ade110e3 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Fri, 19 Nov 2010 23:35:20 -0500
+Subject: [PATCH 1/4] README: fix typo in tcp wrapper doc
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ README |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/README b/README
+index 0da54cc..916de7e 100644
+--- a/README
++++ b/README
+@@ -18,7 +18,7 @@ There is no "./configure", just use "make".
+ 
+ Some make variable can be used to control compilation.
+ 
+- NO_TCP_WRAPPER=  if non-empty, doen't use tcp_wrappers
++ NO_TCP_WRAPPER=  if non-empty, don't use tcp_wrappers
+  USE_DNS=	  if set, tcp_wrappers can check peers based on hostname
+ 		  as well as IP address.  This should only be used if you
+ 		  are certain that gethostbyname will never trigger a
+-- 
+1.7.3.1
+
diff --git a/package/portmap/portmap-6.0-0002-NO_PIE-make-PIE-support-controllable.patch b/package/portmap/portmap-6.0-0002-NO_PIE-make-PIE-support-controllable.patch
new file mode 100644
index 0000000..6e544bf
--- /dev/null
+++ b/package/portmap/portmap-6.0-0002-NO_PIE-make-PIE-support-controllable.patch
@@ -0,0 +1,53 @@
+From 087874b15367a04fd482541d1832696d7163d1ac Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Fri, 19 Nov 2010 23:35:47 -0500
+Subject: [PATCH 2/4] NO_PIE: make PIE support controllable
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ Makefile |    8 ++++++--
+ README   |    1 +
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 5343428..cfcfdbb 100644
+--- a/Makefile
++++ b/Makefile
+@@ -106,6 +106,10 @@ CPPFLAGS += -DIGNORE_SIGCHLD	# AIX 4.x, HP-UX 9.x
+ #
+ # LDLIBS	+= -m
+ # CFLAGS	+= -arch m68k -arch i386 -arch hppa
++ifeq ($(NO_PIE),)
++CFLAGS_PIE  = -fpie
++LDFLAGS_PIE = -pie
++endif
+ 
+ # Auxiliary libraries that you may have to specify
+ #
+@@ -125,9 +129,9 @@ CFLAGS   += -Wall -Wstrict-prototypes
+ all:	portmap pmap_dump pmap_set portmap.man
+ 
+ CPPFLAGS += $(HOSTS_ACCESS)
+-portmap: CFLAGS   += -fpie
++portmap: CFLAGS   += $(CFLAGS_PIE)
+ portmap: LDLIBS   += $(WRAP_LIB)
+-portmap: LDFLAGS  += -pie
++portmap: LDFLAGS  += $(LDFLAGS_PIE)
+ portmap: portmap.o pmap_check.o from_local.o
+ 
+ from_local: CPPFLAGS += -DTEST
+diff --git a/README b/README
+index 916de7e..e0b561a 100644
+--- a/README
++++ b/README
+@@ -18,6 +18,7 @@ There is no "./configure", just use "make".
+ 
+ Some make variable can be used to control compilation.
+ 
++ NO_PIE=	  if non-empty, don't build portmap as a PIE
+  NO_TCP_WRAPPER=  if non-empty, don't use tcp_wrappers
+  USE_DNS=	  if set, tcp_wrappers can check peers based on hostname
+ 		  as well as IP address.  This should only be used if you
+-- 
+1.7.3.1
+
diff --git a/package/portmap/portmap-6.0-0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch b/package/portmap/portmap-6.0-0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
new file mode 100644
index 0000000..41396b6
--- /dev/null
+++ b/package/portmap/portmap-6.0-0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
@@ -0,0 +1,95 @@
+From b3afea5757af1a7356ba30d2e0a7d5909ca18121 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Fri, 19 Nov 2010 23:48:20 -0500
+Subject: [PATCH 3/4] NO_FORK: control usage of fork() for nommu systems
+
+nommu systems lack a fork() function, so add a NO_FORK flag to control
+its usage.  We don't lose a ton of functionality in doing so, and on an
+embedded system, this is OK.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ Makefile     |    5 +++++
+ README       |    1 +
+ pmap_check.c |    6 ++++--
+ portmap.c    |    6 ++++++
+ 4 files changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index cfcfdbb..9df5574 100644
+--- a/Makefile
++++ b/Makefile
+@@ -27,6 +27,11 @@ MAN_SED += -e 's/USE_DNS/yes/'
+ endif
+ endif
+ 
++# For no-mmu systems, we have to disable the fork() functions.
++ifneq ($(NO_FORK),)
++CPPFLAGS += -DNO_FORK
++endif
++
+ # Comment out if your RPC library does not allocate privileged ports for
+ # requests from processes with root privilege, or the new portmap will
+ # always reject requests to register/unregister services on privileged
+diff --git a/README b/README
+index e0b561a..bda1707 100644
+--- a/README
++++ b/README
+@@ -18,6 +18,7 @@ There is no "./configure", just use "make".
+ 
+ Some make variable can be used to control compilation.
+ 
++ NO_FORK=	  if non-empty, don't use fork (good for nommu systems)
+  NO_PIE=	  if non-empty, don't build portmap as a PIE
+  NO_TCP_WRAPPER=  if non-empty, don't use tcp_wrappers
+  USE_DNS=	  if set, tcp_wrappers can check peers based on hostname
+diff --git a/pmap_check.c b/pmap_check.c
+index 6b3e490..983414e 100644
+--- a/pmap_check.c
++++ b/pmap_check.c
+@@ -302,8 +302,10 @@ static void logit(int severity, struct sockaddr_in *addr,
+      * getrpcbynumber() or syslog() does its thing.
+      */
+ 
+-    if (fork() == 0) {
+-
++#ifndef NO_FORK
++    if (fork() == 0)
++#endif
++    {
+ 	/* Try to map program number to name. */
+ 
+ 	if (prognum == 0) {
+diff --git a/portmap.c b/portmap.c
+index 2a98881..94abc64 100644
+--- a/portmap.c
++++ b/portmap.c
+@@ -753,6 +755,7 @@ static void callit(struct svc_req *rqstp, SVCXPRT *xprt)
+ 	if ((pml = find_service(a.rmt_prog, a.rmt_vers,
+ 	    (u_long)IPPROTO_UDP)) == NULL)
+ 		return;
++#ifndef NO_FORK
+ 	/*
+ 	 * fork a child to do the work.  Parent immediately returns.
+ 	 * Child exits upon completion.
+@@ -763,6 +766,7 @@ static void callit(struct svc_req *rqstp, SVCXPRT *xprt)
+ 			    a.rmt_prog);
+ 		return;
+ 	}
++#endif
+ 	port = pml->pml_map.pm_port;
+ 	get_myaddress(&me);
+ 	me.sin_port = htons(port);
+@@ -783,7 +787,9 @@ static void callit(struct svc_req *rqstp, SVCXPRT *xprt)
+ 		clnt_destroy(client);
+ 	}
+ 	(void)close(so);
++#ifndef NO_FORK
+ 	exit(0);
++#endif
+ }
+ 
+ #ifndef IGNORE_SIGCHLD			/* Lionel Cons <cons@dxcern.cern.ch> */
+-- 
+1.7.3.1
+
diff --git a/package/portmap/portmap-6.0-0004-NO_PERROR-control-overriding-of-perror-symbol.patch b/package/portmap/portmap-6.0-0004-NO_PERROR-control-overriding-of-perror-symbol.patch
new file mode 100644
index 0000000..665d6a1
--- /dev/null
+++ b/package/portmap/portmap-6.0-0004-NO_PERROR-control-overriding-of-perror-symbol.patch
@@ -0,0 +1,65 @@
+From 8cea0778f0fb838a7bd764be08f15e1494e5a0b2 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Fri, 19 Nov 2010 23:50:27 -0500
+Subject: [PATCH 4/4] NO_PERROR: control overriding of perror() symbol
+
+Doing static builds of portmap might fail when the C library's perror()
+function is pulled in and collides with portmap's definition.  So add a
+flag to control the local override.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ Makefile |    5 +++++
+ README   |    1 +
+ 2 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9df5574..1635107 100644
+--- a/Makefile
++++ b/Makefile
+@@ -32,6 +32,11 @@ ifneq ($(NO_FORK),)
+ CPPFLAGS += -DNO_FORK
+ endif
+ 
++# For static builds, we might hit perror() symbol clashes
++ifneq ($(NO_PERROR),)
++CPPFLAGS += -DNO_PERROR
++endif
++
+ # Comment out if your RPC library does not allocate privileged ports for
+ # requests from processes with root privilege, or the new portmap will
+ # always reject requests to register/unregister services on privileged
+diff --git a/README b/README
+index bda1707..05861a8 100644
+--- a/README
++++ b/README
+@@ -19,6 +19,7 @@ There is no "./configure", just use "make".
+ Some make variable can be used to control compilation.
+ 
+  NO_FORK=	  if non-empty, don't use fork (good for nommu systems)
++ NO_PERROR=	  if non-empty, don't override the perror() func
+  NO_PIE=	  if non-empty, don't build portmap as a PIE
+  NO_TCP_WRAPPER=  if non-empty, don't use tcp_wrappers
+  USE_DNS=	  if set, tcp_wrappers can check peers based on hostname
+diff --git a/portmap.c b/portmap.c
+index 2a98881..94abc64 100644
+--- a/portmap.c
++++ b/portmap.c
+@@ -391,12 +391,14 @@ main(int argc, char **argv)
+ 	abort();
+ }
+ 
++#ifndef NO_PERROR
+ /* need to override perror calls in rpc library */
+ void perror(const char *what)
+ {
+ 
+ 	syslog(LOG_ERR, "%s: %m", what);
+ }
++#endif
+ 
+ static struct pmaplist *
+ find_service(u_long prog, u_long vers, u_long prot)
+-- 
+1.7.3.1
+
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index e83ff1d..4a5fe62 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -9,8 +9,13 @@ PORTMAP_SOURCE = portmap-$(PORTMAP_VERSION).tgz
 PORTMAP_SITE = http://neil.brown.name/portmap
 PORTMAP_SBINS = portmap pmap_dump pmap_set
 
+PORTMAP_FLAGS = NO_TCP_WRAPPER=1 NO_PIE=1 NO_PERROR=1
+ifeq ($(BR2_USE_MMU),)
+PORTMAP_FLAGS += NO_FORK=1
+endif
+
 define PORTMAP_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" -C $(@D) NO_TCP_WRAPPER=1
+	$(MAKE) CC="$(TARGET_CC)" -C $(@D) $(PORTMAP_FLAGS)
 endef
 
 define PORTMAP_INSTALL_TARGET_CMDS
-- 
1.7.4.rc1
