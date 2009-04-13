From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2009 22:12:19 +0200
Subject: [Buildroot] Simple glibc-based external toolchain support
Message-ID: <20090413221219.0819d500@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xSimple glibc-based external toolchain support

The current Buildroot works just well with sysrootable glibc
toolchains, using the external toolchain feature. The only thing that
needs to be customized is the set of libraries that must be compiled
to the target.

The following patch takes a simple approach to making it easier for
users to use glibc toolchains. It just adds a uClibc/glibc choice in
the external toolchain menu. Then, depending on that selection, the
configuration system will choose a sane default value for the library
files list.

The other advantage of having a uClibc/glibc choice is that in the
future, we'll be able to add checks verifying that the external
toolchain configuration matches the features selected in Buildroot (in
terms of IPv6, RPC, locales or large file support).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/Config.in |   22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

Index: buildroot/toolchain/external-toolchain/Config.in
===================================================================
--- buildroot.orig/toolchain/external-toolchain/Config.in
+++ buildroot/toolchain/external-toolchain/Config.in
@@ -1,9 +1,24 @@
 #
 
 if BR2_TOOLCHAIN_EXTERNAL
+choice
+	prompt "External toolchain C library"
+	default BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+
+config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	bool "uClibc"
+
+config BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	bool "glibc"
+
+endchoice
+
+menu "Library files"
+
 config BR2_TOOLCHAIN_EXTERNAL_LIB_C
 	string "The core C library from the external toolchain"
-	default "libc.so.0"
+	default "libc.so.0" if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	default "libc.so.6" if BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
 	  Specify the core C shared library found in the external
 	  toolchain. This is required in addition to any other
@@ -11,13 +26,16 @@
 
 config BR2_TOOLCHAIN_EXTERNAL_LIBS
 	string "Libraries to copy from the external toolchain"
-	default "ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"
+	default "ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0" if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	default "ld-linux.so.3 libcrypt.so.1 libdl.so.2 libgcc_s.so.1 libm.so.6 libnsl.so.1 libpthread.so.0 libresolv.so.2 librt.so.1 libutil.so.1 libnss_files.so.2" if BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
 	  A space separated list of the shared libraries to be copied
 	  from the external toolchain into the root filesystem. Only
 	  the top-level name is needed, i.e. libc.so, libpthread.so as
 	  the actual shared library symlinked to will be copied also.
 
+endmenu
+
 config BR2_TOOLCHAIN_EXTERNAL_STRIP
         bool
         default y


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
