From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 21 Aug 2018 13:51:37 +0100
Subject: [Buildroot] [PATCH 1/1] Add support for building toolchains
 against custom kernel headers.
In-Reply-To: <20180821140509.162e6c49@windsurf>
References: <20180821110646.5671-1-mark.corbin@embecosm.com>
 <20180821140509.162e6c49@windsurf>
Message-ID: <4f183641-61e2-37bb-d3af-3dfd002efbe9@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

On 21/08/18 13:05, Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 21 Aug 2018 12:06:46 +0100, Mark Corbin wrote:
>> Allows the selection of a manual version, custom tarball or custom
>> git repository for the toolchain kernel headers. This enables
>> toolchains to be built against custom kernel headers without having
>> to build a full kernel.
>>
>> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> Thanks for working on this! Looks good overall, but I have a few
> possible suggestions of improvement.
>
> First, the commit title should be prefixed with the affected package,
> so something like:
>
> 	linux-headers: add support for custom kernel headers
>
> or something like that.
I'll add 'package/linux-headers:' as per other patches.
>
>>  config BR2_KERNEL_HEADERS_VERSION
>>  	bool "Manually specified Linux version"
>> +	help
>> +	  This option allows you to use a specific official version from
>> +	  kernel.org, like 2.6.x, 2.6.x.y, 3.x.y, ...
>> +
>> +	  Note: you cannot use this option to select a _longterm_ 2.6
>> +	  kernel, because these kernels are not located at the standard
>> +	  URL at kernel.org. Instead, select "Custom tarball" and
>> +	  specify the right URL directly.
> Adding this help text is good, but somewhat unrelated. Could you do
> that as a separate, preliminary commit ?
Do you mean just generate a separate patch?
>
>> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
>> index 954c6b7978..3c2509e249 100644
>> --- a/package/linux-headers/linux-headers.mk
>> +++ b/package/linux-headers/linux-headers.mk
>> @@ -64,8 +64,18 @@ endef
>>  
>>  LINUX_HEADERS_POST_PATCH_HOOKS += LINUX_HEADERS_APPLY_LOCAL_PATCHES
>>  
>> -else # ! BR2_KERNEL_HEADERS_AS_KERNEL
>> -
>> +else ifeq ($(BR2_KERNEL_HEADERS_CUSTOM_TARBALL),y)
>> +LINUX_HEADERS_TARBALL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION))
>> +LINUX_HEADERS_SITE = $(patsubst %/,%,$(dir $(LINUX_HEADERS_TARBALL)))
>> +LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_TARBALL))
>> +BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
>> +else ifeq ($(BR2_KERNEL_HEADERS_CUSTOM_GIT),y)
>> +LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
>> +LINUX_HEADERS_SITE = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_REPO_URL))
>> +LINUX_HEADERS_SITE_METHOD = git
>> +LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
>> +BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
>> +else
>>  LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
>>  ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
>>  LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
>> @@ -80,7 +90,7 @@ ifeq ($(BR2_KERNEL_HEADERS_VERSION),y)
>>  BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
>>  endif
> First, I'm not sure why we bother updating the BR_NO_CHECK_HASH_FOR
> variable. I know we already do it, but linux-headers doesn't have
> a .hash file, so I don't see the point in doing this. Arnout, you
> reworked this in commit 24f650aed2d9d92d8cabf0cb160fcf7964f9811e, why
> didn't you just remove the BR_NO_CHECK_HASH_FOR ?
I did wonder about this - I'll plan to remove it unless anybody objects.
>
> Second, with your change there's quite a bit of duplication between the
> code to handle the "same headers as kernel" case and the "custom
> version" stuff you've added.
>
> Could you try something along the lines of:
>
> ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
> LINUX_HEADERS_CUSTOM_TARBALL_LOCATION_KCONFIG_VAR = BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
> LINUX_HEADERS_CUSTOM_REPO_URL_KCONFIG_VAR = BR2_LINUX_KERNEL_CUSTOM_REPO_URL
> else
> LINUX_HEADERS_CUSTOM_TARBALL_LOCATION_KCONFIG_VAR = BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION
> LINUX_HEADERS_CUSTOM_REPO_URL_KCONFIG_VAR = BR2_KERNEL_HEADERS_CUSTOM_REPO_URL
> endif
>
> and then use $($(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION_KCONFIG_VAR))
> and $($(LINUX_HEADERS_CUSTOM_REPO_URL_KCONFIG_VAR)) to avoid
> duplicating all the logic testing if we have a tarball, or a Git repo,
> or, etc.
>
> Note that I haven't tried to refactor the code myself, perhaps there
> are some obstacles to achieve this, perhaps it makes the code uglier,
> but I think it is worth trying.
I'll take a look at this. I was trying to keep the changes to a minimum,
but a re-factor makes sense.
>
> Also, a few comments after the key "else" and "endif" would help figure
> out where each condition starts/stops, at least for the large
> conditions, where it's hard to know when they start/stop.
Will do.

Thanks for the great feedback.
>
> Thanks!
>
> Thomas

-- 

*Mark Corbin*
Embedded Operating Systems Lead
Phone: +44 1590 610184?????Mobile: +44 7765 703479
Email: mark.corbin at embecosm.com
<mailto:mark.corbin@embecosm.com>?????Web: https://www.embecosm.com

Embecosm Logo

Embecosm Ltd., Palamos House #208, 66/67 High Street, Lymington, SO41
9AL, UK
Company No. 6577021 (England & Wales).
--
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180821/b9ced7fc/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: logo.png
Type: image/png
Size: 8442 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180821/b9ced7fc/attachment.png>
