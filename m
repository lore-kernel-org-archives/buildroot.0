From: Eric Malkowski <eric@bvwireless.net>
Date: Mon, 4 Dec 2006 21:37:41 -0500 (EST)
Subject: [Buildroot] Building 2.6.19 with Soekris 4801 target
Message-ID: <33915.10.1.2.50.1165286261.squirrel@bvwireless.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi-

I wanted to build up the latest buildroot w/ latest kernel for a Soekris
4826 board (same as 4801 w/ different interfaces) and wanted to report I
had to modify the toolchain/kernel-headers/kernel-headers.mk file to get
uClibc 0.9.28's "fix_includes.sh" script to be happy.

I built w/ the following options:

Target Arch: i386
Variant:     i586
Headers:     2.6.19  (uses full kernel to snarf headers -- nice)
uClibc:      0.9.28  (not snapshot)
Binutils:    2.16.91.0.7
GCC:         3.4.2
Busybox:     1.2.2   (not snapshot)
kernel:      2.6.19

Using the following from target/device/Soekris/net4801
by picking it in main buildroot config as target device:

busybox.config
linux.config (modified to trim it down tight / geode w/ 27mhz clock etc)
linux.mk     (which is different than more recent device/x86/i386/linux.mk)
uClibc.config   (had to re-capture because first build stopped to ask
questions the uClibc.config checked into svn doesn't have defaults for)

I had to add to "Target Optimizations" -march=i586 to give myself the
confidence everything would be built optimized for 586 instead of 386 to
get the most out of the geode processor (I wanted to see -march=i586 on
all compile lines for packages like openssh, ssl, wireless tools, etc
which is about the extent of my package selections).

Is the default binutils 2.1.16.91.0.7 and gcc 3.4.2 the best things to use
for 2.6.19 w/ uclibc 0.9.28 ??  should I use a newer gcc / binutils for
any reason?

Anyway - The uClibc 0.9.28's fix_includes.sh script in extra/scripts under
it's tree would whine about not being able to detect the version of the
kernel and bail out.  make headers_install of full tree yields an
include/linux/version.h that doesn't have UTS_RELEASE defined and no
uts_release.h file.

I saw that fix_includes.sh would be happy w/ a $KERNEL_SOURCE/Makefile
which is what Erik's pre-made kernel headers packages in the past would
provide.

So I made the following mod to toolchain/kernel-headers/kernel-headers.mk
to copy over the 2.6.19 top level Makefile to the linux headers dir and
voila:

[malk at testbed buildroot]$ svn diff toolchain/kernel-headers/kernel-headers.mk
Index: toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- toolchain/kernel-headers/kernel-headers.mk  (revision 16776)
+++ toolchain/kernel-headers/kernel-headers.mk  (working copy)
@@ -150,6 +150,7 @@
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
        (cd $(LINUX_HEADERS_UNPACK_DIR) ; \
         $(MAKE) ARCH=$(KERNEL_ARCH) INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR)
headers_install)
+       cp $(LINUX_HEADERS_UNPACK_DIR)/Makefile $(LINUX_HEADERS_DIR)
        touch $(LINUX_HEADERS_DIR)/.configured
 else
 # the sanitized kernel-headers


Not sure if the above is the right fix, but it works for me w/ this config.
Was pretty smooth booting up my 4826 over the network via pxeboot.  I find
the 27 mhz clock "takeover" for the buggy tsc that doesn't tick when halt
instruction is executed a little whacky, but it looks good.  I'll try some
tests to see how nice the high res timer stuff looks (fine grained
select() timeouts I would assume).  I absolutely love linux as an embedded
OS and high res timers / more real-time capable 2.6 kernel etc. are things
that make a buildroot type setup like this very attractive.  Thanks for
everyone's work in keeping uClibc and buildroot going.

-Eric
