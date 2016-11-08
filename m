From: Michael Walle <michael@walle.cc>
Date: Tue, 08 Nov 2016 13:38:51 +0100
Subject: [Buildroot] genconfig/unconditonally include external.mk
In-Reply-To: <102f4cbd-15e3-8293-4fec-5d83b8eaa109@mind.be>
References: <66befb0a3a9cb7c98c7a011aa985fb2f@walle.cc>
 <ebbb33ee-6c3c-8be4-0e3e-ffdd136d6ad7@mind.be>
 <fce79a1a961dd6b6df31fbdca3166af2@walle.cc>
 <102f4cbd-15e3-8293-4fec-5d83b8eaa109@mind.be>
Message-ID: <98c173fef60c7635dee3883c3bb90271@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2016-11-08 13:02, schrieb Arnout Vandecappelle:
> On 08-11-16 11:59, Michael Walle wrote:
>> Am 2016-11-08 02:22, schrieb Arnout Vandecappelle:
>> mhh, ok, but i guess having additional make targets would be more 
>> appealing.
>> Esp. if you need some variables defined by buildroot.
> 
>  What variables defined by Buildroot could you possibly need? Since 
> you're
> making a defconfig, you have no .config available. The only variable 
> that you
> may want to use is $(O), but that one you anyway have to pass on the 
> command
> line.

Ahh, I thought of the support/kconfig/merge_config.sh for which I would 
need TOPDIR. I did just a quick test and it turns out, that I cannot use 
it as is, because it does an alldefconfig which isn't supported by 
buildroot (yet? dunno).


> So pass it as an argument to your merge script. Something like
> 
> ./genconfig <config-spec> [<path-to-output>]
> 
>  It would actually be great if we would have a script like that in 
> Buildroot
> that can be used generically.


Lets say we have a generic genconfig inside buildroot. Would it be only 
for external users or would you use it to generate similar defconfig 
files inside buildroot? And in the latter case, how would you do it?


>> mhh I see.. yann wrote that the correct solution would be to include 
>> external.mk
>> unconditionally.
> 
>  That's not what he wrote. Samuel suggested that it could be done 
> through
> external.mk, Patrick said that it was not, and then Yann explained in 
> more
> detail why not, and what would need to be changed in order to use 
> external.mk
> during configuration. He nowhere said that that would be a good 
> solution. OK, he
> wrote "The correct solution would be ..." but (I think) he meant the 
> correct
> solution for including external.mk for config, not the correct solution 
> for the
> genconfig problem.
> 
> 
>> I'm not so sure about this anymore after your comment above. I
>> think we should treat the internal and external package makefiles the 
>> same. That
>> is, either include both if BR2_HAVE_DOT_CONFIG is not set or include 
>> none of
>> them. But I guess there is are reasons not include the package files 
>> if
>> BR2_HAVE_DOT_CONFIG is not set. So why should be external package .mk 
>> files be
>> special..
> 
>  That is a very good remark.
> 
> 
>> You could include external.mk unconditonally, but put the package .mk 
>> files in a
>> BR2_HAVE_DOT_CONFIG block, which is not backwards compatible and 
>> doesn't really
>> fit simplicity. So I'm not sure. I know you were already down that 
>> route, but a
>> second external.mk which is included unconditonally?
> 
>  The problem is that we don't see a sensible use case for it. When we 
> make
> changes we want to make sure that we don't break any use cases, so we 
> really
> need to know what the use cases are. And use cases that can be solved
> differently don't count :-)

Yeah and its really ok, because otherwise buildroot will be more and 
more complex, and I don't want it to become another yocto :o) 
Nonetheless, the genconfig wasn't the only use case for this, but also 
an external help command, which also only makes sense, if you have own 
makefile targets, mhh.
And I really liked the idea of having a target "my_defconfig" where 
my_defconfig doesn't have to be a file but some script which do the 
defconfig. IMHO, from a users perspective it makes sense to have the 
same kind of target (*_defconfig).

-michael
