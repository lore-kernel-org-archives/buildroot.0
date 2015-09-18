From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Sep 2015 09:41:02 +0200
Subject: [Buildroot] musl/gettext issue
In-Reply-To: <55FB3E49.5050606@mind.be>
References: <20150916221636.039df52b@free-electrons.com>
 <55FB3E49.5050606@mind.be>
Message-ID: <20150918094102.10d6c65e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Sep 2015 00:27:21 +0200, Arnout Vandecappelle wrote:

> >  1/ Simply do not allow the GNU gettext package to be built with glibc
> >     and musl since they provide the gettext functionality internally.
> 
>  Problem: something like ecryptfs-utils, which needs the gettext program at
> runtime...

Ah, right, correct.

> >     The only problem with this approach is that while httping is happy
> >     with the POSIX compliant gettext functionality of musl, some other
> >     programs such as Bison
> >     (https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=786885) will
> >     really need GNU gettext functionality.
> 
>  This one could perhaps be solved by adding a BR2_HAS_GNU_GETTEXT. But again, of
> course, it must be possible to select gettext in that case.

Indeed.

> >  2/ Allows force to use GNU gettext in musl configurations. This simply
> >     consists in:
> > 
> >  config BR2_NEEDS_GETTEXT
> >         bool
> > -       default y if BR2_TOOLCHAIN_USES_UCLIBC
> > +       default y if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
> > 
> >      I have tested this solution and it does work (obviously).
> > 
> >      The drawback is obviously that we are going to build/install GNU
> >      gettext even for cases where the internal gettext implementation
> >      of musl would have been sufficient.
> 
>  That sounds like a bad idea. What's the point of using musl if you're going to
> add a bunch of GNU extensions to it?

Absolutely, hence me not wanting to do something like that.

>  Another option is that we add a different flag to indicate the dependency on
> libintl:
> 
> config BR2_PACKAGE_GETTEXT_WITH_LIBINTL
> 	bool
> 	default y
> 	depends on BR2_PACKAGE_GETTEXT
> 	depends on BR2_STATIC_LIBS

Why this depends on BR2_STATIC_LIBS ? Linking against libintl is also
needed in dynamic linking scenarios.

The build failure of
http://autobuild.buildroot.org/results/ede/ede5ee3316ea2b6790dcb930a6bc71adc8922bfc/
requires linking with libintl, even if it's a dynamic linking
configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
