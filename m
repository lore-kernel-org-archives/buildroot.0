From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Oct 2017 09:33:04 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] dependencies: always use
	HOSTCC_NOCACHE for DEPENDENCIES_HOST_PREREQ
Message-ID: <20171025073526.EF634811FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37a757038e864032e203d24f632a7951e18889a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Currently, HOSTCC and HOSTCXX are set to their _NOCACHE variants in the
'dependencies' target. This is needed because at that time, ccache is
not built yet - host-ccache is one of the dependencies. However, because
this override is only specified for the 'dependencies' target (and
thereby gets inherited by its dependencies), the override is only
applied when the package is reached through the 'dependencies' target.
This is not the case when one of DEPENDENCIES_HOST_PREREQ is built
directly from the command line, e.g. when doing 'make host-ccache'. So
in that case, ccache will be built with ccache... which fails of
course.

To fix this, directly apply the override to the DEPENCIES_HOST_PREREQ
targets.

Note that this only fixes the issue for 'make host-ccache', NOT for
e.g. 'make host-ccache-configure'.

Signed-off-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
[Arnout: improve commit message]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(cherry picked from commit 36d398ac30f35ca9d4405a9dee2b33560ec3595d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index d4b0409..ef2ae9b 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -23,8 +23,8 @@ core-dependencies:
 		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
 		$(TOPDIR)/support/dependencies/dependencies.sh
 
-dependencies: HOSTCC=$(HOSTCC_NOCCACHE)
-dependencies: HOSTCXX=$(HOSTCXX_NOCCACHE)
+core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCC=$(HOSTCC_NOCCACHE)
+core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCXX=$(HOSTCXX_NOCCACHE)
 dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
 
 ################################################################################
