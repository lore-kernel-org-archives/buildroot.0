From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 15:37:48 +0200
Subject: [Buildroot] [PATCH 2/2] package/iputils: link with -lintl
In-Reply-To: <00309b95-ef5b-ba21-ecaa-7b62010718b5@mind.be>
References: <20160824231003.29262-1-arnout@mind.be>
 <20160824231003.29262-2-arnout@mind.be>
 <20160825101843.4d7740e0@free-electrons.com>
 <19ed123f-e837-e8a6-858e-639e6236f612@mind.be>
 <20160825150721.1158d7fc@free-electrons.com>
 <00309b95-ef5b-ba21-ecaa-7b62010718b5@mind.be>
Message-ID: <20160825153748.5a8bbb7a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 15:17:37 +0200, Arnout Vandecappelle wrote:

> > Not correct. There are several packages that optionally depend on
> > gettext. For example, look at coreutils, it does exactly what I saying
> > above: it depends on gettext if BR2_PACKAGE_GETTEXT=y and that's it.
> > 
> > Same for gdbm, gptfdisk, libconfuse, popt, etc, etc.
> > 
> > So no, you've not followed the pattern used everywhere else :-)  
> 
>  Ahem. Looking back in my console logs: I grepped for BR2_NEEDS_GETTEXT and I
> found the pattern I mentioned. Self-fulfilling prophecy :-)

Hehe :-)

> >>  Oh, and BR2_NEEDS_GETTEXT is still needed as well, because the gettext package
> >> can also be built for glibc and musl, but in that case gpg-error doesn't link
> >> with it (because the functionality is already available in libc).  
> > 
> > Just use the optional dependency I mentioned above. When the gettext
> > package is built with a musl or glibc toolchain, it doesn't build and
> > install a libintl library, since the C library already provides the
> > functionality. So adding gettext as an optional dependency is just fine.  
> 
>  I mean it is needed (or rather, makes sense) for iputils. If
> BR2_PACKAGE_GETTEXT && !BR2_NEEDS_GETTEXT, then libgpg-error doesn't link with
> libintl, so iputils doesn't need -lintl. And since libintl doesn't even exist,
> adding -lintl will give an error. No?

Hum, yes, I guess so. So, to sum up:

 * Your PATCH 1 needs to be adjusted to:

   ifeq ($(BR2_PACKAGE_GETTEXT),y)
   LIBGPG_ERROR_DEPENDENCIES += gettext
   endif

 * Your PATCH 2 needs to be adjusted to:

   # When gettext is enabled (BR2_PACKAGE_GETTEXT=y), and provides
   # libintl (BR2_NEEDS_GETTEXT=y), we need to link with libintl
   # explicitly when static linking, since our dependencies might use it.
   ifeq ($(BR2_NEEDS_GETTEXT)$(BR2_PACKAGE_GETTEXT)$(BR2_STATIC_LIBS),yyy)
   IPUTILS_MAKE_OPTS += ADDLIB='-lintl'
   endif

Is this correct?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
