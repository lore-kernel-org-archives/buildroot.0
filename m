From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Jul 2015 13:11:16 +0200
Subject: [Buildroot] [PATCH] Update from polarssl to mbed 1.3.11
In-Reply-To: <55A8D954.8020703@zacarias.com.ar>
References: <1437080329-96500-1-git-send-email-eswierk@skyportsystems.com>
 <20150716231142.6486d101@free-electrons.com> <55A8311B.30503@mind.be>
 <20150717095210.223e90bb@free-electrons.com>
 <55A8D954.8020703@zacarias.com.ar>
Message-ID: <55A8E2D4.7080108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/17/15 12:30, Gustavo Zacarias wrote:
> On 17/07/15 04:52, Thomas Petazzoni wrote:
> 
>> Arnout, Ed,
>>
>> On Fri, 17 Jul 2015 00:32:59 +0200, Arnout Vandecappelle wrote:
>>
>>>> Thanks for your patch. However, following Gustavo's comment, I've
>>>> marked your patch as "Changes Requested" in our patch tracking system.
>>>> Can you resubmit a new version that takes into account Gustavo's
>>>> comments?
>>>
>>>   Since it anyway is not compatible and upstream changed name, perhaps it's
>>> better just to create a new package called mbedtls? When we remove polarssl we
>>> can make a legacy entry to point to mbedtls.
>>
>> Why would we remove polarssl? Is the project dead? Or is mbedtls its
>> replacement?
>>
>> Other than that, yes: if mbedtls is like a new library that is
>> incompatible with polarssl, then a separate package is the best option.
> 
> mbedtls is polarssl, it just got renamed when they got bought by ARM.
> Adding to confusion this was done with the 1.3+ branches but not with 1.2 (which
> is in security maintenance).
> It was to reflect that polarssl (now mbedtls) is the crypto library for the mbed
> operating system, even though it still works with linux (likely they enabled
> this with 1.3+ but never backported to 1.2- hence keeping the old name).
> Last time i've checked the 1.2 and 1.3 series couldn't coexist sanely on the
> same system, and since programs checks for polarssl rather than mbedtls for now
> it's probably still the case.
> rtmpdump can use any of the three optionally (gnutls, openssl, polarssl), dunno
> if it can handle 1.3+
> curl needs 1.3+ (we never enabled polarssl support).
> Newer hiawatha needs 1.3+ (or can use bundled).
> shairport-sync can use either polarssl or openssl (mandatory one of them), dunno
> if it can handle 1.3+
> openvpn can use openssl or polarssl (not 1.3+).
> So it basically narrows down the choices, though it doesn't necessarily take
> down other packages.
> Question is, keep 1.2 and some small targets small or go 1.3+ ?
> Also there's mbedtls 2.0.0 now, which, again, breaks API. And this has a better
> chance of living side by side with polarssl 1.2 since they've renamed everything
> it seems.

 So the tarball called mbedtls installs a library called polarssl? Or does it
install a library called mbedtls with a symlink from polarssl?

 Either way, since there's an API change, I still think it makes sense to make
it a new package - that's what we do with webkitgtk24 as well. If side-by-side
is not possible, we can just make it depend on !polarssl or vice versa. It's a
bit of a pain while we have both polarssl and mbedtls because of the extra
select/depends stuff in the packages using it, but anyway most packages only
have automatic dependencies in the .mk file.

 With the API breakage in mbedtls 2.0 in mind, it's probably best to call the
new package mbedtls13 so we can eventually (when everything has migrated to 2.0
API) end up with just a single package mbedtls.

 All this for a TLS library that has simplicity as its USP :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
