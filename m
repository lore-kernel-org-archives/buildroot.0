From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sat, 17 Aug 2013 10:13:58 +0200
Subject: [Buildroot] [PATCH 3 of 6 v2] linux: add support for custom
 Mercurial repository
In-Reply-To: <CAAXf6LUpUAfNBCqVHS9rPuRJbe+oTxXa1BAbmR1Vh1bE1VP0TQ@mail.gmail.com>
References: <patchbomb.1374650577@BEANTN0L019720>
 <702ce86cc56aec78ac12.1374650580@BEANTN0L019720>
 <52087CBD.10501@mind.be> <20130813110914.00c661dc@skate>
 <520A5F15.5040801@mind.be>
 <CAAXf6LUpUAfNBCqVHS9rPuRJbe+oTxXa1BAbmR1Vh1bE1VP0TQ@mail.gmail.com>
Message-ID: <CAAXf6LXa0KLriu70G1ZYyJyymDWJ8h=6GapRvCjLserL_PtNtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 14, 2013 at 7:06 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi,
>
> On Tue, Aug 13, 2013 at 6:30 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 13/08/13 11:09, Thomas Petazzoni wrote:
>>>
>>> Dear Arnout Vandecappelle,
>>>
>>> On Mon, 12 Aug 2013 08:12:13 +0200, Arnout Vandecappelle wrote:
>>>
>>>>   Given that string options can't be propagated from their legacy values,
>>>> and since the name of an option isn't really that important, I'd keep
>>>> the _GIT_ names for the mercurial options as well.
>>>>
>>>>   If we do rename the option symbol names, then I would make sure that it
>>>> is propagated:
>>>>
>>>>         default BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL if
>>>> BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""
>>>>
>>>> + add a comment to the .legacy file so these hacks can be removed
>>>> eventually.
>>>
>>>
>>> Hum, I'm not sure how this articulates with the _WRAP mechanism that
>>> patch 1/6 is proposing. If we do this:
>>>
>>>         default BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL if
>>> BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""
>>>
>>> then why would we need the _WRAP thing?
>>
>>
>>  The _WRAP thing is needed to make sure there is a user-visible boolean
>> option in the legacy menu, and to make sure you only select BR2_LEGACY when
>> the old option is not empty.
>
> Correct.
> Unlike for bool options that can be manipulated from other options,
> you cannot manipulate a string option from another option, only from
> the string option itself by adding a default statement, as Arnout
> proposed in his earlier mail.
>
>>
>>  However, come to think of it, wouldn't it be enough to keep it as a string
>> option and add
>>
>>         select BR2_LEGACY if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""
>>
>> ? Although I guess Thomas has tested this already.
>
> You mean this, right?
> config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
>         string "linux: the git repository URL option has been renamed"
>         select BR2_LEGACY if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""
>
> I did indeed try this but it doesn't work. Kconfig gives the following message:
>
> Config.in.legacy:75:warning: config symbol
> 'BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL' uses select, but is not boolean
> or tristate
>
>>
>>  Looking again at the patch, though, I wonder if it works at all. Aren't the
>> old options that have no symbol definition removed? I think there should
>> still be a
>>
>> config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
>>         string
>>
>> in Config.in.legacy.
>>
>>  But then, it will not be possible to modify the string anymore... so there
>> is no escape...
>>
>>  Argh, Kconfig...
>
> If you have the following config snippet before applying the patch:
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="my_repo_url"
> BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="my_repo_version"
> BR2_LINUX_KERNEL_VERSION="my_repo_version"
>
> and then apply the patch and run 'make menuconfig' and save without
> changes, you get:
>
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=""
> BR2_LINUX_KERNEL_VERSION=""
> BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL_WRAP=y
> BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION_WRAP=y
>
> i.e. the wrap thing does work. It's true that the original option
> BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL is no longer present _after_
> saving the config, but the original value _has_ been detected and used
> to set the _WRAP option.

It seems this is not entirely correct: if you were not using
CUSTOM_GIT options at all, the legacy options would incorrectly be set
as well. I think we'll indeed have to re-introduce the original symbol
as string in Config.in.legacy, as Arnout mentioned, but a plain
config FOO_STRING
        string

doesn't seem to work. The original symbol value is not stored. I can
make it work with a non-hidden symbol:
config FOO_STRING
        string "original string"

but this means that the legacy menu would contain the original
strings. Is that a problem?

If it is, then some help with setting this up the right way would be
greatly appreciated. I tried several things but can't find a better
solution (except for keeping the original symbol names, which I'd like
to avoid).

Thanks,
Thomas
