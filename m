From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Jan 2021 23:10:14 +0100
Subject: [Buildroot] [PATCH] pkg-generic: host variant use git submodules if
 target variant does
Message-ID: <20210113221014.687702-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a package has both a target and a host variant, and uses git
submodules, and the host variant is downloaded before the targt one, we
end up with the generated archive missing the submodules.

This happens in exactly one package in our tree: c-capnproto.

Weirdly enough, the issue was not caught until after we changed the way
we generate tar archives from git downloads.

Propagate the git submodule setting from the target variant to the host
variant, unless the host variant explicitly opted-out.

Fixes:
    http://autobuild.buildroot.org/results/2de9c6c8ce83569d18cc7140ebc60d6fe1aadcbf/

Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c46c742352..357a4ce453 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -567,6 +567,12 @@ ifneq ($$(filter bzr cvs hg,$$($(2)_SITE_METHOD)),)
 BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
 endif
 
+ifndef $(2)_GIT_SUBMODULES
+ ifdef $(3)_GIT_SUBMODULES
+  $(2)_GIT_SUBMODULES = $$($(3)_GIT_SUBMODULES)
+ endif
+endif
+
 # Do not accept to download git submodule if not using the git method
 ifneq ($$($(2)_GIT_SUBMODULES),)
  ifneq ($$($(2)_SITE_METHOD),git)
-- 
2.25.1
