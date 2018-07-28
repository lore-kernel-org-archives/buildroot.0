From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Jul 2018 10:08:32 +0200
Subject: [Buildroot] [PATCH 0/8] imx: update multimedia packages to
 4.9.88_2.0.0_ga
In-Reply-To: <20180726095811.GA5860@t450s.lan>
References: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
 <7bddd977-45ca-5b84-6aca-842c6de86e7c@mind.be>
 <20180726114521.22054034@windsurf> <20180726095811.GA5860@t450s.lan>
Message-ID: <fc1ae389-580c-13f8-1d52-0ea3c0b6507a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-07-18 11:58, Gary Bisson wrote:
> Hi,
> 
> On Thu, Jul 26, 2018 at 11:45:21AM +0200, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Thu, 26 Jul 2018 11:26:51 +0200, Arnout Vandecappelle wrote:
>>
>>>  I'm sorry for all the work that you did, but I don't really agree that this is
>>> a good idea. The upstream package really is called imx-vpu, so we prefer to keep
>>> that name. We changed the name for openssl because there really was no other
>>> way, but I do prefer to avoid that.
>>>
>>>  So I think it's just a matter of finding a better name for the virtual package.
>>> What about imx-vpu-provider?
>>
>> I have not reviewed the patch series carefully enough yet, but a
>> question is: do we need a virtual package at all?
> 
> Up to you, I'm ok either way, just thought it'd be cleaner this way.

 If you don't use the virtual package infra, the code just gets a little more
difficult to understand, so I really don't see a reason NOT to use the virtual
package infra. Yes, a virtual package is a little more verbose than "manually"
handling it, but it's a pattern that is understandable. The only disadvantage
that I see is that you have to find a name for it :-)

 That said, since there are only two users, doing it manually isn't that bad
either. So if you've already done the work, please stick to it and don't keep
running around in circles...

 Regards,
 Arnout

> 
>> I guess the imx-vpu API is not going to be used by gazillions of
>> packages. If I read PATCH 5/8 correctly, it's in fact only used by two
>> packages, right ?
> 
> Yes, libimxvpuapi and imx-vpuwrap are the only 2 users of imx-vpu right
> now.
> 
>> Can't we simply have those two packages do:
>>
>> ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
>> use the new imx-vpu package
>> else
>> use the old imx-vpu package
>> endif
>>
>> And ditto in their Config.in ?
> 
> Ok.
> 
>> Virtual packages are great when there is really an arbitrary number of
>> providers and/or an arbitrary number of users.
>>
>> OpenSSL for examples has only two providers, but it has a very large
>> number of users. Ditto jpeg. MySQL does not have a lot of users, but it
>> might potentially have.
>>
>> Also, the i.MX VPU stuff is highly platform-specific, it provides a
>> very specialized API, it's very unlikely that we will see gazillions of
>> packages depending on the i.MX VPU API.
> 
> Ok, I'll make a v3 like this then.
> 
> Regards,
> Gary
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
