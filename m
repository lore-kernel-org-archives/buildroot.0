From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:32:42 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] pkg-generic: fix
 no-check-hash for inferred site method
Message-ID: <20180719213040.C132B88FB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e922308ceb7d4296578c439d2cf621652ec6f662
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Currently, when the site method is explicitly set to a SCM other than
git, the main download is correctly excluded from being hash-checked.
But when the site method is inferred from the site uri, the download
from a SCM other than git is wrongly being hash-checked.

Fix this by moving the code that excludes SCM methods from hash-check
below the code that infers the site method.

Currently there is no package in the tree that uses inferred site
method, and that is why the autobuilder didn't caught this. We had
packages using inferred site method in the past, the last one was
'expect', but since they didn't have a hash file (for a license or
extra-download for example) the build didn't error out.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b115ecd122d6a9738d89b5e6efc5f7f6df7872e9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9bd2358ef6..7d4eaf9461 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -483,10 +483,6 @@ ifndef $(2)_PATCH
  endif
 endif
 
-ifneq ($$(filter bzr cvs hg svn,$$($(2)_SITE_METHOD)),)
-BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
-endif
-
 $(2)_ALL_DOWNLOADS = \
 	$$(if $$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE)) \
 	$$(foreach p,$$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
@@ -508,6 +504,10 @@ ifndef $(2)_SITE_METHOD
  endif
 endif
 
+ifneq ($$(filter bzr cvs hg svn,$$($(2)_SITE_METHOD)),)
+BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
+endif
+
 # Do not accept to download git submodule if not using the git method
 ifneq ($$($(2)_GIT_SUBMODULES),)
  ifneq ($$($(2)_SITE_METHOD),git)
