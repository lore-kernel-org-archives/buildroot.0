From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 15:07:21 +0200
Subject: [Buildroot] [PATCH 2/2] package/iputils: link with -lintl
In-Reply-To: <19ed123f-e837-e8a6-858e-639e6236f612@mind.be>
References: <20160824231003.29262-1-arnout@mind.be>
 <20160824231003.29262-2-arnout@mind.be>
 <20160825101843.4d7740e0@free-electrons.com>
 <19ed123f-e837-e8a6-858e-639e6236f612@mind.be>
Message-ID: <20160825150721.1158d7fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 10:56:12 +0200, Arnout Vandecappelle wrote:

> >> +ifeq ($(BR2_NEEDS_GETTEXT)$(BR2_PACKAGE_GETTEXT),yy)
> >> +IPUTILS_MAKE_OPTS += ADDLIB='-lintl'
> >> +endif  
> > 
> > Why do you need both BR2_NEEDS_GETTEXT=y and BR2_PACKAGE_GETTEXT=y ?  
> 
>  Historical accident: I wrote this patch before patch 1/2. Without patch 1:
> 
>  BR2_NEEDS_GETTEXT means: if a package needs intl, it needs to select gettext.

Correct.

>  libgpg-error, however, only links with libintl if it is available. So it
> doesn't really _need_ gettext. Only if the gettext package is actually selected,
> it will link with it. In other words, only if BR2_PACKAGE_GETTEXT=y, iputils
> needs to link with libintl.

In this case, as I said in my e-mail, the only thing you should do is:

ifeq ($(BR2_PACKAGE_GETTEXT),y)
<pkg>_DEPENDENCIES += gettext
endif

and not do *anything* in the Config.in.

>  In the autobuild failure, gettext was selected. Since gettext sorts
> alphabetically before libgpg-error, it was already built when libgpg-error was
> built, so libgpg-error links with it, so iputils needs libintl.
> 
>  Then I wrote patch 1/2 to fix that dependency. In that patch, I decided to use
> BR2_NEEDS_GETTEXT to always force libgpg-error to link with libintl, because
> that is what is done by all other packages. As you write in your other reply,
> that's wrong though: a user who doesn't care about i18n would build libintl even
> though it isn't needed in this case. I just followed the pattern that is used
> everywhere else.

Not correct. There are several packages that optionally depend on
gettext. For example, look at coreutils, it does exactly what I saying
above: it depends on gettext if BR2_PACKAGE_GETTEXT=y and that's it.

Same for gdbm, gptfdisk, libconfuse, popt, etc, etc.

So no, you've not followed the pattern used everywhere else :-)

>  Oh, and BR2_NEEDS_GETTEXT is still needed as well, because the gettext package
> can also be built for glibc and musl, but in that case gpg-error doesn't link
> with it (because the functionality is already available in libc).

Just use the optional dependency I mentioned above. When the gettext
package is built with a musl or glibc toolchain, it doesn't build and
install a libintl library, since the C library already provides the
functionality. So adding gettext as an optional dependency is just fine.

>  TBH, the more I think about it, the more I am convinced that we need a more
> fundamental solution:

Maybe, yes.

> * Make gettext/iconv part of the toolchain; remove any explicit dependency on
> gettext.
> 
> * Add a Config.in option to the toolchain (e.g. BR2_USE_LIBINTL) to enable i18n.
> This option just selects the gettext package. That's just to make it easier to
> the user, otherwise they'd have to go and select gettext in the target packages
> menus.
> 
> * If a package really needs libintl, it will also select BR2_USE_LIBINTL if
> BR2_NEEDS_GETTEXT(_IF_LOCALE).
> 
> * Perhaps also make BR2_PACKAGE_GETTEXT a blind option, is there any use for it
> in glibc/musl?

There is: when you need gettext programs on the target, which is the
case of the ecryptfs-utils package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
