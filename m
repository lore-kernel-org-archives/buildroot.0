From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Jul 2017 18:30:45 +0200
Subject: [Buildroot] [PATCH 2/4 v2] package/kvm-unit-tests: introduce
 _ARCH_SUPPORTS
In-Reply-To: <b0102f89-d625-7b1a-074e-006c4bdebeaf@mind.be>
References: <cover.1499522760.git.yann.morin.1998@free.fr>
 <0d5c040b902f29f870a4a941f1850d7c29e43144.1499522760.git.yann.morin.1998@free.fr>
 <b0102f89-d625-7b1a-074e-006c4bdebeaf@mind.be>
Message-ID: <20170708163045.GD3867@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-08 17:41 +0200, Arnout Vandecappelle spake thusly:
> On 08-07-17 16:08, Yann E. MORIN wrote:
> > Move all architecture options to their own symbol, so that it is easier
> > to add more variants in the future.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Cyril Bur <cyrilbur@gmail.com>
> > ---
> >  package/kvm-unit-tests/Config.in | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> > 
> > diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
> > index 7eab0c25d6..0283e97dfc 100644
> > --- a/package/kvm-unit-tests/Config.in
> > +++ b/package/kvm-unit-tests/Config.in
> > @@ -1,15 +1,17 @@
> > -config BR2_PACKAGE_KVM_UNIT_TESTS
> > -	bool "kvm-unit-tests"
> > +config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
> > +	bool
> > +	default y if BR2_cortex_a7 || BR2_cortex_a12 || \
> > +		BR2_cortex_a15 || BR2_cortex_a17
> > +	default y if BR2_powerpc64 || BR2_powerpc64le
> >  	# on i386 and x86-64, __builtin_reachable is used, so we need
> >  	# gcc 4.5 at least. on i386, we use the target gcc, while on
> >  	# x86-64 we use the host gcc (see .mk file for details)
> >  	# On ARM, it uses virtualization extensions
> > -	depends on BR2_cortex_a7 || BR2_cortex_a12 || \
> > -		BR2_cortex_a15 || BR2_cortex_a17 || \
> > -		(BR2_i386 && BR2_TOOLCHAIN_GCC_AT_LEAST_4_5) || \
> > -		BR2_powerpc64 || \
> > -		BR2_powerpc64le || \
> > -		(BR2_x86_64 && BR2_HOST_GCC_AT_LEAST_4_5)
> > +	default y if (BR2_i386 || BR2_x86_64) && BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
> 
>  GCC is *not* an arch dependency, so this should just be

Yet we already use similar construct in other packages, like host-go:

    config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
        depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || [...]

or like kodi:

     config BR2_PACKAGE_KODI_ARCH_SUPPORTS
        default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || [...]

or with libsigsegv:

    config BR2_PACKAGE_LIBSIGSEGV_ARCH_SUPPORTS
        default y if BR2_TOOLCHAIN_USES_GLIBC
        default y if BR2_TOOLCHAIN_USES_MUSL
        default y if BR2_TOOLCHAIN_USES_UCLIBC && [...archs...]

or libunwind, openal (interesting case), openblas, protobuf.

Arguaby, none of the above have a dependency on gcc, but some are on the
C library, and others are on toolchain features...

> 	default y if BR2_i386
> 	default y if BR2_powerpc64 || BR2_powerpc64le
> 	default y if BR2_x86_64
> 
> > +
> > +config BR2_PACKAGE_KVM_UNIT_TESTS
> > +	bool "kvm-unit-tests"
> > +	depends on BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
> >  	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
> >  	help
> >  	  kvm-unit-tests is a project as old as KVM. As its name
> 
>  And here
> 
> 	depends on !((BR2_i386 || BR2_x86_64) || BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
> 
> with the big comment above it.
> 
>  And also the comment is missing at the moment - which is probably why you
> didn't notice that it's not an architecture dependency.

OK, will add.

Thanks!

Regards,
Yann E. MORIN.

> 
>  Regards,
>  Arnout
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
