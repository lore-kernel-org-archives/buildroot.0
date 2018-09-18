From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 09:36:04 +0200
Subject: [Buildroot] [PATCH] libaio: Fix library creation for ARC with
 -Os
In-Reply-To: <20180917204329.15787-1-abrodkin@synopsys.com>
References: <20180917204329.15787-1-abrodkin@synopsys.com>
Message-ID: <20180918093604.0b421d5c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks Alexey for working on this. I have a few questions below, to
better understand the problem and its solution.

On Mon, 17 Sep 2018 23:43:29 +0300, Alexey Brodkin wrote:
> On ARC if "-Os" optimization is used compiler prefers to use so-called
> millicode (basically function prologue & epilogue) implemented once and for
> all in libgcc.a.

Until this point, I follow.

> And if we don't link with libgcc.a on DSO (read libaio.so)

I don't understand "link with libgcc.A on DSO" and therefore the rest
of the explanation is a bit unclear to me.

> creation those millicode functions won't be included, instead their
> symbols will be referenced as they were in libgcc (HIDDEN).
> 
> And then when LD is about to link a final application it sees HIDDEN
> symbol in libaio.so that is supposed to come from some static
> libgcc.a... wait.. what? Shared library has unresolved symbol
> implemented in static library? No, that's not right I guess :)
> 
> So to resolve that wrong sequence we just make sure libaio.so has
> its own copy of used millicode functions implemented locally.

Why is this problem happening only with libaio, and not with other
packages ? Is this the final fix, or is this a temporary workaround ?

> BTW I guess something similar might happen for PowerPC,
> see https://git.buildroot.org/buildroot/commit/?id=ce6536ae500fc4ac0c201d5cb4edf39dd1b4d386
> --------------------------->8------------------------  
> hidden symbol `_rest32gpr_30_x' in libgcc.a(e500crtresx32gpr.o) is referenced by DSO
> --------------------------->8------------------------  

Ah, interesting. So there is really something special about libaio.so
forgetting to link with libgcc ? Should this also be changed to cover
PowerPC to remove the workaround ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
