From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 14 Mar 2008 12:55:14 +0000
Subject: [Buildroot] Problem patching linux
Message-ID: <47DA75B2.50004@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I have a custom board in target/device/my_board. Inside that folder I 
have a kernel_patches folder and I have changed the config so that it 
should apply my patches.

It all works when applying the patches for the kernel headers, but it 
fails to patch the actual kernel. This is because of the different ways 
the patch-kernel.sh script is called.

In kernel-headers-new.makefile it is:
	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) 
$(KERNEL_HEADERS_PATCH_DIR) \
		\*.patch{,.gz,.bz2}

But in the linux Makefile.in it is:
	toolchain/patch-kernel.sh $(LINUX26_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}

The regex is much tougher when actually patching the kernel. The problem 
I have it that my patch files are all in this format:

012-linux-2.6.22.19-some_patch

I need the numbers at the beginning to ensure they get patched in the 
right order.

How should I fix this? How should my patch files be named? Is this just 
a bug in the patching of the kernel?

Thanks,

Will.
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
