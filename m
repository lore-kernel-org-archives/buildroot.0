From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jun 2012 11:09:21 +0200
Subject: [Buildroot] [git commit] introduce PARALLEL_JOBS build system
	variable
Message-ID: <20120624095658.0B09988E1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a72aed3a7434ed35599674a8405b1baee0f3df75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_JLEVEL currently is expanded directly in $(MAKE), and used in
invocations of other build software (e.g. ct-ng).  However, we are
going to allow "0" to be a meaningful value for BR2_JLEVEL, which
won't work for these uses.  Given that it is not permissible to modify
BR2_-prefixed variables in Makefiles, we need an intermediate
variable.

Define PARALLEL_JOBS to $(BR2_JLEVEL), and use the former in MAKE's
definition.  Uses of BR2_JLEVEL throughout the rest of the tree to be
adjusted similarly in follow-up patches.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 57599c5..be83ada 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -6,8 +6,10 @@ HOSTMAKE=$(MAKE)
 endif
 HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 
+PARALLEL_JOBS:=$(BR2_JLEVEL)
+
 MAKE1:=$(HOSTMAKE) -j1
-MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
+MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
 
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
