From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Feb 2014 11:55:06 +0100
Subject: [Buildroot] Analysis of bug #5030: busybox built fails if we
 use an override src dir BUSYBOX_OVERRIDE_SRCDIR and that dir does not
 contain .config
In-Reply-To: <20140212115118.71cc1154@skate>
References: <CAAXf6LWUf7Jj78OuZOWOX4=N5PU0XwY872k2aK2-75JMj25JRg@mail.gmail.com>
 <20140212092118.66cb9514@skate>
 <CAAXf6LXauh9AM15fgOC8L8jdfL5nG+zQtuFCjX1A9dasBpanXg@mail.gmail.com>
 <20140212115118.71cc1154@skate>
Message-ID: <CAAXf6LVADN6CwMA-dtHk3WCYemROMXwPrCntuka9s0nBj2DVkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Feb 12, 2014 at 11:51 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Wed, 12 Feb 2014 11:41:29 +0100, Thomas De Schampheleire wrote:
>
>> > But what would you change the .config and then re-run the configure
>> > step? The configure is all about *producing* the .config, so making a
>> > change to the .config, and then re-running the configure step seems
>> > weird to me.
>>
>> I don't necessarily feel that the 'configure' step is about producing
>> the .config. To me, the configure step is about configuring busybox,
>> based on the .config. So for me, the .config is input to the configure
>> step, not output.
>
> Well, in some sense the configure step is just "some step you do before
> building", and generating the .config thing typically falls in this
> category.
>
>> > We have had for quite a while this comment in busybox.mk, which I never
>> > really understood:
>> >
>> > # We do this here to avoid busting a modified .config in configure
>> > BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
>> >
>> > But we have the busybox-{menuconfig,xconfig} targets that allow to
>> > adjust the configuration, and they only remove the "built" and
>> > "target_installed" stamp files, which means after doing "make
>> > busybox-menuconfig", if you run "make", the configure step of busybox
>> > isn't re-executed, so the configuration changes you made are properly
>> > taken into account and preserved.
>>
>> One may also edit .config manually, without running any of the *config commands.
>
> And then you simply run "make busybox-rebuild", and that's it.
>
>> Note by the way that the bug report is submitted from the context of
>> the OVERRIDE_SRCDIR mechanism. Here there is no .config created at
>> all, so it is not about editing it.
>
> There would be a .config created is the .config creation was done in
> the "configure" step and not in the extract step.

Yes, agreed, and this is what the patch is proposing.
So I think we're on the same page :)

>
>> >> For linux this is not true: if you change your config and re-run the configure
>> >> step, your changes are lost. If you change your .config and expect to keep the
>> >> changes, you can only rebuild, not reconfigure.
>> >>
>> >> This patch proposes to line-up busybox more with how the linux kernel handles
>> >> it.
>> >>
>> >> This raises the question: what do we want, what should the behavior be?
>> >>
>> >> Personally, I haven't had a big problem with the linux way, and thus would
>> >> accept the principle of this patch. But I don't have a very strong opinion on
>> >> this...
>> >
>> > I also accept the principle of this patch.
>> >
>> > As a side note, this behavior of busybox.mk was also problematic when
>> > trying to implement out of tree build for packages, because .config is
>> > inherently part of the *build* directory, but the build directory
>> > doesn't exist yet during the extract step: it is only created at the
>> > beginning of the configure step. So my out-of-tree patch set contains:
>> >
>> > -# We do this here to avoid busting a modified .config in configure
>> > -BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
>> > -
>> >  define BUSYBOX_CONFIGURE_CMDS
>> > +       $(BUSYBOX_COPY_CONFIG)
>> >
>>
>> Then maybe we should apply exactly this change, and not the proposed
>> one that uses a hook?
>> Additionally, we should then also make this change in uclibc, right?
>
> Yes. But I would like to hear Peter's opinion on this.

Peter, what do you think?

Thanks,
Thomas
