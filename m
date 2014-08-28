From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Date: Thu, 28 Aug 2014 12:29:47 +0200
Subject: [Buildroot] [PATCH V2 2/4] avrdude: Depend on elfutils instead of
	libelf to get the libelf library
In-Reply-To: <1409221789-18567-1-git-send-email-gregory.clement@free-electrons.com>
References: <1409221789-18567-1-git-send-email-gregory.clement@free-electrons.com>
Message-ID: <1409221789-18567-3-git-send-email-gregory.clement@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The elfutils package provides a more recent version of the libelf, so
let's use it. It will allow to remove the libelf package and to avoid
conflicts with two packages providing the same library.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 package/avrdude/Config.in  | 6 +++++-
 package/avrdude/avrdude.mk | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 8eac014..9a9b3fb 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -1,10 +1,14 @@
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
-- 
1.9.1
