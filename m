From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 24 Dec 2020 00:07:26 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain/toolchain-wrapper: fix gcc -v
 with relro
In-Reply-To: <CAPi7W821fZ2YZS3TGQW3BpiRvWgDKWd_zF4VVPcNpT779mtwLQ@mail.gmail.com>
References: <20201223182740.2879160-1-fontaine.fabrice@gmail.com>
 <20201223211709.45524133@gmx.net>
 <CAPi7W821fZ2YZS3TGQW3BpiRvWgDKWd_zF4VVPcNpT779mtwLQ@mail.gmail.com>
Message-ID: <20201224000726.27bd2640@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Wed, 23 Dec 2020 22:13:21 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Hi Peter,
> 
> Le mer. 23 d?c. 2020 ? 21:17, Peter Seiderer <ps.report@gmx.net> a ?crit :
> >
> > Hello Fabrice,
> >
> > patch works, some nitpicks/possible improvements below:
> >
> > On Wed, 23 Dec 2020 19:27:40 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >  
> > > rhash in version 1.4.0 with relro fails to build because gcc -v raises
> > > the following build failure:  
> >
> > ...with relro enabled fails to build because the configure step call
> > '.../host/bin/arm-linux-gcc -v' (which is done via the buildroot
> > toolchain-wrapper fails with:
> >  
> > >
> > > /data/buildroot-test/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/soft-float/el/usr/lib64/Scrt1.o: In function `__start':
> > > (.text+0x20): undefined reference to `main'
> > > collect2: error: ld returned 1 exit status
> > > Run result: 1
> > >
> > > This buid failure is raised because the toolchain-wrapper calls gcc with  
> >
> > s/buid/build/
> >  
> > > -Wl,-z,relro and as a result gcc wrongly assumes that some linking must
> > > be done with -v  
> >
> > ...some linking must be done.
> >  
> > >
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > ---
> > >  toolchain/toolchain-wrapper.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> > > index 0fb6064b1c..4c3375cfbc 100644
> > > --- a/toolchain/toolchain-wrapper.c
> > > +++ b/toolchain/toolchain-wrapper.c
> > > @@ -456,7 +456,8 @@ int main(int argc, char **argv)
> > >       /* Are we building the Linux Kernel or U-Boot? */  
> >
> > With your enhancement the comment above is no longer fully applicable...
> >
> >  
> > >       for (i = 1; i < argc; i++) {
> > >               if (!strcmp(argv[i], "-D__KERNEL__") ||
> > > -                 !strcmp(argv[i], "-D__UBOOT__"))
> > > +                 !strcmp(argv[i], "-D__UBOOT__") ||
> > > +                 !strcmp(argv[i], "-v"))  
> >
> > Is a '-v ' somewhere in the argument list a strong enough condition, or
> > should it be better '-v' as the only argument?  
> Thanks for your feedback, I can fix the issues that you have pointed out above.
> However, on this one, it should be noted that the build will also fail
> if -v is not the only argument.

Good point (your approach is the right thing)...

> For example, even on the latest gcc 10.2.0, the following commands fail:
>  - gcc -Wl,-z,relro -Dtest -v
>  - gcc -Wl,-z,relro -fPIE -v

But 'gcc -Dtest -v' and 'gcc -fPIE -v' work (the relro is added by the
wrapper, so it is a buildroot specific/introduced failure)...

> 
> But, finally, I'm wondering if this is the right fix, as stated by gcc
> --help, -v option means "Display the programs invoked by the
> compiler." so gcc -v is not equivalent to gcc --version.

But '-v' shows more info as '--version'..., did not look at detail at the
rhash ouput parsing...., but I think the buildroot wrapper should not
break '-v' neither '--version'..., and the preferred call is a choice
of the package developer/maintainer (but no argument against suggesting
upstream to change from '-v' to '--version' ;-))...

Even if there as a second solution/work-around for the rhash package
case, I believe your '-v' fix should be applied to the wrapper independently
of which fix is applied for the rhash package...(but I think it is
a matter of taste ;-) and I am fine with either solution)...  

Regards,
Peter


> With this patch, we'll not apply relro if -v is one of the argument
> which seems wrong.
> Applying the workaround only if -v is the only argument does not seem
> right either.
> So, patching rhash to use --version instead of -v was probably a
> better approach.
> >  
> > >                       break;
> > >       }
> > >       if (i == argc) {  
> >
> > Build failure fixed, so you can add my:
> >
> > Tested-by: Peter Seiderer <ps.report@gmx.net>
> >
> > Regards,
> > Peter  
> Best Regards,
> 
> Fabrice
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
