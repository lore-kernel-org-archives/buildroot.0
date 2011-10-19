From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 19 Oct 2011 09:34:04 +0200
Subject: [Buildroot] [PATCH 1 of 5] Makefile.package.in: add utility
 functions find*clauses and notfirstword
In-Reply-To: <patchbomb.1318602115@devws108>
References: <patchbomb.1318602115@devws108>
Message-ID: <31ae7a6eaff4e2cf9a1e.1318602116@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a few utility functions to Makefile.package.in.

Functions finddirclauses, finddirclauses_cont, findfileclauses and
findfileclauses_cont help in building a find command that skips a set of
directories and performs operations on a set of files.
This pattern can for example be used to keep certain files or directories from
being stripped, or to remove certain files from a package installation.

The notfirstword function is the inverse of the make 'firstword' function: it
returns all but the first word.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/Makefile.package.in |  17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -87,6 +87,23 @@ MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)
 TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
+# Utility functions for 'find'
+# findfileclauses_cont: creates "-o -name 'X' -o -name 'Y'"
+# [1:namelist, 2:prefix]
+findfileclauses_cont=$(patsubst %,$(2) -name '%',$(1))
+# findfileclauses: creates "-name 'X' -o -name 'Y'"
+# [1:namelist]
+findfileclauses=$(call findfileclauses_cont,$(firstword $(1))) $(call findfileclauses_cont,$(call notfirstword,$(1)),-o)
+# finddirclauses_cont: creates "-o -wholename 'basedir/dirX' -o -wholename 'basedir/dirY'"
+# [1:basedir, 2:namelist, 3:prefix]
+finddirclauses_cont=$(patsubst %,$(3) -wholename '$(1)/%',$(2))
+# finddirclauses: creates "-wholename 'basedir/dirX' -o -wholename 'basedir/dirY'"
+# [1:basedir, 2:namelist]
+finddirclauses=$(call finddirclauses_cont,$(1),$(firstword $(2))) $(call finddirclauses_cont,$(1),$(call notfirstword,$(2)),-o)
+
+# Miscellaneous utility functions
+notfirstword=$(wordlist 2,$(words $(1)),$(1))
+
 # Download method commands
 WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
 SVN:=$(call qstrip,$(BR2_SVN))
