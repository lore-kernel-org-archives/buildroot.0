From: Ormund Williams <ormundw@panix.com>
Date: Wed, 13 Jan 2010 17:55:52 -0500
Subject: [Buildroot] [PATCH] Re-enable workaround for building qt-ebedded on
	x86 for	x86 target, also check for x86_64 target.
Message-ID: <1263423352.12606.28.camel@station1.ormlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ormund Williams <ormundw@panix.com>
---
 package/qt/qt.mk |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 4b6876f..d003908 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -347,6 +347,21 @@ endif
 
 BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,
$(BR2_PACKAGE_QT_EMB_PLATFORM))
 
+# x86x86fix
+# Workaround Qt Embedded bug when crosscompiling for x86 under x86 with
linux
+# host. It's unclear if this would happen on other hosts.
+ifneq ($(findstring pc-linux,$(BR2_GNU_BUILD_SUFFIX)),)
+ifeq ($(BR2_PACKAGE_QT_EMB_PLATFORM),x86)
+QT_CONFIGURE+= -platform linux-g++
+QT_CONFIGURE:=$(call qstrip,$(QT_CONFIGURE))
+endif
+ifeq ($(BR2_PACKAGE_QT_EMB_PLATFORM),x86_64)
+QT_CONFIGURE+= -platform linux-g++
+QT_CONFIGURE:=$(call qstrip,$(QT_CONFIGURE))
+endif
+endif
+# End of workaround.
+
 # Figure out what libs to install in the target
 QT_LIBS=#empty
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
-- 
1.5.6.5


-- 
Ormund Williams
OrmLab LLC
