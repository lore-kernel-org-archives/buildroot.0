From: Stephan Hoffmann <sho@relinux.de>
Date: Mon,  3 Dec 2012 11:05:51 +0100
Subject: [Buildroot] [PATCH] make legal-info: fails with OVERRIDE_SRCDIR
Message-ID: <1354529151-17426-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a check for OVERRIDE_SRCDIR in pkg-generic.mk that is
supposed to produce a warning when OVERRIDE_SRCDIR is active.
This does not work and instead the whole make terminates with
an error message.

This patch changes the check for active OVERRIDE_SRCDIR so that
it works as expected.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9c4fffa..d6bcb67 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -479,7 +479,7 @@ ifneq ($(call qstrip,$$($(2)_SOURCE)),)
 ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
 	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
-else ifeq ($$($(2)_SITE_METHOD),override)
+else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),override)
 else
 # Other packages
-- 
1.7.0.4
