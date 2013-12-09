From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Dec 2013 09:27:48 +0100
Subject: [Buildroot] [PATCH 4/4] systemd: uclibc now has
	posix_fallocate()
In-Reply-To: <1386547663-2678-4-git-send-email-shawn@churchofgit.com>
References: <1386547663-2678-1-git-send-email-shawn@churchofgit.com>
 <1386547663-2678-4-git-send-email-shawn@churchofgit.com>
Message-ID: <CAAXf6LUe+MGnAGtO2yGJPQWb9HxjHwgeMEdFM9TR7f9LmaLN=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Dec 9, 2013 at 1:07 AM, Shawn Landden <shawn@churchofgit.com> wrote:
> uClibc commit 5643900913f64c00f1c29589145
>
> Signed-off-by: Shawn Landden <shawn@churchofgit.com>
> ---
>  package/systemd/systemd-uclibc-fix.patch | 18 ------------------
>  1 file changed, 18 deletions(-)
>
> diff --git a/package/systemd/systemd-uclibc-fix.patch b/package/systemd/systemd-uclibc-fix.patch
> index 9a20845..08a5d3d 100644
> --- a/package/systemd/systemd-uclibc-fix.patch
> +++ b/package/systemd/systemd-uclibc-fix.patch
> @@ -39,21 +39,3 @@ Index: systemd-44/src/macro.h
>   #define _printf_attr_(a,b) __attribute__ ((format (printf, a, b)))
>   #define _sentinel_ __attribute__ ((sentinel))
>   #define _noreturn_ __attribute__((noreturn))
> -Index: systemd-44/src/journal/journal-file.c
> -===================================================================
> ---- systemd-44.orig/src/journal/journal-file.c
> -+++ systemd-44/src/journal/journal-file.c
> -@@ -229,11 +229,13 @@
> -                 }
> -         }
> -
> -+#ifndef __UCLIBC__
> -         /* Note that the glibc fallocate() fallback is very
> -            inefficient, hence we try to minimize the allocation area
> -            as we can. */
> -         if (posix_fallocate(f->fd, old_size, new_size - old_size) < 0)
> -                 return -errno;
> -+#endif
> -
> -         if (fstat(f->fd, &f->last_stat) < 0)
> -                 return -errno;
> --

This clearly requires a toolchain with a sufficiently recent uClibc.
I'm not familiar with our strategy here, so I'm adding ThomasP to this
thread...

Best regards,
Thomas
