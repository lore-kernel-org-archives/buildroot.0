From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Feb 2014 09:21:18 +0100
Subject: [Buildroot] Analysis of bug #5030: busybox built fails if we
 use an override src dir BUSYBOX_OVERRIDE_SRCDIR and that dir does not
 contain .config
In-Reply-To: <CAAXf6LWUf7Jj78OuZOWOX4=N5PU0XwY872k2aK2-75JMj25JRg@mail.gmail.com>
References: <CAAXf6LWUf7Jj78OuZOWOX4=N5PU0XwY872k2aK2-75JMj25JRg@mail.gmail.com>
Message-ID: <20140212092118.66cb9514@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 11 Feb 2014 21:58:54 +0100, Thomas De Schampheleire wrote:

> Bug #5030 "busybox built fails if we use an override src dir
> BUSYBOX_OVERRIDE_SRCDIR and that dir does not contain .config"
> https://bugs.busybox.net/show_bug.cgi?id=5030
> 
> The bug is about the fact that the config file for busybox is copied
> from the extract step, which is not used when you have an
> OVERRIDE_SRCDIR. The submitter proposes to use a pre-configure hook
> instead.
> 
> Triggered by this, I compared the situation of the other components
> using .config files: uclibc and the kernel. My analysis (and questions
> to buildroot developers) are in the bug report, copy pasted below for
> your convenience. If we can reach a conclusion then this bug can be
> fixed too.
> 
> -----
> A question to buildroot developers: what do we do with this patch? The
> different components using .config files all handle it differently:
> 
> busybox copies its .config from the post-extract hook.
> linux copies its .config in the configure_cmds.
> uclibc copies its .config from the post-patch hook.
> 
> The busybox behavior allows a user to change .config, then re-run the configure
> step and keep the user's changes.

But what would you change the .config and then re-run the configure
step? The configure is all about *producing* the .config, so making a
change to the .config, and then re-running the configure step seems
weird to me.

We have had for quite a while this comment in busybox.mk, which I never
really understood:

# We do this here to avoid busting a modified .config in configure
BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG

But we have the busybox-{menuconfig,xconfig} targets that allow to
adjust the configuration, and they only remove the "built" and
"target_installed" stamp files, which means after doing "make
busybox-menuconfig", if you run "make", the configure step of busybox
isn't re-executed, so the configuration changes you made are properly
taken into account and preserved.

> For linux this is not true: if you change your config and re-run the configure
> step, your changes are lost. If you change your .config and expect to keep the
> changes, you can only rebuild, not reconfigure.
> 
> This patch proposes to line-up busybox more with how the linux kernel handles
> it.
> 
> This raises the question: what do we want, what should the behavior be?
> 
> Personally, I haven't had a big problem with the linux way, and thus would
> accept the principle of this patch. But I don't have a very strong opinion on
> this...

I also accept the principle of this patch.

As a side note, this behavior of busybox.mk was also problematic when
trying to implement out of tree build for packages, because .config is
inherently part of the *build* directory, but the build directory
doesn't exist yet during the extract step: it is only created at the
beginning of the configure step. So my out-of-tree patch set contains:

-# We do this here to avoid busting a modified .config in configure
-BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
-
 define BUSYBOX_CONFIGURE_CMDS
+       $(BUSYBOX_COPY_CONFIG)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
