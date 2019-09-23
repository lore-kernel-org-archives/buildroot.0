From: Timo Ketola <Timo.Ketola@exertus.fi>
Date: Mon, 23 Sep 2019 17:17:05 +0000
Subject: [Buildroot] Boot fails with initramfs and 'console='
In-Reply-To: <b72cb6c5-ed4c-c241-ed1b-64b25dee7f2e@mind.be>
References: <d93d9658-8ca4-fbd6-4380-6bc250c82bcf@exertus.fi>
 <b72cb6c5-ed4c-c241-ed1b-64b25dee7f2e@mind.be>
Message-ID: <54c278bd-32cc-6ed9-f6db-48b17485eedc@exertus.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Thanks for looking at this.

On 21.9.2019 13.58, Arnout Vandecappelle wrote:
> 
> 
> On 21/09/2019 08:36, Timo Ketola wrote:
>> Hi there,
>>
>> I'm confused.
>>
>> When U-Boot starts Linux with silent flag in effect, it adjusts bootargs
>> with 'console='.
>>
>> BR installs fs/cpio/init as /init into the initramfs cpio archive. It
>> tries to direct stdio into /dev/console. Why? Linux does exactly the
>> same by itself in init/main.c kernel_init_freeable(). Anyways, trying to
>> open /dev/console with 'console=' in command line fails. Linux reports
>> 'Warning: unable to open an initial console.' but continues. BusyBox's
>> /sbin/init has fallbacks and would also survive. But in /init script it
>> is fatal. The first 'exec 0</dev/console' fails, init dies and Linux panics.
>>
>> Is there something I have completely misunderstood? How this should be
>> correctly (tm) fixed?
>>
>> I think the redirections could be removed. Would that patch be accepted?
>> Can anyone see any bad consequences?
> 
>  Apparently, this was introduced because back in the day, the initramfs would
> start without a mounted devtmps and the opening of /dev/console by the kernel
> would fail. AFAIU this should have been fixed on the kernel side in 2.6.34.

I'm working with 4.9.128 kernel and this still seems to be the case -
that devtmpfs is not mounted when booting with initramfs. Booting with
rdinit=/bin/sh:

> / # mount -t proc proc /proc
> / # mount
> rootfs on / type rootfs (rw)
> proc on /proc type proc (rw,relatime)

> ...
> 
>  Please do check however that we do get fds 0, 1 and 2 open both in silent and
> non-silent mode, and that in non-silent mode they do point to console.

I think this is the case. If stdios are not open, BB init tries to open
'/dev/null' or '/' as a final fallback. But I'll test that.

I submitted a patch:

http://lists.busybox.net/pipermail/buildroot/2019-September/260246.html

I'm still a little bit uneasy with this as a whole because, I have a
feeling that, in the silent case, the system is left with a 'toxic'
/dev/console. Trying to open it from any shell script will kill that
script. Even a comment in Linux source says that "this should never
fail" when opening /dev/console. But in this case just that happens.

--

Timo
