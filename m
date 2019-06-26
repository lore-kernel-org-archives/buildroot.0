From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 26 Jun 2019 09:24:29 +0000
Subject: [Buildroot] [arc-buildroot] [PATCH] ARC: Add support for ARC
 HS48 v3.1 processor
In-Reply-To: <20190624064605.5958b976@windsurf>
References: <20190604053927.29319-1-Evgeniy.Didin@synopsys.com>
 <20190624064605.5958b976@windsurf>
Message-ID: <CY4PR1201MB012038B2DDC6719DA9DE78A5A1E20@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Monday, June 24, 2019 7:46 AM
> To: Evgeniy Didin <didin@synopsys.com>
> Cc: buildroot at busybox.net; arc-buildroot at synopsys.com; Alexey Brodkin <abrodkin@synopsys.com>
> Subject: Re: [arc-buildroot] [Buildroot] [PATCH] ARC: Add support for ARC HS48 v3.1 processor
> 
> Hello Evgeniy,
> 
> On Tue,  4 Jun 2019 08:39:27 +0300
> Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:
> 
> > This patch introduces recently released significant
> > update to ARC HS family: ARC HS48.
> >
> > One of the major ARC HS48 features is dual-issue pipeline
> > which requires a little bit modified instruction scheduling compared
> > to single-issue cores (HS38), thus new "-mcpu/--with-cpu=hs4x".
> >
> > Also to address some peculiarities of early designs based on
> > HS48 we introduced yet another "-mcpu/--with-cpu=hs4x_rel1" which
> 
> I guess you meant --with-cpu=hs4x_rel31 here, correct ?

Right!

> Overall, I'm a bit confused by the naming and choice of options for the
> ARC architecture.
> 
> The patch at https://patchwork.ozlabs.org/patch/995220/ adds a variant
> for ARC HS38 with quad MAC and double precision FPU, and the gcc option
> to enable it was named hs38_linux. It is really weird to use the name
> of an operating system in a gcc architecture name option.

Well actually it's even more complicated :)

That name comes out of a "template" in our IP configuration tool which
in its turn was chosen to highlight that template purpose - it suits the
best systems developed for running Linux. And in fact it's not unusual name
as you may see more of that for ARC EM family, check
https://github.com/gcc-mirror/gcc/blob/master/gcc/config/arc/arc-cpus.def.

> ... but the logic used by RISC-V to name gcc options
> looks a lot better: a number of letters than indicate with optional
> features of the CPU core have been enabled in the design. This allows
> gcc and therefore Buildroot to easily support possibly any combination
> of CPU core design, rather than just a few selected combinations.

That's indeed an interesting point regrading RISC-V which we will
take into consideration as naming of mcpu's seems to be getting a bit
out of control. I guess the main difference between RISC-V and ARC is
RISC-V has more structured ABI versions while we on ARC have more flexibility.

But still what we have is what we have now and we'll need to leave with
it until we come up with something better.

> Regarding HS48, is "rel31" really part of the name ?

Correct, see https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/blob/arc-2019.03/gcc/config/arc/arc-cpus.def#L67

> Are you going to update this with rel32, rel33, rel41, etc. ?

Well that's really hard to tell as even _rel31 was not planned but we
had to add it to address some peculiarities of a particular core revision
which is being implemented in real silicon.

But given your very good point above we need to revisit our naming
scheme to make it simpler and cleaner.

> Or is this rel31 only because as explained in the commit log, it's for
> early designs only ? And then you will add the real hs48 option that
> will use --with-cpu=hs4x ?

Right we were planning to add "hs4x" and "hs4xd" as well.
Most probably I explained our rationale for using mcpu's/with-cpu's
but will re-iterate on it once again so that maybe better solutions will be
offered by a casual readers...

We have a couple of families of ARC cores. Up-to-date ones are ARC EM (pretty simple
but very efficient 32-bit microcontrollers) and ARC HS (much more sophisticated
and powerful cores). EM family is of no interest here as it cannot have MMU so no
Linux on it.

ARC HS cores (as any other ARC cores) might be in its bare-minimal configuration
w/o even external memory, caches, multiplier, FPU - something like on-chip SRAM and ALU.
That's the basic template called HS34. Then we start adding other HW features and
getting other templates like those mentioned "hs38_linux", "hs4xd" etc, see this
nice article describing details of what is supported [1]

So looking at the table for ARC HS I'd propose to use simple "hs" for both
"--with-cpu" & "-mcpu" and then depending on which type of "template" (or whatever we
will call ARC core flavors) is selected by user add required set of discrete options like
"-mdiv-rem -mll64 -mmpy-option=plus_qmacw -mfpu=fpud_all" which in the end will be a
full equivalent of discussed "hs38_linux".

Before Yann's proposal [2] with ARCH_TOOLCHAIN_WRAPPER_OPTS it was not very
convenient as some packages which don't use CFLAGS could have been compiled without
all those handy HW features in mind. But if we configure GCC with "--with-cpu=hs38_linux"
then whatever is compiled with just arc-linux-gcc all HW features bundled in
"hs38_linux" will be used.

[1] https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/wiki/Understanding-GCC-mcpu-option
[2] http://lists.busybox.net/pipermail/buildroot/2019-June/251531.html

As always any input is much appreciated!

-Alexey
