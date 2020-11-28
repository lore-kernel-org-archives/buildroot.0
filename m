From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Nov 2020 10:51:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: fix build with netsnmp
Message-ID: <20201128095108.1069483-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the following build failure:

/bin/sh: net-snmp-config: command not found
/home/buildroot/autobuild/run/instance-2/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/9.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: osasnmpd.o: in function `main':
osasnmpd.c:(.text.startup+0xcc): undefined reference to `snmp_log_perror'

Moreover, replace perl-net-snmp dependency by netsnmp as osasnmpd is an
SNMP subagent for the net-snmp package:
https://github.com/ibm-s390-tools/s390-tools/blob/master/osasnmpd/osasnmpd.8

Fixes:
 - http://autobuild.buildroot.org/results/00796f2ebd5fb0e08ac7a05a9ee566f2bc4bd1c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...snmpd-Makefile-fix-cross-compilation.patch | 41 +++++++++++++++++++
 package/s390-tools/s390-tools.mk              |  8 ++--
 2 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 package/s390-tools/0002-osasnmpd-Makefile-fix-cross-compilation.patch

diff --git a/package/s390-tools/0002-osasnmpd-Makefile-fix-cross-compilation.patch b/package/s390-tools/0002-osasnmpd-Makefile-fix-cross-compilation.patch
new file mode 100644
index 0000000000..8e3d1399f2
--- /dev/null
+++ b/package/s390-tools/0002-osasnmpd-Makefile-fix-cross-compilation.patch
@@ -0,0 +1,41 @@
+From d7faa31a871d14ab02b290bdf2b2fa085766d2ac Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 27 Nov 2020 23:43:15 +0100
+Subject: [PATCH] osasnmpd/Makefile: fix cross-compilation
+
+Fix the following build failure by allowing the user to provide
+NET_SNMP_CONFIG:
+
+/bin/sh: net-snmp-config: command not found
+/home/buildroot/autobuild/run/instance-2/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/9.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: osasnmpd.o: in function `main':
+osasnmpd.c:(.text.startup+0xcc): undefined reference to `snmp_log_perror'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/00796f2ebd5fb0e08ac7a05a9ee566f2bc4bd1c3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ibm-s390-tools/s390-tools/pull/99]
+---
+ osasnmpd/Makefile | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/osasnmpd/Makefile b/osasnmpd/Makefile
+index 15496b2..8ce0932 100644
+--- a/osasnmpd/Makefile
++++ b/osasnmpd/Makefile
+@@ -1,9 +1,10 @@
+ include ../common.mak
+-LDLIBS = `net-snmp-config --agent-libs`
++NET_SNMP_CONFIG = net-snmp-config
++LDLIBS = `$(NET_SNMP_CONFIG) --agent-libs`
+ # On some Linux systems `net-snmp-config --agent-libs` introduces -pie,
+ # therefore add -fPIC to prevent link failures.
+ ALL_CFLAGS += -fPIC
+-ALL_CFLAGS += `net-snmp-config --cflags`
++ALL_CFLAGS += `$(NET_SNMP_CONFIG) --cflags`
+ 
+ OBJS = ibmOSAMib.o ibmOSAMibUtil.o osasnmpd.o
+ 
+-- 
+2.29.2
+
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 5a3bcffba9..34750bea71 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -72,9 +72,11 @@ else
 S390_TOOLS_MAKE_OPTS += HAVE_FUSE=0
 endif
 
-ifeq ($(BR2_PACKAGE_PERL_NET_SNMP),y)
-S390_TOOLS_DEPENDENCIES += perl-net-snmp
-S390_TOOLS_MAKE_OPTS += HAVE_SNMP=1
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+S390_TOOLS_DEPENDENCIES += netsnmp
+S390_TOOLS_MAKE_OPTS += \
+	NET_SNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config \
+	HAVE_SNMP=1
 else
 S390_TOOLS_MAKE_OPTS += HAVE_SNMP=0
 endif
-- 
2.29.2
