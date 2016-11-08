From: Michael Walle <michael@walle.cc>
Date: Tue, 08 Nov 2016 11:59:53 +0100
Subject: [Buildroot] genconfig/unconditonally include external.mk
In-Reply-To: <ebbb33ee-6c3c-8be4-0e3e-ffdd136d6ad7@mind.be>
References: <66befb0a3a9cb7c98c7a011aa985fb2f@walle.cc>
 <ebbb33ee-6c3c-8be4-0e3e-ffdd136d6ad7@mind.be>
Message-ID: <fce79a1a961dd6b6df31fbdca3166af2@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2016-11-08 02:22, schrieb Arnout Vandecappelle:
> On 07-11-16 10:49, Michael Walle wrote:
>> Hi,
>> 
>> there was a discussion (and rejected patches) [1] about adding support 
>> for
>> buildroot config fragments. The conclusion was that this should not be 
>> part of
>> buildroot and should stay external.
> 
>  With "stay external", the idea was not that it would be handled in 
> external.mk,
> but rather that you have a script that merges the defconfigs to a 
> temporary file
> and the calls 'make defconfig BR2_DEFCONFIG=...' on it.

mhh, ok, but i guess having additional make targets would be more 
appealing. Esp. if you need some variables defined by buildroot.

>> But an integration would need unconditonal
>> inclusion of the external.mk. The last mail about this subject was in 
>> July [2].
>> Are there any news on this topic?
> 
>  Nobody ever posted a patch :-)
> 
>  But I can already tell you that you won't be able to just move the 
> include
> outside of the conditional: it can go up over the definition of the 
> package
> infras, and it can't go down over the target-finalize: $(PACKAGES) 
> rule. So it
> has to stay where it is, and the conditional has to be split up.
> 
>  It should be analyzed then what the effect is of including package .mk 
> files
> when the package infra is not defined.

mhh I see.. yann wrote that the correct solution would be to include 
external.mk unconditionally. I'm not so sure about this anymore after 
your comment above. I think we should treat the internal and external 
package makefiles the same. That is, either include both if 
BR2_HAVE_DOT_CONFIG is not set or include none of them. But I guess 
there is are reasons not include the package files if 
BR2_HAVE_DOT_CONFIG is not set. So why should be external package .mk 
files be special..

You could include external.mk unconditonally, but put the package .mk 
files in a BR2_HAVE_DOT_CONFIG block, which is not backwards compatible 
and doesn't really fit simplicity. So I'm not sure. I know you were 
already down that route, but a second external.mk which is included 
unconditonally?

-michael
