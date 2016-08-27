From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 16:03:35 +0200
Subject: [Buildroot] [git commit branch/next] core: move pkg-utils.mk to
	support/
Message-ID: <20160827141122.492EF7FA81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=242e0087e544325cc11bd37f1125aa8b2516d8a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                      |  10 +--
 package/pkg-utils.mk                          |  96 -----------------------
 package/pkg-utils.mk => support/misc/utils.mk | 106 ++++----------------------
 3 files changed, 16 insertions(+), 196 deletions(-)

diff --git a/Makefile b/Makefile
index 6a1c9e1..9275c4d 100644
--- a/Makefile
+++ b/Makefile
@@ -106,14 +106,8 @@ else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
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
index c61b3b6..28db481 100644
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
@@ -82,65 +45,6 @@ INFLATE.tar  = cat
 # suitable-extractor(filename): returns extractor based on suffix
 suitable-extractor = $(INFLATE$(suffix $(1)))
 
-# MESSAGE Macro -- display a message in bold type
-MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$(1))$(TERM_RESET)"
-TERM_BOLD := $(shell tput smso 2>/dev/null)
-TERM_RESET := $(shell tput rmso 2>/dev/null)
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
-PERCENT = %
-QUOTE = '
-# ' # Meh... syntax-highlighting
-
-# This macro properly escapes a command string, then prints it with printf:
-#
-#   - first, backslash '\' are self-escaped, so that they do not escape
-#     the following char and so that printf properly outputs a backslash;
-#
-#   - next, single quotes are escaped by closing an existing one, adding
-#     an escaped one, and re-openning a new one (see below for the reason);
-#
-#   - then '%' signs are self-escaped so that the printf does not interpret
-#     them as a format specifier, in case the variable contains an actual
-#     printf with a format;
-#
-#   - finally, $(sep) is replaced with the literal '\n' so that make does
-#     not break on the so-expanded variable, but so that the printf does
-#     correctly output an LF.
-#
-# Note: this must be escaped in this order to avoid over-escaping the
-# previously escaped elements.
-#
-# Once everything has been escaped, it is passed between single quotes
-# (that's why the single-quotes are escaped they way they are, above,
-# and why the dollar sign is not escaped) to printf(1). A trailing
-# newline is apended, too.
-#
-# Note: leading or trailing spaces are *not* stripped.
-#
-define PRINTF
-	printf '$(subst $(sep),\n,\
-			$(subst $(PERCENT),$(PERCENT)$(PERCENT),\
-				$(subst $(QUOTE),$(QUOTE)\$(QUOTE)$(QUOTE),\
-					$(subst \,\\,$(1)))))\n'
-endef
-
 # check-deprecated-variable -- throw an error on deprecated variables
 # example:
 #   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
diff --git a/package/pkg-utils.mk b/support/misc/utils.mk
similarity index 57%
copy from package/pkg-utils.mk
copy to support/misc/utils.mk
index c61b3b6..990a3d1 100644
--- a/package/pkg-utils.mk
+++ b/support/misc/utils.mk
@@ -1,10 +1,19 @@
 ################################################################################
 #
-# This file contains various utility functions used by the package
-# infrastructure, or by the packages themselves.
+# This file contains various utility macros and variables used about
+# everywhere in make constructs.
 #
 ################################################################################
 
+# Strip quotes and then whitespaces
+qstrip = $(strip $(subst ",,$(1)))
+#"))
+
+# Variables for use in Make constructs
+comma := ,
+empty :=
+space := $(empty) $(empty)
+
 # Case conversion macros. This is inspired by the 'up' macro from gmsl
 # (http://gmsl.sf.net). It is optimised very heavily because these macros
 # are used a lot. It is about 5 times faster than forking a shell and tr.
@@ -42,46 +51,6 @@ $(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM
 # slashes, colons (OK in filenames but not in rules), and spaces.
 sanitize = $(subst $(space),_,$(subst :,_,$(subst /,_,$(strip $(1)))))
 
-#
-# Manipulation of .config files based on the Kconfig
-# infrastructure. Used by the BusyBox package, the Linux kernel
-# package, and more.
-#
-
-define KCONFIG_ENABLE_OPT # (option, file)
-	$(SED) "/\\<$(1)\\>/d" $(2)
-	echo '$(1)=y' >> $(2)
-endef
-
-define KCONFIG_SET_OPT # (option, value, file)
-	$(SED) "/\\<$(1)\\>/d" $(3)
-	echo '$(1)=$(2)' >> $(3)
-endef
-
-define KCONFIG_DISABLE_OPT # (option, file)
-	$(SED) "/\\<$(1)\\>/d" $(2)
-	echo '# $(1) is not set' >> $(2)
-endef
-
-# Helper functions to determine the name of a package and its
-# directory from its makefile directory, using the $(MAKEFILE_LIST)
-# variable provided by make. This is used by the *-package macros to
-# automagically find where the package is located.
-pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
-pkgname = $(lastword $(subst /, ,$(pkgdir)))
-
-# Define extractors for different archive suffixes
-INFLATE.bz2  = $(BZCAT)
-INFLATE.gz   = $(ZCAT)
-INFLATE.lzma = $(XZCAT)
-INFLATE.tbz  = $(BZCAT)
-INFLATE.tbz2 = $(BZCAT)
-INFLATE.tgz  = $(ZCAT)
-INFLATE.xz   = $(XZCAT)
-INFLATE.tar  = cat
-# suitable-extractor(filename): returns extractor based on suffix
-suitable-extractor = $(INFLATE$(suffix $(1)))
-
 # MESSAGE Macro -- display a message in bold type
 MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$(1))$(TERM_RESET)"
 TERM_BOLD := $(shell tput smso 2>/dev/null)
@@ -136,54 +105,7 @@ QUOTE = '
 #
 define PRINTF
 	printf '$(subst $(sep),\n,\
-			$(subst $(PERCENT),$(PERCENT)$(PERCENT),\
-				$(subst $(QUOTE),$(QUOTE)\$(QUOTE)$(QUOTE),\
-					$(subst \,\\,$(1)))))\n'
-endef
-
-# check-deprecated-variable -- throw an error on deprecated variables
-# example:
-#   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
-define check-deprecated-variable # (deprecated var, new var)
-ifneq ($$(origin $(1)),undefined)
-$$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
-endif
-endef
-
-#
-# legal-info helper functions
-#
-LEGAL_INFO_SEPARATOR = "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
-
-define legal-warning # text
-	echo "WARNING: $(1)" >>$(LEGAL_WARNINGS)
-endef
-
-define legal-warning-pkg # pkg, text
-	echo "WARNING: $(1): $(2)" >>$(LEGAL_WARNINGS)
-endef
-
-define legal-warning-nosource # pkg, {local|override}
-	$(call legal-warning-pkg,$(1),sources not saved ($(2) packages not handled))
-endef
-
-define legal-manifest # pkg, version, license, license-files, source, url, {HOST|TARGET}
-	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)"' >>$(LEGAL_MANIFEST_CSV_$(7))
-endef
-
-define legal-license-header # pkg, license-file, {HOST|TARGET}
-	printf "$(LEGAL_INFO_SEPARATOR)\n\t$(1):\
-		$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n\n" >>$(LEGAL_LICENSES_TXT_$(3))
-endef
-
-define legal-license-nofiles # pkg, {HOST|TARGET}
-	$(call legal-license-header,$(1),unknown license file(s),$(2))
-endef
-
-define legal-license-file # pkg, filename, file-fullpath, {HOST|TARGET}
-	$(call legal-license-header,$(1),$(2) file,$(4)) && \
-	cat $(3) >>$(LEGAL_LICENSES_TXT_$(4)) && \
-	echo >>$(LEGAL_LICENSES_TXT_$(4)) && \
-	mkdir -p $(LICENSE_FILES_DIR_$(4))/$(1)/$(dir $(2)) && \
-	cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2)
+		$(subst $(PERCENT),$(PERCENT)$(PERCENT),\
+			$(subst $(QUOTE),$(QUOTE)\$(QUOTE)$(QUOTE),\
+				$(subst \,\\,$(1)))))\n'
 endef
