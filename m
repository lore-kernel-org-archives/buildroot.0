From: Mario Mintel <mariomintel@gmail.com>
Date: Mon, 1 Jun 2020 18:23:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/jailhouse: add option to choose
 custom repo/branch
In-Reply-To: <CAH3JsOrK+8F4xXhxm8ytEawBQ63jswzBG8PW2naq40M6MAyZQA@mail.gmail.com>
References: <20200528144333.49268-1-mariomintel@gmail.com>
 <20200528144333.49268-3-mariomintel@gmail.com>
 <20200529204844.GR8737@scaer>
 <3806f122-f6b0-efba-e94a-64a3729fbe8a@oth-regensburg.de>
 <CAH3JsOrK+8F4xXhxm8ytEawBQ63jswzBG8PW2naq40M6MAyZQA@mail.gmail.com>
Message-ID: <CAH3JsOrGo0k4S=VKfaXFbgkOv2jYvCB6nff0f+TihKz-1ok4JQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again,

Am Sa., 30. Mai 2020 um 19:28 Uhr schrieb Mario Mintel <
mariomintel@gmail.com>:

> Hi everyone,
>
> Am Fr., 29. Mai 2020 um 23:40 Uhr schrieb Ralf Ramsauer <
> ralf.ramsauer at oth-regensburg.de>:
>
>> Hi Yann,
>>
>> On 5/29/20 10:48 PM, Yann E. MORIN wrote:
>> > Mario, All,
>> >
>> > On 2020-05-28 16:43 +0200, Mario Mintel spake thusly:
>> >> In addition to official releases of Jailhouse, allow to specify a
>> custom
>> >> Git URI + branches. This adds more flexibility for custom
>> >> configurations.
>> >
>> > The overwhelming majority of packages do not allow selecting an
>> > alternate location. Why would jailhouse be different?
>>
>> Jailhouse requires system-specific configurations. Those configurations
>> are compiled from C source files to binaries during the build process.
>> While upstream Jailhouse comes with a lot of samples for supported
>> systems, you will need a lot of fine tuning to for a specific use case.
>>
>> >
>> > Are you trying to cover for development? In that case, the usual way is
>>
>> In our case -- Yes.
>>
>> > to use the override srcdir mechanism. See BR2_PACKAGE_OVERRIDE_FILE and
>> > provide such a file with definitions like;
>> >
>> >     JAILHOUSE_OVERRIDE_SRCDIR =
>> /path/to/your/local/development/tree/jailhouse
>>
>> Oh, that could maybe work. Mario, could you please check that? In case
>> this works, we can simply add those definitions to our br2-external tree.
>>
>>
>
> Yeah sure I can try that. Although I won't be able to until Monday as I
> have no
> access to my working computer as of right now.
>
> I will report back as soon as I have results.
>

It does work as proposed by Yann. I wasn't aware of that option. I guess
that makes this patch redundant.

Greetings,
Mario


>
> Greetings,
> Mario
>
>
>> Thanks
>>   Ralf
>>
>> >
>> > Regards,
>> > Yann E. MORIN.
>> >
>> >> Signed-off-by: Mario Mintel <mariomintel@gmail.com>
>> >> ---
>> >>  package/jailhouse/Config.in    | 36 ++++++++++++++++++++++++++++++++--
>> >>  package/jailhouse/jailhouse.mk | 17 ++++++++++++++--
>> >>  2 files changed, 49 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
>> >> index 596b4951db..47523747f9 100644
>> >> --- a/package/jailhouse/Config.in
>> >> +++ b/package/jailhouse/Config.in
>> >> @@ -3,18 +3,50 @@ config BR2_PACKAGE_JAILHOUSE
>> >>      depends on BR2_aarch64 || BR2_x86_64
>> >>      depends on BR2_LINUX_KERNEL
>> >>      help
>> >> -      The Jailhouse partitioning Hypervisor based on Linux.
>> >> +      The Jailhouse Linux-based partitioning hypervisor.
>> >>
>> >>        https://github.com/siemens/jailhouse
>> >>
>> >>  if BR2_PACKAGE_JAILHOUSE
>> >>
>> >> +choice
>> >> +    prompt "Jailhouse Version"
>> >> +
>> >> +config BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
>> >> +    bool "Version 0.12"
>> >> +
>> >> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
>> >> +    bool "Custom Git repository"
>> >> +    help
>> >> +      This option allows Buildroot to get the Jailhouse source code
>> >> +      from a custom Git repository.
>> >> +
>> >> +endchoice
>> >> +
>> >> +if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
>> >> +
>> >> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI
>> >> +    string "URI of custom repository"
>> >> +    default "https://github.com/siemens/jailhouse.git"
>> >> +
>> >> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH
>> >> +    string "Name of Git branch"
>> >> +    default "master"
>> >> +
>> >> +endif
>> >> +
>> >> +config BR2_PACKAGE_JAILHOUSE_VERSION
>> >> +    string
>> >> +    default "0.12" if BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
>> >> +    default BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH \
>> >> +            if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
>> >> +
>> >>  config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
>> >>      bool "helper scripts"
>> >>      depends on BR2_PACKAGE_PYTHON
>> >>      select BR2_PACKAGE_PYTHON_MAKO # runtime
>> >>      help
>> >> -      Python-based helpers for the Jailhouse Hypervisor.
>> >> +      Python-based helpers for the Jailhouse hypervisor.
>> >>
>> >>        https://github.com/siemens/jailhouse
>> >>
>> >> diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/
>> jailhouse.mk
>> >> index 6356c5a7aa..d134b3d1b4 100644
>> >> --- a/package/jailhouse/jailhouse.mk
>> >> +++ b/package/jailhouse/jailhouse.mk
>> >> @@ -4,10 +4,23 @@
>> >>  #
>> >>
>> ################################################################################
>> >>
>> >> -JAILHOUSE_VERSION = 0.12
>> >> -JAILHOUSE_SITE = $(call
>> github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
>> >> +JAILHOUSE_VERSION = $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_VERSION))
>> >>  JAILHOUSE_LICENSE = GPL-2.0
>> >> +ifeq ($(BR2_PACKAGE_JAILHOUSE_LATEST_VERSION),y)
>> >>  JAILHOUSE_LICENSE_FILES = COPYING
>> >> +endif
>> >> +
>> >> +ifeq ($(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT),y)
>> >> +JAILHOUSE_SITE = $(call
>> qstrip,$(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI))
>> >> +JAILHOUSE_SITE_METHOD = git
>> >> +else
>> >> +JAILHOUSE_SITE = $(call
>> github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
>> >> +endif
>> >> +
>> >> +ifeq ($(BR2_PACKAGE_JAILHOUSE)$(BR2_PACKAGE_JAILHOUSE_CUSTIM_GIT),y)
>> >> +BR_NO_CHECK_HASH_FOR += $(JAILHOUSE_SOURCE)
>> >> +endif
>> >> +
>> >>  JAILHOUSE_DEPENDENCIES = \
>> >>      linux
>> >>
>> >> --
>> >> 2.26.1
>> >>
>> >> _______________________________________________
>> >> buildroot mailing list
>> >> buildroot at busybox.net
>> >> http://lists.busybox.net/mailman/listinfo/buildroot
>> >
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200601/7ace33fb/attachment.html>
