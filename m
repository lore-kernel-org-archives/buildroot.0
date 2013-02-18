From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 18 Feb 2013 18:32:43 +0200
Subject: [Buildroot] multchoice menu with kconfig
In-Reply-To: <51225580.3060206@mind.be>
References: <5122315C.3070806@petroprogram.com> <512249D5.5020107@mind.be>
 <51224C88.4020108@petroprogram.com> <51224F93.9060102@mind.be>
 <5122506E.8030008@petroprogram.com> <512251F3.7060101@mind.be>
 <512253C8.2050309@petroprogram.com> <51225580.3060206@mind.be>
Message-ID: <512257AB.6040001@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

18.2.2013 18:23, Arnout Vandecappelle kirjoitti:
> On 18/02/13 17:16, Stefan Fr?berg wrote:
>> 18.2.2013 18:08, Arnout Vandecappelle kirjoitti:
>>> >On 18/02/13 17:01, Stefan Fr?berg wrote:
>>>> >>And because this iso-codes package does not seem to have nothing but
>>>> >>punch .po files
>>>> >>and not link against anything then changing that
>>>> ISO_CODES_DEPENDENCIES
>>>> >>to host-gettext should be good.
>>> >
>>> >  Err... But iso-codes doesn't need host-gettext, does it? It probably
>>> >doesn't make much sense without locale support in the toolchain, but
>>> >otherwise I see no dependencies except python (which is already a
>>> >buildroot dependency).
>>> >
>> But don't you need at least host gettext stuff to process those .po
>> files ?
>>
>> I should now tell at this point that besides giving  -lintl linker flags
>> and giving --disable-nls to configure scripts
>> I absolutely have no idea how gettext works. :D
>>
>> Im confused now.
>> So no dependencies at all ????? Or gettext dependencies with locale
>> checking ?????? (Like Thomas said in his post)
>
>  Sorry, correction: it does need host-gettext, but the gettext package
> (or rather, msgfmt) is one of our global dependencies.
>

Ah, I see.
So if it's only that msgfmt that is needed and it is already there then
I can remove ISO_CODES_DEPENDENCIES completely?

>  host-gettext is only needed for the autoconf macros (because we don't
> use the system's autoconf, only our own version).
>
>  Regards,
>  Arnout
>

Speaking of autoconf (or actually autoreconf):

I have a prelink package ready here and I had to do PRELINK_AUTORECONF =
YES what happens is that it complains about
missing ./ABOUT-NLS and ./config.rpath .
I tried to give PRELINK_AUTORECONF_OPTS = --install --force so that it
would create those missing files but it did not change anything.

The only thing that worked was doing the following horrible looking stuff:

define PRELINK_POST_PATCH_FIXUP
    (cd $(@D); \
    autopoint)
endef

PRELINK_POST_PATCH_HOOKS += PRELINK_POST_PATCH_FIXUP

Im still using 2012.08 version of buildroot so could that be the reason
that buildroots autoreconf does not create those two missing files ?

Regards
Stefan
