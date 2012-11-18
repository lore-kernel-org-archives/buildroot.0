From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sun, 18 Nov 2012 20:09:29 +0200
Subject: [Buildroot] [PATCH] busybox: needs linux-pam dependency added
 if using custom busybox .config & busybox login applet
In-Reply-To: <20121118184849.660aad23@skate>
References: <1353197713-20796-1-git-send-email-stefan.froberg@petroprogram.com>
 <20121118174000.0fe79ef6@skate> <50A91D44.5060104@petroprogram.com>
 <20121118184849.660aad23@skate>
Message-ID: <50A92459.1070404@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

18.11.2012 19:48, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Sun, 18 Nov 2012 19:39:16 +0200, Stefan Fr?berg wrote:
>
>> And that CONFIG_LOGIN checking should be done after buybox tarball has
>> been extracted but by then, it is already too late for
>> determining dependencies ....
>> Aarrggggh!
> I think you understood what the problem is :)
>
>>> It is really difficult to have dependencies that are needed only when
>>> some specific Busybox features are enabled.
>> Tell me about it.
>> What IMHO is needed, is some function or way to get these kinds of
>> information.
>> Just before dependencies are determined.
>>
>> There should be KCONFIG_GET_OPT or something similar inside
>> package/pkg-utils.mk
>> (like there already is KCONFIG_ENABLE_OPT, KCONFIG_DISABLE_OPT and
>> KCONFIG_SET_OPT)
>> that would help to determine not only buildroot features but also linux
>> features and any
>> else package that use kconfig like stuff.
>>
>> It would also help in case of  various package conflicts (say if busybox
>> unzip applet and real unzip are mistakenly
>> being installed, then this could be detected beforehand)
> KCONFIG_GET_OPT cannot work: you could only call it in a Makefile rule
> (i.e inside BUILD_CMDS or CONFIGURE_CMDS or a hook or something like
> that). But by the time those are executed, it is way too late to
> declare a dependency. The dependencies (in BUSYBOX_DEPENDENCIES) must
> be detailed when make parses all the .mk files, not when the rules are
> executed.
>
> Unless I'm wrong, linux-pam is only needed if ENABLE_PAM is defined
> when building Busybox, correct? So, CONFIG_LOGIN builds just fine
> without PAM, doesn't it?
Yes that is correct, there is a CONFIG_PAM in BusyBox .config  and althought
I have never actually tried to build it without pam it should in theory
work.

>
> So maybe you should rather do:
>
> ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> BUSYBOX_DEPENDENCIES += linux-pam
> BUSYBOX_CFLAGS += -DENABLE_PAM
> endif
>
> No?

Hmmm...
I will try that and see.

Thanks!

Regards
Stefan
> Thomas
