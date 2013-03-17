From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2013 19:19:44 +0100
Subject: [Buildroot] [PATCH 5/6] package/genpart: new host-only package
In-Reply-To: <cover.1363544331.git.yann.morin.1998@free.fr>
References: <cover.1363544331.git.yann.morin.1998@free.fr>
Message-ID: <df62482b9becf843f11526c5c8117ff6a4043d56.1363544331.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - add due note about potential licensing issue (Thomas)
---
 package/Config.in.host                        |    1 +
 package/genpart/Config.in.host                |    8 ++++++++
 package/genpart/genpart-fix-return-code.patch |   25 +++++++++++++++++++++++++
 package/genpart/genpart.mk                    |   18 ++++++++++++++++++
 4 files changed, 52 insertions(+), 0 deletions(-)
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
index 0000000..ec18c82
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
+Status: accepted upstream, not yet released.
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
index 0000000..7757ae4
--- /dev/null
+++ b/package/genpart/genpart.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# genpart
+#
+#############################################################
+
+GENPART_VERSION       = 1.0.2
+GENPART_SOURCE        = genpart-$(GENPART_VERSION).tar.bz2
+GENPART_SITE          = http://www.pengutronix.de/software/genpart/download/
+# genpart has no license embedded in its source release.
+# However, their project page mentions:
+#   > This community portal offers an overview about our own OSS
+#   > projects and projects Pengutronix is or was involved with.
+# We can thus assume genpart is under a FLOSS license.
+# So, until the authors have clarified the licensing terms:
+GENPART_LICENSE       = Unknown (clarification has been asked to the authors)
+
+$(eval $(host-autotools-package))
-- 
1.7.2.5
