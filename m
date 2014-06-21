From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Fri, 20 Jun 2014 20:44:29 -0700
Subject: [Buildroot] [PATCH 1/5] freescale-imx: bump to version
	3.10.17-1.0.0
In-Reply-To: <20140620210146.GB26745@free.fr>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
 <1403150639-29382-2-git-send-email-bisson.gary@gmail.com>
 <20140619162009.GA3534@free.fr>
 <CADCpmyNGmM_FoGGoiDS640wjjrQfNkMBsdf+HBfpFgn9aAptKw@mail.gmail.com>
 <20140620210146.GB26745@free.fr>
Message-ID: <53A4FF9D.2020909@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann and Gary,

On 06/20/2014 02:01 PM, Yann E. MORIN wrote:
> Gary, All,
> 
> On 2014-06-19 19:40 -0700, Gary Bisson spake thusly:
>>>> diff --git
>>> a/package/freescale-imx/imx-vpu/imx-vpu-0001-fix-IOSystemInit-failure.patch
>>> b/package/freescale-imx/imx-vpu/imx-vpu-0001-fix-IOSystemInit-failure.patch
>>>> new file mode 100644
>>>> index 0000000..b73a959
>>>> --- /dev/null
>>>> +++
>>> b/package/freescale-imx/imx-vpu/imx-vpu-0001-fix-IOSystemInit-failure.patch
>>>> @@ -0,0 +1,21 @@
>>>> +[PATCH] fix IOSystemInit failure
>>>
>>> Please provide a more detailed comit log. Why do we need this?
>>>
>>
>> As I said in the first patch I used the nitrogen6x to do my testing, there
>> is one "big" difference between freescale and boundary kernel which is the
>> memory split (2G/2G for FSL, 3G/1G for Boundary). Clearly the VPU code has
>> only been tested on Freescale kernels because there is no way it works on
>> kernel with the latter splitting. The VPU init function returns an error if
>> the allocated buffer address is < 0 which does not make any sense. Instead
>> the test should be against MAP_FAILED (-1). Only after that patch I've been
>> able to get the VPU decoding working. I will change the -1 into MAP_FAILED
>> for the next patch.

Nice catch. I do think this should be split into a separate patch
though.

A quick scan of this code shows that there are four other places
that have the test for IOGetVirtMem() <= 0.

> 
> OK, I see. You should also repeat this in the patch description, like:
> 
>     vpu-io: fix IOSystemInit failure
> 
>     There is one "big" difference between freescale and boundary kernel
>     which is the memory split (2G/2G for FSL, 3G/1G for Boundary).
> 
>     Clearly the VPU code has only been tested on Freescale kernels
>     because there is no way it works on kernel with the latter
>     splitting. The VPU init function returns an error if the allocated
>     buffer address is < 0, which happens with the 3G/1G split.
> 
>     Fix the test by checking against MAP_FAILED instead.
> 
>     Signed-off-by: You <you@there>
> 
> Thanks! :-)
> 
> Regards,
> Yann E. MORIN.
> 
