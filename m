From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Sep 2014 00:00:59 +0200
Subject: [Buildroot] [git commit] avrdude: Depend on elfutils instead of
	libelf to get the libelf library
Message-ID: <20140913221240.377639D68B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=635555cbd9d135eedbfc9ac23ee02f37e7d3de00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The elfutils package provides a more recent version of the libelf, so
let's use it. It will allow to remove the libelf package and to avoid
conflicts with two packages providing the same library.

[Peter: adjust toolchain options comment to match]
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avrdude/Config.in  |   12 +++++++++---
 package/avrdude/avrdude.mk |    2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 8eac014..7d9f5eb 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -1,15 +1,21 @@
 config BR2_PACKAGE_AVRDUDE
 	bool "avrdude"
-	select BR2_PACKAGE_LIBELF
+	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE # elfutils
+	depends on BR2_USE_WCHAR # elfutils
+	depends on !BR2_avr32 # elfutils
+	depends on !BR2_bfin # elfutils
 	help
 	  avrdude is a programmer for Atmel AVR microcontrollers
 	  this package provides a version with new linuxspi driver
 
 	  https://github.com/kcuzner/avrdude
 
-comment "avrdude needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "avrdude needs a toolchain w/ threads, largefile, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || !BR2_USE_WCHAR
+	depends on !BR2_avr32
+	depends on !BR2_bfin
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 7876c1d..03d6490 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -12,7 +12,7 @@ AVRDUDE_SUBDIR = avrdude
 # Sources coming from git, without generated configure and Makefile.in
 # files.
 AVRDUDE_AUTORECONF = YES
-AVRDUDE_DEPENDENCIES = libelf libusb libusb-compat ncurses \
+AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
 AVRDUDE_LICENSE = GPLv2+
 AVRDUDE_LICENSE_FILES = avrdude/COPYING
