From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 18:27:53 -0500
Subject: [Buildroot] [PATCH v8 07/16] sysvinit: added libselinux dependency
In-Reply-To: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1436570882-56442-8-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes v7 -> v8:
  - No changes

Changes v6 -> v7:
  - No changes

Changes v5 -> v6:
  - No changes

Changes v4 -> v5:
  - Removed unnecessary += when adding buysbox dependency (Ryan B.)
  - Removed duplicate assignment of OPTS (Matt W.)
  - Added description to patch and signed off line (Clayton S.)

Changes v1 -> v4:
  - Did not exist
---
 ...1-Fix-SELinux-compile-flags-and-libraries.patch | 44 ++++++++++++++++++++++
 package/sysvinit/sysvinit.mk                       |  5 +++
 2 files changed, 49 insertions(+)
 create mode 100644 package/sysvinit/0001-Fix-SELinux-compile-flags-and-libraries.patch

diff --git a/package/sysvinit/0001-Fix-SELinux-compile-flags-and-libraries.patch b/package/sysvinit/0001-Fix-SELinux-compile-flags-and-libraries.patch
new file mode 100644
index 0000000..f857e07
--- /dev/null
+++ b/package/sysvinit/0001-Fix-SELinux-compile-flags-and-libraries.patch
@@ -0,0 +1,44 @@
+From e7dc523c1850534d98ab90dd02e07ee214e21f24 Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+Date: Fri, 1 May 2015 10:58:47 -0500
+Subject: [PATCH] Fix SELinux compile flags and libraries
+
+The SELinux flags, added as CPPFLAGS, end up getting dropped by the
+Makefile. Also ensuring sulogin is linked against libsepol which is
+required.
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+---
+ src/Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index e2b8028..bf1ae81 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -104,7 +104,7 @@ utmpdump:	utmpdump.o
+ 
+ runlevel:	runlevel.o
+ 
+-sulogin:	LDLIBS += $(SULOGINLIBS) $(STATIC)
++sulogin:	LDLIBS += $(SULOGINLIBS) $(INITLIBS) $(STATIC)
+ sulogin:	sulogin.o
+ 
+ wall:		dowall.o wall.o
+@@ -114,10 +114,10 @@ shutdown:	dowall.o shutdown.o utmp.o reboot.h
+ bootlogd:	LDLIBS += -lutil
+ bootlogd:	bootlogd.o
+ 
+-sulogin.o:	CPPFLAGS += $(SELINUX_DEF)
+-sulogin.o:	sulogin.c 
++sulogin.o:	CFLAGS += $(SELINUX_DEF)
++sulogin.o:	sulogin.c
+ 
+-init.o:		CPPFLAGS += $(SELINUX_DEF)
++init.o:		CFLAGS += $(SELINUX_DEF)
+ init.o:		init.c init.h set.h reboot.h initreq.h
+ 
+ utmp.o:		utmp.c init.h
+-- 
+1.9.1
+
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 53640a4..9669a29 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -16,6 +16,11 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 SYSVINIT_DEPENDENCIES = busybox
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+SYSVINIT_DEPENDENCIES += libselinux
+TARGET_CONFIGURE_OPTS += WITH_SELINUX="yes" ROOT="$(TARGET_DIR)"
+endif
+
 define SYSVINIT_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
 		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
-- 
1.9.1
