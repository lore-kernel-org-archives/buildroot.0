From: Eric Malkowski <eric@bvwireless.net>
Date: Mon, 12 Nov 2007 10:29:41 -0500 (EST)
Subject: [Buildroot] My tweeks/fixes to get a mostly default system working
 w/ 2.6.23.1 kernel
Message-ID: <35333.74.94.141.114.1194881381.squirrel@bvwireless.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've used buildroot for a few years now and was getting ready to start a
new project so I grabbed the latest tree last week and had some things I
had to work through I thought I'd share in case it helps newbies etc.

1. ssh segfaults due to no progname extern  (segfault kernel message and
immediate "segmentation fault" by all openssh programs.

The default config for 0.9.29 uclibc has no program invocation name
support.  In the main config under "Toolchain --->" select the "Enable
program invocation name" option.  This may fix segfaults in python and
other programs that use that external vars at startup -- I saw someone
struggling w/ that back in october.  This was not an obvious one to track
down and took a bit of time so I thought I'd share.

2. Simple latest kernel 2.6.23.1 support

For this I went with the "simple" kernel selection (kernel headers and
kernel binary are the same) and added the following:

===================================================================
--- toolchain/kernel-headers/Config.in  (revision 20365)
+++ toolchain/kernel-headers/Config.in  (working copy)
@@ -77,6 +77,10 @@
                depends !BR2_avr32 && !BR2_nios2
                bool "Latest Linux 2.6.23.x kernel headers"

+       config BR2_KERNEL_HEADERS_2_6_23_1
+               depends !BR2_avr32 && !BR2_nios2
+               bool "Linux 2.6.23.1 kernel headers"
+
        config BR2_KERNEL_HEADERS_SNAP
                bool "Linux 2.6 snapshot"
                depends !BR2_avr32
@@ -131,5 +135,6 @@
        default "2.6.22.10"     if BR2_KERNEL_HEADERS_2_6_22_10
        default "2.6.22.10"     if BR2_KERNEL_HEADERS_2_6_22
        default "2.6.23"        if BR2_KERNEL_HEADERS_2_6_23
+       default "2.6.23.1"      if BR2_KERNEL_HEADERS_2_6_23_1
        default "2.6"           if BR2_KERNEL_HEADERS_SNAP

I tried using the advanced kernel setup and tried to get it to do kernel
2.6.23.1, but no matter what I chose, it always downloaded 2.6.23 for
kernel headers.  I didn't try telling it to grab any patches and really
wanted it to just get 2.6.23.1 and do in-kernel headers and build a
vanilla 2.6.23.1 kernel w/ no extra patches or anything special.  The
above hack did this nicely for me.

3. quagga 0.99.9 fails to build w/ link errors about rpl_malloc and
rpl_realloc.  Also, quagga was installing static ".a" libs and an unneeded
info file in the target.  My hacks to fix this (the remove of the .a
should be generalized -- I'm only building ospf and zebra):

[malk at lightning buildroot]$ svn diff package/quagga/quagga.mk
Index: package/quagga/quagga.mk
===================================================================
--- package/quagga/quagga.mk    (revision 20365)
+++ package/quagga/quagga.mk    (working copy)
@@ -139,6 +139,8 @@
        (cd $(QUAGGA_DIR); rm -rf config.cache; \
                $(TARGET_CONFIGURE_OPTS) \
                $(TARGET_CONFIGURE_ARGS) \
+               ac_cv_func_malloc_0_nonnull=yes \
+               ac_cv_func_realloc_0_nonnull=yes \
                ./configure \
                --target=$(GNU_TARGET_NAME) \
                --host=$(GNU_TARGET_NAME) \
@@ -157,6 +159,9 @@

 $(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY): $(QUAGGA_BINARY)
        $(MAKE) DESTDIR=$(TARGET_DIR) -C $(QUAGGA_DIR) install
+       rm -f $(TARGET_DIR)/usr/lib/libospf.a \
+             $(TARGET_DIR)/usr/lib/libzebra.a
+
 ifneq ($(BR2_PACKAGE_QUAGGA_HEADERS),y)
        rm -rf $(TARGET_DIR)/usr/include/quagga
 endif
@@ -165,6 +170,7 @@
 endif
 ifneq ($(BR2_HAVE_INFOPAGES),y)
        rm -rf $(TARGET_DIR)/usr/info
+       rm -f $(TARGET_DIR)/usr/share/info/*
 endif

 quagga: uclibc $(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY)


4. stunnel fails to build complaining it can't locate SSL.  I haven't
looked into this one yet, but I will probably need stunnel for what I'm
doing, so I'll work on getting it working.

5. uclibc config during kernel-headers at the beginning kept going
interactive on me.  Per the norm after building w/ defaults I went into
toolchain_build_i486/uClibc-0.9.29 and did make menuconfig to select what
I wanted for uclibc config and copied it over to
local/<project>/<project>.config   Doing a full scratch build would result
in uclibc config going interactive because it would get confused over
multiple definitions of CONFIG_486=y  This is because the kernel-keaders
make stuff uses a bunch of sed commands to add in uclibc config
customizations based on top level BR2 config items.  I had to manually
remove the stuff the sed commands set or take the default config under
toolchain/uClibc/uClibc-0.9.29.config and manually turn on or off the
options I wanted to mess with file edits since that file has the stuff
tweeked with sed commands already pruned out.  Not a big deal, but I like
to kick builds off that don't go interactive and I think my uClibc config
is settled into what I want.

6. The "project" stuff is nice.  I did a "make saveconfig" to get started
and then gradually kept tweeking my various configs to my liking and
manually copying them down into local/<project>.  I found the need at
times to build the whole thing as if I did a fresh checkout to make sure
configs wouldn't go interactive (newer kernel options stopping to ask etc)
-- I used this script to remove all the stuff that is ignored by
subversion w/ the exception of the DL dir.  WARNING: use at your own risk
-- could do DAMAGE if your svn is ignoring things you want to keep! 
comment out the rm -rf to see what it would remove if you want to clean
the tree:

[malk at lightning buildroot]$ cat rm-ignore.sh
#!/bin/sh

for file in `svn status --no-ignore | egrep '^I' | awk '{print $2}' |
egrep -v '^dl$'`
do
   echo $file
   rm -rf $file
done

rm -f .auto.deps


7. force regenerating the project_build_ARCH/<project>/root directory on a
rebuild.  In the past I used to remove the root directory to force
re-doing everything from the skeleton and installing all stuff in there
from an empty root dir.  To do this I built everything from scratch saved
the root dir, and then wiped it and re-ran make and found a few things
needed to be purged to get the various dependencies to re-build the root
dir and include everything a full scratch build would do.  Use at your own
risk -- when enabling or disabling various packages or adding / removing
various target skeleton files, it's handy to regen the "root" directory
completely on a quick re-invocation of make.  This seemed to work for me
after a complete build:

[malk at lightning buildroot]$ cat rebuild_root.sh
#!/bin/sh

set -x

rm -f build_i486/grub-0.97/.installed
rm -f toolchain_build_i486/gcc-4.2.1-final/.libs_installed

rm -rf project_build_i486/wireless/root
rm -f project_build_i486/wireless/.root
rm -f build_i486/staging_dir/.fakeroot.00000

make


The thing I found strange that I didn't have issues with in the older gcc
3.x.x buildroot days was needing to remove ".libs_installed" to get it to
install the libgcc shared lib back into the root tree.  In the past I
didn't need to do that.


8. Taking local/<project>/ files w/ a freshly checked out tree (or after
run of rm-ignore.sh script above) and quickly building w/ the config files
from you local/<project>:  I would do the following to build the whole
tree:

./rm-ignore.sh

various stuff removed, clean tree w/ just local mods to files under svn
control and your local/<project> files are available

cp local/wireless/wireless.config .config
make oldconfig
make 2>&1 | tee build_everything.log


The above uses the project stuff nicely when setup to use a project w/ the
main buildroot config.

I hope none of my commentary steers anyone in the wrong direction...  but
this was just some notes on my goal to go w/ latest stable linux kernel
and a bunch of configuration to build up an x86 rootfs and kernel to boot
on soekris or PC engines wrap hardware for my wireless toys.

Perhaps folks with the same intentions could benefit when using the latest
buildroot.
