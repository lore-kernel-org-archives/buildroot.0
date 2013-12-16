From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 16 Dec 2013 16:28:14 +0100
Subject: [Buildroot] [PATCH 1/1] linux.mk: enable options for ktap
In-Reply-To: <20131216144447.GB5876@ad.chargestorm.se>
References: <1387191200-20387-1-git-send-email-anders@chargestorm.se>
 <CAAXf6LVOssD-uJP6E3oFRg3DOca7N8sR+PzrBtLZDd=1PVTjVw@mail.gmail.com>
 <20131216144447.GB5876@ad.chargestorm.se>
Message-ID: <CAAXf6LX8WnxbJp=st28-15_xY54YC2DdhROCsHRq0nAaMj3qUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 16, 2013 at 3:45 PM, Anders Darander <anders@chargestorm.se> wrote:
> * Thomas De Schampheleire <patrickdepinguin@gmail.com> [131216 12:12]:
>> On Mon, Dec 16, 2013 at 11:53 AM, Anders Darander <anders@chargestorm.se> wrote:
>> > Certain tracing related options are required to be able to build ktapvm.ko, enable those.
>> >
>> > Enable CONFIG_FUNTCTION_TRACER as otherwise, CONFIG_EVENT_TRACING won't stick. (Some
>> > tracer needs to be enabled for this).
>> >
>> > Signed-off-by: Anders Darander <anders@chargestorm.se>
>> > ---
>> >
>> >  This is a followup to the introduction of the ktap package, as was discussed in
>> >  http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/72000.
>> >
>> >  linux/linux.mk | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/linux/linux.mk b/linux/linux.mk
>> > index 33931e5..5af167d 100644
>> > --- a/linux/linux.mk
>> > +++ b/linux/linux.mk
>> > @@ -184,6 +184,11 @@ define LINUX_CONFIGURE_CMDS
>> >                 $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
>> >         $(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
>> >                 $(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
>> > +       $(if $(BR2_PACKAGE_KTAP),
>> > +               $(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
>> > +               $(call KCONFIG_ENABLE_OPT,CONFIG_EVENT_TRACING,$(@D)/.config)
>> > +               $(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS,$(@D)/.config)
>> > +               $(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER,$(@D)/.config))
>> >         $(if $(BR2_PACKAGE_SYSTEMD),
>> >                 $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
>> >         $(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
>> > --
>>
>> Should we update the help text in ktap to indicate that the mentioned
>> configs are enabled automatically if the kernel is built by buildroot?
>
> What does everyone else think?
>
> We've got three options:
>
> 1) Let it be as it is today
> 2) Change the text to state that those options are automatically enabled
> 3) Do as e.g. systemd does, which enables cgroups without mentioning in
> Config.in. I.e. remove the discussion of those options from
> ktap/Config.in.
>
> I'm indifferent to either of these solutions.

Let's indeed see what others think, but my opinion:
- it's good that ktap/Config.in mentions the options, so that users
with an external toolchain are notified
- it would be good to reassure users that do have a buildroot-built
kernel that everything is fine for them.

So I prefer option 2.

Best regards,
Thomas
