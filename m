From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Jun 2012 23:14:56 +0200
Subject: [Buildroot] [git commit] pkg-utils.mk: add utility functions
	find*clauses and notfirstword
Message-ID: <20120623213308.B42DF828A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75f18de67e7bc7f1feb360eb4201a3c6d6773698
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a few utility functions to pkg-utils.mk.

Functions finddirclauses and findfileclauses help in building a find command
that skips a set of directories and performs operations on a set of files.
This pattern can for example be used to keep certain files or directories from
being stripped, or to remove certain files from a package installation.

The notfirstword function is the inverse of the 'firstword' function in make:
it returns all but the first word.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-utils.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 953dbc9..0c55a9d 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -76,6 +76,15 @@ MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESE
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
