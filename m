From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Thu, 17 Jan 2013 02:36:06 +0200
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <20130117000037.39ccc628@skate>
References: <50F6A26D.4030607@petroprogram.com> <20130117000037.39ccc628@skate>
Message-ID: <50F74776.60503@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

17.1.2013 1:00, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Wed, 16 Jan 2013 14:51:57 +0200, Stefan Fr?berg wrote:
>
>> Yesterday evening I managed to compile cairo-dock-core and
>> cairo-dock-plugins
>> version 3.1.2 for buildroot 2012.08.
>>
>> It's a nice, lightweight (made with C), Mac OSX feeling application
>> dock.
>>
>> The problem is that cairo-dock-core has the following line in it's
>> code:
>>
>> pCairoDockModule->handle = dlopen (pCairoDockModule->cSoFilePath,
>> RTLD_LAZY | RTLD_LOCAL | RTLD_DEEPBIND);
>>
>> And uClibc does not have RTLD_DEEPBIND. Removing it will allow
>> cairo-dock to compile but the result is
>> that cairo-dock plugins won't work.
> Strange, from a quick look, it seems that it is used to get a single
> symbol, called "pre_init" from each plugin. I don't see how pre_init
> may conflict with some other global symbol, which is what RTLD_DEEPBIND
> is all about. But I've only done a 5 minutes look at cairo-dock code,
> so I might have missed the point.
>
>> Is there any workaround to this RTLD_DEEPBIND stuff ?
> Since you're using a big stuff like X.org, why do you persist in using
> uClibc? Using glibc or eglibc would make a very small size difference,
> and would avoid the hassle of all those small, but annoying, uClibc
> limitations.
>
> Best regards,
>
> Thomas

Well, it's not *that* big.

I mean, yeah, I have Xorg but besides that I only have Fluxbox as my
environment
and I just wanted to have much more feature richer & "cooler"
application launcher than what
Fluxbox offers (that is, none).

As a matter of fact, my biggest uClibc-compiled application is not Xorg
but firefox 18.0 (patch coming soon)

And IMHO those limitations are not really uClibc's fault at all.

It's because glibc offers stuff like (execinfo.h, mcheck.h,
RTLD_DEEPBIND etc...) which are not listed in any standard (POSIX or
otherwise)
and which people happily use in their own coding projects while being
unaware that they are not standard comforming
and hence not easily portable.
Im sure you noticed this when making that elfutils package Thomas. I had
as hellish experience as you did when doing
the initial build of that thing. All because the author of that software
happened to be Ulrich Drepped, the father of glibc,
so no wonder that it's code was littered with (non-standard) glibc-stuff.

Also, it's a good learning experience for me while porting stuff to uClibc

Regards
Stefan

P.S:

I found out that they started using RTLD_DEEPBIND in cairo-dock-core
2.4.0 version.
So I will try 2.3.0 and report my findings.
