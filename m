From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Dec 2014 21:54:14 -0600
Subject: [Buildroot] [PATCH 22/30] sysvinit: added libselinux dependency
In-Reply-To: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1418702062-61039-23-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 .../sysvinit-0010-fix-WITH-SELINUX-define.patch    | 24 ++++++++++++++++++++++
 package/sysvinit/sysvinit.mk                       | 11 +++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 package/sysvinit/sysvinit-0010-fix-WITH-SELINUX-define.patch

diff --git a/package/sysvinit/sysvinit-0010-fix-WITH-SELINUX-define.patch b/package/sysvinit/sysvinit-0010-fix-WITH-SELINUX-define.patch
new file mode 100644
index 0000000..4d9c10a
--- /dev/null
+++ b/package/sysvinit/sysvinit-0010-fix-WITH-SELINUX-define.patch
@@ -0,0 +1,24 @@
+--- a/src/Makefile	2010-04-11 04:30:27.000000000 -0500
++++ b/src/Makefile	2014-09-16 14:07:31.404952266 -0500
+@@ -104,7 +104,7 @@
+ 
+ runlevel:	runlevel.o
+ 
+-sulogin:	LDLIBS += $(SULOGINLIBS) $(STATIC)
++sulogin:	LDLIBS += $(SULOGINLIBS) $(INITLIBS) $(STATIC)
+ sulogin:	sulogin.o
+ 
+ wall:		dowall.o wall.o
+@@ -114,10 +115,10 @@
+ bootlogd:	LDLIBS += -lutil
+ bootlogd:	bootlogd.o
+ 
+-sulogin.o:	CPPFLAGS += $(SELINUX_DEF)
++sulogin.o:	CFLAGS += $(SELINUX_DEF)
+ sulogin.o:	sulogin.c 
+ 
+-init.o:		CPPFLAGS += $(SELINUX_DEF)
++init.o:		CFLAGS += $(SELINUX_DEF)
+ init.o:		init.c init.h set.h reboot.h initreq.h
+ 
+ utmp.o:		utmp.c init.h
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 53640a4..253ea9b 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -13,7 +13,16 @@ SYSVINIT_LICENSE_FILES = COPYING
 
 # Override BusyBox implementations if BusyBox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-SYSVINIT_DEPENDENCIES = busybox
+SYSVINIT_DEPENDENCIES += busybox
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+SYSVINIT_DEPENDENCIES += libselinux
+TARGET_CONFIGURE_OPTS += WITH_SELINUX="yes" ROOT="$(TARGET_DIR)"
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+TARGET_CONFIGURE_OPTS += WITH_SELINUX="yes" ROOT="$(TARGET_DIR)"
 endif
 
 define SYSVINIT_DEBIAN_PATCHES
-- 
1.9.1
