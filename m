From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jun 2021 21:54:54 +0200
Subject: [Buildroot] [git commit] core/pkg-generic: fix instrumentation for
 packages that install nowhere
Message-ID: <20210616192751.122938B384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee5e14ff17fda761784feda2f887b6fbde5355e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A (target [0]) package can independently declare installing in various
locations: target, staging, or images. The default is to only install
in target.

When a package opts out from installing to target, but does not opts
in to install in any other location, the package is not downloaded,
extracted, patched, configured, nor built at all. As a consequence, none
of the per-step instrumentation is executed, specifically the listing
of files before/after the package sequence.

Down the line, the package infra does not cope well with that situation,
because the gathering-install step, the one that synchronises all the
optional target, staging, or images install steps, still gets run.

And as #13836 shows, this does not go well:

    /bin/sh: /home/tbuild/myboard/build/foo/.files-list.after: No such file or directory
    make[1]: *** [/home/tbuild/myboard/build/foo/.stamp_installed] Error 1
    make: *** [_all] Error 2

So, we should have ensured that the gathering-install step itself
depends on the build step, which would have solved the issue.

However, this bug really illustrates a more fundamental issue: does it
even make sense to have a package that installs nothing in any location?
Indeed, why even bother with that package to begin with if it will not
provide anything at all?

It turns out that yes, this makes sense. We have some packages, that
do not install anything at all, and do not even build anything; they are
there just to ensure that we can download something that will ultimately
be used by another package. This is the case for example for packages
that provide linux extensions, like aufs [1].

Additionally, some ugly out-of-tree packages could conceivably install
things during the build (or even configure!) steps. That's not unheard
of... [2]

So, the solution is to ensure that the gathering-install step does
depend on the build step, to trigger the proper dependency chain and
have the instrumentation hooks properly run even in that degenerate
case.

Fixes: #13836

[0] a host package can't opt out of installing anything.
[1] that one is actually missing AUFS_INSTALL_TARGET = NO, so this
    hides the issue.
[2] even us are not 100% clean on that topic: gcc will install files in
    staging and target as part of the same step (not the build, granted,
    but still...)

Reported-by: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Matthew Weber <matthew.weber at collins.com
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9fbc63d19e..45589bcbb4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -826,6 +826,7 @@ endif
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
 $(1)-install:		$$($(2)_TARGET_INSTALL)
+$$($(2)_TARGET_INSTALL): $$($(2)_TARGET_BUILD)
 
 ifeq ($$($(2)_TYPE),host)
 $$($(2)_TARGET_INSTALL): $$($(2)_TARGET_INSTALL_HOST)
