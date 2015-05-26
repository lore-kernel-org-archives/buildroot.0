From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:08 +0200
Subject: [Buildroot] [PATCH 13/21 RFC] core: require br2-external trees
	define a unique ID
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <9f1866417055043c152262f89148bfd4bb369602.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This unique ID is used to construct a BR2_EXTERNAL-specific variable,
BR2_EXTERNAL_$(ID), which contains the path to the br2-external tree.

This variable is available both from Kconfig (set in the Kconfig
snippet) and from the .mk files.

Also display the BR2_EXTERNAL_$(ID) and its path as a comment in the
menuconfig.

This will ultimately allow us to support multiple br2-external trees at
once, with that ID (and thus BR2_EXTERNAL_$(ID)) uniquely defining which
br2-external tree is being used.

Note: since the variables in the Makefile and in Kconfig are named the
same, the one we computed early on (lines 167, second hunk) will be
overridden by the one in .config when we have it. Thus, even though they
are set to the same raw value, the one from .config is quoted and, being
included later in the Makefile, will take precedence, so we must un-quote
it before we include the br2-external's makefile. That's unfortunate, but
there is no easy way around that as we want the two variables to be named
the same in Makefile and Kconfig (and we can't ask the user to un-quote
that variable himself either), hence the little dirty trick on line 425
(third hunk).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c7b719a..37e552d 100644
--- a/Makefile
+++ b/Makefile
@@ -143,6 +143,8 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 #
 # When BR2_EXTERNAL is set to an empty value (e.g. explicitly in command
 # line), the .br-external file is removed.
+#
+# Ensure the BR2_EXTERNAL tree defines its ID, and set its top-level path.
 
 BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
 -include $(BR2_EXTERNAL_FILE)
@@ -155,6 +157,14 @@ else
   endif
   override BR2_EXTERNAL := $(_BR2_EXTERNAL)
   $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
+  ifeq ($(wildcard $(BR2_EXTERNAL)/external.id),)
+  $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' has no ID file 'external.id')
+  endif
+  BR2_EXTERNAL_ID := $(shell cat $(BR2_EXTERNAL)/external.id 2>/dev/null)
+  ifeq ($(BR2_EXTERNAL_ID),)
+  $(error $(BR2_EXTERNAL) has no ID (in file 'external.id'))
+  endif
+  BR2_EXTERNAL_$(BR2_EXTERNAL_ID) = $(BR2_EXTERNAL)
   BR2_EXTERNAL_MK = $(BR2_EXTERNAL)/external.mk
 endif
 
@@ -410,6 +420,9 @@ include linux/linux.mk
 include system/system.mk
 include fs/common.mk
 
+# The BR2_EXTERNAL_$(ID) variable is also present in .config, so it is
+# quoted. We must unquote it before feeding it to the br2-external makefile.
+BR2_EXTERNAL_$(BR2_EXTERNAL_ID) := $(call qstrip,$(BR2_EXTERNAL_$(BR2_EXTERNAL_ID)))
 # Nothing to include if no BR2_EXTERNAL tree in use
 include $(BR2_EXTERNAL_MK)
 
@@ -798,7 +811,10 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
 	$(Q)if [ -n '$(BR2_EXTERNAL)' ]; then \
 		printf "#\n# Automatically generated file; DO NOT EDIT.\n#\n\n"; \
 		printf 'menu "User-provided options"\n\n'; \
-		printf 'source "%s/Config.in"\n\n' $$(cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd); \
+		printf 'comment "BR2_EXTERNAL_%s (%s)"\n\n' $(BR2_EXTERNAL_ID) $(BR2_EXTERNAL_$(BR2_EXTERNAL_ID)); \
+		printf 'config BR2_EXTERNAL_%s\n' $(BR2_EXTERNAL_ID); \
+		printf '\tstring\n\tdefault "%s"\n\n' $(BR2_EXTERNAL_$(BR2_EXTERNAL_ID)); \
+		printf 'source "$$BR2_EXTERNAL_%s/Config.in"\n\n' $(BR2_EXTERNAL_ID); \
 		printf 'endmenu\n'; \
 	fi >$@
 
-- 
1.9.1
