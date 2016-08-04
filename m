From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 18:19:18 +0200
Subject: [Buildroot] [git commit] Revert "dtc: install libfdt library and
	headers for host variant"
Message-ID: <20160804162111.DC1B382139@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a69fa777940be73d5224cb2b8c702bef5ba8074
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 5ca9b7cf66941a66cff736aadaf8a31afe55f964. Installing
dtc headers in $(HOST_DIR) causes some build failures of
host-uboot-tools due to a conflicting libfdt.h header.

The possible solution to solve this problem, based on -isystem, has been
reverted has it was causing too many issues that we didn't want to solve
so close to cutting 2016.08-rc1.

Since the headers of libfdt for the host are currently not needed for
any package in the Buildroot tree, it is easier and safer to just revert
this patch.

Fixes:

  http://autobuild.buildroot.net/results/9fba77f4080bf6bc26e341f3f383cdba26c0e14f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dtc/dtc.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index febd592..8fdcdbe 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -51,9 +51,7 @@ define HOST_DTC_BUILD_CMDS
 endef
 
 define HOST_DTC_INSTALL_CMDS
-	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin install-lib \
-		install-includes
-
+	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin
 endef
 
 $(eval $(generic-package))
