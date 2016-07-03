From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 17:44:51 +0200
Subject: [Buildroot] [PATCH v4 1/2] ts4800-mbrboot: new package
In-Reply-To: <1465498542-7333-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
 (Patrick Keroulas's message of "Thu, 9 Jun 2016 14:55:41 -0400")
References: <1465498542-7333-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1465498542-7333-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <87oa6eu3nw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Keroulas <patrick.keroulas@savoirfairelinux.com> writes:

One more issue:

 > +mbrboot.elf : mbrboot.o mbrboot.ld
 > +	$(CC) -Wl,--gc-sections -Wl,-static -o mbrboot.elf -nostdlib -Tmbrboot.ld -fno-pic mbrboot.o
 > +	size mbrboot.elf

With at least our current Linaro external toolchain, this ends up with a
2.4G big file.

It reminds me of a similar problem in the Linux kernel from some years
ago:

commit 1e621a8e3752367d4aae78a8ab00a18fb2793f34
Author: Lennert Buytenhek <buytenh@wantstofly.org>
Date:   Fri Oct 12 14:38:54 2007 +0100

    [ARM] 4600/1: fix kernel build failure with build-id-supporting binutils

    Newer versions of binutils support --build-id, which adds an ELF
    note section called ".note.gnu.build-id" to the output.  On the ARM
    kernel build, because there is no explicit mention of this section
    in the shipped ld script, this section is placed at vaddr 0x00000000
    (whereas the normal kernel text/data typically starts at vaddr
    0xc0008000), causing the output of objcopy (Image) to produce a 3G+
    file.

    This patch makes objcopy strip the .note.gnu.build-id section from
    the Image file along with all other note sections, which fixes the
    build.

    Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>
    Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=1e621a8e3752367d4aae78a8ab00a18fb2793f34

And indeed, passing -R .note.gnu.build-id to objcopy fixes it - So that
might be worth including.

-- 
Bye, Peter Korsgaard
