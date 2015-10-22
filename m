From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Oct 2015 22:34:09 +0200
Subject: [Buildroot] [PATCH 14/21 v2] core: introduce per br2-external ID
In-Reply-To: <cover.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <34423e8f6ab990edec92d5b6d0694124927d705d.1445545973.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This unique ID is used to construct a per br2-external tree variable,
BR2_EXTERNAL_$(ID), which contains the path to the br2-external tree.

This variable is available both from Kconfig (set in the Kconfig
snippet) and from the .mk files.

Also, display the BR2_EXTERNAL_$(ID) and its path as a comment in the
menuconfig.

This will ultimately allow us to support multiple br2-external trees at
once, with that ID (and thus BR2_EXTERNAL_$(ID)) uniquely defining which
br2-external tree is being used.

Note: since the variables in the Makefile and in Kconfig are named the
same, the one we computed early on (second hunk) will be overridden by
the one in .config when we have it. Thus, even though they are set to
the same raw value, the one from .config is quoted and, being included
later in the Makefile, will take precedence, so we must un-quote it
before we include the br2-external's makefile (third hunk). That's
unfortunate, but there is no easy way around that as we want the two
variables to be named the same in Makefile and Kconfig (and we can't
ask the user to un-quote that variable himself either), hence the
little dirty trick.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 80de431..f5202ba 100644
--- a/Makefile
+++ b/Makefile
@@ -153,6 +153,9 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 #
 # When BR2_EXTERNAL is set to an empty value (e.g. explicitly in command
 # line), the .br-external file is removed.
+#
+# If the br2-external tree defines its ID, then export the path in the
+# BR2_EXTERNAL_$(ID) variable.
 
 BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
 -include $(BR2_EXTERNAL_FILE)
@@ -165,6 +168,13 @@ else
   endif
   override BR2_EXTERNAL := $(_BR2_EXTERNAL)
   $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
+  ifneq ($(wildcard $(BR2_EXTERNAL)/external.id),)
+    BR2_EXTERNAL_ID := $(shell cat $(BR2_EXTERNAL)/external.id 2>/dev/null)
+    ifeq ($(BR2_EXTERNAL_ID),)
+    $(error $(BR2_EXTERNAL) has no ID (in file 'external.id'))
+    endif
+    BR2_EXTERNAL_$(BR2_EXTERNAL_ID) = $(BR2_EXTERNAL)
+  endif
   BR2_EXTERNAL_MK = $(BR2_EXTERNAL)/external.mk
 endif
 
@@ -424,6 +434,10 @@ include boot/common.mk
 include linux/linux.mk
 include fs/common.mk
 
+# If the br2-external tree defines its ID, then the BR2_EXTERNAL_$(ID)
+# variable is also present in .config, so it is quoted. We must unquote
+# it before feeding it to the br2-external makefile.
+BR2_EXTERNAL_$(BR2_EXTERNAL_ID) := $(call qstrip,$(BR2_EXTERNAL_$(BR2_EXTERNAL_ID)))
 # Nothing to include if no BR2_EXTERNAL tree in use
 include $(BR2_EXTERNAL_MK)
 
@@ -823,7 +837,13 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
 	$(Q)if [ -n '$(BR2_EXTERNAL)' ]; then \
 		printf "#\n# Automatically generated file; DO NOT EDIT.\n#\n\n"; \
 		printf 'menu "User-provided options"\n\n'; \
-		printf 'source "%s/Config.in"\n\n' $$(cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd); \
+		if [ -z "$(BR2_EXTERNAL_ID)" ]; then \
+			printf 'source "%s/Config.in"\n\n' $$(cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd); \
+		else \
+			printf 'config BR2_EXTERNAL_%s\n' $(BR2_EXTERNAL_ID); \
+			printf '\tstring\n\tdefault "%s"\n\n' $(BR2_EXTERNAL_$(BR2_EXTERNAL_ID)); \
+			printf 'source "$$BR2_EXTERNAL_%s/Config.in"\n\n' $(BR2_EXTERNAL_ID); \
+		fi; \
 		printf 'endmenu # User-provided options\n'; \
 	fi >$@
 
-- 
1.9.1
