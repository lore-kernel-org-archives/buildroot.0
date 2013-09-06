From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Sep 2013 20:04:15 -0500
Subject: [Buildroot] [PATCH 01/10] sysvinit: add support for SELinux
In-Reply-To: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1378429464-12546-2-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 .../sysvinit-0002-selinux_flag_addition_fix.patch  |   15 +++++++++++++++
 package/sysvinit/sysvinit.mk                       |    6 ++++++
 2 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/sysvinit/sysvinit-0002-selinux_flag_addition_fix.patch

diff --git a/package/sysvinit/sysvinit-0002-selinux_flag_addition_fix.patch b/package/sysvinit/sysvinit-0002-selinux_flag_addition_fix.patch
new file mode 100644
index 0000000..978f59b
--- /dev/null
+++ b/package/sysvinit/sysvinit-0002-selinux_flag_addition_fix.patch
@@ -0,0 +1,15 @@
+--- a/src/Makefile	2013-08-30 16:12:41.272916677 -0500
++++ b/src/Makefile	2013-08-30 16:12:29.082986810 -0500
+@@ -114,10 +114,10 @@
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
index bf05d73..65cbf17 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -14,6 +14,12 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 SYSVINIT_DEPENDENCIES = busybox
 endif
 
+# Add SELinux support to sysvinit
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+SYSVINIT_DEPENDENCIES += libselinux
+TARGET_CONFIGURE_OPTS += WITH_SELINUX="yes" ROOT="$(TARGET_DIR)"
+endif
+
 define SYSVINIT_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
 		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
-- 
1.7.1
