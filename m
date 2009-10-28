From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Wed, 28 Oct 2009 09:26:20 -0700
Subject: [Buildroot] busybox question
In-Reply-To: <877hufddx5.fsf@macbook.be.48ers.dk>
References: <20091027211438.BEC2B7773A@busybox.osuosl.org>	<4AE7C7C5.8090001@cs.ucsb.edu>
	<877hufddx5.fsf@macbook.be.48ers.dk>
Message-ID: <4AE870AC.6070601@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Roman" == Roman Chertov <rchertov@cs.ucsb.edu> writes:
> 
>  Roman> Hello,
>  Roman> I have an ARM920T board that I am trying to get going with buildroot and
>  Roman> uClibc.  I managed to compile the kernel, and it boots up to the point
>  Roman> where the login must happen.  Nothing happens at that point.  However,
>  Roman> the machine runs as I can ping it.  I have tried to init=/bin/sh
>  Roman> init=/bin/ethtool, but I did not get any output to indicate that
>  Roman> something started.
> 
> And you have set console= to something sensible? What is the last output
> you get from the kernel?

console=ttyAM0,115200 ip=dhcp noinitrd root=/dev/nfs init=/sbin/init
nfsroot=192.168.0.1:/proj/tools/buildroot-2009.08/project_build_arm/uclibc/root/
This is my argument list to the kernel.

This was my last message from the kernel

VFS: Mounted root (nfs filesystem).

Freeing init memory: 120K

Based on Francisco's private email, I made some nodes in the /dev
directory as by default, buildroot creates only files and not device
files with major/minor numbers.  I made the nodes by copying some of the
devices from the board's default disk while it was running.  Now, when I
boot, I get the following repeating sequence.

can't open /dev/~: No such file or directory

can't open /dev/tty1: No such file or directory

can't open /dev/tty2: No such file or directory


Looks like the culprit, is the improper device setup.

> 
> Do you have software floating point support enabled in buildroot?
> (toolchain->Use software floating point by default)

This is not set.

> 
>  Roman> I have the following question.  I can build the default image on the
>  Roman> board (Debian 2.4, glibc) and mount the buildroot root fs over NFS.
>  Roman> However, if I try to execute any program, I get the following errors:
> 
>  Roman> root at ts7000:bin# ./busybox
>  Roman> -bash: ./busybox: No such file or directory
> 
> You'll probably have to chroot into the nfs dir to get the dynamic
> linker to work.

I will give this a shot later on today.

Thanks.

Roman

> 
> 
