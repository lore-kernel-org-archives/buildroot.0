From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Jun 2014 14:34:24 +0200
Subject: [Buildroot] [PATCH v2 3/3] Makefile: do not add to targets
	common dependencies
In-Reply-To: <CAHkwnC8OEjEchUSmgXeVpwg6jiPc1WCt4YF4CmPGJZwBrBVTxA@mail.gmail.com>
References: <1403252778-19761-1-git-send-email-fabio.porcedda@gmail.com>
 <1403252778-19761-4-git-send-email-fabio.porcedda@gmail.com>
 <53A4C860.7090601@mind.be>
 <CAHkwnC8OEjEchUSmgXeVpwg6jiPc1WCt4YF4CmPGJZwBrBVTxA@mail.gmail.com>
Message-ID: <53A81ED0.5070309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/06/14 11:51, Fabio Porcedda wrote:
> On Sat, Jun 21, 2014 at 1:48 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 20/06/14 10:26, Fabio Porcedda wrote:
>>> Remove the rule that add common dependencies to every targets in the
>>> "TARGETS" variable because all those targets are packages that use the package
>>> framework that already add common dependencies.
> 
> I will update the description with a better description:
> 
> Remove the rule that add common dependencies to every targets in the
> "TARGETS" variable because all those targets are packages that use the
> package framework or they depends on targets that use the package
> framework, because the package framework already add common dependencies
> this rule it's useless.

 Several spelling issues here; corrected text:

Remove the rule that adds common dependencies to every target in the
"TARGETS" variable, because all those targets are packages that use the
package infrastructure or they depend on targets that use the package
infrastructure. The package infrastructure already adds common dependencies.
Therefore, this rule is useless.


> 
>>  There are still two targets that don't:
>>
>> - target-generatelocales - should probably be converted to a
>> TARGET_FINALIZE_HOOK as well;
> 
> I will do:
> 
> ifneq ($(GENERATE_LOCALE),)
> TARGETS+=host-localedef

 Spaces around +=

 Otherwise it's perfect.

> define GENERATE_LOCALE_HOOK
> ...
> endif
> TARGET_FINALIZE_HOOKS += GENERATE_LOCALE_HOOK
> endif
> 
>> - toolchain-eclipse-register - doesn't need to depend on anything I think, but
>> anyway could also be converted to a TARGET_FINALIZE_HOOK.
> 
> It depends on the toolchain target, but the toolchain is always built
> so it's safe to convert to a hook.

 Actually, the toolchain is not always built, e.g. 'make host-foo' will not
build it. Also if you haven't selected any target package, it won't be built.
But that's a bit far-fetched I guess.

 And anyway, the toolchain-eclipse-register target doesn't really depend on the
toolchain - it just creates a file that refers to it. Right?

> 
>>
>>  So neither of these are really critical.
> 
> The only advantage to convert those targets to hooks is for consistency?

 Indeed.

> 
> BTW: Both of those targets depends on the toolchain target that use
> the package framework so they have already the common dependencies.

 Indeed.


 Regards,
 Arnout


> 
>>  Also, you forgot you Sob.
> 
> Yes, thanks.
> 
> BR
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
