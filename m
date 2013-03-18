From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 23:08:22 +0100
Subject: [Buildroot] [git commit] package/genpart: new host-only package
Message-ID: <20130318221420.6A0AF9B169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dfa976593e6e8cc0b6b2549c758ca084b768f5d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in.host                        |    1 +
 package/genpart/Config.in.host                |    8 ++++++++
 package/genpart/genpart-fix-return-code.patch |   25 +++++++++++++++++++++++++
 package/genpart/genpart.mk                    |   18 ++++++++++++++++++
 4 files changed, 52 insertions(+), 0 deletions(-)

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
