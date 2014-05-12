From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Mon, 12 May 2014 12:17:09 -0700
Subject: [Buildroot] [PATCH v2 1/2] powerpc64 powerpc64le: add support
In-Reply-To: <20140511234912.7b70a9c2@free-electrons.com>
References: <1399842673-21261-1-git-send-email-cody@linux.vnet.ibm.com>
 <20140511234912.7b70a9c2@free-electrons.com>
Message-ID: <53711E35.9020603@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/11/2014 02:49 PM, Thomas Petazzoni wrote:

> Generally speaking, I believe it would be nice if this patch could be
> split into smaller patches. This would also ease their way for merging.
> I'll try to suggest approaches to split it up while reviewing it, below.

yep, will do.

[...]

>> +config BR2_POWERPC_CPU_HAS_SPE
>> +	bool
>> +
>> +config BR2_POWERPC
>> +	bool
>> +	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>
> I see what you want to do, but I'm not a big fan of just using a case
> difference between BR2_POWERPC and BR2_powerpc. Unfortunately, I don't
> really have a great proposal to make here. One possibility would be to
> rename the current BR2_powerpc to BR2_powerpcbe, and then use
> BR2_powerpc64be instead of BR2_powerpc64. Then BR2_powerpc would be
> available as a common option for all PowerPC architectures. But that
> requires a fairly significant rename, so before implementing it, I'd
> suggest you wait a bit to see if there's a consensus around this
> proposal or not.

I don't like the BR2_powerpcbe change as it would mean the arch name and 
config option wouldn't be the same, potentially causing even more 
confusion than the switched caps mechanism I went with.

> In any case, introducing this common BR2_POWERPC or BR2_powerpc option
> could be done as a separate, preliminary patch. This way, a good number
> of the package related changes to use BR2_POWERPC could be made before
> introducing the PPC64 support.

I avoided using BR2_POWERPC in packages as generally when a new ppc 
variant is added they'll need to be updated to support it.

>>   choice
>>   	prompt "Target Architecture Variant"
>> -	depends on BR2_powerpc
>> +	depends on BR2_POWERPC
>
> Not your fault, but since the file containing this is only included
> when BR2_powerpc is defined, I'm not sure to see why we have this
> 'depends on' here.
>

Yep, I'll remove these. This also removes much of the point of 
BR2_POWERPC, so I think I'll nuke it as well in v2.

[... removed a bunch of acks to your suggestions hidden in a mountain of 
code ...]
