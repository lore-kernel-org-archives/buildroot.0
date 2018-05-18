From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 18 May 2018 12:45:24 +0200
Subject: [Buildroot] [PATCH] pkg-generic: error out with 'local' site method
 and no _SITE
Message-ID: <20180518104524.4630-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

See also
https://stackoverflow.com/questions/50364655/including-patches-to-build-root

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-generic.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8a3b5f90a9..988f2d34e3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -520,6 +520,9 @@ ifeq ($$($(2)_SITE_METHOD),local)
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_OVERRIDE_SRCDIR = $$($(2)_SITE)
 endif
+ifeq ($$($(2)_OVERRIDE_SRCDIR),)
+$$(error $(1) has local site method, but `$(2)_SITE_METHOD` is not defined)
+endif
 endif
 
 ifndef $(2)_LICENSE
-- 
2.17.0
