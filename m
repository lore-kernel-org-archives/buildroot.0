From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 11 Feb 2014 21:58:54 +0100
Subject: [Buildroot] Analysis of bug #5030: busybox built fails if we use an
 override src dir BUSYBOX_OVERRIDE_SRCDIR and that dir does not contain
 .config
Message-ID: <CAAXf6LWUf7Jj78OuZOWOX4=N5PU0XwY872k2aK2-75JMj25JRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Bug #5030 "busybox built fails if we use an override src dir
BUSYBOX_OVERRIDE_SRCDIR and that dir does not contain .config"
https://bugs.busybox.net/show_bug.cgi?id=5030

The bug is about the fact that the config file for busybox is copied
from the extract step, which is not used when you have an
OVERRIDE_SRCDIR. The submitter proposes to use a pre-configure hook
instead.

Triggered by this, I compared the situation of the other components
using .config files: uclibc and the kernel. My analysis (and questions
to buildroot developers) are in the bug report, copy pasted below for
your convenience. If we can reach a conclusion then this bug can be
fixed too.

-----
A question to buildroot developers: what do we do with this patch? The
different components using .config files all handle it differently:

busybox copies its .config from the post-extract hook.
linux copies its .config in the configure_cmds.
uclibc copies its .config from the post-patch hook.

The busybox behavior allows a user to change .config, then re-run the configure
step and keep the user's changes.
For linux this is not true: if you change your config and re-run the configure
step, your changes are lost. If you change your .config and expect to keep the
changes, you can only rebuild, not reconfigure.

This patch proposes to line-up busybox more with how the linux kernel handles
it.

This raises the question: what do we want, what should the behavior be?

Personally, I haven't had a big problem with the linux way, and thus would
accept the principle of this patch. But I don't have a very strong opinion on
this...
-----

Thanks for your input,
Thomas
