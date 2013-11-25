From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 25 Nov 2013 16:10:31 +0100
Subject: [Buildroot] [PATCH] lvm2: replace
	!BR2_PACKAGE_LVM2_DMSETUP_ONLY by BR2_PACKAGE_LVM2_FULL_SUITE
In-Reply-To: <52932E3A.2080903@mind.be>
References: <20131123183721.071bcfa1@skate>
 <1385250624-15984-1-git-send-email-arnout@mind.be>
 <CAAXf6LXHZw6YRg1P+2=B1wca0CWHFhxocnYoQ4W7JmOb_v=Twg@mail.gmail.com>
 <52932E3A.2080903@mind.be>
Message-ID: <CAAXf6LU5OkxP8VyPZ4XK0Fp6KAAn6N+8OhiQnXnv4f-=4Lk3AA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 25, 2013 at 12:02 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 25/11/13 10:46, Thomas De Schampheleire wrote:
>>
>> Hi Arnout,
>>
>> On Sun, Nov 24, 2013 at 12:50 AM, Arnout Vandecappelle
>> (Essensium/Mind) <arnout@mind.be> wrote:
>
> [snip]
>
>>> +config BR2_PACKAGE_LVM2_DMSETUP_ONLY
>>> +       bool "lvm2's 'dmsetup only' option removed"
>>> +       select BR2_LEGACY
>>> +       help
>>> +         The BR2_PACKAGE_LVM2_DMSETUP_ONLY was a negative option, which
>>> +         led to problems with other packages that need the full lvm2
>>> +         suite. Therefore, the option has been replaced with the
>>> positive
>>> +         BR2_PACKAGE_LVM2_FULL_SUITE option.
>>> +
>>
>>
>> There should be a comment here that refers to the remaining legacy
>> reference in package/lvm2/Config.in, see
>> comment at BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL_WRAP.
>
>
>  True, I forgot about that. Thanks.
>
>
>>
>>>   config BR2_PACKAGE_QT_JAVASCRIPTCORE
>>>          bool "qt javascriptcore option removed"
>>>          select BR2_LEGACY
>>> diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
>>> index b3988ea..849aab3 100644
>>> --- a/package/lvm2/Config.in
>>> +++ b/package/lvm2/Config.in
>>> @@ -16,16 +16,18 @@ config BR2_PACKAGE_LVM2
>>>            user-space. This makes it useful for not only LVM, but EVMS,
>>>            software raid, and other drivers that create "virtual" block
>>> devices.
>>>
>>> -config BR2_PACKAGE_LVM2_DMSETUP_ONLY
>>> -       bool "install dmsetup only"
>>> +config BR2_PACKAGE_LVM2_FULL_SUITE
>>> +       bool "install the full LVM2 suite"
>>> +       default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11
>>>          depends on BR2_PACKAGE_LVM2
>>>          help
>>> -         Install dmsetup only and skip the LVM2 suite.
>>> +         Install the full LVM2 suite. When this option is not set, only
>>> +         dmsetup is installed.
>>>
>>>   config BR2_PACKAGE_LVM2_APP_LIBRARY
>>>          bool "install application library"
>>>          depends on BR2_PACKAGE_LVM2
>>> -       depends on !BR2_PACKAGE_LVM2_DMSETUP_ONLY
>>> +       select BR2_PACKAGE_LVM2_FULL_SUITE
>>>          help
>>>            Install application library (liblvm2app).
>>
>>
>> It seems odd to me that the 'full suite' does not include the app
>> library: it is not 'full'.
>
>
>  Granted, but I can't think of a better name. Anyone?

How 'large' is this application library? In this particular
configuration it is 810K (liblvm2app.so). Is it acceptable to include
it always in the 'full suite' (and thus remove the option
BR2_PACKAGE_LVM2_APP_LIBRARY)?

Best regards,
Thomas
