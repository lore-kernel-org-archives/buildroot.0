From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:59:32 +0200
Subject: [Buildroot] qemu_riscv64_virt can't boot up with large cpio
 initial RAM filesystem
In-Reply-To: <2019100915460909560126@c-sky.com>
References: <2019100915460909560126@c-sky.com>
Message-ID: <ca65a9ed-0a19-e494-a1ca-166297a53445@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/10/2019 09:46, han_mao at c-sky.com wrote:
> Hi,
> I've got some troble when I tried to use init ram fs on riscv64 virt.
> The default ext2 fs works fine. If I use cpio and init ram fs to
> replace that. The kernel can boot up with small ram fs, but
> a big ram fs(>100M) doesn't work.

 I believe default memory size is 128MB, so a large cpio image will overflow the
memory.

 Use the -m option to increase qemu's memory size.

 Regards,
 Arnout

> kernel got into panic and report "junk within compressed archive"
> static long __init flush_buffer(void *bufv, unsigned long len)
> {
>         char *buf = (char *) bufv;
>         long written;
>         long origLen = len;
>         if (message)
>                 return -1;
>         while ((written = write_buffer(buf, len)) < len && !message) {
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
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
