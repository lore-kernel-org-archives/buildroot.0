From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 28 Nov 2013 11:54:12 +0100
Subject: [Buildroot] [PATCH] lvm2: replace
	!BR2_PACKAGE_LVM2_DMSETUP_ONLY by BR2_PACKAGE_LVM2_FULL_SUITE
In-Reply-To: <5296ED0A.8020200@mind.be>
References: <20131123183721.071bcfa1@skate>
 <1385250624-15984-1-git-send-email-arnout@mind.be>
 <CAAXf6LXHZw6YRg1P+2=B1wca0CWHFhxocnYoQ4W7JmOb_v=Twg@mail.gmail.com>
 <52932E3A.2080903@mind.be>
 <CAAXf6LVhLB1yqkhz0Fupd646ZQu9-4k0uw1LxkTbz-EWO_JOdw@mail.gmail.com>
 <5296ED0A.8020200@mind.be>
Message-ID: <f64cb0e9-58eb-42d2-93cf-64f759b48bf0@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote:
>On 25/11/13 22:21, Thomas De Schampheleire wrote:
>> On Mon, Nov 25, 2013 at 12:02 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>> On 25/11/13 10:46, Thomas De Schampheleire wrote:
>> [..]
>>>>> diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
>>>>> index b3988ea..849aab3 100644
>>>>> --- a/package/lvm2/Config.in
>>>>> +++ b/package/lvm2/Config.in
>>>>> @@ -16,16 +16,18 @@ config BR2_PACKAGE_LVM2
>>>>>             user-space. This makes it useful for not only LVM, but EVMS,
>>>>>             software raid, and other drivers that create "virtual" block
>>>>> devices.
>>>>>
>>>>> -config BR2_PACKAGE_LVM2_DMSETUP_ONLY
>>>>> -       bool "install dmsetup only"
>>>>> +config BR2_PACKAGE_LVM2_FULL_SUITE
>>>>> +       bool "install the full LVM2 suite"
>>>>> +       default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11
>>>>>           depends on BR2_PACKAGE_LVM2
>>>>>           help
>>>>> -         Install dmsetup only and skip the LVM2 suite.
>>>>> +         Install the full LVM2 suite. When this option is not set, only
>>>>> +         dmsetup is installed.
>>>>>
>>>>>    config BR2_PACKAGE_LVM2_APP_LIBRARY
>>>>>           bool "install application library"
>>>>>           depends on BR2_PACKAGE_LVM2
>>>>> -       depends on !BR2_PACKAGE_LVM2_DMSETUP_ONLY
>>>>> +       select BR2_PACKAGE_LVM2_FULL_SUITE
>>>>>           help
>>>>>             Install application library (liblvm2app).
>>>>
>>>>
>>>> It seems odd to me that the 'full suite' does not include the app
>>>> library: it is not 'full'.
>>>
>>>
>>>   Granted, but I can't think of a better name. Anyone?
>>
>> I was trying an alternative approach with 'choice', but failed.
>> Here is what I tried:
>>
>> $ hg diff package/
>> diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
>> --- a/package/lvm2/Config.in
>> +++ b/package/lvm2/Config.in
>> @@ -16,19 +16,29 @@ config BR2_PACKAGE_LVM2
>>            user-space. This makes it useful for not only LVM, but EVMS,
>>            software raid, and other drivers that create "virtual" block devices.
>>
>> +if BR2_PACKAGE_LVM2
>> +
>> +choice
>> +       prompt "Installation type"
>> +
>> +config BR2_PACKAGE_LVM2_STANDARD_INSTALL
>> +       bool "standard installation"
>> +
>>   config BR2_PACKAGE_LVM2_DMSETUP_ONLY
>>          bool "install dmsetup only"
>> -       depends on BR2_PACKAGE_LVM2
>>          help
>>            Install dmsetup only and skip the LVM2 suite.
>>
>> +endchoice
>> +
>>   config BR2_PACKAGE_LVM2_APP_LIBRARY
>>          bool "install application library"
>> -       depends on BR2_PACKAGE_LVM2
>> -       depends on !BR2_PACKAGE_LVM2_DMSETUP_ONLY
>> +       select BR2_PACKAGE_LVM2_STANDARD_INSTALL
>>          help
>>            Install application library (liblvm2app).
>>
>> +endif
>> +
>
>  So, what didn't work with this?

It behaved as before, udisks lvm support would not 
enable the standard install and keep the dmonly option...

>
>
>>   comment "lvm2 needs a toolchain w/ largefile"
>>          depends on BR2_USE_MMU
>>          depends on !BR2_LARGEFILE
>> diff --git a/package/udisks/Config.in b/package/udisks/Config.in
>> --- a/package/udisks/Config.in
>> +++ b/package/udisks/Config.in
>> @@ -30,6 +30,7 @@ if BR2_PACKAGE_UDISKS
>>   config BR2_PACKAGE_UDISKS_LVM2
>>          bool "lvm2 support"
>>          select BR2_PACKAGE_LVM2_APP_LIBRARY
>> +       select BR2_PACKAGE_LVM2_STANDARD_INSTALL
>>          help
>>            Enable LVM2 support
>>
>>
>> If anyone can make this work, I'd prefer it over the 'magic'
>> if-not-full-suite-you-get-dmonly approach.
>
>  I don't.
>
>* Choice is not covered by randconfig, so not tried by the autobuilders.

Didn't know that.

>
>* Choice is more cumbersome for the user
>
>* I don't see what is wrong with a boolean option that installs more stuff.
>
>>
>> If not, what about the naming 'standard installation' to refer to what
>> is called 'full suite' in your patch. If it is not standard install,
>> it is dmonly.
>
>  I called it:
>
>config BR2_PACKAGE_LVM2_STANDARD_INSTALL
>	bool "standard install instead of only dmsetup"
>	default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11
>	help
>	  Install the standard suite of lvm2 programs. When this option
>	  is not set, only dmsetup is installed.
>
>

Works for me!

Best regards,
Thomas
