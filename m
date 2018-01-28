From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 28 Jan 2018 02:43:58 -0200
Subject: [Buildroot] [PATCH] lshw: use data files provided by hwdata
Message-ID: <20180128044358.6696-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lshw is seldomly released, so its data files become easily outdated.
Fortunately it looks for the files in several directories, so let it
find the files at /usr/share/hwdata, since the hwdata collection is
released on a monthly basis.

The manuf.txt and oui.txt files are not used at run time, so it's not
necessary to install them.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 ...4-For-Buildroot-do-not-install-data-files.patch | 34 ++++++++++++++++++++++
 package/lshw/Config.in                             |  3 ++
 2 files changed, 37 insertions(+)
 create mode 100644 package/lshw/0004-For-Buildroot-do-not-install-data-files.patch

diff --git a/package/lshw/0004-For-Buildroot-do-not-install-data-files.patch b/package/lshw/0004-For-Buildroot-do-not-install-data-files.patch
new file mode 100644
index 0000000000..10abe1e097
--- /dev/null
+++ b/package/lshw/0004-For-Buildroot-do-not-install-data-files.patch
@@ -0,0 +1,34 @@
+From 68fb28c82238d4d894d56c5b97449e310086bd9e Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Sun, 28 Jan 2018 01:40:27 -0200
+Subject: [PATCH] For Buildroot: do not install data files
+
+lshw is seldomly released, so its data files become easily outdated.
+Fortunately it looks for the files in several directories, so let it
+find the files at /usr/share/hwdata, since the hwdata collection is
+released on a monthly basis.
+
+The manuf.txt and oui.txt files are not used at run time, so it's not
+necessary to install them.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ src/Makefile | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index b50586b..1b67174 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -98,8 +98,6 @@ install: all
+ 	$(INSTALL) -m 0755 $(PACKAGENAME) $(DESTDIR)/$(SBINDIR)
+ 	$(INSTALL) -d -m 0755 $(DESTDIR)/$(MANDIR)/man1
+ 	$(INSTALL) -m 0644 $(PACKAGENAME).1 $(DESTDIR)/$(MANDIR)/man1
+-	$(INSTALL) -d -m 0755 $(DESTDIR)/$(DATADIR)/$(PACKAGENAME)
+-	$(INSTALL) -m 0644 $(DATAFILES) $(DESTDIR)/$(DATADIR)/$(PACKAGENAME)
+ 	make -C po install
+ 
+ install-gui: gui
+-- 
+2.14.3
+
diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 3caac66c72..eea4312008 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_LSHW
 	bool "lshw"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_HWDATA
+	select BR2_PACKAGE_HWDATA_PCI_IDS
+	select BR2_PACKAGE_HWDATA_USB_IDS
 	help
 	  lshw (Hardware Lister) is a small tool to provide
 	  detailed information on the hardware configuration of the
-- 
2.14.3
