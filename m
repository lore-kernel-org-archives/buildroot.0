From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Dec 2016 09:35:35 +0100
Subject: [Buildroot] [PATCH] raspberrypi-tools: new package
Message-ID: <1480926935-3393-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package currently only installs the "rpiboot" utility, which
is needed to access via USB mass storage the built-in eMMC of
Raspberry Pi compute modules. It has been successfully tested on HW by
Quentin Schulz.

One annoyance is that this big repository contains a huge amount of
things, not related to rpiboot, including pre-built toolchains and
lots of other stuff. But there's not much we can do about it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Quentin Schulz <quentin.schulz@free-electrons.com>
---
 package/Config.in.host                             |   1 +
 ...oot-Makefile-allow-passing-CFLAGS-LDFLAGS.patch |  27 +++++
 ...0002-usbboot-Makefile-add-DESTDIR-support.patch |  48 ++++++++
 ...n.c-rework-logic-to-find-def1-def2-and-de.patch | 127 +++++++++++++++++++++
 package/raspberrypi-tools/Config.in.host           |  12 ++
 package/raspberrypi-tools/raspberrypi-tools.mk     |  21 ++++
 6 files changed, 236 insertions(+)
 create mode 100644 package/raspberrypi-tools/0001-usbboot-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
 create mode 100644 package/raspberrypi-tools/0002-usbboot-Makefile-add-DESTDIR-support.patch
 create mode 100644 package/raspberrypi-tools/0003-usbboot-main.c-rework-logic-to-find-def1-def2-and-de.patch
 create mode 100644 package/raspberrypi-tools/Config.in.host
 create mode 100644 package/raspberrypi-tools/raspberrypi-tools.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 3b115c5..fc7ef2b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -35,6 +35,7 @@ menu "Host utilities"
 	source "package/patchelf/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/qemu/Config.in.host"
+	source "package/raspberrypi-tools/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/raspberrypi-tools/0001-usbboot-Makefile-allow-passing-CFLAGS-LDFLAGS.patch b/package/raspberrypi-tools/0001-usbboot-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
new file mode 100644
index 0000000..9201f09
--- /dev/null
+++ b/package/raspberrypi-tools/0001-usbboot-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
@@ -0,0 +1,27 @@
+From db0a64c51655f6b5b87f27e3dbda40d2768ea790 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 2 Dec 2016 23:09:44 +0100
+Subject: [PATCH] usbboot/Makefile: allow passing CFLAGS/LDFLAGS
+
+This might be needed to pass some custom CFLAGS/LDFLAGS when building
+rpiboot.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ usbboot/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usbboot/Makefile b/usbboot/Makefile
+index 3e7d1e4..d9a7220 100755
+--- a/usbboot/Makefile
++++ b/usbboot/Makefile
+@@ -1,5 +1,5 @@
+ rpiboot: main.c
+-	$(CC) -g -o $@ $< -lusb-1.0
++	$(CC) -g $(CFLAGS) -o $@ $< -lusb-1.0 $(LDFLAGS)
+ 
+ install: rpiboot
+ 	cp rpiboot /usr/bin
+-- 
+2.7.4
+
diff --git a/package/raspberrypi-tools/0002-usbboot-Makefile-add-DESTDIR-support.patch b/package/raspberrypi-tools/0002-usbboot-Makefile-add-DESTDIR-support.patch
new file mode 100644
index 0000000..d8034ee
--- /dev/null
+++ b/package/raspberrypi-tools/0002-usbboot-Makefile-add-DESTDIR-support.patch
@@ -0,0 +1,48 @@
+From 7b1503557cd31f20998c648decc4f82ed1fada18 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 2 Dec 2016 23:10:37 +0100
+Subject: [PATCH] usbboot/Makefile: add DESTDIR support
+
+This allows installing rpiboot outside of /usr if needed.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ usbboot/Makefile | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/usbboot/Makefile b/usbboot/Makefile
+index d9a7220..7835b7f 100755
+--- a/usbboot/Makefile
++++ b/usbboot/Makefile
+@@ -2,18 +2,18 @@ rpiboot: main.c
+ 	$(CC) -g $(CFLAGS) -o $@ $< -lusb-1.0 $(LDFLAGS)
+ 
+ install: rpiboot
+-	cp rpiboot /usr/bin
+-	mkdir -p /usr/share/rpiboot
+-	cp usbbootcode.bin /usr/share/rpiboot
+-	cp msd.elf /usr/share/rpiboot
+-	cp buildroot.elf /usr/share/rpiboot
++	cp rpiboot $(DESTDIR)/usr/bin
++	mkdir -p $(DESTDIR)//usr/share/rpiboot
++	cp usbbootcode.bin $(DESTDIR)/usr/share/rpiboot
++	cp msd.elf $(DESTDIR)/usr/share/rpiboot
++	cp buildroot.elf $(DESTDIR)/usr/share/rpiboot
+ 
+ uninstall:
+-	rm -f /usr/bin/rpiboot
+-	rm -f /usr/share/rpiboot/usbbootcode.bin
+-	rm -f /usr/share/rpiboot/msd.elf
+-	rm -f /usr/share/rpiboot/buildroot.elf
+-	rmdir --ignore-fail-on-non-empty /usr/share/rpiboot/
++	rm -f $(DESTDIR)/usr/bin/rpiboot
++	rm -f $(DESTDIR)/usr/share/rpiboot/usbbootcode.bin
++	rm -f $(DESTDIR)/usr/share/rpiboot/msd.elf
++	rm -f $(DESTDIR)/usr/share/rpiboot/buildroot.elf
++	rmdir --ignore-fail-on-non-empty $(DESTDIR)/usr/share/rpiboot/
+ 
+ clean: 
+ 	rm rpiboot
+-- 
+2.7.4
+
diff --git a/package/raspberrypi-tools/0003-usbboot-main.c-rework-logic-to-find-def1-def2-and-de.patch b/package/raspberrypi-tools/0003-usbboot-main.c-rework-logic-to-find-def1-def2-and-de.patch
new file mode 100644
index 0000000..f704d92
--- /dev/null
+++ b/package/raspberrypi-tools/0003-usbboot-main.c-rework-logic-to-find-def1-def2-and-de.patch
@@ -0,0 +1,127 @@
+From a0cf19a7ab7ae353ed16e9705d4dae37a82d2a15 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 2 Dec 2016 23:43:23 +0100
+Subject: [PATCH] usbboot/main.c: rework logic to find def1, def2 and def3
+ files
+
+The current logic to find def1, def2 and def3 first tries to find them
+in the local directory, and if they are not available, find them in
+/usr/share.
+
+However, this doesn't work if rpiboot and its related files are
+installed, but not in /usr. In order to address this use-case, this
+commit reworks the logic to find the file path.
+
+A new function, getfilepath() is created. If the requested file is
+available in the current directory, it is used. If not, then the path to
+the file is inferred from the location of the currently running
+program. I.e if we run /home/foo/sys/bin/rpiboot, then we will search
+def1 in usbbootcode.bin in
+/home/foo/sys/bin/../share/rpiboot/usbbootcode.bin.
+
+This continues to address the case of an installation in /usr, while
+allowing installation in other locations as well.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ usbboot/main.c | 61 +++++++++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 48 insertions(+), 13 deletions(-)
+
+diff --git a/usbboot/main.c b/usbboot/main.c
+index 1b4e042..7c571d6 100755
+--- a/usbboot/main.c
++++ b/usbboot/main.c
+@@ -1,10 +1,12 @@
+-#include "libusb-1.0/libusb.h"
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-
++#include <libgen.h>
+ #include <unistd.h>
+ 
++#include "libusb-1.0/libusb.h"
++
+ int verbose = 0;
+ int out_ep = 1;
+ int in_ep = 2;
+@@ -146,6 +148,37 @@ int ep_read(unsigned char *buf, int len, libusb_device_handle * usb_device)
+ 	return len;
+ }
+ 
++char *getfilepath(char *filename)
++{
++	char *progpath, *filepath, *progdir;
++	ssize_t len;
++
++	/* If file is available locally, use it */
++	if (access(filename, F_OK) != -1)
++		return filename;
++
++	/* Otherwise, use the installed version */
++	progpath = malloc(PATH_MAX);
++	len = readlink("/proc/self/exe", progpath, PATH_MAX - 1);
++	if (len == -1)
++	{
++		free(progpath);
++		return NULL;
++	}
++
++	progpath[len] = '\0';
++	progdir = dirname(progpath);
++	if (asprintf(&filepath, "%s/../share/rpiboot/%s", progdir, filename) < 0)
++	{
++		free(progpath);
++		return NULL;
++	}
++
++	free(progpath);
++
++	return filepath;
++}
++
+ int main(int argc, char *argv[])
+ {
+ 	int result;
+@@ -157,13 +190,9 @@ int main(int argc, char *argv[])
+ 	int last_serial = -1;
+ 	FILE *fp1, *fp2, *fp;
+ 
+-	char def1_inst[] = "/usr/share/rpiboot/usbbootcode.bin";
+-	char def2_inst[] = "/usr/share/rpiboot/msd.elf";
+-	char def3_inst[] = "/usr/share/rpiboot/buildroot.elf";
+-
+-	char def1_loc[] = "./usbbootcode.bin";
+-	char def2_loc[] = "./msd.elf";
+-	char def3_loc[] = "./buildroot.elf";
++	char def1_name[] = "usbbootcode.bin";
++	char def2_name[] = "msd.elf";
++	char def3_name[] = "buildroot.elf";
+ 
+ 	char *def1, *def2, *def3;
+ 
+@@ -171,10 +200,16 @@ int main(int argc, char *argv[])
+ 	char *fatimage = NULL, *executable = NULL;
+ 	int loop       = 0;
+ 
+-// if local file version exists use it else use installed
+-	if( access( def1_loc, F_OK ) != -1 ) { def1 = def1_loc; } else { def1 = def1_inst; }
+-	if( access( def2_loc, F_OK ) != -1 ) { def2 = def2_loc; } else { def2 = def2_inst; }
+-	if( access( def3_loc, F_OK ) != -1 ) { def3 = def3_loc; } else { def3 = def3_inst; }
++	def1 = getfilepath(def1_name);
++	def2 = getfilepath(def2_name);
++	def3 = getfilepath(def3_name);
++
++	if (!def1 || !def2 || !def3)
++	{
++		fprintf(stderr, "One of %s, %s or %s cannot be found\n",
++			def1_name, def2_name, def3_name);
++		exit(1);
++	}
+ 
+ 	stage1   = def1;
+ 	stage2   = def2;
+-- 
+2.7.4
+
diff --git a/package/raspberrypi-tools/Config.in.host b/package/raspberrypi-tools/Config.in.host
new file mode 100644
index 0000000..31b493a
--- /dev/null
+++ b/package/raspberrypi-tools/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_RASPBERRYPI_TOOLS
+	bool "host raspberrypi-tools"
+	depends on BR2_arm
+	help
+	  This package builds and install RaspberryPi related tools
+	  for the host machine. It currently only installs the
+	  "rpiboot" tool, which allows to boot the RaspberryPi SoC
+	  over USB, and have it expose a USB mass storage device in
+	  order to reflash the built-in storage of the RaspberryPi
+	  (useful for the eMMC built into the Compute module).
+
+	  https://github.com/raspberrypi/tools
diff --git a/package/raspberrypi-tools/raspberrypi-tools.mk b/package/raspberrypi-tools/raspberrypi-tools.mk
new file mode 100644
index 0000000..e6511ab
--- /dev/null
+++ b/package/raspberrypi-tools/raspberrypi-tools.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# raspberrypi-tools
+#
+################################################################################
+
+RASPBERRYPI_TOOLS_VERSION = 6376a50ed059b3c852ce3836981ba5ff07d6b368
+RASPBERRYPI_TOOLS_SITE = $(call github,raspberrypi,tools,$(RASPBERRYPI_TOOLS_VERSION))
+
+HOST_RASPBERRYPI_TOOLS_DEPENDENCIES = host-libusb
+
+define HOST_RASPBERRYPI_TOOLS_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)/usbboot/
+endef
+
+define HOST_RASPBERRYPI_TOOLS_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)/usbboot/ \
+		DESTDIR=$(HOST_DIR) install
+endef
+
+$(eval $(host-generic-package))
-- 
2.7.4
