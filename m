From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 18:10:46 +0200
Subject: [Buildroot] [git commit] toolchain/helpers.mk: fix creation of
	DESTDIR in copy_toolchain_lib_root
Message-ID: <20170705160800.22AB881805@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9971e936be6eb2ee5f531953bc35259d016dc60f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 6136aef..9942ce4 100644
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
