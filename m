From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 16 Oct 2012 17:11:42 +0200
Subject: [Buildroot] [PATCH RFC] grub2: new boot loader
Message-ID: <1350400302-19752-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The difference between grub 0.97 and grub 2.00 is so large that it
doesn't make much sense to use the same package infrastructure.
In addition, this is still a bit experimental so we may not want to
remove grub 0.97 right away.  Therefore, grub2 is created as a new
package.  If it stabilizes enough before it's merged, I'll rename it
to grub and remove the old grub.

Since this is not a simple version bump, I'm first posting an RFC.

This RFC only works for i386/x86_64 BIOS platforms; for the final
version, the intention is to add a few other platforms as well.

There are a few FIXME/TODO items in comments.

One major controversial item is that there is a host and a target
version.  The host version creates the bootloader binaries for the
target, but the grub installer binaries for the host.  The target
version also creates the bootloader binaries for the target, and the
grub installer binaries for the target as well.  This makes it
possible to re-run grub-setup on the target.

Because the pkg-infra doesn't really support host/target split for
boot loaders, I created it as a normal package instead of a bootloader.
The Config.in is still included from the bootloader menu, though.

The grub2-0001-grub-setup-make-it-possible-to-specify-the-root-devi
patch isn't strictly required to build grub, but it is to make it
useful in the typical buildroot use case.  Without it, you need root
privileges to be able to install grub, even when writing to an image
file.

Still todo:
 - build-test with different cross toolchains
 - test build on 32-bit host
 - add config options for the relevant features
 - review grub.200-fix_mbr_handling.patch from old grub
 - review grub.300-honor_UCLIBC_HAS_LFS.patch from old grub

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 boot/Config.in                                     |    1 +
 package/Config.in                                  |    1 +
 package/grub2/Config.in                            |   10 ++
 package/grub2/Config.in.host                       |   10 ++
 ...make-it-possible-to-specify-the-root-devi.patch |  183 ++++++++++++++++++++
 package/grub2/grub2.mk                             |   95 ++++++++++
 6 files changed, 300 insertions(+)

diff --git a/boot/Config.in b/boot/Config.in
index a55139b..d88039f 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -5,6 +5,7 @@ source "boot/at91bootstrap3/Config.in"
 source "boot/at91dataflashboot/Config.in"
 source "boot/barebox/Config.in"
 source "boot/grub/Config.in"
+source "package/grub2/Config.in.host"
 source "boot/lpc32xxcdl/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/syslinux/Config.in"
diff --git a/package/Config.in b/package/Config.in
index d7b3db6..049cc87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -206,6 +206,7 @@ source "package/fmtools/Config.in"
 source "package/gadgetfs-test/Config.in"
 source "package/gdisk/Config.in"
 source "package/gpsd/Config.in"
+source "package/grub2/Config.in"
 source "package/gvfs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/hdparm/Config.in"
diff --git a/package/grub2/Config.in b/package/grub2/Config.in
new file mode 100644
index 0000000..57ba846
--- /dev/null
+++ b/package/grub2/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GRUB2
+	bool "grub2"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  The GRand Unified Bootloader for x86 systems.
+	  This creates the installers that run on the target and install
+	  into the target.  Select this if you want to be able to re-install
+	  grub on the target itself.
+
+	  http://www.gnu.org/software/grub/
diff --git a/package/grub2/Config.in.host b/package/grub2/Config.in.host
new file mode 100644
index 0000000..0fcb35e
--- /dev/null
+++ b/package/grub2/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_GRUB2
+	bool "grub2"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  The GRand Unified Bootloader for x86 systems.
+	  This creates the installers that run on the host and create a
+	  boot loader for the target.  Select this if you want to create
+	  a bootable image on your host.
+
+	  http://www.gnu.org/software/grub/
diff --git a/package/grub2/grub2-0001-grub-setup-make-it-possible-to-specify-the-root-devi.patch b/package/grub2/grub2-0001-grub-setup-make-it-possible-to-specify-the-root-devi.patch
new file mode 100644
index 0000000..fa3779d
--- /dev/null
+++ b/package/grub2/grub2-0001-grub-setup-make-it-possible-to-specify-the-root-devi.patch
@@ -0,0 +1,183 @@
+From de553e029b9bd7746d0551b03ed7319114972d69 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 4 Sep 2012 16:09:36 +0200
+Subject: [PATCH] grub-setup: make it possible to specify the root device
+
+This patch makes it possible to call grub-setup as a non-privileged
+user when the user has access to the target device (e.g. when it is
+an image file).
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+Upstream status: rejected (reasons are unclear).
+---
+ util/grub-setup.c |  108 ++++++++++++++++++++++++++++++++---------------------
+ 1 file changed, 65 insertions(+), 43 deletions(-)
+
+diff --git a/util/grub-setup.c b/util/grub-setup.c
+index 085e8df..ee1b367 100644
+--- a/util/grub-setup.c
++++ b/util/grub-setup.c
+@@ -141,7 +141,7 @@ write_rootdev (char *core_img, grub_device_t root_dev,
+ static void
+ setup (const char *dir,
+        const char *boot_file, const char *core_file,
+-       const char *dest, int force,
++       const char *dest, const char* rootarg, int force,
+        int fs_probe, int allow_floppy)
+ {
+   char *boot_path, *core_path, *core_path_dev, *core_path_dev_full;
+@@ -253,50 +253,61 @@ setup (const char *dir,
+ 
+   core_dev = dest_dev;
+ 
+-  {
+-    char **root_devices = grub_guess_root_devices (dir);
+-    char **cur;
+-    int found = 0;
++  if (rootarg && *rootarg)
++    {
++      /* Verify if the supplied root is valid */
++      root_dev = grub_device_open (rootarg);
++      if (root_dev)
++	root = xstrdup(rootarg);
++      else
++	grub_util_error ("supplied root device `%s' is invalid, because of `%s'",
++			 rootarg, grub_errmsg);
++    }
++  else
++    {
++      char **root_devices = grub_guess_root_devices (dir);
++      char **cur;
++      int found = 0;
+ 
+-    for (cur = root_devices; *cur; cur++)
+-      {
+-	char *drive;
+-	grub_device_t try_dev;
+-
+-	drive = grub_util_get_grub_dev (*cur);
+-	if (!drive)
+-	  continue;
+-	try_dev = grub_device_open (drive);
+-	if (! try_dev)
+-	  continue;
+-	if (!found && try_dev->disk->id == dest_dev->disk->id
+-	    && try_dev->disk->dev->id == dest_dev->disk->dev->id)
+-	  {
+-	    if (root_dev)
+-	      grub_device_close (root_dev);
+-	    free (root);
+-	    root_dev = try_dev;
+-	    root = drive;
+-	    found = 1;
++      for (cur = root_devices; *cur; cur++)
++	{
++	  char *drive;
++	  grub_device_t try_dev;
++
++	  drive = grub_util_get_grub_dev (*cur);
++	  if (!drive)
+ 	    continue;
+-	  }
+-	if (!root_dev)
+-	  {
+-	    root_dev = try_dev;
+-	    root = drive;
++	  try_dev = grub_device_open (drive);
++	  if (! try_dev)
+ 	    continue;
+-	  }
+-	grub_device_close (try_dev);	
+-	free (drive);
+-      }
+-    if (!root_dev)
+-      {
+-	grub_util_error ("guessing the root device failed, because of `%s'",
+-			 grub_errmsg);
+-      }
+-    grub_util_info ("guessed root_dev `%s' from "
+-		    "dir `%s'", root_dev->disk->name, dir);
+-  }
++	  if (!found && try_dev->disk->id == dest_dev->disk->id
++	      && try_dev->disk->dev->id == dest_dev->disk->dev->id)
++	    {
++	      if (root_dev)
++		grub_device_close (root_dev);
++	      free (root);
++	      root_dev = try_dev;
++	      root = drive;
++	      found = 1;
++	      continue;
++	    }
++	  if (!root_dev)
++	    {
++	      root_dev = try_dev;
++	      root = drive;
++	      continue;
++	    }
++	  grub_device_close (try_dev);
++	  free (drive);
++	}
++      if (!root_dev)
++	{
++	  grub_util_error ("guessing the root device failed, because of `%s'",
++			   grub_errmsg);
++	}
++      grub_util_info ("guessed root_dev `%s' from "
++		      "dir `%s'", root_dev->disk->name, dir);
++    }
+ 
+   grub_util_info ("setting the root device to `%s'", root);
+   if (grub_env_set ("root", root) != GRUB_ERR_NONE)
+@@ -952,6 +963,8 @@ static struct argp_option options[] = {
+    N_("use GRUB files in the directory DIR [default=%s]"), 0},
+   {"device-map",  'm', N_("FILE"), 0,
+    N_("use FILE as the device map [default=%s]"), 0},
++  {"root-partition",  'r', N_("DEV"), 0,
++   N_("use grub device DEV as the root partition within DEVICE [default=probed]"), 0},
+   {"force",       'f', 0,      0,
+    N_("install even if problems are detected"), 0},
+   {"skip-fs-probe",'s',0,      0,
+@@ -993,6 +1006,7 @@ struct arguments
+   char *core_file;
+   char *dir;
+   char *dev_map;
++  char *root;
+   int  force;
+   int  fs_probe;
+   int allow_floppy;
+@@ -1040,6 +1054,13 @@ argp_parser (int key, char *arg, struct argp_state *state)
+         arguments->dev_map = xstrdup (arg);
+         break;
+ 
++      case 'r':
++        if (arguments->root)
++          free (arguments->root);
++
++        arguments->root = xstrdup (arg);
++        break;
++
+       case 'f':
+         arguments->force = 1;
+         break;
+@@ -1172,7 +1193,7 @@ main (int argc, char *argv[])
+   setup (arguments.dir ? : DEFAULT_DIRECTORY,
+ 	 arguments.boot_file ? : DEFAULT_BOOT_FILE,
+ 	 arguments.core_file ? : DEFAULT_CORE_FILE,
+-	 dest_dev, arguments.force,
++	 dest_dev, arguments.root, arguments.force,
+ 	 arguments.fs_probe, arguments.allow_floppy);
+ 
+   /* Free resources.  */
+@@ -1184,6 +1205,7 @@ main (int argc, char *argv[])
+   free (arguments.dir);
+   free (arguments.dev_map);
+   free (arguments.device);
++  free (arguments.root);
+   free (root_dev);
+   free (dest_dev);
+ 
+-- 
+1.7.10.4
+
diff --git a/package/grub2/grub2.mk b/package/grub2/grub2.mk
new file mode 100644
index 0000000..80a7796
--- /dev/null
+++ b/package/grub2/grub2.mk
@@ -0,0 +1,95 @@
+#############################################################
+#
+# grub
+#
+#############################################################
+
+GRUB2_VERSION = 2.00
+GRUB2_SITE    = $(BR2_GNU_MIRROR)/grub
+GRUB2_SOURCE  = grub-$(GRUB2_VERSION).tar.gz
+
+# FIXME:
+# License is different for different files.  COPYING is GPLv3+,
+# but inidivual files are GPLv2+ LGPLv2.1+ GPLv3+ LGPLv3+.  Of
+# course, that means that the whole can only be distributed
+# under GPLv3+, so I guess that's the correct license.
+GRUB2_LICENSE = GPLv3+
+GRUB2_LICENSE_FILES = COPYING
+
+# grub2 requires flex 2.5.35
+GRUB2_DEPENDENCIES = host-flex
+
+# options common between grub2 and host-grub2:
+GRUB2_COMMON_CONF_OPT = \
+	--disable-mm-debug \
+	--with-platform=pc \
+	--with-bootdir=/boot \
+	--with-grubdir=grub \
+	--disable-efiemu \
+	--disable-grub-emu-sdl \
+	--disable-grub-emu-usb \
+	--disable-grub-emu-pci \
+	--disable-grub-mkfont \
+	--disable-grub-mount \
+	--disable-device-mapper \
+	--disable-libzfs
+
+# We only build for a single target, so no need to add <arch>-prefix
+GRUB2_COMMON_CONF_OPT += --program-prefix=""
+
+# grub2 isn't warning-free
+GRUB2_COMMON_CONF_OPT += --disable-werror
+
+
+GRUB2_CONF_OPT = $(GRUB2_COMMON_CONF_OPT)
+
+# grub adds -Wall to CPPFLAGS, so it's not actually CPP.
+GRUB2_CONF_OPT += CPP="$(TARGET_CC) -E"
+
+
+# Cross-build the boot loader binaries in the host build
+HOST_GRUB2_CONF_ENV = \
+	TARGET_CC="$(TARGET_CC)" \
+	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
+	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
+	TARGET_LDFLAGS="$(TARGET_LDFLAGS)"
+
+HOST_GRUB2_CONF_OPT = $(GRUB2_COMMON_CONF_OPT)
+
+# grub adds -Wall to CPPFLAGS, so it's not actually CPP.
+HOST_GRUB2_CONF_OPT += CPP="$(TARGET_CC) -E"
+
+# FIXME fix nls support for host-grub2
+HOST_GRUB2_CONF_OPT += --disable-nls
+
+# TODO:
+# --with-platform=$(BR2_TARGET_GRUB2_PLATFORM)
+#   i386-efi) ;;
+#   x86_64-efi) ;;
+#   i386-pc) ;;
+#   i386-multiboot) ;;
+#   i386-coreboot) ;;
+#   i386-ieee1275) ;;
+#   i386-qemu) ;;			  Requires unifont in /usr!
+#   powerpc-ieee1275) ;;
+#   sparc64-ieee1275) ;;
+#   ia64-efi) ;;
+#   mips-qemu_mips) ;;                     Requires unifont /usr!
+#   mips-arc) ;;
+#   mipsel-qemu_mips) ;;                   Requires unifont /usr!
+#   mipsel-loongson) ;;			   Requites unifont /usr!
+#   *-emu) ;;				   Requires host-ncurses
+# --with-bootdir
+# --with-grubdir
+# --enable-efiemu	  # only on 32-bit i386
+# --enable-grub-emu-sdl   # only on *-emu target; depends on host-ncurses
+# --enable-grub-emu-usb
+# --enable-grub-emu-pci   # either usb or pci; depends on host-libpci
+# --enable-grub-mkfont    # depends on (host-)freetype; required by loongson
+# --enable-grub-mount     # depends on (host-)FUSE
+# --enable-device-mapper  # depends on (host?)libdevmapper
+# --enable-libzfs         # depends on host-libzfs
+
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
tg: (2ce5da6..) t/grub2 (depends on: master)
