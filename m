From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Feb 2014 09:01:11 +0100
Subject: [Buildroot] [PATCH] Makefile.legacy: fix recursive invocation
 with BUILDROOT_DL_DIR and _CONFIG
In-Reply-To: <20140210220947.GG5239@free.fr>
References: <1392068935-25510-1-git-send-email-arnout@mind.be>
 <20140210220947.GG5239@free.fr>
Message-ID: <52F9D8C7.7070900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/14 23:09, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2014-02-10 22:48 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> The legacy support for the old BUILDROOT_DL_DIR and BUILDROOT_CONFIG
>> breaks down when make is invoked recursively - which is done in a few
>> cases, e.g. silentoldconfig, external-defs, ... These targets always
>> give a legacy error.
>>
>> For BUILDROOT_DL_DIR, this is fixed by making sure that the original
>> value of BR2_DL_DIR taken from the environment is also exported again.
>>
>> For BUILDROOT_CONFIG, this is fixed with an additional comparison of
>> the environment variable's value with the fake value that we introduce
>> ourselves.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> I gave my Tested-by earlier (and I am *not* withdrawing it) since I
> think this is a valid stop-gap fix which should go before -rc1 is cut.
> 
> However, I wonder how appropriate this implementation is. I am not really
> convinced by this hack (although I can't see a better alternative).
> 
> Another solution (which I do not like much, either) would be to enclose
> these checks in:
> 
>     ifeq ($(ALREADY_IN_BUILDROOT),)
>     blabla legacy stuff blabla
>     endif
> 
> and at the end of the main Makefile, add:
> 
>     export ALREADY_IN_BUILDROOT=y
> 
> But, this is hacky too, and I'm not fond of it either.

 Yeah, it's not really an improvement.

 We could also just throw away those legacy checks.

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
