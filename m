From: Ben Dooks <ben@fluff.org>
Date: Wed, 27 Jun 2007 16:25:15 +0100
Subject: [Buildroot] ARM EABI builds
In-Reply-To: <20070627090329.GA3741@z1.synertronixx>
References: <20070626133327.GA5989@trinity.fluff.org>
	<468182D7.30509@gmail.com>
	<20070626222500.GP31791@trinity.fluff.org>
	<20070627081954.GR31791@trinity.fluff.org>
	<20070627090329.GA3741@z1.synertronixx>
Message-ID: <20070627152514.GS31791@trinity.fluff.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, Jun 27, 2007 at 11:03:29AM +0200, Konstantin Kletschke wrote:
> Am 2007-06-27 09:19 +0100 schrieb Ben Dooks:
> 
> > I have finally tracked down the problem, and will be submitting a
> > fix as soon as I have reviewed the patch.
> 
> *argh* 
> 
> I followed your thread and I am so sorry that I forgot that I for myself
> apply a patch regarding this issue. It floated around a while ago and
> it is called unbreak-armv4t.patch:

Whilst this is also a fix, I think that passing --with-cpu= to the
compiler at generation time is a better option. This will allow OABI
builds for any pre-armv4 sytems, and ensure that xscale/v5/v6/etc will
also produce optimal output as they will be configured with the correct
cpu architecture.
 
> ff -urN gcc-4.1.1/gcc/config/arm/linux-eabi.h gcc-4.1.1-arm9tdmi/gcc/config/arm/linux-eabi.h
> --- gcc-4.1.1/gcc/config/arm/linux-eabi.h       2006-10-22 11:11:49.000000000 -0700
> +++ gcc-4.1.1-arm9tdmi/gcc/config/arm/linux-eabi.h      2006-10-24 21:34:01.000000000 -0700
> @@ -45,7 +45,7 @@
>     The ARM10TDMI core is the default for armv5t, so set
>     SUBTARGET_CPU_DEFAULT to achieve this.  */
>  #undef SUBTARGET_CPU_DEFAULT
> -#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
> +#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm9tdmi
> 
>  #undef SUBTARGET_EXTRA_LINK_SPEC
>  #define SUBTARGET_EXTRA_LINK_SPEC " -m armelf_linux_eabi"
> 
> 
> > The next thing is, do we then need to produce our compiler and
> > libraries in toolchain_arm_<cpu>_<fp> and build_arm_<cpu>_<fp> ?
> 
> Well... why not? The toolchain_arm_<cpu>_<fp> directory is some sort of
> PIC in the filesystem and can moved around and used for crosscompiling
> other stuff standing alone.

That was more a request for comments, it can sometimes be difficult
to guage exactly how people view these things until you've asked.

It would also need EABI/OABI in there. I tried switching an already
configured buildroot from EABI to OABI, and found that it did not
build correctly (but that is for another post).

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
