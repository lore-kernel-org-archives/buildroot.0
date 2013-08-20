From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 20 Aug 2013 10:36:37 +0200
Subject: [Buildroot] [PATCH 3 of 6 v2] linux: add support for custom
 Mercurial repository
In-Reply-To: <52124252.4030209@mind.be>
References: <patchbomb.1374650577@BEANTN0L019720>
 <702ce86cc56aec78ac12.1374650580@BEANTN0L019720>
 <52087CBD.10501@mind.be> <20130813110914.00c661dc@skate>
 <520A5F15.5040801@mind.be>
 <CAAXf6LUpUAfNBCqVHS9rPuRJbe+oTxXa1BAbmR1Vh1bE1VP0TQ@mail.gmail.com>
 <CAAXf6LXa0KLriu70G1ZYyJyymDWJ8h=6GapRvCjLserL_PtNtA@mail.gmail.com>
 <52124252.4030209@mind.be>
Message-ID: <CAAXf6LUzLZEDkh0oUj4wsCc3Rf=+D3Y-6AtHMA4C-4mJpELatQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 19, 2013 at 6:05 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 17/08/13 10:13, Thomas De Schampheleire wrote:
>>
>>>
>>>
>>> If you have the following config snippet before applying the patch:
>>> BR2_LINUX_KERNEL_CUSTOM_GIT=y
>>> BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="my_repo_url"
>>> BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="my_repo_version"
>>> BR2_LINUX_KERNEL_VERSION="my_repo_version"
>>>
>>> and then apply the patch and run 'make menuconfig' and save without
>>> changes, you get:
>>>
>>> BR2_LINUX_KERNEL_CUSTOM_GIT=y
>>> BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""
>>> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=""
>>> BR2_LINUX_KERNEL_VERSION=""
>>> BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL_WRAP=y
>>> BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION_WRAP=y
>>>
>>> i.e. the wrap thing does work. It's true that the original option
>>> BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL is no longer present _after_
>>> saving the config, but the original value _has_ been detected and used
>>> to set the _WRAP option.
>>
>>
>> It seems this is not entirely correct: if you were not using
>> CUSTOM_GIT options at all, the legacy options would incorrectly be set
>> as well. I think we'll indeed have to re-introduce the original symbol
>> as string in Config.in.legacy, as Arnout mentioned, but a plain
>> config FOO_STRING
>>          string
>>
>> doesn't seem to work. The original symbol value is not stored. I can
>> make it work with a non-hidden symbol:
>> config FOO_STRING
>>          string "original string"
>>
>> but this means that the legacy menu would contain the original
>> strings. Is that a problem?
>
>
>  For me, that as such is not much of a problem. In fact, I think you can
> make the _WRAP option hidden in that case. So to remove the legacy, you'd
> have to set FOO_STRING to the empty string again.
>
> config FOO_STRING
>         string "FOO_STRING has been replaced by BAR_STRING"
>         help
>           ...
>
> config FOO_STRING_WRAP
>         bool
>         default y if FOO_STRING != ""
>         select BR2_LEGACY
>
>

Thanks a lot for this suggestion. It indeed seems to work, and I like
it: the original string values are still visible somewhere, and there
is just one line in the legacy menu.

>
>
>  However, in this case it is a simple symbol rename, then maybe we don't
> need to add anything to the legacy menu.  Just add the default to
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL without defining a symbol for
> BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL. I'm surprised that that works, though.

It doesn't, I made a mistake there. You still need the original option
somewhere.


To come back on the question: should we try and propagate the options
from old to new string options or not.
The original patch did not do that, the user was responsible for
making the change.
Arnout responded that he'd like to make it 'just work' for the user,
and advocated automatic propagation.
I originally agreed to this reasoning, but am now reconsidering.
To implement the automatic propagation of string values, we'd have:

config FOO_NEW_STRING (in linux/Config.in)
        default FOO_OLD_STRING if FOO_OLD_STRING != ""

config FOO_OLD_STRING (in Config.in.legacy)

However, the behavior of this combination is odd: if you start from an
old config, update to the newer buildroot, and run make menuconfig,
you get the legacy warnings (as expected). In the Kernel menu, the new
strings are correctly showing the original values (this is the
automatic propagation). In the Legacy menu, the original values are
shown too. Everything seems fine up to this point, but there are two
scenarios now:
1. to clear the legacy messages, you have to empty the original string
in the legacy menu. If you do that, however, the new string in the
Kernel menu will also be cleared! If you now save your config, the
original string is gone everywhere.
2. if you first save the config (legacy warnings still intact), then
reopen menuconfig and clear the legacy warnings, the automatic
propagation holds, and now the Kernel menu still contains the original
values.

This behavior is very confusing and annoying, IMO. A typical user
would perform scenario 1, not knowing about the mentioned problem.


An additional advantage of not automatic propagating, is that there is
just one place that deals with legacy options: Config.in.legacy. To
remove support for all legacy options, we could just delete that one
file and be done with it. However, to automatically propagate string
options, we also have to change additional files (linux/Config.in in
this example), which is less clean.


Both arguments lead me to advocating not automatically propagating
legacy string options.

Best regards,
Thomas
