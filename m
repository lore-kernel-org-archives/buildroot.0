From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 27 Aug 2013 14:29:37 +0200
Subject: [Buildroot] [PATCH 3 of 6 v2] linux: add support for custom
 Mercurial repository
In-Reply-To: <521452C8.3000707@mind.be>
References: <patchbomb.1374650577@BEANTN0L019720>
 <702ce86cc56aec78ac12.1374650580@BEANTN0L019720>
 <52087CBD.10501@mind.be> <20130813110914.00c661dc@skate>
 <520A5F15.5040801@mind.be>
 <CAAXf6LUpUAfNBCqVHS9rPuRJbe+oTxXa1BAbmR1Vh1bE1VP0TQ@mail.gmail.com>
 <CAAXf6LXa0KLriu70G1ZYyJyymDWJ8h=6GapRvCjLserL_PtNtA@mail.gmail.com>
 <52124252.4030209@mind.be>
 <CAAXf6LUzLZEDkh0oUj4wsCc3Rf=+D3Y-6AtHMA4C-4mJpELatQ@mail.gmail.com>
 <521452C8.3000707@mind.be>
Message-ID: <CAAXf6LWm+AUztd8iV7ONNkaA2oJ0fiL8=seG9MsxXTkx4sooxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Aug 21, 2013 at 7:40 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 08/20/13 10:36, Thomas De Schampheleire wrote:
>>
>> To come back on the question: should we try and propagate the options
>> from old to new string options or not.
>> The original patch did not do that, the user was responsible for
>> making the change.
>> Arnout responded that he'd like to make it 'just work' for the user,
>> and advocated automatic propagation.
>> I originally agreed to this reasoning, but am now reconsidering.
>> To implement the automatic propagation of string values, we'd have:
>>
>> config FOO_NEW_STRING (in linux/Config.in)
>>          default FOO_OLD_STRING if FOO_OLD_STRING != ""
>>
>> config FOO_OLD_STRING (in Config.in.legacy)
>>
>> However, the behavior of this combination is odd: if you start from an
>> old config, update to the newer buildroot, and run make menuconfig,
>> you get the legacy warnings (as expected). In the Kernel menu, the new
>> strings are correctly showing the original values (this is the
>> automatic propagation). In the Legacy menu, the original values are
>> shown too. Everything seems fine up to this point, but there are two
>> scenarios now:
>> 1. to clear the legacy messages, you have to empty the original string
>> in the legacy menu. If you do that, however, the new string in the
>> Kernel menu will also be cleared! If you now save your config, the
>> original string is gone everywhere.
>> 2. if you first save the config (legacy warnings still intact), then
>> reopen menuconfig and clear the legacy warnings, the automatic
>> propagation holds, and now the Kernel menu still contains the original
>> values.
>
>>
>> This behavior is very confusing and annoying, IMO. A typical user
>> would perform scenario 1, not knowing about the mentioned problem.
>
>
>  I agree that it is confusing and annoying. However, this is the same
> behaviour as for boolean options. So if we accept this argument, then also
> the automatic propagation for boolean options should be removed.
>
>  So maybe we could make the options with automatic propagation not select
> BR2_LEGACY. If it is indeed just a symbol rename, then the user doesn't need
> to be made aware of it, I guess. The disadvantage is that the old options
> will still appear in saved defconfigs, but that's a minor thing according to
> me.
>
>  Another option is warn the user in the comments at the top of
> Config.in.legacy that they should save and re-run menuconfig.
>
>
>
>
>> An additional advantage of not automatic propagating, is that there is
>> just one place that deals with legacy options: Config.in.legacy. To
>> remove support for all legacy options, we could just delete that one
>> file and be done with it. However, to automatically propagate string
>> options, we also have to change additional files (linux/Config.in in
>> this example), which is less clean.
>
>
>  But I don't think that's a big deal. Config.in.legacy can contain some text
> to point to the other place where the symbol has to be removed.
>
>
>
>> Both arguments lead me to advocating not automatically propagating
>> legacy string options.
>
>
>  If that is the case, then simple renames of config symbols should still be
> avoided, I think. We want it to be really easy for people to upgrade
> buildroot, so they shouldn't be exposed to the whole legacy stuff unless
> really needed.
>


What is the input of the buildroot community on this thread?

Thanks,
Thomas
