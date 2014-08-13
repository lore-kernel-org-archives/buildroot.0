From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 13 Aug 2014 18:50:19 +0200
Subject: [Buildroot] Some Perl modules fail to cross-compile
In-Reply-To: <53EB535B.60301@imgtec.com>
References: <20140813063010.CD21010118A@stock.ovh.net>
 <53EB535B.60301@imgtec.com>
Message-ID: <CAB0FRst4_dcG1GWQXAOBBTc1QqeV9-ZE+La1VPL+XiPr==uwGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-08-13 14:00 GMT+02:00 Vicente Olivert Riera <Vincent.Riera@imgtec.com>:
> The affected modules are:
>
>  perl-gd
>  perl-net-ssleay
>  perl-xml-libxml
>
> The build system of these modules have a "use Config;" in the Makefile.PL.
> Given that we are cross-compiling, the Perl program used to run that
> Makefile.PL is the host's Perl program (because we can't run MIPS Perl in
> our x86_64 machine, for instance), so the %Config read only variable
> provided by the Config module contains all the information that the
> Configure program had during the Perl build time (in our case, the host's
> Perl). Then, the build system fills the OPTIMIZE variable (only if it's
> empty) with some flags taken from that %Config variable, so some things like
> "-mtune=generic" or "-m64" can end into the OPTIMIZE variable and cause a
> compilation failure for target architectures which don't support those
> flags.
>
> I have reported this bug upstream. Please read the comments:
>   https://rt.cpan.org/Public/Bug/Display.html?id=97834
>
> My proposal to fix these three packages is to append the OPTIMIZE variable
> to the configure options and set it to -mtune=$(BR2_GCC_TARGET_ARCH) to
> avoid the OPTIMIZE variable get filled with incompatible flags.
>
> I have the patches ready and they work, so, if you think this is a valid
> solution, just tell it to me and I will send the patches ASAP.
>

The host perl must load the host Config.pm.
So, in order to cross compiling, we must overload all variables in the
command line.
Currently, only CCFLAGS/ccflags is set in package/pkg-perl.mk, in the same way,
we could also set OPTIMIZE with " ".

Fran?ois

> Thanks.
> --
> Vincent
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
