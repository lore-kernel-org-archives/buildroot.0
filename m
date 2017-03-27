From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Mar 2017 14:03:37 +0200
Subject: [Buildroot] Issue performing switch_root to a UBIFS partition
In-Reply-To: <CAGm1_kuAPosDi1Wc89_oKYr3J=t5py3nFL9F4bO3dZM+N54Ncw@mail.gmail.com>
References: <CAGm1_kuAPosDi1Wc89_oKYr3J=t5py3nFL9F4bO3dZM+N54Ncw@mail.gmail.com>
Message-ID: <efffdb66-2095-29cc-05ee-db25625c8371@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-03-17 10:05, Yegor Yefremov wrote:
> I'm trying to boot from initramfs and then switch_root to UBIFS
> partition. Both rootfs were created with the same toolchain. And when
> I mount UBIFS from initramfs I can execute its busybox etc. So at
> least the architecture it the same.
> 
> I'm performing the same actions as described here [1]
> 
> mkdir /newroot
> mount -t ubifs ubi0:rootfs /newroot
> 
> mount --move /sys /newroot/sys
> mount --move /proc /newroot/proc
> mount --move /dev /newroot/dev

 Can you add some error logging here to check that the mount commands actually
succeed?

> 
> exec switch_root /newroot /sbin/init

 I've done this once with pivot_root, not switch_root. That was a bit more
intricate. I did mount --rbind instead of mount --move, and I had to unmount
stuff after the pivot.


> As soon as I execute switch_root, the system complains, that it cannot
> find /dev/ttyO0.

 Have you tried the -c option of switch_root? Any idea who it is that complains?

> 
> can't open /dev/ttyO0: No such file or directory
> 
> If I omit moving /sys, /proc and /dev, the /sbin/init from initramfs
> rootfs will be executed.

 How do you know which one is executed?

> I.e. in both cases it seems like /sbin/init
> from initramfs rootfs will be executed and switch_root produces no
> error/warnig messages.

 You can add strace to your initramfs and execute switch_root under strace -f to
see what is happening. Well, looking at busybox source, basically it does

cd /newroot
mount --move . /
chroot .
exec /sbin/init

so somehow it seems that the mount --move didn't do the expected thing...

 Regards,
 Arnout

> 
> What am I missing?
> 
> [1] https://landley.net/writing/rootfs-programming.html
> 
> Yegor
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
