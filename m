From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 23:06:03 +0100
Subject: [Buildroot] Incorrect kernel configuration produced from
	_defconfig file
In-Reply-To: <87si0gv5jp.fsf@dell.be.48ers.dk>
References: <CAF_dkJAcuTbdu97oMi_-W7Bd6-4pGx633qE=+UaNHwb6Z_5wCg@mail.gmail.com>
 <20160225170443.2e6208f4@free-electrons.com>
 <20160225161451.GE12073@piout.net>
 <CAF_dkJDcPKAqb5sSoRinfBqo3L7zni8M9NTqEN-zyjpF_98ZGw@mail.gmail.com>
 <20160225165032.GG12073@piout.net>
 <20160225180352.1d768c84@free-electrons.com>
 <87si0gv5jp.fsf@dell.be.48ers.dk>
Message-ID: <20160225230603.7651ae97@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Feb 2016 22:33:30 +0100, Peter Korsgaard wrote:

> oldnoconfig was introduced (renamed) just before 2.6.36
> (ef61ca88c511154d6bead23c08f9a021cfdfeb01) and olddefconfig was
> introduced during the 3.7 cycle (fb16d8912db5268f29706010ecafff74b971c58d).
> 
> With the recent discussion about if we would rely on devtmpfs or not
> (which was added in the 2.6.32 cycle), I don't think we can rely on any
> of them without the fallback code.
> 
> The fact that oldnoconfig == olddefconfig is also kernel specific, but
> from a quick look it doesn't seem to cause any conflicts:
> 
>  - busybox doesn't have it
>  - barebox, uClibc and uboot have it with similar behaviour as the kernel

It is somewhat odd that oldnoconfig and olddefconfig are doing the
same. If they are the same, why do they have two different names?

I would have expected oldnoconfig to say "no" to all new options, and
olddefconfig to say "use the default" to all new options.

>  > So switching to olddefconfig might not be that easy. But maybe this is
>  > something that can be made conditional in the pkg-kconfig
>  > infrastructure. Like use olddefconfig if available, and if not fall
>  > back to the yes "" | make oldconfig trick.
> 
> Why not just do it like in OE ? run the yes "" .. thing if make
> oldnoconfig fails?

Yes, sure, this seems a good idea. This way we have a good/sane
behavior for the packages using a modern kconfig code base, and
fallback to a working solution for old stuff like busybox.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
