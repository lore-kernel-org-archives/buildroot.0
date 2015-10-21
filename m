From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Oct 2015 21:28:26 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: remove
 BR2_TARGET_OPTIMIZATION from TARGET_CFLAGS
In-Reply-To: <20151021182815.GA4112@free.fr>
References: <1444861150-4972-1-git-send-email-arnout@mind.be>
 <20151021182815.GA4112@free.fr>
Message-ID: <5627E75A.70206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-10-15 20:28, Yann E. MORIN wrote:
[snip]
> However, I noticed a potential bug in the toolchain-wrapper makefile.
> Here's how we currently define BR_ADDITIONAL_CFLAGS:
> 
>     -DBR_ADDITIONAL_CFLAGS='$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)",)'
> 
> Notice the last comma in there? We want to have that comma in the
> resulting expansion, so that we transform the option string:
> 
>     -mfoo -mbar -buz
> 
> into:
> 
>     "-mfoo", "-mbar", "-mbuz",
> 
> so that it can be used ina C array definition:
> 
>     static char *predef_args[] = {
>     [...]
>     #ifdef BR_ADDITIONAL_CFLAGS
>         BR_ADDITIONAL_CFLAGS
>     #endif
>     }
> 
> However, in Makefile function calls, the comma is used to separate the
> arguments passed to the function.
> 
> Even though $(foreach ...) only accepts three arguments, and the last
> comma in fact correctly ends up in the expanded string, it would be
> much safer to use $(comma) instead, like we would have to do in a call
> to any other function.

 Sure thing. Care to cook a patch?

 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
