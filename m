From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 11 Jun 2012 21:09:37 -0500
Subject: [Buildroot] [PATCH 1/7] introduce PARALLEL_JOBS build system
	variable
In-Reply-To: <1339466983-19786-1-git-send-email-ntl@pobox.com>
References: <1339466983-19786-1-git-send-email-ntl@pobox.com>
Message-ID: <1339466983-19786-2-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/Makefile.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index df7042c..9177a1b 100644
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
 
 # Compute GNU_TARGET_NAME and REAL_GNU_TARGET_NAME
 GNU_TARGET_NAME=$(ARCH)-linux
-- 
1.7.6.5
