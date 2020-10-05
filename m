From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 5 Oct 2020 07:41:21 -0500
Subject: [Buildroot] [PATCH] gcc: disable fortran use of libquadmath
In-Reply-To: <14e962ad-c83a-bf54-ba73-f8fad9fba322@gmail.com>
References: <20200911124131.8549-1-matthew.weber@rockwellcollins.com>
 <14e962ad-c83a-bf54-ba73-f8fad9fba322@gmail.com>
Message-ID: <CANQCQpYHKvaNPJyho4Yg5vHTBzrVCqz9Mc04=igT-4=xFfT7gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,


On Sun, Oct 4, 2020 at 3:30 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> Hello Matt,
>
> Le 11/09/2020 ? 14:41, Matt Weber a ?crit :
> > The GCC package has a default conf option of disabling libquadmath and
> > the toolchain dependencies selectively enabled it if i386 / x64.
> >
> > Fixes:
> > https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359622
> >
> > This patch fixes a build failure when (GCC + glibc) is being built for
> > the IBM Power8 arch and has libgfortran enabled + libquadmath disabled.
> > The libgfortran has a code condition for __float128 and includes the
> > quadmath headers. The bug occurs because Power8 has emulated
> > float128 support. The fix per GCC options is to also set
> > --disable-libquadmath-support which disables the
> > __float128/libquadmath support in gcc/fortran and in libgfortran [1].
> >
> > Another option to fix the build failure was to enable libquadmath for
> > IBM Power8 (ISA 2.07), however this would be soft float based as the
> > ISA 3.0+ (Power9) first supports native float128 [2][3].
>
> I did a test with toolchain-builder this weekend using Buildroot's master branch
> but without your patch (I missed that it was included for toolchain builder
> release 2020.08-1). So I had the same issue...
>
> I tried to fix it by enabling libquadmath even if it's a software support:
> http://patchwork.ozlabs.org/project/buildroot/patch/20201004142050.2487724-1-romain.naour at gmail.com
>
> But I can't really test the libquadmath solution since I'm only using qemu to do
> a boot testing. So your proposal looks safer.

I ran into a similar test situation. I agree there are more ppc archs
that could have libquadmath enabled.  However after reading about some
of the performance regressions when hardware doesn't support float128
but the quadmath library is used, I picked a conservative path of
disabling.

Best Regards,
Matt
