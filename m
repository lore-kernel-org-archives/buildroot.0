From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 May 2012 16:39:21 +0200
Subject: [Buildroot] [PATCH 1/2] localedef: new package
In-Reply-To: <cover.1336487951.git.thomas.petazzoni@free-electrons.com>
References: <cover.1336487951.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4b1a9726147fec34cbca4237331e43a542f86524.1336487951.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This host only package allows to build the localedef program, which is
needed to generate locale data for (e)glibc-based systems. The source
code has been extracted from the eglibc sources and put inside a small
and nice tarball by the PTXdist developers, which makes it easy and
convenient to build for the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/localedef/localedef.mk |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/localedef/localedef.mk

diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
new file mode 100644
index 0000000..71b9994
--- /dev/null
+++ b/package/localedef/localedef.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# localedef
+#
+#############################################################
+
+LOCALEDEF_VERSION = 2.14.1-r17443-ptx1
+LOCALEDEF_SOURCE  = localedef-eglibc-$(LOCALEDEF_VERSION).tar.bz2
+LOCALEDEF_SITE    = http://www.pengutronix.de/software/ptxdist/temporary-src/
+
+HOST_LOCALEDEF_CONF_OPT += \
+	--prefix=/usr \
+	--with-glibc=./eglibc
+
+# The makefile does not implement an install target
+define HOST_LOCALEDEF_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/localedef $(HOST_DIR)/usr/bin/localedef
+endef
+
+$(eval $(call AUTOTARGETS,host))
\ No newline at end of file
-- 
1.7.9.5
