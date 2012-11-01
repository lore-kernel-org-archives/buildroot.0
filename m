From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu,  1 Nov 2012 01:17:45 +0100
Subject: [Buildroot] [PATCH 1/1] Create a symbolic link to the target kernel
	directory.
Message-ID: <1351729065-31324-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This symbolic link makes it easier when building kernel modules.
The makefile for a module no longer has to point to the full directory name of the kernel but can use this symbolic link instead.
You no longer need to edit the path to the kernel tree in the module's makefiles when changing your target kernel version.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 Makefile       | 1 +
 linux/linux.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 0128839..8356aeb 100644
--- a/Makefile
+++ b/Makefile
@@ -668,6 +668,7 @@ ifeq ($(O),output)
 	rm -rf $(O)
 endif
 	rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
+	rm -f targetkernel 
 
 cross: $(BASE_TARGETS)
 
diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..4541081 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -219,6 +219,8 @@ define LINUX_BUILD_CMDS
 	fi
 	$(LINUX_BUILD_DTB)
 	$(LINUX_APPEND_DTB)
+	rm -f targetkernel
+	ln -s $(LINUX_DIR) targetkernel
 endef
 
 
-- 
1.8.0
