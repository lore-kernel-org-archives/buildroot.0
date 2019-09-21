From: Timo Ketola <Timo.Ketola@exertus.fi>
Date: Sat, 21 Sep 2019 06:36:20 +0000
Subject: [Buildroot] Boot fails with initramfs and 'console='
Message-ID: <d93d9658-8ca4-fbd6-4380-6bc250c82bcf@exertus.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

I'm confused.

When U-Boot starts Linux with silent flag in effect, it adjusts bootargs
with 'console='.

BR installs fs/cpio/init as /init into the initramfs cpio archive. It
tries to direct stdio into /dev/console. Why? Linux does exactly the
same by itself in init/main.c kernel_init_freeable(). Anyways, trying to
open /dev/console with 'console=' in command line fails. Linux reports
'Warning: unable to open an initial console.' but continues. BusyBox's
/sbin/init has fallbacks and would also survive. But in /init script it
is fatal. The first 'exec 0</dev/console' fails, init dies and Linux panics.

Is there something I have completely misunderstood? How this should be
correctly (tm) fixed?

I think the redirections could be removed. Would that patch be accepted?
Can anyone see any bad consequences?

--

Timo
