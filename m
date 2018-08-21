From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 21 Aug 2018 14:28:08 +0100
Subject: [Buildroot] [PATCH 1/1] Add support for building toolchains
 against custom kernel headers.
In-Reply-To: <20180821131105.GM15347@scaer>
References: <20180821110646.5671-1-mark.corbin@embecosm.com>
 <20180821140509.162e6c49@windsurf>
 <4f183641-61e2-37bb-d3af-3dfd002efbe9@embecosm.com>
 <20180821131105.GM15347@scaer>
Message-ID: <da2cf4b2-2fdf-943e-3a7f-2cd6e89f0920@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann

On 21/08/18 14:11, Yann E. MORIN wrote:
> Mark, Thomas, All,
>
> On 2018-08-21 13:51 +0100, Mark Corbin spake thusly:
>> On 21/08/18 13:05, Thomas Petazzoni wrote:
>>> On Tue, 21 Aug 2018 12:06:46 +0100, Mark Corbin wrote:
>>>> Allows the selection of a manual version, custom tarball or custom
>>>> git repository for the toolchain kernel headers. This enables
>>>> toolchains to be built against custom kernel headers without having
>>>> to build a full kernel.
> [--SNIP--]
>>>>  config BR2_KERNEL_HEADERS_VERSION
>>>>  	bool "Manually specified Linux version"
>>>> +	help
>>>> +	  This option allows you to use a specific official version from
>>>> +	  kernel.org, like 2.6.x, 2.6.x.y, 3.x.y, ...
>>>> +
>>>> +	  Note: you cannot use this option to select a _longterm_ 2.6
>>>> +	  kernel, because these kernels are not located at the standard
>>>> +	  URL at kernel.org. Instead, select "Custom tarball" and
>>>> +	  specify the right URL directly.
>>> Adding this help text is good, but somewhat unrelated. Could you do
>>> that as a separate, preliminary commit ?
>> Do you mean just generate a separate patch?
> Yes, a separate, first patch that adds this help text, and only that.
>
> [--SNIP--]
>>>> +BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
> [--SNIP--]
>>> First, I'm not sure why we bother updating the BR_NO_CHECK_HASH_FOR
>>> variable. I know we already do it, but linux-headers doesn't have
>>> a .hash file, so I don't see the point in doing this. Arnout, you
>>> reworked this in commit 24f650aed2d9d92d8cabf0cb160fcf7964f9811e, why
>>> didn't you just remove the BR_NO_CHECK_HASH_FOR ?
>> I did wonder about this - I'll plan to remove it unless anybody objects.
> No, I'd prefer if we were to actualyl add a .hash file for linux-headers
> and for linux as well, btw, with the former being a symlink to the
> latter.
>
> So, when you respin, prepare a series that:
>
>  1. adds the help text alone,
>  2. adds a .hash for linux and a symlink to it from linux-headers
Does this need populating with just the hashes for the current 'default'
versions, i.e. 4.17.17, 4.16.18, 4.15.18, 4.14.65,...etc. or all
possible versions (!!!) from kernel.org?

I presume that custom versions will remain exempt via
'BR_NO_CHECK_HASH_FOR' as originally intended?

Thanks

Mark

>  3. refactors of the variables
>  4. adds the custom locations
>
> thanks! :-)
>
> Regards,
> Yann E. MORIN.
>

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
