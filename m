From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 17 Jul 2014 19:57:20 +0200
Subject: [Buildroot] [PATCH 6 of 6] uclibc: update-config: preserve
	freshly configured settings
In-Reply-To: <53C6110A.2040403@mind.be>
References: <patchbomb.1405338624@localhost>
 <82c951fdcf4851185bcc.1405338630@localhost>
 <53C40DC8.8000607@mind.be>
 <CAAXf6LXaJFF+N6tGAcgY7mpYmBJg=cE0F7eOxvh+eba_83xY4w@mail.gmail.com>
 <53C6110A.2040403@mind.be>
Message-ID: <CAAXf6LXqAoJGSL21x0+v6n0UT4+FrMkMd2xL5sWQq+moUWPWeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Jul 16, 2014 at 7:43 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 15/07/14 20:33, Thomas De Schampheleire wrote:
>> Hi Arnout,
>>
>> On Mon, Jul 14, 2014 at 7:05 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>> On 14/07/14 13:50, Thomas De Schampheleire wrote:
>>>> In the sequence:
>>>>
>>>> make uclibc-menuconfig
>>>> make uclibc-update-config
>>>>
>>>> the freshly configured settings from the menuconfig are lost during the
>>>> update-config step. This is because update-config depends on the configure
>>>> step, which starts by copying the config file to the build directory.
>>>>
>>>> Instead, stop depending on the configure step from update-config, and
>>>> introduce a new stamp file .stamp_config_fixup_done, which applies any
>>>> fixups on the .config file.
>>>
>>>  I think the commit message should explain why this stamp file is preferred over
>>> repeating the fixup in each target.
>>>
>>
>> I'm trying to come up with good reasons here, but the only real one I
>> can find is to avoid duplicating code and avoid redoing the fixup
>> unnecessarily.
>>
>> Did you have anything else in mind?
>
>  Well, I never proposed to introduce an extra stamp file, did I? :-)
>
>  The reasons you put forward are OK, they should just be mentioned in the commit
> message because it's a change from how things are currently done, and this
> should be motivated. That way, if someone later on finds a reason to revert to
> repeating the fixup, they can see why it was done this way to begin with.

Is the commit message of v2 sufficient for you or should I add something?

>
>  BTW, it doesn't really avoid duplication of code. Now we have repetitions of
>
> $(UCLIBC_DIR)/.stamp_configured: $(UCLIBC_DIR)/.stamp_config_fixup_done
>
> and otherwise we'd have repetitions of
>
> define UCLIBC_CONFIGURE_CMDS
>         $(UCLIBC_FIXUP_DOT_CONFIG)

Yes true.
If others also prefer the repeating of FIXUP_DOT_CONFIG over the stamp
file solution I can change that, of course.

Best regards,
thomas
