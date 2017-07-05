From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 16:54:18 +0200
Subject: [Buildroot] [PATCH] toolchain/helpers.mk: fix creation of DESTDIR
	in copy_toolchain_lib_root
Message-ID: <20170705145418.25101-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit b3cc7e65ee, the definition of the DESTDIR variable was moved
down into the loop that follows symlinks in the libraries that are
copied to target. However, the corresponding mkdir was not moved down,
so that no directories are ever created.

In practice, this mkdir is normally redundant since the directories
should already have been created as part of creating STAGING_DIR.
Still, the current situation is clearly wrong, so fix it by moving the
mkdir down to after the assignment to DESTDIR.

While we're at it, also remove a redundant empty line. It's a leftover
from when a lot of variables were declared above.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/helpers.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 6136aef6b9..9942ce404f 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -10,13 +10,12 @@
 #
 copy_toolchain_lib_root = \
 	LIBPATTERN="$(strip $1)"; \
-\
 	LIBPATHS=`find $(STAGING_DIR)/ -name "$${LIBPATTERN}" 2>/dev/null` ; \
 	for LIBPATH in $${LIBPATHS} ; do \
-		mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
 		while true ; do \
 			LIBNAME=`basename $${LIBPATH}`; \
 			DESTDIR=`echo $${LIBPATH} | sed "s,^$(STAGING_DIR)/,," | xargs dirname` ; \
+			mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
 			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 			if test -h $${LIBPATH} ; then \
 				cp -d $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
-- 
2.13.2
