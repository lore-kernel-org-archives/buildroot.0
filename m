From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 May 2016 16:00:40 +0200
Subject: [Buildroot] [PATCH v3 next] openblas: new package
In-Reply-To: <573DC2D6.5090003@imgtec.com>
References: <1463652602-3276-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160519142103.507c1395@free-electrons.com>
 <573DC2D6.5090003@imgtec.com>
Message-ID: <20160519160040.1eee27e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 14:42:46 +0100, Vicente Olivert Riera wrote:

> > config BR2_PACKAGE_OPENBLAS_TARGET
> > 	string
> > 	default "ATOM"	if BR2_x86_atom
> > 	default "CORE2"	if BR2_x86_core2
> > 	...
> > 	default "CORTEXA15" if BR2_cortex_a15
> > 	...  
> 
> No, we cannot do that because there isn't only one OpenBLAS target per
> BR arch symbol. For instance, for mips64 there are 3 OpenBLAS targets
> available. For x86 there are lots of them. Same for x86_64. Plust the
> user may want to build a generic buildroot (because it doesn't have
> specific support for certain core) and build OpenBLAS for that core.

For x86 and x86_64, we have sub-options that specify which CPU is being
used. Look at my example above, which shows that ATOM and CORE2 can be
found by looking at the BR2_x86_<foo> options.

Regarding MIPS64, what are the practical differences between the
following options?

+config BR2_PACKAGE_OPENBLAS_TARGET_SICORTEX
+	bool "SICORTEX"
+	depends on BR2_mips64 || BR2_mips64el
+config BR2_PACKAGE_OPENBLAS_TARGET_LOONGSON3A
+	bool "LOONGSON3A"
+	depends on BR2_mips64 || BR2_mips64el
+config BR2_PACKAGE_OPENBLAS_TARGET_LOONGSON3B
+	bool "LOONGSON3B"
+	depends on BR2_mips64 || BR2_mips64el
+config BR2_PACKAGE_OPENBLAS_TARGET_I6400
+	bool "I6400"
+	depends on BR2_mips64 || BR2_mips64el

If there are some practical differences in terms of gcc options being
used, then it probably means that we need to add additional
sub-architectures in arch/Config.in.mips.

> > I think that for such small patches, that are not taken from upstream,
> > my preference is to have them in Buildroot itself rather than
> > downloaded by <pkg>_PATCH.  
> 
> I remember someone told me that we prefer this method when possible...

Yeah, we don't have a very fixed policy on this. My own thinking is
that it's fine to use <pkg>_PATCH to fetch patches that are already
otherwise available (from another distribution or from upstream), but
when it's done by "us", it's better to have the patch in Buildroot
itself. But I agree that the line between both solutions is thin.

> Anyway my pull request has been merged so if I have to respin this patch
> I will just bump the version and get rid of the patch.

Good!

> >> +# Disable fortran if the fortran compiler doesn't actually exist.
> >> +ifeq ($(wildcard $(TARGET_FC)),)  
> > 
> > I don't really like this way of testing if we have Fortran support. We
> > probably want some kind of BR2_TOOLCHAIN_HAS_FORTRAN hidden config
> > option. Talk with Samuel, I think he had some patches that were adding
> > this kind of stuff for the external toolchains.  
> 
> Yeah, that would be great, but we don't have it right now. I wrote a
> patch for SSP toolchain support and it's taking ages to get applied.
> I don't know if I want to wait for another patch for the
> BR2_TOOLCHAIN_HAS_FORTRAN stuff to get applied before adding this
> package to Buildroot. Why don't do that in the future? Add the package
> now. When we have that toolchain-has-fortran thing available, then we
> modify the package to use it.

So, for the moment, just disable Fortran support unconditionally, and
in a follow-up patch you can enable Fortran support.

> > It seems weird that OpenMP is related to NPTL thread support. OpenMP is
> > a separate feature of the toolchain, see the option
> > BR2_GCC_ENABLE_OPENMP for internal toolchains.  
> 
> Well, I've read here [1] that "OpenMP is available for most platforms
> that support POSIX threads".

If the support has been enabled in the compiler, which is what I'm
talking about. Have you tried your packages with a Buildroot internal
toolchain, with OpenMP support disabled?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
