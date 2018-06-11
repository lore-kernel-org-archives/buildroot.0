From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 23:08:58 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] pkg-generic: error out
 with 'local' site method and no _SITE
Message-ID: <20180611211537.760BB8832D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=619a722394a78baebb8c706b769ccfadd9c52a7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The 'local' site method is easily confused with the 'file' site method,
making people create packages like this:

    FOO_SITE_METHOD = local
    FOO_SOURCE = foo.tar.gz

    $(eval $(generic-package))

Due to the intricacies of the generic package infra, this does not
cause an error; instead, the foo.tar.gz tarball that happens to be
present in the download directory will be used. This behaviour differs
greatly from what is specified in the manual.

Instead, error out immediately if a package specifies the 'local' site
method but does not specify a _SITE.

We check for _OVERRIDE_SRCDIR rather than checking for _SITE, just
after _OVERRIDE_SRCDIR has been set to _SITE. Indeed, a package that
sets _OVERRIDE_SRCDIR but not _SITE currently works correctly. There is
no reason to make it fail.

See also
https://stackoverflow.com/questions/50364655/including-patches-to-build-root

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 775929c988db0197363a3c6f693fc3928bdb43de)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d635516734..a689dde4d2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -510,6 +510,9 @@ ifeq ($$($(2)_SITE_METHOD),local)
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_OVERRIDE_SRCDIR = $$($(2)_SITE)
 endif
+ifeq ($$($(2)_OVERRIDE_SRCDIR),)
+$$(error $(1) has local site method, but `$(2)_SITE` is not defined)
+endif
 endif
 
 ifndef $(2)_LICENSE
