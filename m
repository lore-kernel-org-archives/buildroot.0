From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:21:58 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/flashrom:
	security bump to version 0.9.9
Message-ID: <20170601144623.AA4CE8296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=567d01e0dc994b218bb18f84d5702dadbde1490c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes buffer overflow:
https://mail.coreboot.org/pipermail/flashrom/2016-March/014523.html

Removed patch 0002-sys-io.h.patch, not needed anymore, hwaccess.h now
contains a similar fix:

  elif defined(__linux__) || defined(__GLIBC__)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit db55de2b42a54ca715a7aa3ed6e388ea6f557092)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flashrom/0002-sys-io.h.patch | 27 ---------------------------
 package/flashrom/flashrom.hash       |  2 +-
 package/flashrom/flashrom.mk         |  2 +-
 3 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/package/flashrom/0002-sys-io.h.patch b/package/flashrom/0002-sys-io.h.patch
deleted file mode 100644
index 8d990c6..0000000
--- a/package/flashrom/0002-sys-io.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-hwaccess: sys/io.h is not specific to glibc
-
-Under Linux, sys/io.h provides inb and outb, so we really need it.
-However, its inclusion is conditional to the _GLIBC_ define. This is
-usually OK under Linux, since both glibc and uClibc define it (uclibc
-fakes being glibc).
-
-But the musl C library does not impersonate glibc, so we're missing
-including sys/io.h in this case.
-
-Change the include from checking _GLIBC_ to checking whether this is
-Linux, looking for the __linux__ define.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN flashrom-0.9.8.orig/hwaccess.h flashrom-0.9.8/hwaccess.h
---- flashrom-0.9.8.orig/hwaccess.h	2015-02-10 09:03:10.000000000 +0100
-+++ flashrom-0.9.8/hwaccess.h	2015-10-28 20:01:54.259202484 +0100
-@@ -27,7 +27,7 @@
- #include "platform.h"
- 
- #if IS_X86
--#if defined(__GLIBC__)
-+#if defined(__linux__)
- #include <sys/io.h>
- #endif
- #endif
diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index a216869..64b67b9 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 13dc7c895e583111ecca370363a3527d237d178a134a94b20db7df177c05f934 flashrom-0.9.8.tar.bz2
+sha256 cb3156b0f63eb192024b76c0814135930297aac41f80761a5d293de769783c45  flashrom-0.9.9.tar.bz2
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 7e0fcf2..7ebda33 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 0.9.8
+FLASHROM_VERSION = 0.9.9
 FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = http://download.flashrom.org/releases
 FLASHROM_DEPENDENCIES = pciutils libusb libusb-compat libftdi host-pkgconf
