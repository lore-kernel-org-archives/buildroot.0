From: han_mao at c-sky.com <han_mao@c-sky.com>
Date: Wed, 9 Oct 2019 15:46:09 +0800
Subject: [Buildroot] qemu_riscv64_virt can't boot up with large cpio initial
 RAM filesystem
Message-ID: <2019100915460909560126@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I've got some troble when I tried to use init ram fs on riscv64 virt.
The default ext2 fs works fine. If I use cpio and init ram fs to
replace that. The kernel can boot up with small ram fs, but
a big ram fs(>100M) doesn't work.
kernel got into panic and report "junk within compressed archive"
static long __init flush_buffer(void *bufv, unsigned long len)
{
        char *buf = (char *) bufv;
        long written;
        long origLen = len;
        if (message)
                return -1;
        while ((written = write_buffer(buf, len)) < len && !message) {
                char c = buf[written];
                if (c == '0') {
                        buf += written;
                        len -= written;
                        state = Start;
                } else if (c == 0) {
                        buf += written;
                        len -= written;
                        state = Reset;
                } else
                        error("junk within compressed archive");
This check failed.
Someone knows how to solve this problem?

Thanks,
Mao Han
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191009/f88a9d62/attachment.html>
