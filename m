From: Sven Neumann <s.neumann@phase-zero.de>
Date: Tue, 20 Jan 2009 17:50:15 +0100
Subject: [Buildroot] Trouble with buildroot for ARM EABI
In-Reply-To: <034D9638-D4E9-4DED-98B3-005DEBB99B00@caiaq.de>
References: <034D9638-D4E9-4DED-98B3-005DEBB99B00@caiaq.de>
Message-ID: <1232470215.6666.24.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, 2009-01-17 at 01:26 +0100, Daniel Mack wrote:

> As far as we tracked things down, at least one of the culprits is the  
> uClibc package which does not generate bits/sysnum.h correctly. The  
> file include/unistd.h that ships with the kernel defines the syscall  
> numbers depending on __ARM_EABI__, which is not set correctly by  
> uclibc when it is included to generate sysnum.h. Hence, the generated  
> file (eventually in build_arm/staging_dir/usr/include/bits/sysnum.h)  
> contains false assumptions about the offset of syscalls as it sets it  
> to 0x900000 which is only valid for OABI. The effect of this  
> misbehaviour are instantly crashing target binaries, at least when  
> OABI compat support is switched off in the kernel config.

__ARM_EABI__ is a define built into gcc. So the proper fix is to make
sure that gcc is built for the correct target. It seems that it is
possible to create a buildroot configuration where this is not the case.

We have now configured our build for ARM with iwmmxt. After I manually
change the gcc target suffix to 'linux-uclibcgnueabi' everything started
to work out correctly. Perhaps the buildroot config system should try
harder to make sure that this is correctly set.

The relevant parts of our working .config are:

 BR2_GCC_TARGET_TUNE="iwmmxt"
 BR2_GCC_TARGET_ARCH="iwmmxt"
 BR2_GCC_TARGET_ABI="iwmmxt"
 BR2_TARGET_ARM=y
 BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"

Unfortunately strace does not compile with this setup. But that's a
different probelem...


Sven
