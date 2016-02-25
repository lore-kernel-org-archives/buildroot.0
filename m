From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 25 Feb 2016 23:26:59 +0100
Subject: [Buildroot] Incorrect kernel configuration produced from
	_defconfig file
In-Reply-To: <20160225230603.7651ae97@free-electrons.com>
References: <CAF_dkJAcuTbdu97oMi_-W7Bd6-4pGx633qE=+UaNHwb6Z_5wCg@mail.gmail.com>
 <20160225170443.2e6208f4@free-electrons.com>
 <20160225161451.GE12073@piout.net>
 <CAF_dkJDcPKAqb5sSoRinfBqo3L7zni8M9NTqEN-zyjpF_98ZGw@mail.gmail.com>
 <20160225165032.GG12073@piout.net>
 <20160225180352.1d768c84@free-electrons.com>
 <87si0gv5jp.fsf@dell.be.48ers.dk>
 <20160225230603.7651ae97@free-electrons.com>
Message-ID: <20160225222659.GM12073@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/02/2016 at 23:06:03 +0100, Thomas Petazzoni wrote :
> Hello,
> 
> On Thu, 25 Feb 2016 22:33:30 +0100, Peter Korsgaard wrote:
> 
> > oldnoconfig was introduced (renamed) just before 2.6.36
> > (ef61ca88c511154d6bead23c08f9a021cfdfeb01) and olddefconfig was
> > introduced during the 3.7 cycle (fb16d8912db5268f29706010ecafff74b971c58d).
> > 
> > With the recent discussion about if we would rely on devtmpfs or not
> > (which was added in the 2.6.32 cycle), I don't think we can rely on any
> > of them without the fallback code.
> > 
> > The fact that oldnoconfig == olddefconfig is also kernel specific, but
> > from a quick look it doesn't seem to cause any conflicts:
> > 
> >  - busybox doesn't have it
> >  - barebox, uClibc and uboot have it with similar behaviour as the kernel
> 
> It is somewhat odd that oldnoconfig and olddefconfig are doing the
> same. If they are the same, why do they have two different names?
> 
> I would have expected oldnoconfig to say "no" to all new options, and
> olddefconfig to say "use the default" to all new options.
> 

That's exactly why it has been renamed:

scripts/kconfig/Makefile:
# oldnoconfig is an alias of olddefconfig, because people already are dependent
# on its behavior (sets new symbols to their default value but not 'n') with the
# counter-intuitive name.
oldnoconfig: olddefconfig

scripts/kconfig/conf.c:
	/*
	 * oldnoconfig is an alias of olddefconfig, because people already
	 * are dependent on its behavior(sets new symbols to their default
	 * value but not 'n') with the counter-intuitive name.
	 */
	{"oldnoconfig",     no_argument,       NULL, olddefconfig},

See fb16d8912db5268f29706010ecafff74b971c58d and
67d34a6a391369269a2e5dba8a5f42cc4cd50231


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
