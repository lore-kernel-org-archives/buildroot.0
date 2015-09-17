From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Sep 2015 00:27:21 +0200
Subject: [Buildroot] musl/gettext issue
In-Reply-To: <20150916221636.039df52b@free-electrons.com>
References: <20150916221636.039df52b@free-electrons.com>
Message-ID: <55FB3E49.5050606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-09-15 22:16, Thomas Petazzoni wrote:
[snip]
> But that doesn't work with a glibc configuration: BR2_PACKAGE_GETTEXT
> can be enabled, but we don't have a libintl library, because GNU
> gettext doesn't build one in a glibc configuration. We try to link
> against libintl, but it's not there, and the build fails.
> 
> So, I see two possible options here:
> 
>  1/ Simply do not allow the GNU gettext package to be built with glibc
>     and musl since they provide the gettext functionality internally.

 Problem: something like ecryptfs-utils, which needs the gettext program at
runtime...


>     The only problem with this approach is that while httping is happy
>     with the POSIX compliant gettext functionality of musl, some other
>     programs such as Bison
>     (https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=786885) will
>     really need GNU gettext functionality.

 This one could perhaps be solved by adding a BR2_HAS_GNU_GETTEXT. But again, of
course, it must be possible to select gettext in that case.


> 
>  2/ Allows force to use GNU gettext in musl configurations. This simply
>     consists in:
> 
>  config BR2_NEEDS_GETTEXT
>         bool
> -       default y if BR2_TOOLCHAIN_USES_UCLIBC
> +       default y if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
> 
>      I have tested this solution and it does work (obviously).
> 
>      The drawback is obviously that we are going to build/install GNU
>      gettext even for cases where the internal gettext implementation
>      of musl would have been sufficient.

 That sounds like a bad idea. What's the point of using musl if you're going to
add a bunch of GNU extensions to it?


 Another option is that we add a different flag to indicate the dependency on
libintl:

config BR2_PACKAGE_GETTEXT_WITH_LIBINTL
	bool
	default y
	depends on BR2_PACKAGE_GETTEXT
	depends on BR2_STATIC_LIBS
	depends on !BR2_TOOLCHAIN_USES_GLIBC


 HTTPING_LDFLAGS = $(TARGET_LDFLAGS) \
        $(if $(BR2_PACKAGE_GETTEXT_WITH_LIBINTL),-lintl) \


 There's just about 30 packages that ned to be adapted.

 Regards,
 Arnout

> 
> Do you see some other options? Any opinion between the two proposed
> options?
> 
> Thanks,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
