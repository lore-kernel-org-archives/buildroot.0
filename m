From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Apr 2017 12:42:21 +0200
Subject: [Buildroot] libintl static linking issues - yet another spin
In-Reply-To: <20170328222525.005b27bb@free-electrons.com>
References: <20170326235320.448e802a@free-electrons.com>
 <db756f2e-3dda-2fcc-6035-3287b88acf29@mind.be>
 <20170328222525.005b27bb@free-electrons.com>
Message-ID: <66e02263-8faf-0601-e3ba-18501de7c6ef@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Following up on the libintl static linking issues which have been discussed in
several threads but no conclusion as of yet.]

On 28-03-17 22:25, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 27 Mar 2017 14:35:46 +0200, Arnout Vandecappelle wrote:
> 
>>>  * avahi: link with libintl if libglib2 is enabled
>>>    https://patchwork.ozlabs.org/patch/683732/
>>>
>>>    My plan is to enable the stub libintl in uClibc-ng and stop having
>>>    all those linking issues with libintl from gettext. The only
>>>    drawback would be that there would no longer be "translation"
>>>    support with uClibc: the libintl implementation in uClibc-ng is
>>>    really just a stub.
>>>
>>>    Thoughts ?  
>>  I think having internationalization support can still be useful in a
>> Buildroot/uClibc based system, e.g. to support translation of a custom CLI UI.
>> So using the stub implementation unconditionally sounds like a bad idea.
>>
>>  How about instead making gettext/intl support depend on !static? That's also a
>> catch-all solution, but a lot less aggressive.
> Indeed, that's a solution. This solves the static linking issues, but
> by getting rid of libintl from gettext entirely, I was hoping to remove
> all the BR2_NEEDS_GETTEXT/BR2_NEEDS_GETTEXT_IF_LOCALE stuff.
> 
> But yes, I can understand that i18n support can be useful in a uClibc
> based system.
> 
> However, the !static dependency then needs to be propagated to all
> places where libintl is used, but only if uClibc is used. It's a bit of
> a nightmare :-/


 Here's a fresh idea, extended version of the "let gettext depend on !static" idea:

- We make LOCALE support depend on !static.
- We make the gettext package depend on !static.
- We need to propage a !static dependency to the 14 packages that have select
BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT; probably should be double-checked if
they really depend on gettext.
- The dozens of packages that have select BR2_PACKAGE_GETTEXT if
BR2_NEEDS_GETTEXT_IF_LOCALE don't need to depend on !static.


 However, thinking a bit more about it: if libintl support disappears from
uClibc-ng, does that mean that the BR2_TOOLCHAIN_BUILDROOT_LOCALE is gone? If
so, then the entire BR2_NEEDS_GETTEXT_IF_LOCALE becomes redundant. Actually,
that option is currently probably incorrect, since for musl it will never be
enabled, which means that those packages may not be built with intl support when
using musl, even if the gettext package is enabled.


 So perhaps instead we should introduce a new toolchain option BR2_ENABLE_INTL
or something similar. It would depend on BR2_NEEDS_GETTEXT and on !static, it
selects the gettext package (and nothing more). We could then move convert the
gettext package into a toolchain package so it is always there, and remove all
the gettext-related dependencies from Config.in and *.mk. In terms of patches it
would be a little bit complicated, but the end result would be a whole lot simpler.


 Thoughts?

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
