From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  8 Feb 2013 22:56:51 +0100
Subject: [Buildroot] [PATCH 5/6] package/genpart: new host-only package
In-Reply-To: <cover.1360360503.git.yann.morin.1998@free.fr>
References: <cover.1360360503.git.yann.morin.1998@free.fr>
Message-ID: <4e7c28809eba3391ae525d451a9671ab7e7ecffc.1360360503.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in.host                        |    1 +
 package/genpart/Config.in.host                |    8 ++++++++
 package/genpart/genpart-fix-return-code.patch |   25 +++++++++++++++++++++++++
 package/genpart/genpart.mk                    |   11 +++++++++++
 4 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 package/genpart/Config.in.host
 create mode 100644 package/genpart/genpart-fix-return-code.patch
 create mode 100644 package/genpart/genpart.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index c456d5d..e97f6e8 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -4,6 +4,7 @@ source "package/dfu-util/Config.in.host"
 source "package/dosfstools/Config.in.host"
 source "package/e2fsprogs/Config.in.host"
 source "package/genimage/Config.in.host"
+source "package/genpart/Config.in.host"
 source "package/lpc3250loader/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
diff --git a/package/genpart/Config.in.host b/package/genpart/Config.in.host
new file mode 100644
index 0000000..f986504
--- /dev/null
+++ b/package/genpart/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_GENPART
+	bool "host genpart"
+	help
+	  Generate a 16 byte partition table entry defined by command line
+	  arguments and dump it to stdout. No CHS magic is done, only lba
+	  entries are filled out.
+	  
+	  http://www.pengutronix.de/software/genpart/index_en.html
diff --git a/package/genpart/genpart-fix-return-code.patch b/package/genpart/genpart-fix-return-code.patch
new file mode 100644
index 0000000..14ff165
--- /dev/null
+++ b/package/genpart/genpart-fix-return-code.patch
@@ -0,0 +1,25 @@
+genpart: return 0 if partition writen OK, with no do_magic
+
+If do_magic is false, we don't won't write the 0xaa55 magic.
+However, if we succesfully wrote the partition entry, we still
+want to return 0 to indicate success.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Robert Schwebel <r.schwebel@pengutronix.de>
+
+--
+Patch sent upstream, but no mailing list.
+Status: pending...
+
+diff -durN host-genpart-1.0.2.orig/src/genpart.c host-genpart-1.0.2/src/genpart.c
+--- host-genpart-1.0.2.orig/src/genpart.c	2009-12-20 21:54:56.000000000 +0100
++++ host-genpart-1.0.2/src/genpart.c	2013-01-22 23:13:24.109752579 +0100
+@@ -92,6 +92,8 @@
+ 		if (do_magic) {
+ 			if (fwrite(&magic, 2, 1, stdout) > 0)
+ 				rc=0;
++		} else {
++			rc=0;
+ 		}
+ 	}
+ 	return rc;
diff --git a/package/genpart/genpart.mk b/package/genpart/genpart.mk
new file mode 100644
index 0000000..735333a
--- /dev/null
+++ b/package/genpart/genpart.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# genpart
+#
+#############################################################
+
+GENPART_VERSION       = 1.0.2
+GENPART_SOURCE        = genpart-$(GENPART_VERSION).tar.bz2
+GENPART_SITE          = http://www.pengutronix.de/software/genpart/download/
+
+$(eval $(host-autotools-package))
-- 
1.7.2.5
