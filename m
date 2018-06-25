From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 24 Jun 2018 22:41:01 -0300
Subject: [Buildroot] [PATCH 1/1] pkg-generic: fix no-check-hash for inferred
 site method
Message-ID: <20180625014101.13177-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when the site method is explicitly set to a SCM other than
git, the main download is correctly excluded from being hash-checked.
But when the site method is inferred from the site uri, the download
from a SCM other than git is wrongly being hash-checked.

Fix this by moving the code that excludes SCM methods from hash-check
below the code that infers the site method.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
All packages in the tree that use those site methods currently
explicitly set the site method.
$ make -s printvars VARS=%_SITE_METHOD | grep '=\(bzr\|cvs\|hg\|svn\)'
CANFESTIVAL_SITE_METHOD=hg
DVB_APPS_SITE_METHOD=hg
FIS_SITE_METHOD=svn
OPEN2300_SITE_METHOD=svn
OPENTYRIAN_SITE_METHOD=hg
PYTHON_NFC_SITE_METHOD=bzr
PYTHON_PYGAME_SITE_METHOD=hg
---
 package/pkg-generic.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 501dd3de39..91b61c6de0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -489,10 +489,6 @@ ifndef $(2)_PATCH
  endif
 endif
 
-ifneq ($$(filter bzr cvs hg svn,$$($(2)_SITE_METHOD)),)
-BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
-endif
-
 $(2)_ALL_DOWNLOADS = \
 	$$(if $$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE)) \
 	$$(foreach p,$$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
@@ -514,6 +510,10 @@ ifndef $(2)_SITE_METHOD
  endif
 endif
 
+ifneq ($$(filter bzr cvs hg svn,$$($(2)_SITE_METHOD)),)
+BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
+endif
+
 # Do not accept to download git submodule if not using the git method
 ifneq ($$($(2)_GIT_SUBMODULES),)
  ifneq ($$($(2)_SITE_METHOD),git)
-- 
2.17.1
