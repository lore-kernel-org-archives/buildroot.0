From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Nov 2015 22:41:22 +0100
Subject: [Buildroot] [PATCH 2/3] Config.in: add symbols for
 BR2_HOST_GCC_AT_LEAST_X_Y
In-Reply-To: <20151129211448.GK3630@free.fr>
References: <1448147919-5463-1-git-send-email-arnout@mind.be>
 <1448147919-5463-2-git-send-email-arnout@mind.be>
 <20151129174805.GC3630@free.fr> <565B665B.9050304@mind.be>
 <20151129211448.GK3630@free.fr>
Message-ID: <565B7102.2070707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29-11-15 22:14, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-11-29 21:55 +0100, Arnout Vandecappelle spake thusly:
>> On 29-11-15 18:48, Yann E. MORIN wrote:
>>> Arnout, All,
>>>
>>> On 2015-11-22 00:18 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>>>> Some host packages need a recent gcc version. Add symbols to Config.in
>>>> to specify the HOSTCC version. The values are passed through the
>>>> environment, and this environment is generated in a new support script.
>>>
>>> I really don't like this...
>>
>>  I originally had it as a make fragment :-P
>>
>>>
>>> Maybe it is a good candidate for a generated kconfig snippet, instead of
>>> this generated-environment oddity?
>>
>>  I never thought of that, it would be a possibility. If I would have time :-)
>> I'd have a go at it.
> 
> I already have all that is needed to generate a kconfig fragment, in my
> multi br2-external series.

> 
> It was meant only as a mean to add the generated Config.in that
> aggregates all the br2-external entries, but otherwise adds all the
> dependencies in the Makefile to ensure the fragment is created before we
> run any kconfig program.
> 
> So, if you could review those patches, we can get them early (if not the
> complete series) so all you'd have is to write the kconfig snippet
> generator for the host gcc version checks.

 I'll try to do that.

> 
> [--SNIP--]
>>>> +# Hidden config symbols for packages to check system gcc version
>>>> +config BR2_HOST_GCC_AT_LEAST_4_7
>>>> +	bool
>>>> +	option env="HOST_GCC_AT_LEAST_4_7"
>>>> +
>>>> +config BR2_HOST_GCC_AT_LEAST_4_8
>>>> +	bool
>>>> +	option env="HOST_GCC_AT_LEAST_4_8"
>>>> +
>>>> +config BR2_HOST_GCC_AT_LEAST_4_9
>>>> +	bool
>>>> +	option env="HOST_GCC_AT_LEAST_4_9"
>>>> +
>>>> +config BR2_HOST_GCC_AT_LEAST_5
>>>> +	bool
>>>> +	option env="HOST_GCC_AT_LEAST_5"
>>>
>>> If you make each of those options actually select the N-1 option, then
>>> all you need if to set one environment variable.
>>
>>  Alas, that is not possible with the env option. You'd need two symbols, one for
>> getting it from the environment and a real one that can be selected.
> 
> That's not what I conclude from my experiments:
> 
>     $ cat env-select.in
>     comment "What is enabled?"
>     config FOO
>         bool
>         option env="KCFG_FOO"
>     config BAR
>         bool
>         select FOO
>         option env="KCFG_BAR"
>     comment "FOO=y"
>         depends on FOO
>     comment "BAR=y"
>         depends on BAR
> 
>     $ KCFG_BAR=y mconf env-select.in
>     *** What is enabled? ***
>     *** FOO=y ***
>     *** BAR=y ***
> 
> So, it seems BAR does indeed select FOO, no? ;-)

 OK, I just remembered something like that from experiments with LEGACY and
didn't try again. I guess I remembered incorrectly :-)


 Regards,
 Arnout

> 
> [--SNIP--]
>>>> +* Host GCC version
>>>> +** Dependency symbol: +BR2_HOST_GCC_AT_LEAST_X_Y+, (replace
>>>> +   +X_Y+ with the proper version, see +Config.in+)
>>>> +** Comment string: no comment to be added
>>>> +** Note that it is usually not the package itself that has a minimum
>>>> +   host GCC version, but rather a host-package on which it depends.
>>>
>>> Well, in case the package builds an internal host tool, and properly
>>> separates BUILD_CC from CC, then the restriction does apply to the
>>> package itself and not a host-package.
>>
>>  Yeah I know, however it's complicated to explain that well in the manual, and I
>> don't believe it will ever happen in practice. Things built with BUILD_CC are
>> usually pretty simple tools.
> 
> Agreed.
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
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
