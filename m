From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 23:47:49 +0200
Subject: [Buildroot] [git commit] wf111: fix overwriting module files during
	install
Message-ID: <20160425220245.7D828819A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eee68714a85b159050caecc2628fa349c4d9489e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When installing the WF111 modules, the module.* files generated during
the kernel compilation were overridden. This ended up having the wrong
information about the modules compiled in a given image (and only the
one about the WF111 module). This could be verified using the
"modprobe -l" command, with only the wf111 module showing up.

This patch fixes this by invoking the install_static target (which
will do both the build and installation) in WF111_INSTALL_TARGET_CMDS.
This way the files are not overridden but instead updated with the
additional WF111 informations.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
Tested-by: Antoine Tenart <antoine.tenart@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wf111/wf111.mk | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
index 479d665..28b1815 100644
--- a/package/wf111/wf111.mk
+++ b/package/wf111/wf111.mk
@@ -21,14 +21,13 @@ else ifeq ($(BR2_i386),y)
 WF111_SOURCE = wf111-linux-driver_5.2.2-r1_x86.tar.gz
 endif
 
-define WF111_BUILD_CMDS
+# Due to the stupidity of the package Makefile, we can't invoke
+# separately the build step and the install step and get a correct
+# behavior. So we do everything in the install step.
+define WF111_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PWD=$(@D) \
 		$(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) \
-		install_static
-endef
-
-define WF111_INSTALL_TARGET_CMDS
-	cp -dpfr $(@D)/output/* $(TARGET_DIR)
+		OUTPUT=$(TARGET_DIR) install_static
 endef
 
 $(eval $(generic-package))
