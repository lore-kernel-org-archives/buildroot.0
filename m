From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 25 Aug 2016 10:56:12 +0200
Subject: [Buildroot] [PATCH 2/2] package/iputils: link with -lintl
In-Reply-To: <20160825101843.4d7740e0@free-electrons.com>
References: <20160824231003.29262-1-arnout@mind.be>
 <20160824231003.29262-2-arnout@mind.be>
 <20160825101843.4d7740e0@free-electrons.com>
Message-ID: <19ed123f-e837-e8a6-858e-639e6236f612@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-08-16 10:18, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 25 Aug 2016 01:10:03 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> +ifeq ($(BR2_NEEDS_GETTEXT)$(BR2_PACKAGE_GETTEXT),yy)
>> +IPUTILS_MAKE_OPTS += ADDLIB='-lintl'
>> +endif
> 
> Why do you need both BR2_NEEDS_GETTEXT=y and BR2_PACKAGE_GETTEXT=y ?

 Historical accident: I wrote this patch before patch 1/2. Without patch 1:

 BR2_NEEDS_GETTEXT means: if a package needs intl, it needs to select gettext.

 libgpg-error, however, only links with libintl if it is available. So it
doesn't really _need_ gettext. Only if the gettext package is actually selected,
it will link with it. In other words, only if BR2_PACKAGE_GETTEXT=y, iputils
needs to link with libintl.

 In the autobuild failure, gettext was selected. Since gettext sorts
alphabetically before libgpg-error, it was already built when libgpg-error was
built, so libgpg-error links with it, so iputils needs libintl.

 Then I wrote patch 1/2 to fix that dependency. In that patch, I decided to use
BR2_NEEDS_GETTEXT to always force libgpg-error to link with libintl, because
that is what is done by all other packages. As you write in your other reply,
that's wrong though: a user who doesn't care about i18n would build libintl even
though it isn't needed in this case. I just followed the pattern that is used
everywhere else.

 Oh, and BR2_NEEDS_GETTEXT is still needed as well, because the gettext package
can also be built for glibc and musl, but in that case gpg-error doesn't link
with it (because the functionality is already available in libc).


 TBH, the more I think about it, the more I am convinced that we need a more
fundamental solution:

* Make gettext/iconv part of the toolchain; remove any explicit dependency on
gettext.

* Add a Config.in option to the toolchain (e.g. BR2_USE_LIBINTL) to enable i18n.
This option just selects the gettext package. That's just to make it easier to
the user, otherwise they'd have to go and select gettext in the target packages
menus.

* If a package really needs libintl, it will also select BR2_USE_LIBINTL if
BR2_NEEDS_GETTEXT(_IF_LOCALE).

* Perhaps also make BR2_PACKAGE_GETTEXT a blind option, is there any use for it
in glibc/musl?

* Add -lintl to link if BR2_USE_LIBINTL. Perhaps add a make variable:
ifeq ($(BR2_USE_LIBINTL),y)
TARGET_LIBINTL_IF_NEEDED = -lintl
endif

 If BR2_PACKAGE_GETTEXT is not a blind option, then there is still a possibility
that it is selected without BR2_USE_LIBINTL, so it becomes more complicated :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
