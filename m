From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Wed, 23 Apr 2008 10:56:10 +0200
Subject: [Buildroot] Failing NFS root mount
References: <067701c8a475$2df6d860$ad289e86@LPSC0173W>
	<20080422140727.GA32518@cloud.net.au>
Message-ID: <06fe01c8a51f$e37d5470$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replies to multiple people here:

>> If I'm using ash (linked to busybox), then I can chroot okay (problems 
>> with
>> /proc but I can run executables).
>
> What if you boot the system in that configuration?
>
> You will need to mount /proc in the chroot too btw, and maybe /tmp and
> /dev/pts too depending on what you run in there.

If I do "mount -a" after I chroot into my nfs dir, things work fine.

Question: the exported nfs dir, must be "chown -R root:root" beforehand, 
right ? If I don't do so, then I can't do much with it, but I didn't see 
this fact stated anywhere.

>> Question: if booting off NFS, do I need to change the /etc/fstab ?
>> /dev/root       /              ext2     rw,noauto         0      1
>
> I don't think you ever need to list /dev/root in the fstab.. the kernel
> certainly isn't using it to mount the root and I don't think anything
> else is either.

OK, removed it. Works fine (with local filesystem boot).

>> [    4.392920] Freeing unused kernel memory: 76k init
>> And then it hangs.
> Does it work with nfs over tcp? E.G. nfsroot=<ip>:<path>,tcp

Same thing.

> Does init=/bin/date or init=/bin/sh work?

Slightly different result:
[    4.279661] Sending BOOTP requests . OK
[    4.299666] IP-Config: Got BOOTP answer from 192.168.1.185, my address is 
192.168.1.200
[    4.306849] IP-Config: Complete:
[    4.309459]       device=eth0, addr=192.168.1.200, mask=255.255.255.0, 
gw=192.168.1.185,
[    4.317338]      host=genepy_t, domain=, nis-domain=(none),
[    4.322910]      bootserver=192.168.1.185, rootserver=192.168.1.185, 
rootpath=/home/guinevere
/Min_UartLite_NetLite_Ace/buildroot/project_build_powerpc/genepy/root
[    4.338578] Looking up port of RPC 100003/2 on 192.168.1.185
[    4.353721] Looking up port of RPC 100005/1 on 192.168.1.185
[    4.419502] VFS: Mounted root (nfs filesystem).
[    4.423251] Freeing unused kernel memory: 76k init
[    4.700870] Kernel panic - not syncing: Attempted to kill init!
[    4.705622] Rebooting in 180 seconds..


> What network traffic do you see with wireshark?
Lots of NFS exchange. I'm no network specialist, so here's a very short 
excerpt:
5102    97.578066       192.168.1.200   192.168.1.185   NFS     V2 GETATTR 
Call, FH:0x718e5d82
5103    97.578084       192.168.1.185   192.168.1.200   NFS     V2 GETATTR 
Reply (Call In 5102)

>   1) Use 'ip=bootp' instead of 'ip=dhcp'.
Both work with the local filesystem (although the output with bootp makes a 
lot more sense).
Both hang when the filesystem is on nfs

>   2) Did you create device nodes in your NFS root filesystem for
> /dev/log
I just verified that this one is indeed created dynamically when syslogd 
starts.
-- 
Guillaume Dargaud
http://www.gdargaud.net/
