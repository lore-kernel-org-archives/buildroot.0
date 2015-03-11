From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2015 23:30:16 +0100
Subject: [Buildroot] [PATCH 1/7] package infra: print the name of the
	package being parsed
In-Reply-To: <cover.1426112628.git.yann.morin.1998@free.fr>
References: <cover.1426112628.git.yann.morin.1998@free.fr>
Message-ID: <81a97adbcd73d9ddc9a232d59f8751996148889b.1426112628.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, our start-up time is far from being null. This is because we
have 1500 packages that may each define or amend north of 60 variables
(either directly in their .mk, as well as through the package macros).

This is very harsh on make, which handles variables in hash tables.

So, our startup time can be up to a few seconds, and there is not much
we can do about that.

What's even not very encouraging, is that there is no feedback to the
user that we are actually doing something.

Just print a message for each package we scan, so the user is aware
something is going on.

From a clean, out-of-tree directory, prepare with:
    make $(pwd)/build/buildroot-config/{,m}conf

to have the configurators not impact the measurements. Then run in
sequence:

                                before      after
make help                        0.201       0.202
make defconfig                   0.260       0.263
make help                        2.976       0.984
make oldconfig                   0.260       0.271

(rough average of ~4 runs each)

For the first 'make help', there's no .config, and hence we do not scan
the packages' .mk, and we are 'fast'. For the second 'make help', there
is a .config file, and we scann all packages' .mk file, and we are
'slow'. This patch has no virtually impact on the time it takes to
process the packages' .mk files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile               | 6 ++++++
 package/pkg-generic.mk | 3 +++
 package/pkg-utils.mk   | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/Makefile b/Makefile
index af043a3..e816b26 100644
--- a/Makefile
+++ b/Makefile
@@ -372,6 +372,9 @@ ifneq ($(BR2_DEPRECATED),y)
 include Makefile.legacy
 endif
 
+# Just print one line, as scanning packages rewinds one line back
+$(info .)
+
 include package/Makefile.in
 include support/dependencies/dependencies.mk
 
@@ -397,6 +400,9 @@ include fs/common.mk
 
 include $(BR2_EXTERNAL)/external.mk
 
+# Clear last "Scanning package foo" line
+$(info $(TERM_UP_KILL)Done scanning packages.)
+
 TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c1b379b..ad4831b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -305,6 +305,9 @@ endef
 
 define inner-generic-package
 
+# Inform user something is happening...
+$$(info $(TERM_UP_KILL)Scanning package $(1))
+
 # Define default values for various package-related variables, if not
 # already defined. For some variables (version, source, site and
 # subdir), if they are undefined, we try to see if a variable without
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 7eddc47..bee314b 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -81,6 +81,9 @@ MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$
 TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
+# Cursor one line up, start of line, erase line
+TERM_UP_KILL := $(shell printf "\033[1A\r\033[K")
+
 # Utility functions for 'find'
 # findfileclauses(filelist) => -name 'X' -o -name 'Y'
 findfileclauses = $(call notfirstword,$(patsubst %,-o -name '%',$(1)))
-- 
1.9.1
