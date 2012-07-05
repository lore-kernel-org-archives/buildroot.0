From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Jul 2012 21:57:05 +0200
Subject: [Buildroot] [PATCH] syslinux: bump to 4.05
In-Reply-To: <CAJkQPOm7x8898X-bjDhN+LRN_EY8wR46WWj7hZmFOD0Q8YiASA@mail.gmail.com>
References: <CAJkQPOm7x8898X-bjDhN+LRN_EY8wR46WWj7hZmFOD0Q8YiASA@mail.gmail.com>
Message-ID: <4FF5F191.4050404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/04/12 15:04, Aras Vaichas wrote:
> * bump syslinux from 4.04 to 4.05
> * add patch to fix build problem with 4.05, see
> http://old.nabble.com/syslinux-fails-to-build-td34112447.html
>
> Signed-off-by: Aras Vaichas<aras.vaichas@gmail.com>
> ---
>   syslinux-build-fix-for-uuid.patch |   15 +++++++++++++++
>   syslinux.mk                         |    2 +-
>   2 files changed, 16 insertions(+), 1 deletion(-)
> diff -Naur a/boot/syslinux/syslinux-build-fix-for-uuid.patch
> b/boot/syslinux/syslinux-build-fix-for-uuid.patch
> --- a/boot/syslinux/syslinux-build-fix-for-uuid.patch   1970-01-01
> 01:00:00.000000000 +0100
> +++ b/boot/syslinux/syslinux-build-fix-for-uuid.patch   2012-07-04
> 13:19:05.263191733 +0100

  Looks like your patch is wordwrapped.  You can't send patches through the
GMail web interface.  The best option is to use git send-email - its help
page explains how to set it up for use with GMail.

> @@ -0,0 +1,15 @@
> +Author: Micah Gersten<micahg@ubuntu.com>
> +Description: Fix build failure with --as-needed (Closes: #654838).
> +
> +diff -Naurp syslinux.orig/utils/Makefile syslinux/utils/Makefile
> +--- syslinux.orig/utils/Makefile       2011-12-23 14:53:26.653571511 +0100
> ++++ syslinux/utils/Makefile    2012-01-22 18:55:03.849466924 +0100
> +@@ -51,7 +51,7 @@ isohdpfx.c: $(ISOHDPFX) isohdpfxarray.pl
> +       $(PERL) isohdpfxarray.pl $(ISOHDPFX)>  $@
> +
> + isohybrid: isohybrid.o isohdpfx.o
> +-      $(CC) $(LDFLAGS) -luuid -o $@ $^
> ++      $(CC) $(LDFLAGS) -o $@ $^ -luuid

  Unfortunately, this isn't enough.  You need host-util-linux as well, and
some additional arguments have to be passed to the build command to make
sure uuid/uuid.h and libuuid.so are found.

  It looks like the syslinux build system is as broken as the one of grub;
we currently don't actually cross-compile, but use the host compiler in
the assumption that it's an x86 multilib compiler...

  I'll fix it (still using the host compiler for the time being) and
resend your patch.


  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
