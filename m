From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 12:58:56 +0200
Subject: [Buildroot] Boot fails with initramfs and 'console='
In-Reply-To: <d93d9658-8ca4-fbd6-4380-6bc250c82bcf@exertus.fi>
References: <d93d9658-8ca4-fbd6-4380-6bc250c82bcf@exertus.fi>
Message-ID: <b72cb6c5-ed4c-c241-ed1b-64b25dee7f2e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/09/2019 08:36, Timo Ketola wrote:
> Hi there,
> 
> I'm confused.
> 
> When U-Boot starts Linux with silent flag in effect, it adjusts bootargs
> with 'console='.
> 
> BR installs fs/cpio/init as /init into the initramfs cpio archive. It
> tries to direct stdio into /dev/console. Why? Linux does exactly the
> same by itself in init/main.c kernel_init_freeable(). Anyways, trying to
> open /dev/console with 'console=' in command line fails. Linux reports
> 'Warning: unable to open an initial console.' but continues. BusyBox's
> /sbin/init has fallbacks and would also survive. But in /init script it
> is fatal. The first 'exec 0</dev/console' fails, init dies and Linux panics.
> 
> Is there something I have completely misunderstood? How this should be
> correctly (tm) fixed?
> 
> I think the redirections could be removed. Would that patch be accepted?
> Can anyone see any bad consequences?

 Apparently, this was introduced because back in the day, the initramfs would
start without a mounted devtmps and the opening of /dev/console by the kernel
would fail. AFAIU this should have been fixed on the kernel side in 2.6.34.

 Since our unofficial approach is that we don't bother with kernels before 3.0,
it should indeed be OK to remove the redirections.

 Please do check however that we do get fds 0, 1 and 2 open both in silent and
non-silent mode, and that in non-silent mode they do point to console.


 Regards,
 Arnout


> 
> --
> 
> Timo
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
