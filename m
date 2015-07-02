From: Karoly Kasza <kaszak@gmail.com>
Date: Thu,  2 Jul 2015 13:18:47 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: bump to version 9.10.2
Message-ID: <1435835927-54824-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
Change: Somehow the configure script lost it's execution permission.
Needed to add a hook for chmod to be able to execute it.

 package/openvmtools/openvmtools.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 57271c8..87d504c 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVMTOOLS_VERSION = stable-9.10.0
+OPENVMTOOLS_VERSION = stable-9.10.2
 OPENVMTOOLS_SITE = $(call github,vmware,open-vm-tools,$(OPENVMTOOLS_VERSION))
 OPENVMTOOLS_SUBDIR = open-vm-tools
 OPENVMTOOLS_LICENSE = LGPLv2.1
@@ -45,6 +45,13 @@ else
 OPENVMTOOLS_CONF_OPTS += --without-pam
 endif
 
+# configure needs execution permission
+define OPENVMTOOLS_PRE_CONFIGURE_CHMOD
+	chmod 0755 $(@D)/$(OPENVMTOOLS_SUBDIR)/configure
+endef
+
+OPENVMTOOLS_PRE_CONFIGURE_HOOKS += OPENVMTOOLS_PRE_CONFIGURE_CHMOD
+
 # symlink needed by lib/system/systemLinux.c (or will cry in /var/log/messages)
 # defined in lib/misc/hostinfoPosix.c
 # /sbin/shutdown needed for Guest OS restart/shutdown from hypervisor
-- 
2.1.4
