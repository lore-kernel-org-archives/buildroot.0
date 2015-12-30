From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 09:53:47 +0100
Subject: [Buildroot] [PATCH 2/2] bfin: put the libc link path of the
 flat shared and sep data formats before the sysroot link path
In-Reply-To: <B168F8A49F4BCF4C84FD23DA5F6363EE75D82F29@NWD2MBX7.ad.analog.com>
References: <1426669156-24250-1-git-send-email-sonic.adi@gmail.com>
 <1426669156-24250-2-git-send-email-sonic.adi@gmail.com>
 <20151229220149.0fe86aac@free-electrons.com>
 <B168F8A49F4BCF4C84FD23DA5F6363EE75D82F29@NWD2MBX7.ad.analog.com>
Message-ID: <20151230095347.6e9a9197@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sonic,

First of all, thanks for replying so quickly. Since we haven't seen
much patches from you improving the Blackfin support in upstream
Buildroot, I wasn't sure you would answer our e-mail.

On Wed, 30 Dec 2015 06:55:57 +0000, Zhang, Sonic wrote:

> The right sysroot of the Blackfin toolchain is copied by the external
> toolchain logic in buildroot. The problem is that the libc files for
> FLAT, Shared FLAT and Shared FLAT with separate data formats are put
> into different subfolders of the same blackfin toolchain for FLAT
> binary.

Absolutely.

> Do you suggest to copy the libc for current FLAT format type
> into $(STAGING_DIR)/usr/lib in the toolchain copy logic? If so, I can
> send a new patch.

Yes, but this should normally happen "magically". Let me take an
example from another toolchain to illustrate how it works.

If you take the CodeSourcery ARM toolchain, it has three sysroots:

 - One for ARMv5 (the default one)
 - One for ARMv4
 - One for ARMv7 Thumb2

See below:

$ ./bin/arm-none-linux-gnueabi-gcc -print-file-name=libc.a
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../arm-none-linux-gnueabi/libc/usr/lib/libc.a
$ ./bin/arm-none-linux-gnueabi-gcc -march=armv4t -print-file-name=libc.a
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../arm-none-linux-gnueabi/libc/armv4t/usr/lib/libc.a
$ ./bin/arm-none-linux-gnueabi-gcc -march=armv7-a -mthumb -print-file-name=libc.a
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../arm-none-linux-gnueabi/libc/thumb2/usr/lib/libc.a

If I build an ARMv5 system in Buildroot, then the sysroot from libc/ will
be copied to $(STAGING_DIR) :

$ md5sum output/staging/usr/lib/libc.a 
0c6a145ebbc860800152c2d8c82e5af9  output/staging/usr/lib/libc.a
$ md5sum output/host/opt/ext-toolchain/bin/../arm-none-linux-gnueabi/libc/usr/lib/libc.a
0c6a145ebbc860800152c2d8c82e5af9  output/host/opt/ext-toolchain/bin/../arm-none-linux-gnueabi/libc/usr/lib/libc.a

If I now build an ARMv4 system in Buildroot, then the sysroot from
libc/armv4t/ will be copied to $(STAGING_DIR) :

$ md5sum output/staging/usr/lib/libc.a 
21109c9b68203d10437446d998d782c7  output/staging/usr/lib/libc.a
$ md5sum output/host/opt/ext-toolchain/bin/../arm-none-linux-gnueabi/libc/armv4t/usr/lib/libc.a
21109c9b68203d10437446d998d782c7  output/host/opt/ext-toolchain/bin/../arm-none-linux-gnueabi/libc/armv4t/usr/lib/libc.a

And finally, if I build an ARMv7 Thumb2 system in Buildroot, then the
sysroot from libc/thumb2/ will be copied to $(STAGING_DIR) :

$ md5sum output/staging/usr/lib/libc.a 
d94693412ceac0839883ed0ece38c43f  output/staging/usr/lib/libc.a
$ md5sum output/host/opt/ext-toolchain/bin/../arm-none-linux-gnueabi/libc/thumb2/usr/lib/libc.a
d94693412ceac0839883ed0ece38c43f  output/host/opt/ext-toolchain/bin/../arm-none-linux-gnueabi/libc/thumb2/usr/lib/libc.a

This all gets done magically by the existing external toolchain logic,
with no special handling for this CodeSourcery toolchain. In all three
cases, we end up with $(STAGING_DIR) containing a copy of the sysroot
that corresponds to the selected architecture flags. If you want to try
this out by ourself, try the following configurations:

 - For ARMv5

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y

 - For ARMv4

BR2_arm=y
BR2_arm920t=y
BR2_TOOLCHAIN_EXTERNAL=y

 - For ARMv7/Thumb2

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABI=y
BR2_ARM_SOFT_FLOAT=y
BR2_ARM_INSTRUCTIONS_THUMB2=y
BR2_TOOLCHAIN_EXTERNAL=y

Now, back to the Blackfin toolchain, if we ask gcc for the location of
libc.a (like I did before with the ARM toolchain), we get :

 - With no special flags

$ ./bin/bfin-uclinux-gcc -print-file-name=libc.a
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bfin-uclinux/bin/../bfin-uclinux/runtime/usr/lib/libc.a

 - With -mid-shared-library

$ ./bin/bfin-uclinux-gcc -mid-shared-library -print-file-name=libc.a
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bfin-uclinux/bin/../bfin-uclinux/runtime/usr/lib/mid-shared-library/libc.a

 - With -msep-data

$ ./bin/bfin-uclinux-gcc -msep-data -print-file-name=libc.a
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bfin-uclinux/bin/../bfin-uclinux/runtime/usr/lib/msep-data/libc.a

As you can see, it behaves like the CodeSourcery ARM toolchain:
depending on the gcc flags passed, it points to a different sysroot. So
my expectation is that the external toolchain logic that works for the
CodeSourcery ARM toolchain should also work for the ADI Blackfin
toolchain. Note that Buildroot specifically uses the location of libc.a
to determine where the sysroot is. See:

# Returns the location of the libc.a file for the given compiler + flags
define toolchain_find_libc_a
$$(readlink -f $$(LANG=C $(1) -print-file-name=libc.a))
endef

Can you investigate why the external toolchain logic doesn't work for
the Blackfin use case, and whether it can be fixed/extended to cover
this case ?

I saw your patch, which could be a work-around specific to the Blackfin
toolchain. It takes into account the mid-shared-library and msep-data
cases, but it doesn't take into account the other sysroot available in
the Blackfin toolchain:

$ ./output/host/opt/ext-toolchain/bfin-uclinux/bin/bfin-uclinux-gcc -print-multi-lib
.;
bf532-none;@mcpu=bf532-none
mid-shared-library;@mid-shared-library
msep-data;@msep-data
bf532-none/mid-shared-library;@mcpu=bf532-none at mid-shared-library
bf532-none/msep-data;@mcpu=bf532-none at msep-data

So we would have to add other cases for the bf532-none flag (but what
is this flag ? the gcc documentation documents -mcpu=bf532, but
certainly not -mcpu=bf532-none).

Could you look into this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
