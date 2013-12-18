From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Dec 2013 21:56:52 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #3 (deadline
	December 20)
In-Reply-To: <52AEEF37.90605@gmail.com>
References: <CAAXf6LXUx3dERdYxq5d4mY8apxXk+Ltj_CNPm+RTM+52nKRUNA@mail.gmail.com>
 <CAAXf6LXjTtbN96pWCvmXVEWHXM5Fcb53weJWXaqjZYx1Qb73mw@mail.gmail.com>
 <52AA2D7A.8070804@gmail.com>
 <CAAXf6LULojRcVcJOmbOLg0yYe7vVOLY6=SqkkE8Wif6eu6ghvQ@mail.gmail.com>
 <52AEEF37.90605@gmail.com>
Message-ID: <CAAXf6LWFjs7mq3hB1irOJ6abTz0SWp6H-Zk18Odv1LeawY5wtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Valentine,

On Mon, Dec 16, 2013 at 1:16 PM, vaxon <gvaxon@gmail.com> wrote:
[..]

>>
>> I tested your two patches now.
>> On the first one, that regenerates locale.dir, I have some questions:
>>
>> 1. in the original locale.dir, the format is
>> <locale database file>  <full locale name>
>> Both words are separated with whitespace. However, in your patch a
>> colon (:) is used.
>
>
> The space-separated variant was used for older versions of X11 (before
> XFree86 v4.0).

But the version used in mainline buildroot uses the space-separated
variant, so shouldn't your patch also do this?

>
>
>>
>> 2. your patch expects that the locale filename is the same as the full
>> locale name. However, in the original locale.dir, I see many entries
>> where this assumption does not hold. For example:
>> iso8859-1/XLC_LOCALE                    de_BE.ISO8859-1
>> iso8859-15/XLC_LOCALE                   de_BE.ISO8859-15
>> iso8859-1/XLC_LOCALE                    de_CH.ISO8859-1
>> iso8859-15/XLC_LOCALE                   de_CH.ISO8859-15
>> iso8859-1/XLC_LOCALE                    de_DE.ISO8859-1
>> iso8859-15/XLC_LOCALE                   de_DE.ISO8859-15
>> iso8859-1/XLC_LOCALE                    en_US.ISO8859-1
>> iso8859-15/XLC_LOCALE                   en_US.ISO8859-15
>>
>
> The idea of the patch was to recreate the locale.dir file at its minimum
> from the locales that are not removed by the target-purgelocales.
> It's not modifying the LOCALE_WHITELIST file.
> The only thing it does it adds the "$$lang/XLC_LOCALE: $$lang" to the
> locale.dir
> in case the locale is in the LOCALE_WHITELIST (is not removed).
> This helped to keep minimum files to make locale work in X11 for me.
> The
>
>
>> The default set of whitelisted locales in buildroot is: C en_US de fr
>> If I try this default with your patch, the resulting locale.dir only
>> contains:
>> C/XLC_LOCALE: C
>> and there is no de/fr/en_US support anymore.
>> It seems that the file locale.alias provides the translation between
>> the short names 'en_US', 'de', 'fr' and the locale names specified in
>> locale.dir.
>>
>> Looking at the original behavior of target-purgelocales, it seems
>> broken too. Also there, only 'C' remains and the aliases are not taken
>> into account.
>
>
> I did not mess with the locale names/aliases.
> Yes, target-purgelocales removes aliases but I'm not sure what effect this
> may have.
> The locales I used (C en_US en_US.UTF-8 ru_RU ru_RU.UTF-8) worked fine with
> this patch applied.
> Probably because it was UTF-8 after all.
> (C, en_US.UTF-8, ru_RU.UTF-8 directories are all there in
> /usr/share/X11/locale/)
> So, I decided not to mess with the LOCALE_WHITELIST file or the aliases, but
> to keep
> some XLC_LOCALE files that are in it and list them in the locale.dir.
>
>
>>
>> Either this should be fixed at once, or we consider this as an
>> improvement unrelated to your changes.
>>
>> What is your opinion? Do you have any time / interest in looking
>> further into this?
>
>
> I'm afraid I don't have any time at the moment, and as I don't see any
> problems with
> the locales I originally use, I'm quite happy with this patch.

The current code works fine as long as you don't use aliases. This
means that the default value of LOCALE_WHITELIST is broken.

Best regards,
thomas
