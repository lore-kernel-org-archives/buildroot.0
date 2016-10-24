From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 24 Oct 2016 13:19:30 +0100
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
In-Reply-To: <874m42lztg.fsf@dell.be.48ers.dk>
References: <20161019221035.2350c181@free-electrons.com>
 <c2da1832-3282-33f0-1588-e828f3df4801@mind.be>
 <874m42lztg.fsf@dell.be.48ers.dk>
Message-ID: <b4fb3016-266b-d9bf-bbe1-ec7169c7136a@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 24/10/16 13:02, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  >> * TARGET_CFLAGS = $(TARGET_WRAPPER_CFLAGS) $(TARGET_OPTIMIZATION) \
>  >> $(TARGET_DEBUGGING)
>  >> TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>  >> TARGET_LDFLAGS = $(TARGET_CFLAGS)
>  >> TARGET_FCFLAGS = $(TARGET_CFLAGS)
> 
>  >  Turns out that it will be slightly more complicated than this. For MIPS, the
>  > -mmsa option to enable SIMD processing MUST NOT be used in kernel and bootloader
>  > builds. Therefore we cannot add it to TARGET_WRAPPER_CFLAGS. Instead, we'll have
>  > a TARGET_EXTRA_CFLAGS that does not get added to the wrapper but does get added
>  > to TARGET_CFLAGS and therefore passed to package buidls.
> 
> If that is the only problem, couldn't we just add -mno-msa to the
> kernel/bootloader if _MIPS_MSA is enabled?

That would be a solution, filter (or append -mno-* counterparts) to the
flags when building kernel or bootloaders. The thing is we would need to
do this for other optimization options (not just MSA) and architectures.

Do we want to do that? It looks better and cleaner to have a variable
that holds flags suitable for building packages but not for building
kernels/bootloaders. I think that's what Arnout means with the
TARGET_EXTRA_CFLAGS.

My question is, if that TARGET_EXTRA_CFLAGS is not added to the wrapper,
what will happen with those packages that have a crappy build system
that doesn't respect the env variables?

And another question. What happen if we use the real compiler to build
kernels and bootloaders? Would that be a problem? I don't know other
architectures, but for MIPS the only variable we need to pass to the
make program for building a kernel is ARCH=mips. The defconfig will set
all the rest (float, endian, etc.).

Regards,

Vincent.

> 
