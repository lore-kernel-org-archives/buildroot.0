From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 28 May 2018 00:23:57 -0300 (BRT)
Subject: [Buildroot] [PATCH-2018.02.x] util-linux: add two upstream
 patches to fix blocking on getrandom() with recent kernels
In-Reply-To: <20180527103949.25839-1-peter@korsgaard.com>
References: <20180527103949.25839-1-peter@korsgaard.com>
Message-ID: <1571905527.184522.1527477837171.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>, "buildroot" <buildroot@buildroot.org>
> Cc: "Peter Korsgaard" <peter@korsgaard.com>
> Sent: Sunday, May 27, 2018 7:39:49 AM
> Subject: [PATCH-2018.02.x] util-linux: add two upstream patches to fix blocking on getrandom() with recent kernels

> As part of the fix for CVE-2018-1108 (kernel drivers before version 4.17-rc1
> are vulnerable to a weakness in the Linux kernel's implementation of random
> seed data.  Programs, early in the boot sequence, could use the data
> allocated for the seed before it was sufficiently generated), the kernel
> random number generator initialization routine was changed.  See the
> project-zero writeup for more details:
> 
> https://bugs.chromium.org/p/project-zero/issues/detail?id=1559
> 
> These changes have now also been backported to 4.14.x (since 4.14.39) and
> 4.16.x (since 4.16.7).
> 
> This change unfortunately causes users of libuuid from util-linux to block
> for a very long time waiting for sufficient entropy.  An example of this is
> mke2fs, which uses libuuid to generate the filesystem UUID.
> 
> Fix this by backporting two post-2.31 fixes from upstream.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Tested-by: Carlos Santos <casantos@datacom.com.br>

Built host and target util-linux for x86_64 systems running Linux
kernel 4.16.11 (Fedora 28) and 4.14.39 (Buildroot), respectively.

Ran mke2fs from an early init script to check that it did not block.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
