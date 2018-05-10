From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 May 2018 18:43:37 +0200
Subject: [Buildroot] [PATCH] docs/manual: using a branch name as FPP_VERSION
 does not work
Message-ID: <20180510164337.14578-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For various reasons, we've always suggested users to avoid using a
branch as version string for their packages, because it does not work
as a they would expect:

  - it is not reproducible, because the branch may change between two
    builds that are done at different times;

  - it does not even follow the branch, as Buildroot anyway generates
    a local tarball.

Yet, until recently, using a branch name would just work (with the
above limitations): the git tree was cloned, the branch checked out,
and the tarball created.

But with the advent of the git caching, using a branch name does not
work anymore. Indeed, we now do a git-fetch, and that does not create
local branches. So we can't check out a branch, because it does not
exist locally.

Update the manual to state that using a branch does not work. Remove
the 'stable' example, as it looked like the name of a stable branch;
instead, replace it with a version string that ressemble a tag.

Fix the layout of the manual by making the version examples an actual
bulleted list.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 7e1f246752..8ea8ce6037 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -199,12 +199,12 @@ information is (assuming the package name is +libfoo+) :
 * +LIBFOO_VERSION+, mandatory, must contain the version of the
   package. Note that if +HOST_LIBFOO_VERSION+ doesn't exist, it is
   assumed to be the same as +LIBFOO_VERSION+. It can also be a
-  revision number, branch or tag for packages that are fetched
-  directly from their revision control system. +
-  Examples: +
-    +LIBFOO_VERSION = 0.1.2+ +
-    +LIBFOO_VERSION = cb9d6aa9429e838f0e54faa3d455bcbab5eef057+ +
-    +LIBFOO_VERSION = stable+
+  revision number or a tag for packages that are fetched directly
+  from their revision control system. Do not use a branch name as
+  version; it does not work. Examples:
+  ** a version for a release tarball: +LIBFOO_VERSION = 0.1.2+
+  ** a sha1 for a git tree: +LIBFOO_VERSION = cb9d6aa9429e838f0e54faa3d455bcbab5eef057+
+  ** a tag for a git tree +LIBFOO_VERSION = v0.1.2+
 
 * +LIBFOO_SOURCE+ may contain the name of the tarball of the package,
   which Buildroot will use to download the tarball from
-- 
2.14.1
