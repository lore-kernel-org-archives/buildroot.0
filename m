From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Jan 2011 11:29:45 +0100
Subject: [Buildroot] [PATCH 4/7] portmap: add nommu support
In-Reply-To: <1294669725-5379-4-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Mon, 10 Jan 2011 09:28:42 -0500")
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-4-git-send-email-vapier@gentoo.org>
Message-ID: <87lj2r3f8m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 Mike> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Mike> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
 Mike> ---
 Mike>  ...0-0001-README-fix-typo-in-tcp-wrapper-doc.patch |   26 +++++
 Mike>  ...0002-NO_PIE-make-PIE-support-controllable.patch |   53 ++++++++++
 Mike>  ...K-control-usage-of-fork-for-nommu-systems.patch |  110 ++++++++++++++++++++
 Mike>  ...ERROR-control-overriding-of-perror-symbol.patch |   46 ++++++++
 Mike>  package/portmap/portmap.mk                         |    7 +-
 Mike>  5 files changed, 241 insertions(+), 1 deletions(-)
 Mike>  create mode 100644 package/portmap/portmap-6.0-0001-README-fix-typo-in-tcp-wrapper-doc.patch
 Mike>  create mode 100644 package/portmap/portmap-6.0-0002-NO_PIE-make-PIE-support-controllable.patch
 Mike>  create mode 100644 package/portmap/portmap-6.0-0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
 Mike>  create mode 100644 package/portmap/portmap-6.0-0004-NO_PERROR-control-overriding-of-perror-symbol.patch

What's the upstream status of these patches?


 Mike> +++ b/package/portmap/portmap-6.0-0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
 Mike> @@ -0,0 +1,110 @@
 Mike> +From b3afea5757af1a7356ba30d2e0a7d5909ca18121 Mon Sep 17 00:00:00 2001
 Mike> +From: Mike Frysinger <vapier@gentoo.org>
 Mike> +Date: Fri, 19 Nov 2010 23:48:20 -0500
 Mike> +Subject: [PATCH 3/4] NO_FORK: control usage of fork() for nommu systems
 Mike> +
 Mike> +nommu systems lack a fork() function, so add a NO_FORK flag to control
 Mike> +its usage.  We don't lose a ton of functionality in doing so, and on an
 Mike> +embedded system, this is OK.
 Mike> +
 Mike> +Signed-off-by: Mike Frysinger <vapier@gentoo.org>
 Mike> +---
 Mike> + Makefile     |    5 +++++
 Mike> + README       |    1 +
 Mike> + pmap_check.c |    6 ++++--
 Mike> + portmap.c    |    6 ++++++
 Mike> + 4 files changed, 16 insertions(+), 2 deletions(-)
 Mike> +
 Mike> +diff --git a/Makefile b/Makefile
 Mike> +index cfcfdbb..9df5574 100644
 Mike> +--- a/Makefile
 Mike> ++++ b/Makefile
 Mike> +@@ -27,6 +27,11 @@ MAN_SED += -e 's/USE_DNS/yes/'
 Mike> + endif
 Mike> + endif
 Mike> + 
 Mike> ++# For no-mmu systems, we have to disable the fork() functions.
 Mike> ++ifneq ($(NO_FORK),)
 Mike> ++CPPFLAGS += -DNO_FORK
 Mike> ++endif
 Mike> ++
 Mike> + # Comment out if your RPC library does not allocate privileged ports for
 Mike> + # requests from processes with root privilege, or the new portmap will
 Mike> + # always reject requests to register/unregister services on privileged
 Mike> +diff --git a/README b/README
 Mike> +index e0b561a..bda1707 100644
 Mike> +--- a/README
 Mike> ++++ b/README
 Mike> +@@ -18,6 +18,7 @@ There is no "./configure", just use "make".
 Mike> + 
 Mike> + Some make variable can be used to control compilation.
 Mike> + 
 Mike> ++ NO_FORK=	  if non-empty, don't use fork (good for nommu systems)
 Mike> +  NO_PIE=	  if non-empty, don't build portmap as a PIE
 Mike> +  NO_TCP_WRAPPER=  if non-empty, don't use tcp_wrappers
 Mike> +  USE_DNS=	  if set, tcp_wrappers can check peers based on hostname
 Mike> +diff --git a/pmap_check.c b/pmap_check.c
 Mike> +index 6b3e490..983414e 100644
 Mike> +--- a/pmap_check.c
 Mike> ++++ b/pmap_check.c
 Mike> +@@ -302,8 +302,10 @@ static void logit(int severity, struct sockaddr_in *addr,
 Mike> +      * getrpcbynumber() or syslog() does its thing.
 Mike> +      */
 Mike> + 
 Mike> +-    if (fork() == 0) {
 Mike> +-
 Mike> ++#ifndef NO_FORK
 Mike> ++    if (fork() == 0)
 Mike> ++#endif
 Mike> ++    {
 Mike> + 	/* Try to map program number to name. */
 Mike> + 
 Mike> + 	if (prognum == 0) {
 Mike> +diff --git a/portmap.c b/portmap.c
 Mike> +index 2a98881..94abc64 100644
 Mike> +--- a/portmap.c
 Mike> ++++ b/portmap.c
 Mike> +@@ -391,12 +391,14 @@ main(int argc, char **argv)
 Mike> + 	abort();
 Mike> + }
 Mike> + 
 Mike> ++#ifndef NO_PERROR
 Mike> + /* need to override perror calls in rpc library */
 Mike> + void perror(const char *what)

What is this NO_PERROR thing? That belongs in the next patch rather than
here, right?

 Mike> +++ b/package/portmap/portmap-6.0-0004-NO_PERROR-control-overriding-of-perror-symbol.patch
 Mike> @@ -0,0 +1,46 @@
 Mike> +From 8cea0778f0fb838a7bd764be08f15e1494e5a0b2 Mon Sep 17 00:00:00 2001
 Mike> +From: Mike Frysinger <vapier@gentoo.org>
 Mike> +Date: Fri, 19 Nov 2010 23:50:27 -0500
 Mike> +Subject: [PATCH 4/4] NO_PERROR: control overriding of perror() symbol
 Mike> +
 Mike> +Doing static builds of portmap might fail when the C library's perror()
 Mike> +function is pulled in and collides with portmap's definition.  So add a
 Mike> +flag to control the local override.

Why not simply rename it like the recent issue with getline -> get_line
in kconfig?

 Mike> diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
 Mike> index e83ff1d..4a5fe62 100644
 Mike> --- a/package/portmap/portmap.mk
 Mike> +++ b/package/portmap/portmap.mk
 Mike> @@ -9,8 +9,13 @@ PORTMAP_SOURCE = portmap-$(PORTMAP_VERSION).tgz
 Mike>  PORTMAP_SITE = http://neil.brown.name/portmap
 Mike>  PORTMAP_SBINS = portmap pmap_dump pmap_set
 
 Mike> +PORTMAP_FLAGS = NO_TCP_WRAPPER=1 NO_PIE=1 NO_PERROR=1

Why enforce no PIE?

 Mike> +ifeq ($(BR2_USE_MMU),)
 Mike> +PORTMAP_FLAGS += NO_FORK=1

Out of interest, what functionaly in portmapper do you miss with
NO_FORK?

-- 
Bye, Peter Korsgaard
