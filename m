From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 23 Nov 2011 14:59:20 +0100
Subject: [Buildroot] [PATCH 1 of 2 v3] Makefile.package.in: add utility
 functions find*clauses and notfirstword
In-Reply-To: <patchbomb.1322054943@devws108>
References: <patchbomb.1322054943@devws108>
Message-ID: <eb97ed352368a5b29048.1322054944@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a few utility functions to Makefile.package.in.

Functions finddirclauses and findfileclauses help in building a find command
that skips a set of directories and performs operations on a set of files.
This pattern can for example be used to keep certain files or directories from
being stripped, or to remove certain files from a package installation.

The notfirstword function is the inverse of the 'firstword' function in make:
it returns all but the first word.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
v3: use -path instead of -wholename; fix a bug in finddirclauses. Thanks, Cam.
v2: integrate _cont variants in main find*clauses functions. Thanks, Arnout.

 package/Makefile.package.in |  11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -87,6 +87,17 @@ MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)
 TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
+# Utility functions for 'find'
+# findfileclauses: creates "-name 'X' -o -name 'Y'"
+# [1:namelist]
+findfileclauses=-name '$(firstword $(1))' $(patsubst %,-o -name '%',$(call notfirstword,$(1)))
+# finddirclauses: creates "-path 'basedir/dirX' -o -path 'basedir/dirY'"
+# [1:basedir, 2:namelist]
+finddirclauses=-path '$(1)/$(firstword $(2))' $(patsubst %,-o -path '$(1)/%',$(call notfirstword,$(2)))
+
+# Miscellaneous utility functions
+notfirstword=$(wordlist 2,$(words $(1)),$(1))
+
 # Download method commands
 WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
 SVN:=$(call qstrip,$(BR2_SVN))
