From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 12:34:32 +0200
Subject: [Buildroot] [PATCH 12/16 v3] core: handle .br-external in a make
	rule
In-Reply-To: <cover.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <0994022779466155b22c6e815e737d21c447a528.1468750623.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we treat the case where we have no br2-external tree
(BR2_EXTERNAL is empty) differently from the case where we do have
one (BR2_EXTERNAL is not empty).

There is now no reason to treat those two cases differently:

  - the kconfig snippet is always generated appropriately (i.e. it would
    include the br2-external tree if set, or include nothing otherwise);

  - we no longer have a dummy br-external tree either.

As such, generate the .br-external cache file in both cases.

This will make it much easier to handle when we introduce support for
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
index 72b55cb..67334e5 100644
--- a/Makefile
+++ b/Makefile
@@ -146,23 +146,17 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 # On subsequent invocations of make, it is read in. It can still be overridden
 # on the command line, therefore the file is re-created every time make is run.
 #
-# When BR2_EXTERNAL is set to an empty value (e.g. explicitly in command
-# line), the .br-external file is removed.
-#
 # If the br2-external tree defines its ID, then export the path in the
 # BR2_EXTERNAL_$(ID) variable.
 
 BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
 -include $(BR2_EXTERNAL_FILE)
-ifeq ($(BR2_EXTERNAL),)
-  $(shell rm -f $(BR2_EXTERNAL_FILE))
-else
+ifneq ($(BR2_EXTERNAL),)
   _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
   ifeq ($(_BR2_EXTERNAL),)
     $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relative to $(TOPDIR))
   endif
   override BR2_EXTERNAL := $(_BR2_EXTERNAL)
-  $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
   ifneq ($(wildcard $(BR2_EXTERNAL)/external.id),)
     BR2_EXTERNAL_ID := $(shell cat $(BR2_EXTERNAL)/external.id 2>/dev/null)
     ifeq ($(BR2_EXTERNAL_ID),)
@@ -173,6 +167,11 @@ else
   BR2_EXTERNAL_MK = $(BR2_EXTERNAL)/external.mk
 endif
 
+# This needs to be *after* we compute BR_EXTERNAL, above.
+.PHONY: $(BR2_EXTERNAL_FILE)
+$(BR2_EXTERNAL_FILE):
+	@echo BR2_EXTERNAL ?= $(BR_EXTERNAL) >$@
+
 # To make sure that the environment variable overrides the .config option,
 # set this before including .config.
 ifneq ($(BR2_DL_DIR),)
-- 
2.7.4
