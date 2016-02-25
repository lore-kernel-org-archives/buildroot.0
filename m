From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2016 22:33:30 +0100
Subject: [Buildroot] Incorrect kernel configuration produced from
	_defconfig file
In-Reply-To: <20160225180352.1d768c84@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 25 Feb 2016 18:03:52 +0100")
References: <CAF_dkJAcuTbdu97oMi_-W7Bd6-4pGx633qE=+UaNHwb6Z_5wCg@mail.gmail.com>
 <20160225170443.2e6208f4@free-electrons.com>
 <20160225161451.GE12073@piout.net>
 <CAF_dkJDcPKAqb5sSoRinfBqo3L7zni8M9NTqEN-zyjpF_98ZGw@mail.gmail.com>
 <20160225165032.GG12073@piout.net>
 <20160225180352.1d768c84@free-electrons.com>
Message-ID: <87si0gv5jp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Alexandre Belloni,
 > On Thu, 25 Feb 2016 17:50:32 +0100, Alexandre Belloni wrote:

 >> Personally, I'd drop the yes "" | part of it and use only make
 >> olddefconfig but the rules are also used for busybox et al. so you'd
 >> have to check that all have a recent enough kconfig

 > I think the reason we still use the yes "" trick is that we have a
 > generic kconfig infrastructure, and it should work for all kconfig
 > based packages. Including old kernel version (when was
 > olddefconfig introduced?) or Busybox (which has an horribly old copy of
 > the kconfig code).

oldnoconfig was introduced (renamed) just before 2.6.36
(ef61ca88c511154d6bead23c08f9a021cfdfeb01) and olddefconfig was
introduced during the 3.7 cycle (fb16d8912db5268f29706010ecafff74b971c58d).

With the recent discussion about if we would rely on devtmpfs or not
(which was added in the 2.6.32 cycle), I don't think we can rely on any
of them without the fallback code.

The fact that oldnoconfig == olddefconfig is also kernel specific, but
from a quick look it doesn't seem to cause any conflicts:

 - busybox doesn't have it
 - barebox, uClibc and uboot have it with similar behaviour as the kernel

 > So switching to olddefconfig might not be that easy. But maybe this is
 > something that can be made conditional in the pkg-kconfig
 > infrastructure. Like use olddefconfig if available, and if not fall
 > back to the yes "" | make oldconfig trick.

Why not just do it like in OE ? run the yes "" .. thing if make
oldnoconfig fails?

-- 
Bye, Peter Korsgaard
