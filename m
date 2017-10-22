From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Oct 2017 16:17:51 +0200
Subject: [Buildroot] [PATCH 1/2] core-dependencies: remove unneeded HOSTCC
Message-ID: <20171022141752.26105-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dependencies.sh uses HOSTCC_NOCCACHE directly, and this variable is
exported from the top-level Makefile, so there is no need to pass
HOSTCC to it. HOSTCC is not used at all in dependencies.sh.

Thus, we also no longer need to apply the HOSTCC override for
core-dependencies. The core-depencies rule doesn't use HOSTCC or
HOSTCXX.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/dependencies/dependencies.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index ef2ae9b7e1..80ba48a6a7 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -19,12 +19,11 @@ DEPENDENCIES_HOST_PREREQ += host-ccache
 endif
 
 core-dependencies:
-	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
-		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
+	@MAKE="$(MAKE)" DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
 		$(TOPDIR)/support/dependencies/dependencies.sh
 
-core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCC=$(HOSTCC_NOCCACHE)
-core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCXX=$(HOSTCXX_NOCCACHE)
+$(DEPENDENCIES_HOST_PREREQ): HOSTCC=$(HOSTCC_NOCCACHE)
+$(DEPENDENCIES_HOST_PREREQ): HOSTCXX=$(HOSTCXX_NOCCACHE)
 dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
 
 ################################################################################
-- 
2.15.0.rc1
