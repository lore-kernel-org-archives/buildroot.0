From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 14 Dec 2013 12:47:11 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #3 (deadline
	December 20)
In-Reply-To: <52AA2D7A.8070804@gmail.com>
References: <CAAXf6LXUx3dERdYxq5d4mY8apxXk+Ltj_CNPm+RTM+52nKRUNA@mail.gmail.com>
 <CAAXf6LXjTtbN96pWCvmXVEWHXM5Fcb53weJWXaqjZYx1Qb73mw@mail.gmail.com>
 <52AA2D7A.8070804@gmail.com>
Message-ID: <CAAXf6LULojRcVcJOmbOLg0yYe7vVOLY6=SqkkE8Wif6eu6ghvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Valentine,

On Thu, Dec 12, 2013 at 10:41 PM, vaxon <gvaxon@gmail.com> wrote:
> On 12/12/2013 05:08 PM, Thomas De Schampheleire wrote:
>>
>> Hi Valentine,
>>
>> On Fri, Dec 6, 2013 at 10:02 PM, Thomas De Schampheleire
>> <patrickdepinguin@gmail.com> wrote:
>>
>>> [1/2] Makefile: Fix target-purgelocales
>>> Valentine Barshak <gvaxon@gmail.com>
>>> http://patchwork.ozlabs.org/patch/188623
>>>
>>> [2/2] Makefile: Add /usr/lib/locale to target-purgelocales
>>> Valentine Barshak <gvaxon@gmail.com>
>>> http://patchwork.ozlabs.org/patch/188624
>>
>>
>> At first sight these patches are still relevant. Could you confirm this?
>
>
> Yes, I think they still are.
>

I tested your two patches now.
On the first one, that regenerates locale.dir, I have some questions:

1. in the original locale.dir, the format is
<locale database file>  <full locale name>
Both words are separated with whitespace. However, in your patch a
colon (:) is used.

2. your patch expects that the locale filename is the same as the full
locale name. However, in the original locale.dir, I see many entries
where this assumption does not hold. For example:
iso8859-1/XLC_LOCALE                    de_BE.ISO8859-1
iso8859-15/XLC_LOCALE                   de_BE.ISO8859-15
iso8859-1/XLC_LOCALE                    de_CH.ISO8859-1
iso8859-15/XLC_LOCALE                   de_CH.ISO8859-15
iso8859-1/XLC_LOCALE                    de_DE.ISO8859-1
iso8859-15/XLC_LOCALE                   de_DE.ISO8859-15
iso8859-1/XLC_LOCALE                    en_US.ISO8859-1
iso8859-15/XLC_LOCALE                   en_US.ISO8859-15

The default set of whitelisted locales in buildroot is: C en_US de fr
If I try this default with your patch, the resulting locale.dir only contains:
C/XLC_LOCALE: C
and there is no de/fr/en_US support anymore.
It seems that the file locale.alias provides the translation between
the short names 'en_US', 'de', 'fr' and the locale names specified in
locale.dir.

Looking at the original behavior of target-purgelocales, it seems
broken too. Also there, only 'C' remains and the aliases are not taken
into account.

Either this should be fixed at once, or we consider this as an
improvement unrelated to your changes.

What is your opinion? Do you have any time / interest in looking
further into this?
Are others interested in fixing this locale whitelist handling?

Thanks,
Thomas
