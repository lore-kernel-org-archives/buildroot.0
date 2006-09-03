From: don <don_reid@comcast.net>
Date: Sun, 3 Sep 2006 16:52:14 -0700
Subject: [Buildroot] Kernel Module compiled outside kernel
Message-ID: <20060903235214.GA16191@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK, I decided that trying to use ndiswrapper wasn't such a good idea,
and that maybe no-one in the buildroot/uclibc community wanted to help.

So I managed to find another network card.  But this one needs the
madwifi driver which is mostly open source (there is a binary HAL).

This produces the same error, which I think will happen for any separate
kernel module.  This seems to be something basic with the toolchain as
buildroot sets it up.

Can anyone compile a kernel module from outside the kernel source tree?


The Makefile uses:

	$(MAKE) -C $(KERNELPATH) SUBDIRS=$(shell pwd) modules

I have KERNELPATH set right.

The log output is:  (I've shortend the paths by removing the buildroot loc.)
 
 	make -C .../build_i486/linux-2.6.11.5 SUBDIRS=.../build_i486/madwifi-0.9.2 modules
	make[2]: Entering directory `.../build_i486/linux-2.6.11.5'
	CC [M]
	.../build_i486/madwifi-0.9.2/ath/ah_osdep.o
	.../build_i486/staging_dir/lib/gcc/i486-linux-uclibc/3.4.5/../../../../i486-linux-uclibc/bin/ld:
	cannot find -lgcc_s

This library is present in what looks like the right place(s):

	build_i486/root/lib/libgcc_s.so -> libgcc_s.so.1
	build_i486/root/lib/libgcc_s.so.1
	build_i486/staging_dir/lib/libgcc_s.so -> libgcc_s.so.1
	build_i486/staging_dir/lib/libgcc_s.so.1
	toolchain_build_i486/gcc-3.4.5-final/gcc/libgcc_s.so -> libgcc_s.so.1
	toolchain_build_i486/gcc-3.4.5-final/gcc/libgcc_s.so.1


I have tried several ways to track down the details of what is going on.
Setting gcc's verbose flag results in a bizarre error that I will report 
in a separate message.

Don Reid
