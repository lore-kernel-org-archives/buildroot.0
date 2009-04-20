From: correa at uclibc.org <correa@uclibc.org>
Date: Mon, 20 Apr 2009 22:26:09 +0000 (UTC)
Subject: [Buildroot] svn commit: [26168] trunk/buildroot/package/qtopia4
Message-ID: <20090420222609.A3E8877654@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-04-20 22:26:09 +0000 (Mon, 20 Apr 2009)
New Revision: 26168

Log:
Workaround problem with configure for x86 crosscompile to x86 under linux.

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2009-04-20 22:04:21 UTC (rev 26167)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2009-04-20 22:26:09 UTC (rev 26168)
@@ -16,6 +16,10 @@
 # (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
 # to fix
 
+# BUG: There is a workaround below (search for x86x86fix) for
+# x86 crosscompiling under linux x86. Please remove it when the workaround
+# is no longer necessary.
+
 QTOPIA4_VERSION:=4.5.0
 QTOPIA4_CAT:=$(BZCAT)
 
@@ -322,6 +326,19 @@
 BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)))
 #"))
 
+# x86x86fix
+# Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
+# host. It's unclear if this would happen on other hosts.
+ifneq ($(findstring pc-linux,$(BR2_GNU_BUILD_SUFFIX)),)
+ifeq ($(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM),x86)
+QTOPIA4_CONFIGURE+= -platform linux-g++
+QTOPIA4_CONFIGURE:=$(strip $(subst ",, $(QTOPIA4_CONFIGURE)))
+#"))
+endif
+endif
+# End of workaround.
+
+
 QTOPIA4_QMAKE_CONF:=$(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 
 QTOPIA4_QMAKE_AR:=$(TARGET_AR) cqs
