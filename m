From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 27 Jul 2015 11:34:06 +0200
Subject: [Buildroot] [PATCH] package/exim: Fix compilation error with
 musl
In-Reply-To: <20150726151005.12a9989d@free-electrons.com>
References: <1437831415-6066-1-git-send-email-luca@lucaceresoli.net>
 <20150726151005.12a9989d@free-electrons.com>
Message-ID: <55B5FB0E.2060600@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Sat, 25 Jul 2015 15:36:55 +0200, Luca Ceresoli wrote:
>> From: Bernd Kuhls <bernd.kuhls@t-online.de>
>>
>> Fixes
>> smtp_in.c: In function ?smtp_start_session?:
>> smtp_in.c:1976:36: error: invalid application of ?sizeof? to incomplete type ?struct options?
>>       EXIM_SOCKLEN_T optlen = sizeof(struct ip_options) + MAX_IPOPTLEN;
>>
>> smtp_in.c misdetects the needed style for ip_options, only OPTSTYLE == 2 works.
>> Since musl does not provide any macro[1] to detect it we need to pretend to be
>> darwin in order to fix the compile bug.
>>
>> [1] http://wiki.musl-libc.org/wiki/FAQ#Q:_why_is_there_no_MUSL_macro_.3F
>>
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> [Luca: simplify by using only one sed invocation]
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> ---
>>
>> I'm adopting this oldish patch (https://patchwork.ozlabs.org/patch/460496/)
>> from Bernd. The bug it fixes is still there, and the fix is still valid. I
>> just simplified it according to my comments to the original patch.
>
> Thanks for picking up an old patch, definitely useful! I'm not too
> happy with us pretending to be Darwin when building against Musl, as it
> could fire back on us in the future (like if Exim starts using
> something really Darwin specific). But oh well, I guess it's good
> enough for now.

Indeed.

Actually, for the sake of _building_, setting NO_IP_OPTIONS instead of
DARWIN_IP_OPTIONS would be fine as well. But it would result in OPTSTYLE
to be set to 3, not 2. Bernd, do you think it would work anyway?

For the curious, the *_IP_OPTIONS defines are only referenced in this
file:

   http://git.exim.org/exim.git/blob/HEAD:/src/src/smtp_in.c#l1961

where there's a lengthy commentary about the headaches with the various
C libraries.

-- 
Luca
