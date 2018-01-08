From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 23:37:54 +0100
Subject: [Buildroot] [git commit] core-dependencies: remove unneeded HOSTCC
Message-ID: <20180108223809.DDDC48004B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42decc07ce3efe5ec4b5d70016daca3e712451ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dependencies.sh uses HOSTCC_NOCCACHE directly, and this variable is
exported from the top-level Makefile, so there is no need to pass
HOSTCC to it. HOSTCC is not used at all in dependencies.sh.

Thus, we also no longer need to apply the HOSTCC override for
core-dependencies. The core-depencies rule doesn't use HOSTCC or
HOSTCXX.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index ef2ae9b..80ba48a 100644
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
