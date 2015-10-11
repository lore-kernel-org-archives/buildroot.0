From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 11 Oct 2015 23:21:31 +0200
Subject: [Buildroot] musl/gettext issue
In-Reply-To: <20150916221636.039df52b@free-electrons.com>
References: <20150916221636.039df52b@free-electrons.com>
Message-ID: <1444598491.3974.7.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mi, 2015-09-16 at 22:16 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> Today, I started looking at:
> 
> ???http://autobuild.buildroot.org/results/ede/ede5ee3316ea2b6790dcb93
> 0a6bc71adc8922bfc/build-end.log
> 
> Which, in appearance, seems to be the traditional missing -lintl when
> linking. But further investigation has revealed a slightly more
> complicated problem: how do we handle GNU gettext vs. musl.
> 
> Until, we were handling GNU gettext for glibc and uClibc:
> 
> ?* With glibc, the gettext handling is built into the C library. So
> the
> ???separate GNU gettext package (for the target) is not needed, and
> if
> ???it ever gets built, it detects that the C library has the
> necessary
> ???features, and therefore it doesn't build/install a libintl.so
> ???library and its header files.
> 
> ?* With uclibc, the gettext handling is not part of the C library, so
> ???we have to build the GNU gettext package when gettext support is
> ???needed. In this case, the GNU gettext package detects that the C
> ???library does not provide the gettext functionality, and it will
> ???build/install libintl.so and its header files.
> 
> This is why we have BR2_NEEDS_GETTEXT which is true when we use
> uClibc
> and false when we use uClibc, and BR2_NEEDS_GETTEXT_IF_LOCALE which
> is
> true when BR2_NEEDS_GETTEXT is true (i.e uClibc) *and* locale support
> is enabled.
> 
> So far, so good.
> 
> Now, enter musl. It does have an internal gettext implementation.
> However, it is not recognized by GNU gettext has a correct
> implementation, so when you build GNU gettext in a musl system, it
> does
> build/install libintl.so and its header files.
> 
> So for httping, two scenarios are possible:
> 
> ?1/ httping is built alone against musl. No problem: the gettext
> ????functions are part of the C library, everything works fine.
> 
> ?2/ httping is built *after* GNU gettext has been built. Since GNU
> ????gettext will replace the libintl.h of musl by its own one, the
> ????symbols from the GNU gettext libintl.so will be used, so we must
> ????link with -lintl explicitly. Which we are not doing, since
> ????htting.mk does:
> 
> ???????$(if $(BR2_NEEDS_GETTEXT),-lintl)
> 
> ????And BR2_NEEDS_GETTEXT is false for musl.
> 
> So, I initially tried:
> 
> -???????$(if $(BR2_NEEDS_GETTEXT),-lintl)
> +???????$(if $(BR2_PACKAGE_GETTEXT),-lintl)
> 
> With the reasoning that if GNU gettext is available, we want to use
> it,
> and if it's not available, then we'll not use it.
> 
> But that doesn't work with a glibc configuration: BR2_PACKAGE_GETTEXT
> can be enabled, but we don't have a libintl library, because GNU
> gettext doesn't build one in a glibc configuration. We try to link
> against libintl, but it's not there, and the build fails.
> 
> So, I see two possible options here:
> 
> ?1/ Simply do not allow the GNU gettext package to be built with
> glibc
> ????and musl since they provide the gettext functionality internally.
> 
> ????The only problem with this approach is that while httping is
> happy
> ????with the POSIX compliant gettext functionality of musl, some
> other
> ????programs such as Bison
> ????(https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=786885) will
> ????really need GNU gettext functionality.
> 
> ?2/ Allows force to use GNU gettext in musl configurations. This
> simply
> ????consists in:
> 
> ?config BR2_NEEDS_GETTEXT
> ????????bool
> -???????default y if BR2_TOOLCHAIN_USES_UCLIBC
> +???????default y if BR2_TOOLCHAIN_USES_UCLIBC ||
> BR2_TOOLCHAIN_USES_MUSL
> 
> ?????I have tested this solution and it does work (obviously).
> 
> ?????The drawback is obviously that we are going to build/install GNU
> ?????gettext even for cases where the internal gettext implementation
> ?????of musl would have been sufficient.
> 
> Do you see some other options? Any opinion between the two proposed
> options?

I have the same problem building the package mtd/host-mtd with musl.
mkfs.ubifs needs to be linked with lintl in this case and host-mtd not.

The option to use?BR2_PACKAGE_GETTEXT_WITH_LIBINTL as suggested by
Arnout looks good to me. Anybody cares about proposing a patch?

Best regards
J?rg Krause?
