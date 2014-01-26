From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Jan 2014 17:31:41 +0100
Subject: [Buildroot] [PATCH] uboot-tools: Allow users to use uboot's
	sources
In-Reply-To: <52E530D5.20405@lucaceresoli.net>
References: <1390696553-4163-1-git-send-email-maxime.hadjinlian@gmail.com>
 <52E530D5.20405@lucaceresoli.net>
Message-ID: <CAGduivwtd5SeEOSi6NNCegk7L7oem0+dF9eqkvoGtYk1_xODVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 26, 2014 at 4:59 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Hi Maxime,
Hi Luca
>
>
> Maxime Hadjinlian wrote:
>>
>> If the user has specified a custom U-Boot repository, he may also want
>> to use it for U-Boot tools.
>>
>> This could be usefull in two identified use case:
>>    - User want the same version for U-Boot tools and U-Boot
>>    - User has modified U-Boot tools in his U-Boot repository
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>
>
> I ACK the idea, but there are a few changes I would make to your patch,
> see below.
>
>
>> ---
>>   package/uboot-tools/Config.in      | 10 ++++++++++
>>   package/uboot-tools/uboot-tools.mk |  9 +++++++++
>>   2 files changed, 19 insertions(+)
>>
>> diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
>> index 7c8f17c..3742b0e 100644
>> --- a/package/uboot-tools/Config.in
>> +++ b/package/uboot-tools/Config.in
>> @@ -7,6 +7,16 @@ config BR2_PACKAGE_UBOOT_TOOLS
>>
>>   if BR2_PACKAGE_UBOOT_TOOLS
>>
>> +if BR2_TARGET_UBOOT
>> +
>> +config BR2_PACKAGE_UBOOT_TOOLS_UBOOT_SOURCE
>> +       bool "Use the same repository as U-Boot ?"
>
>
> We don't usually have question marks in option names.
>
>
>> +       help
>> +         Select this to use the same repository specified for U-Boot.
>> Otherwise,
>> +         the upstream sources will be used.
>
>
> Just nitpicking, but IMO the newcomer might find it confusing: we are
> always downloading U-Boot sources, so what does this option change?
>
> I would replace "specified for U-Boot" with "specified for the uboot
> package". This makes it more clear that you refer to the "uboot"
> package in Buildroot.
>
> This is just a clarification, there is nothing wrong in your wording.
>
I'm ok with this change. I am not really good in English, so I have a
hard time finding good formulation.
>
>> +
>> +endif
>> +
>>   config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
>>         bool "mkimage"
>>         help
>> diff --git a/package/uboot-tools/uboot-tools.mk
>> b/package/uboot-tools/uboot-tools.mk
>> index 398ce8b..367d067 100644
>> --- a/package/uboot-tools/uboot-tools.mk
>> +++ b/package/uboot-tools/uboot-tools.mk
>> @@ -10,6 +10,15 @@ UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
>>   UBOOT_TOOLS_LICENSE = GPLv2+
>>   UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
>>
>> +ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_UBOOT_SOURCE),y)
>> +       UBOOT_TOOLS_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
>> +       UBOOT_TOOLS_SOURCE  = $(UBOOT_SOURCE)
>> +       UBOOT_TOOLS_SITE    = $(UBOOT_SITE)
>
>
> You are overriding the previously-defined options. I find an
> if/then/else construct much cleaner:
>
> ifneq ($(BR2_PACKAGE_UBOOT_TOOLS_UBOOT_SOURCE),y)
> ...use upstream sources... (current code)
> else
> ...use sources for the uboot package...
> endif
>
I'd like to have a few more opinions on that, after seeing the code in
the form if/then/else, I find it awkward as it would be (as far as I
know) the only package, where you don't find the SOURCE/SITE variable
defined at the top of the file.
So I am not sure about this.
>> +ifeq ($(UBOOT_SITE_METHOD),)
>
>
> This should be an ifneq, not ifeq.
Thanks !
>
>
>> +       UBOOT_TOOL_SITE_METHOD = $(UBOOT_SITE_METHOD)
>> +endif
>> +endif
>> +
>>   define UBOOT_TOOLS_BUILD_CMDS
>>         $(MAKE) -C $(@D)                        \
>>                 HOSTCC="$(TARGET_CC)"           \
>>
>
>
> --
> Luca
