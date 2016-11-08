From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 23:05:52 +0100
Subject: [Buildroot] genconfig/unconditonally include external.mk
In-Reply-To: <98c173fef60c7635dee3883c3bb90271@walle.cc>
References: <66befb0a3a9cb7c98c7a011aa985fb2f@walle.cc>
 <ebbb33ee-6c3c-8be4-0e3e-ffdd136d6ad7@mind.be>
 <fce79a1a961dd6b6df31fbdca3166af2@walle.cc>
 <102f4cbd-15e3-8293-4fec-5d83b8eaa109@mind.be>
 <98c173fef60c7635dee3883c3bb90271@walle.cc>
Message-ID: <ff0542fb-6875-6844-7d77-c127bd083db3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 13:38, Michael Walle wrote:
> Am 2016-11-08 13:02, schrieb Arnout Vandecappelle:
>> On 08-11-16 11:59, Michael Walle wrote:
>>> Am 2016-11-08 02:22, schrieb Arnout Vandecappelle:
>>> mhh, ok, but i guess having additional make targets would be more appealing.
>>> Esp. if you need some variables defined by buildroot.
>>
>>  What variables defined by Buildroot could you possibly need? Since you're
>> making a defconfig, you have no .config available. The only variable that you
>> may want to use is $(O), but that one you anyway have to pass on the command
>> line.
> 
> Ahh, I thought of the support/kconfig/merge_config.sh for which I would need
> TOPDIR. I did just a quick test and it turns out, that I cannot use it as is,
> because it does an alldefconfig which isn't supported by buildroot (yet? dunno).

 Shouldn't that be olddefconfig (which is supported by buildroot)?

> 
> 
>> So pass it as an argument to your merge script. Something like
>>
>> ./genconfig <config-spec> [<path-to-output>]
>>
>>  It would actually be great if we would have a script like that in Buildroot
>> that can be used generically.
> 
> 
> Lets say we have a generic genconfig inside buildroot. Would it be only for
> external users or would you use it to generate similar defconfig files inside
> buildroot? And in the latter case, how would you do it?

 Both, I think. To use it to generate defconfig files inside buildroot, we'd add
something in the documentation explaining how you can create an extended board
config by calling the script to combine the base config with an extension config.


[snip]
>>  The problem is that we don't see a sensible use case for it. When we make
>> changes we want to make sure that we don't break any use cases, so we really
>> need to know what the use cases are. And use cases that can be solved
>> differently don't count :-)
> 
> Yeah and its really ok, because otherwise buildroot will be more and more
> complex, and I don't want it to become another yocto :o) 

 We started using pseudo, and firing up make takes almost as long as firing up
bitbake, so I'm afraid we're not that far off...


> Nonetheless, the
> genconfig wasn't the only use case for this, but also an external help command,
> which also only makes sense, if you have own makefile targets, mhh.
> And I really liked the idea of having a target "my_defconfig" where my_defconfig
> doesn't have to be a file but some script which do the defconfig. IMHO, from a
> users perspective it makes sense to have the same kind of target (*_defconfig).

 We have a (IMHO healthy) resistance against such "frivolous features", but if
there is enough push for it they eventually tend to come through. Cfr.
BR2_EXTERNAL, for instance. Keep on posting patches and talking to people!

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
