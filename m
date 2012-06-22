From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 22 Jun 2012 07:34:49 +0200
Subject: [Buildroot] [PATCH 1 of 2 v5-resend2] pkg-utils.mk: add utility
 functions find*clauses and notfirstword
In-Reply-To: <patchbomb.1340343288@beantl019720>
References: <patchbomb.1340343288@beantl019720>
Message-ID: <670be08197799a0a4f1d.1340343289@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a few utility functions to pkg-utils.mk.

Functions finddirclauses and findfileclauses help in building a find command
that skips a set of directories and performs operations on a set of files.
This pattern can for example be used to keep certain files or directories from
being stripped, or to remove certain files from a package installation.

The notfirstword function is the inverse of the 'firstword' function in make:
it returns all but the first word.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
v5: Take split of Makefile.package.in into account.
v4: simplify find*clauses even further. Thanks, Arnout!
v3: use -path instead of -wholename; fix a bug in finddirclauses. Thanks, Cam.
v2: integrate _cont variants in main find*clauses functions. Thanks, Arnout.

 package/pkg-utils.mk |  9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -76,6 +76,15 @@ MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)
 TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
+# Utility functions for 'find'
+# findfileclauses(filelist) => -name 'X' -o -name 'Y'
+findfileclauses = $(call notfirstword,$(patsubst %,-o -name '%',$(1)))
+# finddirclauses(base, dirlist) => -path 'base/dirX' -o -path 'base/dirY'
+finddirclauses = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
+
+# Miscellaneous utility functions
+# notfirstword(wordlist): returns all but the first word in wordlist
+notfirstword = $(wordlist 2,$(words $(1)),$(1))
 
 # Needed for the foreach loops to loop over the list of hooks, so that
 # each hook call is properly separated by a newline.
