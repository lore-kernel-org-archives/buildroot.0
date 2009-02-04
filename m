From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Feb 2009 13:29:17 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Tue\, 3 Feb 2009
	23\:49\:10 -0200")
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
Message-ID: <873aeue676.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> Hi,
 Thiago>     I thought it was seattled sometime last year that kernel names
 Thiago> would not include timestamps or any think that breaks u-boot from
 Thiago> loading the kernel.

 Thiago>     I just had atngw100-linux-2.6.27.13-20090203.gz for a kernel name.
 Thiago> It's already bad enough that rootfs has stupid timestamps, we don't
 Thiago> really need kernel binaries too. If I wanted to preserve binaries, I
 Thiago> would copy them over before building again. Whenever I type make, I
 Thiago> expect things to be overwritten.

The rootfs timestamp is because your defconfig sets the
BR2_ROOTFS_SUFFIX to a nonstandard value.

I had a look at target/linux/Makefile.in.advanced and see that it
uses:

LINUX26_KERNEL:=$(BINARIES_DIR)/$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)

whereas the normal (!advanced) Linux config uses:

LINUX26_KERNEL:=$(BINARIES_DIR)/linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)

To me the sane thing would just be for the files to be named whatever
the kernel names them (uImage/zImage/bzImage/..), but even if we don't
do that we should atleast make the 2 Linux types use the same style.

We can add BR2_KERNEL_PREFIX/SUFFIX (defaulting to "") if people
really to do something special.

Ulf, what do you say?

-- 
Bye, Peter Korsgaard
