From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Wed, 28 Oct 2009 12:35:26 -0700
Subject: [Buildroot] busybox question
In-Reply-To: <4AE87550.9090603@toumaz.com>
References: <20091027211438.BEC2B7773A@busybox.osuosl.org>	<4AE7C7C5.8090001@cs.ucsb.edu>	<877hufddx5.fsf@macbook.be.48ers.dk>
	<4AE870AC.6070601@cs.ucsb.edu> <4AE87550.9090603@toumaz.com>
Message-ID: <4AE89CFE.5050406@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Emmanuel,

I have created a tar fs and then untarred as root so that mknod would
work properly.  I have then rebooted the board and pointed it to the new
file system.  I get the uClibc prompt, but I can't log in.  This means
that busybox is working.  However, I suspect that the serial line is not
configured correctly in inittab. (I added ttyS0, ttyS1, and ttyAM0)

However, I also modified /etc/init.d/rcS to print a debug message (echo
-n).  I have also modified rcC to call script which would reboot the
board in 2 minutes.  That would allow me to make changes to the rootfs
and then try booting the whole thing again.  However, I don't see the
debug messages, the sshd, snmpd, ntp, startup messages (rcS is supposed
to invoke those).  Also, my auto reboot does not work.  I suspect that
init never called the /etc/init.d/rcS file.

I would appreciate any hints regarding this.

Roman

Emmanuel Riou wrote:
> Hi Roman,
> 
> please see my comments inline,
> 
> Roman Chertov wrote:
>> Peter Korsgaard wrote:
>>>>>>>> "Roman" == Roman Chertov <rchertov@cs.ucsb.edu> writes:
>>>  Roman> Hello,
>>>  Roman> I have an ARM920T board that I am trying to get going with
>>> buildroot and
>>>  Roman> uClibc.  I managed to compile the kernel, and it boots up to
>>> the point
>>>  Roman> where the login must happen.  Nothing happens at that point. 
>>> However,
>>>  Roman> the machine runs as I can ping it.  I have tried to init=/bin/sh
>>>  Roman> init=/bin/ethtool, but I did not get any output to indicate that
>>>  Roman> something started.
>>>
>>> And you have set console= to something sensible? What is the last output
>>> you get from the kernel?
>>
>> console=ttyAM0,115200 ip=dhcp noinitrd root=/dev/nfs init=/sbin/init
>> nfsroot=192.168.0.1:/proj/tools/buildroot-2009.08/project_build_arm/uclibc/root/
>>
>> This is my argument list to the kernel.
>>
>> This was my last message from the kernel
>>
>> VFS: Mounted root (nfs filesystem).
>>
>> Freeing init memory: 120K
>>
>> Based on Francisco's private email, I made some nodes in the /dev
>> directory as by default, buildroot creates only files and not device
>> files with major/minor numbers.  I made the nodes by copying some of the
>> devices from the board's default disk while it was running.  Now, when I
>> boot, I get the following repeating sequence.
>>
>> can't open /dev/~: No such file or directory
>>
>> can't open /dev/tty1: No such file or directory
>>
>> can't open /dev/tty2: No such file or directory
>>
> You have to configure buildroot to generate a tar archive of your
> filesystem, since buildroot uses fakeroot to create the /dev files in
> the archive (buildroot can't create the /dev files in your project
> directory as you are not root). You just have to untar this archive then
> to get your complete root filesystem you're gonna mount via NFS.
> 
> Hope this helps,
> 
> Emmanuel.
> 
> 
>>
>> Looks like the culprit, is the improper device setup.
>>
>>> Do you have software floating point support enabled in buildroot?
>>> (toolchain->Use software floating point by default)
>>
>> This is not set.
>>
>>>  Roman> I have the following question.  I can build the default image
>>> on the
>>>  Roman> board (Debian 2.4, glibc) and mount the buildroot root fs
>>> over NFS.
>>>  Roman> However, if I try to execute any program, I get the following
>>> errors:
>>>
>>>  Roman> root at ts7000:bin# ./busybox
>>>  Roman> -bash: ./busybox: No such file or directory
>>>
>>> You'll probably have to chroot into the nfs dir to get the dynamic
>>> linker to work.
>>
>> I will give this a shot later on today.
>>
>> Thanks.
>>
>> Roman
>>
>>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 
