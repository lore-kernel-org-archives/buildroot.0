From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2019 23:35:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/uclibc: fix termios
 redefinition issue for PowerPC
In-Reply-To: <20190821003059.22765-1-vadim4j@gmail.com>
References: <20190821003059.22765-1-vadim4j@gmail.com>
Message-ID: <fafcde05-3bb3-10fd-c791-a45b9bc57bcb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Vadim,

On 21/08/2019 02:30, Vadim Kochan wrote:
> Fix redefinition of 'struct termios' by syncing termios powerpc headers
> from glibc, the commit which fixed the same issue in glibc:
> 
>     d4795e4a43e6f0c221bc5dc64c612206a21a177b PowerPC: Fix termios definitions
> 
>     https://sourceware.org/git/?p=glibc.git;a=commit;h=d4795e4a43e6f0c221bc5dc64c612206a21a177b
> 
> it fixed the following bug request:
> 
>     https://bugzilla.redhat.com/show_bug.cgi?id=1122714
> 
> In case of Buildroot it fixes flashrom build for PowerPC.
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/797dde5cbf0e94162c7cc7b557841605c78ac2f3/>
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  ...rPC-sync-with-termios-fix-from-glibc.patch | 434 ++++++++++++++++++
>  1 file changed, 434 insertions(+)
>  create mode 100644 package/uclibc/0005-PowerPC-sync-with-termios-fix-from-glibc.patch
> 
> diff --git a/package/uclibc/0005-PowerPC-sync-with-termios-fix-from-glibc.patch b/package/uclibc/0005-PowerPC-sync-with-termios-fix-from-glibc.patch
> new file mode 100644
> index 0000000000..7f676fba32
> --- /dev/null
> +++ b/package/uclibc/0005-PowerPC-sync-with-termios-fix-from-glibc.patch
> @@ -0,0 +1,434 @@
> +From 11d50ce9f44e5d2224ec6a3d8a9225d9164c7c64 Mon Sep 17 00:00:00 2001
> +From: Vadim Kochan <vadim4j@gmail.com>
> +Date: Tue, 20 Aug 2019 23:16:18 +0300
> +Subject: [PATCH] PowerPC: sync with termios fix from glibc
> +
> +It fixes the following bug:
> +
> +    https://bugzilla.redhat.com/show_bug.cgi?id=1122714
> +
> +with original glibc's fix:
> +
> +    d4795e4a43e6f0c221bc5 (PowerPC: Fix termios definitions)
> +
> +https://sourceware.org/git/?p=glibc.git;a=commit;h=d4795e4a43e6f0c221bc5dc64c612206a21a177b
> +
> +Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

 Since this commit is exactly the same as the change to glibc, you should keep
at least the original Sob, probably also the authorship.

 Also, I don't see a trace of this patch on the uClibc-ng mailing list. Did you
send it upstream?

 And finally: you should keep the original commit message, it provides relevant
information. And you should extend that message with an explanation of why here
we can completely remove termios.h while in glibc they kept it.


 Regards,
 Arnout

> +---
> + libc/sysdeps/linux/powerpc/bits/ioctl-types.h |  74 +++-
> + libc/sysdeps/linux/powerpc/bits/termios.h     | 320 ------------------
> + 2 files changed, 73 insertions(+), 321 deletions(-)
> + delete mode 100644 libc/sysdeps/linux/powerpc/bits/termios.h
