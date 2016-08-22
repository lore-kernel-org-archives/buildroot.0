From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Aug 2016 22:10:31 +0200
Subject: [Buildroot] [PATCH] openblas: fix build with old binutils
	versions
In-Reply-To: <1471696561-2591-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 20 Aug 2016 14:36:01 +0200")
References: <1471696561-2591-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mvk4pnt4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Older toolchains that use binutils <= 2.23.2 are affected by binutils
 > bug #14887 (https://sourceware.org/bugzilla/show_bug.cgi?id=14887),
 > where:

 > 	someinstruction [ foo, something ]

 > is not accepted, due to the whitespace after [ and before ], causing the
 > following build failures for OpenBLAS:

 >   ARM register expected -- `pld [ r1,#512 ]'

 > Since we don't have any mechanism to add dependencies on binutils
 > versions, we work around this problem by patching the code to remove the
 > problematic whitespaces. As there are many many instances of this in the
 > ARM assembly code of OpenBLAS, we use a sed expression to make this
 > modification rather than a patch.

 > Fixes:

 >   http://autobuild.buildroot.net/results/43e50b480b4aea0fdec745d7875c85377c114cac/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > Since this is a rather non-conventional way of fixing problems, I'll
 > wait for some people to agree or disagree before applying this
 > patch. Alternate proposals are welcome.

I also don't really see any other simple way of handling it.

> ---
 >  package/openblas/openblas.mk | 13 +++++++++++++
 >  1 file changed, 13 insertions(+)

 > diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
 > index baeef05..08a2804 100644
 > --- a/package/openblas/openblas.mk
 > +++ b/package/openblas/openblas.mk
 > @@ -38,6 +38,19 @@ else ifeq ($(BR2_SHARED_LIBS),y)
 >  OPENBLAS_MAKE_OPTS += NO_STATIC=1
 >  endif
 
 > +# binutils version <= 2.23.2 have a bug

s/have/has/

> +# (https://sourceware.org/bugzilla/show_bug.cgi?id=14887) where
 > +# whitespaces in ARM register specifications such as [ r1, #12 ] or [
 > +# r2 ] cause the assembler to reject the code. Since there are
 > +# numerous instances of such cases in the code, we use sed rather than
 > +# a patch. We simply replace [ foobar ] by [foobar] to work around the
 > +# problem.
 > +define OPENBLAS_FIXUP_ARM_ASSEMBLY
 > +	$(SED) "s%\[\s*%\[%;s%\s*\]%\]%" $(@D)/kernel/arm/*.S

NIT, we typically use single quotes (') for simplicity in the sed
invocations unless we explicitly need shell expansions.

> +endef
 > +
 > +OPENBLAS_POST_PATCH_HOOKS += OPENBLAS_FIXUP_ARM_ASSEMBLY

I was thinking that this should be inside a BR2_arm / BR2_armeb
conditional, but as it only takes a trivial amount of time to execute,
it is probably nicer to do it unconditionally.

Committed with the above fixed, thanks.

-- 
Bye, Peter Korsgaard
