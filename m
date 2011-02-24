From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Feb 2011 12:53:14 +0100
Subject: [Buildroot] Unable to login to buildroot
In-Reply-To: <201102241048.48537.dargaud@lpsc.in2p3.fr> (Guillaume Dargaud's
	message of "Thu, 24 Feb 2011 10:48:48 +0100")
References: <201102241048.48537.dargaud@lpsc.in2p3.fr>
Message-ID: <87pqqhr6mt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:

Hi,

 Guillaume> Welcome to the Gandalf acquisition
 Guillaume> gandalf login: root
 Guillaume> Jan  1 00:00:10 login[254]: root login on 'ttyUL0'

 Guillaume> Welcome to the Gandalf acquisition
 Guillaume> gandalf login:

 Guillaume> And it repeats... I also cannot login via ssh (I configured
 Guillaume> dropbear) and I have a feeling none of the init.d scripts
 Guillaume> got started. I use the default inittab.

The default skeleton doesn't have a password set for root, and dropbear
doesn't allow root login without a password.

 Guillaume> The drive is mounted via nfs, and there are some missing
 Guillaume> stuff (when looking at them from the NFS server side):
 
 Guillaume> $ ll proc tmp
 Guillaume> proc:
 Guillaume> total 8
 Guillaume> drwxr-xr-x  2 root root 4096 Feb 24 08:31 ./
 Guillaume> drwxr-xr-x 16 root root 4096 Feb 24 09:19 ../

 Guillaume> tmp:
 Guillaume> total 12
 Guillaume> drwxrwxrwt  3 root root 4096 Feb 24 09:24 ./
 Guillaume> drwxr-xr-x 16 root root 4096 Feb 24 09:19 ../
 Guillaume> drwxr-xr-x  2 root root 4096 Feb 24 08:54 ldconfig/
 Guillaume> -rw-r--r--  1 root root    0 Feb 24 09:24 utmp

Looks normal. Proc is a virtual filesystem and /tmp/ is normally a
ramdisk.

 Guillaume> Anything I overlooked ?

Not as far as I can see. You are creating your nfsroot from rootfs.tar
and extracting as root, right?

 Guillaume> Bonus question: if you configure buildroot without an FPU,
 Guillaume> then what is the difference between hard floats and soft
 Guillaume> floats ? Why can you have both and what is preferable ?

Hard float means let the compiler insert hardware FPU instructions
in the code stream whenever floating point calculations are done. Soft
float means add calls to software emulation functions instead.

On a system without a hardware FPU you CAN run hard float binaries if
you have configured the kernel to emulate those instructions, but it
will be very slow. Soft float is preferred.

-- 
Bye, Peter Korsgaard
