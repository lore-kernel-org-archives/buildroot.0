From: Daniel Mack <daniel@caiaq.de>
Date: Sat, 17 Jan 2009 01:26:42 +0100
Subject: [Buildroot] Trouble with buildroot for ARM EABI
Message-ID: <034D9638-D4E9-4DED-98B3-005DEBB99B00@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

we've been hunting down weird effects regarding a build for ARM EABI  
with the 20090113 br2 snapshot.

As far as we tracked things down, at least one of the culprits is the  
uClibc package which does not generate bits/sysnum.h correctly. The  
file include/unistd.h that ships with the kernel defines the syscall  
numbers depending on __ARM_EABI__, which is not set correctly by  
uclibc when it is included to generate sysnum.h. Hence, the generated  
file (eventually in build_arm/staging_dir/usr/include/bits/sysnum.h)  
contains false assumptions about the offset of syscalls as it sets it  
to 0x900000 which is only valid for OABI. The effect of this  
misbehaviour are instantly crashing target binaries, at least when  
OABI compat support is switched off in the kernel config.

We tried that on different Debian/unstable boxed which all show equal  
effects. I really wonder why nobody else stumbled over this issue  
before. Could anyone shed some light on and propose a fix for this  
issue?

Thanks,
Daniel
