From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2021 21:08:46 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] pkg-generic: host variant
 use git submodules if target variant does
Message-ID: <20210118200733.3BB5881846@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bab3f33e04101d4846cf2b94067993b663b9dd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

When a package has both a target and a host variant, and uses git
submodules, and the host variant is downloaded before the target one, we
end up with the generated archive missing the submodules.

This happens in exactly one package in our tree: c-capnproto.

This issue was not caught before because after a few days, the full
sources are added to sources.buildroot.net. So when the hash check
fails, the full tarball is simply downloaded from there.

Propagate the git submodule setting from the target variant to the host
variant, unless the host variant explicitly opted-out.

Fixes:
    http://autobuild.buildroot.org/results/2de9c6c8ce83569d18cc7140ebc60d6fe1aadcbf/

Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4d03923b6a7776d30ee2a7452640d79442cfa2f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 54de03da03..021658d63d 100644
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
