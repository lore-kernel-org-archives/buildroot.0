From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 May 2012 00:25:58 +0200
Subject: [Buildroot] [git commit] localedef: new package
Message-ID: <20120508223206.1C6DB96C7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1db490aae99295c7b74d630b1b2edbf0b5a5516c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This host only package allows to build the localedef program, which is
needed to generate locale data for (e)glibc-based systems. The source
code has been extracted from the eglibc sources and put inside a small
and nice tarball by the PTXdist developers, which makes it easy and
convenient to build for the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/localedef/localedef.mk |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
new file mode 100644
index 0000000..1a044e3
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
