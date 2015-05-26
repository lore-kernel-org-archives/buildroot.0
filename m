From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:11 +0200
Subject: [Buildroot] [PATCH 16/21 RFC] core: handle .br-external in a make
	rule
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <f13985ab52b30c9a73281866b931f4eafb10fb5f.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we treat the case where we have no br2-external tree
(BR2_EXTERNAL is empty) differently from the case we do have one
(BR2_EXTERNAL is not empty).

There is now no reason to treat those two cases differently:

  - the kconfig snippet is always generated appropriately (i.e. it would
    include the br2-external tree if set, or include nothing otherwise);

  -  BR2_EXTERNAL (and its internal variant BR_EXTERNAL) is no longer
     useable by user;

  - we no longer have a dummy br-external tree either.

As such, generate the .br-external cache file in both cases.

This will make it much easy to handle when we introduce support for
multiple br2-external trees.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 1042192..b3f515b 100644
--- a/Makefile
+++ b/Makefile
@@ -141,21 +141,15 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 # On subsequent invocations of make, it is read in. It can still be overridden
 # on the command line, therefore the file is re-created every time make is run.
 #
-# When BR2_EXTERNAL is set to an empty value (e.g. explicitly in command
-# line), the .br-external file is removed.
-#
 # Ensure the BR2_EXTERNAL tree defines its ID, and set its top-level path.
 
 BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
 -include $(BR2_EXTERNAL_FILE)
-ifeq ($(BR2_EXTERNAL),)
-  $(shell rm -f $(BR2_EXTERNAL_FILE))
-else
+ifneq ($(BR2_EXTERNAL),)
   BR_EXTERNAL := $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
   ifeq ($(BR_EXTERNAL),)
     $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relative to $(TOPDIR))
   endif
-  $(shell echo BR2_EXTERNAL ?= $(BR_EXTERNAL) > $(BR2_EXTERNAL_FILE))
   ifeq ($(wildcard $(BR_EXTERNAL)/external.id),)
   $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' has no ID file 'external.id')
   endif
@@ -167,6 +161,11 @@ else
   BR_EXTERNAL_MK = $(BR2_EXTERNAL_$(BR_EXTERNAL_ID))/external.mk
 endif
 
+# This needs to be *after* we compute BR_EXTERNAL, above.
+.PHONY: $(BR2_EXTERNAL_FILE)
+$(BR2_EXTERNAL_FILE):
+	@echo BR2_EXTERNAL ?= $(BR_EXTERNAL) >$@
+
 # Don't let users use that variable, they must use the ID-suffixed variant
 override BR2_EXTERNAL :=
 
-- 
1.9.1
