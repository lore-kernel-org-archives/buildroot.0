From: Karoly Kasza <kaszak@gmail.com>
Date: Wed, 17 Jun 2015 09:33:36 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: move files up from
	unnecessary subdirectory
Message-ID: <1434526416-62466-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Open-vm-tools package is now distributed from GitHub and a new
subdirectory was introduced, which breaks the Buildroot process.

This patch moves everything up from the new subdirectory after
extraction, making Buildroot once again able to run.

Fixes:

http://autobuild.buildroot.net/results/bfd10c8d454a2686ebb1c4afdb49c55e39a9dd67/

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/openvmtools/openvmtools.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 822bbf1..414a42a 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -44,6 +44,13 @@ else
 OPENVMTOOLS_CONF_OPTS += --without-pam
 endif
 
+# Move everything up from the unnecessary subdirectory
+define OPENVMTOOLS_POST_EXTRACT_MOVE_SUBDIR
+	mv $(@D)/open-vm-tools/* $(@D)
+endef
+
+OPENVMTOOLS_POST_EXTRACT_HOOKS += OPENVMTOOLS_POST_EXTRACT_MOVE_SUBDIR
+
 # symlink needed by lib/system/systemLinux.c (or will cry in /var/log/messages)
 # defined in lib/misc/hostinfoPosix.c
 # /sbin/shutdown needed for Guest OS restart/shutdown from hypervisor
-- 
2.1.4
