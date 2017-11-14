From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Nov 2017 13:55:39 +0100
Subject: [Buildroot] [git commit] Revert "pkg-download: remove explicit
 PKG_VERSION from github helper"
Message-ID: <20171114124920.0641F80FE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2114c29e910652abcbaeee0f2f698060b346d82a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 1e5a8916b2ab4c9c99548fa6fbd4855eee323881.

The idea was that the version string can be derived because we know the
package name.

However, this patch does not account for the fact that $(pkgname) always
points to the latest pacakge scanned, which in all other situation we're
using it, is the current package, because it is used inside one ot he
xxx-inner macros that are $(eval)ualed. So $(pkgname) is evaluated
"early" and gets the expected value.

However, the github value is not in one of those macros, so it gets
evaluated "late", when doing the actual download. So, by that time,
$(pkgname) will expand to the last package scanned, which is actuall the
manual (without a br2-external tree).

That would require that the _SITE variable be assigned with the :=
assignment operator. This is weird, because that would make it the only
variable to require that, but only when using the github helper, which
is even less obvious and would cause a lot of trouble...

The obvious fixup would seem to be to use $(PKG) instead, because that
already contains the upper-case package name that vcan be used as a
prefix to variables.

However, that does not work either, because we have a check that forbids
a trsailing slash in _SITE, check that is done in pacakge/pkg-generic,
inside the xxx-inner macro, during the $(eval) call.

And at that time, PKG is not yet defined, because it is only defined for
an actual recipe.

So we can't seem to have a workable solution. So, just revert the patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-tips.txt | 5 +----
 package/pkg-download.mk              | 4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 824f075..19577fa 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -138,7 +138,7 @@ past, the 'github' helper function should be used as shown below.
 ------------------------
 # Use a tag or a full commit ID
 FOO_VERSION = v1.0
-FOO_SITE = $(call github,<user>,<package>[,<version>])
+FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
 ------------------------
 
 .Notes
@@ -147,9 +147,6 @@ FOO_SITE = $(call github,<user>,<package>[,<version>])
   Buildroot (e.g.: +foo-f6fb6654af62045239caed5950bc6c7971965e60.tar.gz+),
   so it is not necessary to specify it in the +.mk+ file.
 - When using a commit ID as version, you should use the full 40 hex characters.
-- The +version+ parameter is optional and should only be specified if anything
-  other than FOO_VERSION needs to be used, e.g. when this function is used to
-  specify a custom Linux or U-Boot tarball.
 
 If the package you wish to add does have a release section on GitHub, the
 maintainer may have uploaded a release tarball, or the release may just point
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index dc4ff1c..fbbc2d7 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -52,8 +52,8 @@ notdomain = $(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$
 # default domainseparator is /, specify alternative value as first argument
 domainseparator = $(if $(1),$(1),/)
 
-# github(user,package[,version]): returns site of GitHub repository
-github = https://github.com/$(1)/$(2)/archive/$(or $(3),$($(call UPPERCASE,$(pkgname))_VERSION))
+# github(user,package,version): returns site of GitHub repository
+github = https://github.com/$(1)/$(2)/archive/$(3)
 
 # Expressly do not check hashes for those files
 # Exported variables default to immediately expanded in some versions of
