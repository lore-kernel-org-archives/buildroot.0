From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 09:53:25 +0200
Subject: [Buildroot] [git commit branch/next] package/raspberrypi-usbboot:
 bump version to 9324fd7
Message-ID: <20210520073019.A19C587576@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fce1488853273db6491c4015002fcbdbbbae7da0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- add license description/file/hash

- rebased 0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch

- removed 0002-Makefile-add-DESTDIR-support.patch
  (Makefile install target removed since [1])

- removed 0003-main.c-rework-logic-to-find-def1-def2-and-def3-files.patch
  (bootcode.bin/bootcode4.bin and start.elf/start4.elf compiled in since [2])

- change host install command

[1] https://github.com/raspberrypi/usbboot/commit/9e6ff777bbf271b75aa0b1aa24e6f12d7b768375
[2] https://github.com/raspberrypi/usbboot/commit/1bb4c2da4775329bcf5811616fc8f0ce78ee2121

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch |  18 +--
 .../0002-Makefile-add-DESTDIR-support.patch        |  51 ---------
 ...rk-logic-to-find-def1-def2-and-def3-files.patch | 127 ---------------------
 .../raspberrypi-usbboot/raspberrypi-usbboot.hash   |   5 +-
 package/raspberrypi-usbboot/raspberrypi-usbboot.mk |   7 +-
 5 files changed, 18 insertions(+), 190 deletions(-)

diff --git a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
index cdab6070c2..d482b0b9d4 100644
--- a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
+++ b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
@@ -1,4 +1,4 @@
-From 5b015e67af27679f4ca8f7f5f2f71020ec054b0c Mon Sep 17 00:00:00 2001
+From 38b730c00f45abf324caf687b5b00662ff4252c2 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Fri, 2 Dec 2016 23:09:44 +0100
 Subject: [PATCH] Makefile: allow passing CFLAGS/LDFLAGS
@@ -8,21 +8,23 @@ rpiboot.
 
 Submitted-upstream: https://github.com/raspberrypi/usbboot/pull/2
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Rebased on 9324fd7]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 3e7d1e4..d9a7220 100755
+index 822e714..875e717 100755
 --- a/Makefile
 +++ b/Makefile
 @@ -1,5 +1,5 @@
- rpiboot: main.c
--	$(CC) -g -o $@ $< -lusb-1.0
-+	$(CC) -g $(CFLAGS) -o $@ $< -lusb-1.0 $(LDFLAGS)
+ rpiboot: main.c msd/bootcode.h msd/start.h msd/bootcode4.h msd/start4.h
+-	$(CC) -Wall -Wextra -g -o $@ $< -lusb-1.0
++	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ $< -lusb-1.0 $(LDFLAGS)
  
- install: rpiboot
- 	cp rpiboot /usr/bin
+ %.h: %.bin ./bin2c
+ 	./bin2c $< $@
 -- 
-2.7.4
+2.31.1
 
diff --git a/package/raspberrypi-usbboot/0002-Makefile-add-DESTDIR-support.patch b/package/raspberrypi-usbboot/0002-Makefile-add-DESTDIR-support.patch
deleted file mode 100644
index a757cb0e03..0000000000
--- a/package/raspberrypi-usbboot/0002-Makefile-add-DESTDIR-support.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 905bc741b189d67160b27551b8ad01459c2707a0 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 2 Dec 2016 23:10:37 +0100
-Subject: [PATCH] Makefile: add DESTDIR support
-
-This allows installing rpiboot outside of /usr if needed.
-
-Submitted-upstream: https://github.com/raspberrypi/usbboot/pull/2
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Arnout: remove /usr]
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- Makefile | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index d9a7220..7835b7f 100755
---- a/Makefile
-+++ b/Makefile
-@@ -2,18 +2,18 @@ rpiboot: main.c
- 	$(CC) -g $(CFLAGS) -o $@ $< -lusb-1.0 $(LDFLAGS)
- 
- install: rpiboot
--	cp rpiboot /usr/bin
--	mkdir -p /usr/share/rpiboot
--	cp usbbootcode.bin /usr/share/rpiboot
--	cp msd.elf /usr/share/rpiboot
--	cp buildroot.elf /usr/share/rpiboot
-+	cp rpiboot $(DESTDIR)bin
-+	mkdir -p $(DESTDIR)/share/rpiboot
-+	cp usbbootcode.bin $(DESTDIR)/share/rpiboot
-+	cp msd.elf $(DESTDIR)/share/rpiboot
-+	cp buildroot.elf $(DESTDIR)/share/rpiboot
- 
- uninstall:
--	rm -f /usr/bin/rpiboot
--	rm -f /usr/share/rpiboot/usbbootcode.bin
--	rm -f /usr/share/rpiboot/msd.elf
--	rm -f /usr/share/rpiboot/buildroot.elf
--	rmdir --ignore-fail-on-non-empty /usr/share/rpiboot/
-+	rm -f $(DESTDIR)/bin/rpiboot
-+	rm -f $(DESTDIR)/share/rpiboot/usbbootcode.bin
-+	rm -f $(DESTDIR)/share/rpiboot/msd.elf
-+	rm -f $(DESTDIR)/share/rpiboot/buildroot.elf
-+	rmdir --ignore-fail-on-non-empty $(DESTDIR)/share/rpiboot/
- 
- clean: 
- 	rm rpiboot
--- 
-2.7.4
-
diff --git a/package/raspberrypi-usbboot/0003-main.c-rework-logic-to-find-def1-def2-and-def3-files.patch b/package/raspberrypi-usbboot/0003-main.c-rework-logic-to-find-def1-def2-and-def3-files.patch
deleted file mode 100644
index 30cde49f34..0000000000
--- a/package/raspberrypi-usbboot/0003-main.c-rework-logic-to-find-def1-def2-and-def3-files.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 935894908dc24acda0acea7d211a9d80e55ecadb Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 2 Dec 2016 23:43:23 +0100
-Subject: [PATCH] main.c: rework logic to find def1, def2 and def3 files
-
-The current logic to find def1, def2 and def3 first tries to find them
-in the local directory, and if they are not available, find them in
-/usr/share.
-
-However, this doesn't work if rpiboot and its related files are
-installed, but not in /usr. In order to address this use-case, this
-commit reworks the logic to find the file path.
-
-A new function, getfilepath() is created. If the requested file is
-available in the current directory, it is used. If not, then the path to
-the file is inferred from the location of the currently running
-program. I.e if we run /home/foo/sys/bin/rpiboot, then we will search
-def1 in usbbootcode.bin in
-/home/foo/sys/bin/../share/rpiboot/usbbootcode.bin.
-
-This continues to address the case of an installation in /usr, while
-allowing installation in other locations as well.
-
-Submitted-upstream: https://github.com/raspberrypi/usbboot/pull/2
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- main.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++-------------
- 1 file changed, 48 insertions(+), 13 deletions(-)
-
-diff --git a/main.c b/main.c
-index 1b4e042..7c571d6 100755
---- a/main.c
-+++ b/main.c
-@@ -1,10 +1,12 @@
--#include "libusb-1.0/libusb.h"
-+#define _GNU_SOURCE
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--
-+#include <libgen.h>
- #include <unistd.h>
- 
-+#include "libusb-1.0/libusb.h"
-+
- int verbose = 0;
- int out_ep = 1;
- int in_ep = 2;
-@@ -146,6 +148,37 @@ int ep_read(unsigned char *buf, int len, libusb_device_handle * usb_device)
- 	return len;
- }
- 
-+char *getfilepath(char *filename)
-+{
-+	char *progpath, *filepath, *progdir;
-+	ssize_t len;
-+
-+	/* If file is available locally, use it */
-+	if (access(filename, F_OK) != -1)
-+		return filename;
-+
-+	/* Otherwise, use the installed version */
-+	progpath = malloc(PATH_MAX);
-+	len = readlink("/proc/self/exe", progpath, PATH_MAX - 1);
-+	if (len == -1)
-+	{
-+		free(progpath);
-+		return NULL;
-+	}
-+
-+	progpath[len] = '\0';
-+	progdir = dirname(progpath);
-+	if (asprintf(&filepath, "%s/../share/rpiboot/%s", progdir, filename) < 0)
-+	{
-+		free(progpath);
-+		return NULL;
-+	}
-+
-+	free(progpath);
-+
-+	return filepath;
-+}
-+
- int main(int argc, char *argv[])
- {
- 	int result;
-@@ -157,13 +190,9 @@ int main(int argc, char *argv[])
- 	int last_serial = -1;
- 	FILE *fp1, *fp2, *fp;
- 
--	char def1_inst[] = "/usr/share/rpiboot/usbbootcode.bin";
--	char def2_inst[] = "/usr/share/rpiboot/msd.elf";
--	char def3_inst[] = "/usr/share/rpiboot/buildroot.elf";
--
--	char def1_loc[] = "./usbbootcode.bin";
--	char def2_loc[] = "./msd.elf";
--	char def3_loc[] = "./buildroot.elf";
-+	char def1_name[] = "usbbootcode.bin";
-+	char def2_name[] = "msd.elf";
-+	char def3_name[] = "buildroot.elf";
- 
- 	char *def1, *def2, *def3;
- 
-@@ -171,10 +200,16 @@ int main(int argc, char *argv[])
- 	char *fatimage = NULL, *executable = NULL;
- 	int loop       = 0;
- 
--// if local file version exists use it else use installed
--	if( access( def1_loc, F_OK ) != -1 ) { def1 = def1_loc; } else { def1 = def1_inst; }
--	if( access( def2_loc, F_OK ) != -1 ) { def2 = def2_loc; } else { def2 = def2_inst; }
--	if( access( def3_loc, F_OK ) != -1 ) { def3 = def3_loc; } else { def3 = def3_inst; }
-+	def1 = getfilepath(def1_name);
-+	def2 = getfilepath(def2_name);
-+	def3 = getfilepath(def3_name);
-+
-+	if (!def1 || !def2 || !def3)
-+	{
-+		fprintf(stderr, "One of %s, %s or %s cannot be found\n",
-+			def1_name, def2_name, def3_name);
-+		exit(1);
-+	}
- 
- 	stage1   = def1;
- 	stage2   = def2;
--- 
-2.7.4
-
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
index 94860a9dab..3f66b12ff1 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
@@ -1,2 +1,5 @@
 # Locally calculated
-sha256 a8893f8a10522bd58866eb34e7f0d7731c43200d585f122681f428cdef76e676 raspberrypi-usbboot-f4e3f0f9a3c64d846ba53ec3367e33a4f9a7d051.tar.gz
+sha256  e4a07df05c23e0eba100d4013367e7823e3b8bc72da7b79b031bd346616c6ae5  raspberrypi-usbboot-9324fd7034b9d3606aed8a27da74d6d57e066e7e.tar.gz
+
+# License files
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
index 7018617906..5d7b433c64 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-RASPBERRYPI_USBBOOT_VERSION = f4e3f0f9a3c64d846ba53ec3367e33a4f9a7d051
+RASPBERRYPI_USBBOOT_VERSION = 9324fd7034b9d3606aed8a27da74d6d57e066e7e
 RASPBERRYPI_USBBOOT_SITE = $(call github,raspberrypi,usbboot,$(RASPBERRYPI_USBBOOT_VERSION))
+RASPBERRYPI_USBBOOT_LICENSE = Apache-2.0
+RASPBERRYPI_USBBOOT_LICENSE_FILES = LICENSE
 
 HOST_RASPBERRYPI_USBBOOT_DEPENDENCIES = host-libusb
 
@@ -14,8 +16,7 @@ define HOST_RASPBERRYPI_USBBOOT_BUILD_CMDS
 endef
 
 define HOST_RASPBERRYPI_USBBOOT_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
-		DESTDIR=$(HOST_DIR) install
+	$(INSTALL) -D -m 0755 $(@D)/rpiboot $(HOST_DIR)/bin/rpiboot
 endef
 
 $(eval $(host-generic-package))
