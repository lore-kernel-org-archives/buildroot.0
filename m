From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Dec 2012 11:29:37 -0800
Subject: [Buildroot] [git commit] make legal-info: fails with OVERRIDE_SRCDIR
Message-ID: <20121205193134.D57C4996BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f77121fdde5a0c16d9b6968c71e982d3e953d25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is a check for OVERRIDE_SRCDIR in pkg-generic.mk that is
supposed to produce a warning when OVERRIDE_SRCDIR is active.
This does not work and instead the whole make terminates with
an error message.

This patch changes the check for active OVERRIDE_SRCDIR so that
it works as expected.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6fcd359..fc05dc6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -477,7 +477,7 @@ ifneq ($(call qstrip,$$($(2)_SOURCE)),)
 ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
 	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
-else ifeq ($$($(2)_SITE_METHOD),override)
+else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),override)
 else
 # Other packages
