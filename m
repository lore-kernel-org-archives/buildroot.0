From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 04 Apr 2018 22:39:21 +0200
Subject: [Buildroot] bash: /dev/fd/62: No such file or directory
In-Reply-To: <878ta2oh5g.fsf@dell.be.48ers.dk>
References: <1521154501.16532.15.camel@embedded.rocks>
 <874llggl14.fsf@dell.be.48ers.dk>
 <d624af0cde7298851332a2fc009f173562d99d98.camel@embedded.rocks>
 <877ept7r7w.fsf@dell.be.48ers.dk>
 <3dd2f190fef3d71e1b2f1f5ec6f4323e8ee8c745.camel@embedded.rocks>
 <87d0zeol26.fsf@dell.be.48ers.dk> <878ta2oh5g.fsf@dell.be.48ers.dk>
Message-ID: <cb3062d59adc88e5a9549c769bf499c76528511c.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2018-04-04 at 22:23 +0200, Peter Korsgaard wrote:
> > > > > > "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
> Hi,
> 
>  >> It turned out that nothing needs to be done for static /dev as the
>  >> symlinks are created now by the init system.
> 
>  > But how can that work? static /dev normally means readonly /dev.
> 
> That didn't come out very clear. What I wanted to say is that static
> /dev should also work on a readonly fs, so these symlinks should be made
> at build time, not at runtime.

I see!

I've rebuild the system with BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=n.

Snippet of the inittab file:

   # Startup the system
   ::sysinit:/bin/mount -t proc proc /proc
   #::sysinit:/bin/mount -o remount,rw /
   ::sysinit:/bin/mkdir -p /dev/pts
   ::sysinit:/bin/mkdir -p /dev/shm
   ::sysinit:/bin/mount -a
   ::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
   ::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
   ::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout
   ::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr
   ::sysinit:/bin/hostname -F /etc/hostname

On the system /dev is still writable:

   # echo 1 > /dev/1.txt
   # echo 1 > /root/1.txt
   -sh: /root/1.txt: Read-only file system

   # ls -l /dev/fd/*
   ls: /dev/fd/255: No such file or directory
   ls: /dev/fd/3: No such file or directory
   lrwx------    1 root     root            64 Jan  1 00:09 /dev/fd/0 -> /dev/ttyS0
   lrwx------    1 root     root            64 Jan  1 00:09 /dev/fd/1 -> /dev/ttyS0
   lrwx------    1 root     root            64 Jan  1 00:09 /dev/fd/2 -> /dev/ttyS0

   # bash -c "cat <(date)"
   Thu Jan  1 00:10:07 UTC 1970

J?rg
