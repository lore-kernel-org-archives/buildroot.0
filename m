From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 04 Apr 2018 22:22:15 +0200
Subject: [Buildroot] bash: /dev/fd/62: No such file or directory
In-Reply-To: <87d0zeol26.fsf@dell.be.48ers.dk>
References: <1521154501.16532.15.camel@embedded.rocks>
 <874llggl14.fsf@dell.be.48ers.dk>
 <d624af0cde7298851332a2fc009f173562d99d98.camel@embedded.rocks>
 <877ept7r7w.fsf@dell.be.48ers.dk>
 <3dd2f190fef3d71e1b2f1f5ec6f4323e8ee8c745.camel@embedded.rocks>
 <87d0zeol26.fsf@dell.be.48ers.dk>
Message-ID: <45b7cb6058f51f80dca92205e39fc3a066dbc80e.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2018-04-04 at 20:58 +0200, Peter Korsgaard wrote:
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
> Hi,
> 
>  >> > but I am unsure how to add those symlinks to the static
>  >> > /dev. makedevs does not support symbolic links.
>  >> 
>  >> Heh, you are right. We can either:
>  >> 
>  >> - Add a BASH_ROOTFS_PRE_CMD_HOOKS hook in bash.mk if static /dev is used
>  >> to create these symlinks
>  >> 
>  >> - Extend the makedevs code to also support symlinks
>  >> 
>  >> - Completely ignore this issue for static /dev
>  >> 
>  >> The first option is probably the easiest/nicest.
> 
>  > It turned out that nothing needs to be done for static /dev as the
>  > symlinks are created now by the init system.
> 
> But how can that work? static /dev normally means readonly /dev.

I've tested this with the following config fragment:

   BR2_ROOTFS_DEVICE_CREATION_STATIC=y
   BR2_SYSTEM_BIN_SH_BASH=y
   BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y

Running on the target:

   # ls -l /dev/fd*
   lrwxrwxrwx    1 root     root            13 Jan  1 00:00 /dev/fd -> /proc/self/fd
   # ls -l /dev/fd*/**
   ls: /dev/fd/255: No such file or directory
   ls: /dev/fd/3: No such file or directory
   lrwx------    1 root     root            64 Jan  1 00:01 /dev/fd/0 -> /dev/ttyS0
   lrwx------    1 root     root            64 Jan  1 00:01 /dev/fd/1 -> /dev/ttyS0
   lrwx------    1 root     root            64 Jan  1 00:01 /dev/fd/2 -> /dev/ttyS0
   # bash -c 'read x< <(echo 1); echo $x'
   1

Not sure it is really readonly. I thought that it means no dynamic device nodes are created...

J?rg
