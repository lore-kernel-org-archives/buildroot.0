From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Tue, 15 Oct 2019 00:53:51 +0000
Subject: [Buildroot] qemu_riscv64_virt can't boot up with large cpio
 initial RAM filesystem
In-Reply-To: <2019100915262320629523@c-sky.com>
References: <2019100915262320629523@c-sky.com>
Message-ID: <271a256064b670de4efcf805940de6b0926e4f24.camel@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2019-10-09 at 15:26 +0800, han_mao at c-sky.com wrote:
> Hi,
> I got some troble when I tried to use init ram fs on riscv64 virt.
> The default ext2 fs works fine. If I use cpio and init ram fs to
> replace that. The kernel can boot up with small ram fs, but
> a big ram fs(>100M) doesn't work.

It's possible that your addresses are colliding. As in something is
being moved/written on top of your ramfs in memory and corrupting it.
It's also possible that you are out of memory?

It's hard to debug without more information (such as a log).

Why do you need such a large ram fs? Why not just attach the image as a
drive?

Alistair

> kernel got into panic and report "junk within compressed archive"
> static long __init flush_buffer(void *bufv, unsigned long len)
> {
>         char *buf = (char *) bufv;
>         long written;
>         long origLen = len;
>         if (message)
>                 return -1;
>         while ((written = write_buffer(buf, len)) < len && !message)
> {
>                 char c = buf[written];
>                 if (c == '0') {
>                         buf += written;
>                         len -= written;
>                         state = Start;
>                 } else if (c == 0) {
>                         buf += written;
>                         len -= written;
>                         state = Reset;
>                 } else
>                         error("junk within compressed archive");
> This check failed.
> Someone knows how to solve this problem?
> 
> Thanks,
> Mao Han
