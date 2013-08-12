From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 12 Aug 2013 12:54:10 +0200
Subject: [Buildroot] [PATCH 3 of 6 v2] linux: add support for custom
 Mercurial repository
In-Reply-To: <52087CBD.10501@mind.be>
References: <patchbomb.1374650577@BEANTN0L019720>
 <702ce86cc56aec78ac12.1374650580@BEANTN0L019720>
 <52087CBD.10501@mind.be>
Message-ID: <CAAXf6LW+v5FtM5J3PbsdM3OvRP-0vrpB03+t=CfGnoVAfQ2ePw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Aug 12, 2013 at 8:12 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 24/07/13 09:23, Thomas De Schampheleire wrote:
> [snip]
>> diff --git a/linux/Config.in b/linux/Config.in
>> --- a/linux/Config.in
>> +++ b/linux/Config.in
>> @@ -52,6 +52,12 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT
>>         This option allows Buildroot to get the Linux kernel source
>>         code from a Git repository.
>>
>> +config BR2_LINUX_KERNEL_CUSTOM_HG
>> +     bool "Custom Mercurial repository"
>> +     help
>> +       This option allows Buildroot to get the Linux kernel source
>> +       code from a Mercurial repository.
>> +
>>   endchoice
>>
>>   config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
>> @@ -62,24 +68,26 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_L
>>       string "URL of custom kernel tarball"
>>       depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
>>
>> -config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
>> -     string "URL of custom Git repository"
>> -     depends on BR2_LINUX_KERNEL_CUSTOM_GIT
>> +if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
>>
>> -config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
>> -     string "Custom Git version"
>> -     depends on BR2_LINUX_KERNEL_CUSTOM_GIT
>> +config BR2_LINUX_KERNEL_CUSTOM_REPO_URL
>> +     string "URL of custom repository"
>
>  Given that string options can't be propagated from their legacy values,
> and since the name of an option isn't really that important, I'd keep
> the _GIT_ names for the mercurial options as well.
>
>  If we do rename the option symbol names, then I would make sure that it
> is propagated:
>
>         default BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""
>
> + add a comment to the .legacy file so these hacks can be removed
> eventually.
>
>  Also, you have to change the symbol names in the defconfigs as well
> (there are already 10 uses of this symbol).

Thanks for your feedback on this series.

Regarding the choice of keeping the _GIT_ option names as-is, or
changing them with the appropriate legacy handling, I'd like to hear
the opinion of others.

I understand that the _GIT_ names make the legacy handling easier, but
I also feel it's awkward to have _GIT_ in your config file when you're
really using Mercurial. It seems like a hack to me. So my preference
would be to stick to the renaming as proposed in this patch series,
but with the additional default in linux/Config.in (and likewise for
uboot) as you suggested, deprecating this default later. In this case
I'll also change the defconfigs, as you correctly noted (thanks).

Best regards,
Thomas
