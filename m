From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Oct 2015 22:33:58 +0200
Subject: [Buildroot] [PATCH 03/21 v2] core: move pkg-utils.mk to support/
In-Reply-To: <cover.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <924ba3caeef2c8236936a4515e2d55316362d046.1445545973.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pkg-utils.mk contains various definitions that are used in the package
infrastructures and packages themselves.

However, those definitions can be useful in other parts of Buildroot,
and are already used in a few places that are not related to the package
infrastructure. Also, $(sep) will be needed early in the Makefile when
we eventually support multiple br2-external trees.

Since this file only contains definitions, we can include it anytime.

So, consider that file to no longer be specific to the package infras:
  - move it to support and rename it,
  - move a few similar definitions from the main Makefile to that file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 Makefile              | 10 ++-----
 package/pkg-utils.mk  | 59 ----------------------------------------
 support/misc/utils.mk | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+), 67 deletions(-)
 create mode 100644 support/misc/utils.mk

diff --git a/Makefile b/Makefile
index da78f18..60cea32 100644
--- a/Makefile
+++ b/Makefile
@@ -111,14 +111,8 @@ else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
 BR_BUILDING = y
 endif
 
-# Strip quotes and then whitespaces
-qstrip = $(strip $(subst ",,$(1)))
-#"))
-
-# Variables for use in Make constructs
-comma := ,
-empty :=
-space := $(empty) $(empty)
+# Include some helper macros and variables
+include support/misc/utils.mk
 
 ifneq ("$(origin O)", "command line")
 O := output
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 44bd2c9..28db481 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -5,43 +5,6 @@
 #
 ################################################################################
 
-# Case conversion macros. This is inspired by the 'up' macro from gmsl
-# (http://gmsl.sf.net). It is optimised very heavily because these macros
-# are used a lot. It is about 5 times faster than forking a shell and tr.
-#
-# The caseconvert-helper creates a definition of the case conversion macro.
-# After expansion by the outer $(eval ), the UPPERCASE macro is defined as:
-# $(strip $(eval __tmp := $(1))  $(eval __tmp := $(subst a,A,$(__tmp))) ... )
-# In other words, every letter is substituted one by one.
-#
-# The caseconvert-helper allows us to create this definition out of the
-# [FROM] and [TO] lists, so we don't need to write down every substition
-# manually. The uses of $ and $$ quoting are chosen in order to do as
-# much expansion as possible up-front.
-#
-# Note that it would be possible to conceive a slightly more optimal
-# implementation that avoids the use of __tmp, but that would be even
-# more unreadable and is not worth the effort.
-
-[FROM] := a b c d e f g h i j k l m n o p q r s t u v w x y z - .
-[TO]   := A B C D E F G H I J K L M N O P Q R S T U V W X Y Z _ _
-
-define caseconvert-helper
-$(1) = $$(strip \
-	$$(eval __tmp := $$(1))\
-	$(foreach c, $(2),\
-		$$(eval __tmp := $$(subst $(word 1,$(subst :, ,$c)),$(word 2,$(subst :, ,$c)),$$(__tmp))))\
-	$$(__tmp))
-endef
-
-$(eval $(call caseconvert-helper,UPPERCASE,$(join $(addsuffix :,$([FROM])),$([TO]))))
-$(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM]))))
-
-# Sanitize macro cleans up generic strings so it can be used as a filename
-# and in rules. Particularly useful for VCS version strings, that can contain
-# slashes, colons (OK in filenames but not in rules), and spaces.
-sanitize = $(subst $(space),_,$(subst :,_,$(subst /,_,$(strip $(1)))))
-
 #
 # Manipulation of .config files based on the Kconfig
 # infrastructure. Used by the BusyBox package, the Linux kernel
@@ -82,28 +45,6 @@ INFLATE.tar  = cat
 # suitable-extractor(filename): returns extractor based on suffix
 suitable-extractor = $(INFLATE$(suffix $(1)))
 
-# MESSAGE Macro -- display a message in bold type
-MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$(1))$(TERM_RESET)"
-TERM_BOLD := $(shell tput smso)
-TERM_RESET := $(shell tput rmso)
-
-# Utility functions for 'find'
-# findfileclauses(filelist) => -name 'X' -o -name 'Y'
-findfileclauses = $(call notfirstword,$(patsubst %,-o -name '%',$(1)))
-# finddirclauses(base, dirlist) => -path 'base/dirX' -o -path 'base/dirY'
-finddirclauses = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
-
-# Miscellaneous utility functions
-# notfirstword(wordlist): returns all but the first word in wordlist
-notfirstword = $(wordlist 2,$(words $(1)),$(1))
-
-# Needed for the foreach loops to loop over the list of hooks, so that
-# each hook call is properly separated by a newline.
-define sep
-
-
-endef
-
 # check-deprecated-variable -- throw an error on deprecated variables
 # example:
 #   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
diff --git a/support/misc/utils.mk b/support/misc/utils.mk
new file mode 100644
index 0000000..7984ea4
--- /dev/null
+++ b/support/misc/utils.mk
@@ -0,0 +1,74 @@
+################################################################################
+#
+# This file contains various utility macros and variables used about
+# everywhere in make constructs.
+#
+################################################################################
+
+# Strip quotes and then whitespaces
+qstrip = $(strip $(subst ",,$(1)))
+#"))
+
+# Variables for use in Make constructs
+comma := ,
+empty :=
+space := $(empty) $(empty)
+
+# Case conversion macros. This is inspired by the 'up' macro from gmsl
+# (http://gmsl.sf.net). It is optimised very heavily because these macros
+# are used a lot. It is about 5 times faster than forking a shell and tr.
+#
+# The caseconvert-helper creates a definition of the case conversion macro.
+# After expansion by the outer $(eval ), the UPPERCASE macro is defined as:
+# $(strip $(eval __tmp := $(1))  $(eval __tmp := $(subst a,A,$(__tmp))) ... )
+# In other words, every letter is substituted one by one.
+#
+# The caseconvert-helper allows us to create this definition out of the
+# [FROM] and [TO] lists, so we don't need to write down every substition
+# manually. The uses of $ and $$ quoting are chosen in order to do as
+# much expansion as possible up-front.
+#
+# Note that it would be possible to conceive a slightly more optimal
+# implementation that avoids the use of __tmp, but that would be even
+# more unreadable and is not worth the effort.
+
+[FROM] := a b c d e f g h i j k l m n o p q r s t u v w x y z - .
+[TO]   := A B C D E F G H I J K L M N O P Q R S T U V W X Y Z _ _
+
+define caseconvert-helper
+$(1) = $$(strip \
+	$$(eval __tmp := $$(1))\
+	$(foreach c, $(2),\
+		$$(eval __tmp := $$(subst $(word 1,$(subst :, ,$c)),$(word 2,$(subst :, ,$c)),$$(__tmp))))\
+	$$(__tmp))
+endef
+
+$(eval $(call caseconvert-helper,UPPERCASE,$(join $(addsuffix :,$([FROM])),$([TO]))))
+$(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM]))))
+
+# Sanitize macro cleans up generic strings so it can be used as a filename
+# and in rules. Particularly useful for VCS version strings, that can contain
+# slashes, colons (OK in filenames but not in rules), and spaces.
+sanitize = $(subst $(space),_,$(subst :,_,$(subst /,_,$(strip $(1)))))
+
+# MESSAGE Macro -- display a message in bold type
+MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$(1))$(TERM_RESET)"
+TERM_BOLD := $(shell tput smso)
+TERM_RESET := $(shell tput rmso)
+
+# Utility functions for 'find'
+# findfileclauses(filelist) => -name 'X' -o -name 'Y'
+findfileclauses = $(call notfirstword,$(patsubst %,-o -name '%',$(1)))
+# finddirclauses(base, dirlist) => -path 'base/dirX' -o -path 'base/dirY'
+finddirclauses = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
+
+# Miscellaneous utility functions
+# notfirstword(wordlist): returns all but the first word in wordlist
+notfirstword = $(wordlist 2,$(words $(1)),$(1))
+
+# Needed for the foreach loops to loop over the list of hooks, so that
+# each hook call is properly separated by a newline.
+define sep
+
+
+endef
-- 
1.9.1
