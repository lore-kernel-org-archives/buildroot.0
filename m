From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2021 23:32:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/busybox: bump version to 1.33.0
In-Reply-To: <20210108190603.1020554-1-bernd.kuhls@t-online.de>
References: <20210108190603.1020554-1-bernd.kuhls@t-online.de>
Message-ID: <20210109223205.GF3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-01-08 20:06 +0100, Bernd Kuhls spake thusly:
> Rebased patch 0002.
> 
> Removed patch 0003 which was applied upstream:
> https://git.busybox.net/busybox/commit/?h=1_33_stable&id=1a5d6fcbb5e606ab4acdf22afa26361a25f1d43b
> 
> Switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

But see a little nit, below...

> ---
>  ...trip-non-l-arguments-returned-by-pkg.patch |  2 +-
>  ...ock-Fix-settimeofday-for-glibc-v2.31.patch | 58 -------------------
>  package/busybox/busybox.hash                  |  4 +-
>  package/busybox/busybox.mk                    |  4 +-
>  4 files changed, 5 insertions(+), 63 deletions(-)
>  delete mode 100644 package/busybox/0003-hwclock-Fix-settimeofday-for-glibc-v2.31.patch
> 
> diff --git a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
> index 84435442c9..46f9fc1a5c 100644
> --- a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
> +++ b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
> @@ -16,7 +16,7 @@ diff --git a/Makefile.flags b/Makefile.flags
>  index 307afa7..885e323 100644
>  --- a/Makefile.flags
>  +++ b/Makefile.flags
> -@@ -176,7 +176,9 @@ ifeq ($(CONFIG_SELINUX),y)
> +@@ -177,7 +177,9 @@ ifeq ($(CONFIG_SELINUX),y)

Just changing the line offsets is only noise, when that does not prevent
the patch from applying. So I've dropped this.

Regards,
Yann E. MORIN.

>   SELINUX_PC_MODULES = libselinux libsepol
>   $(eval $(call pkg_check_modules,SELINUX,$(SELINUX_PC_MODULES)))
>   CPPFLAGS += $(SELINUX_CFLAGS)
> diff --git a/package/busybox/0003-hwclock-Fix-settimeofday-for-glibc-v2.31.patch b/package/busybox/0003-hwclock-Fix-settimeofday-for-glibc-v2.31.patch
> deleted file mode 100644
> index cab346acf3..0000000000
> --- a/package/busybox/0003-hwclock-Fix-settimeofday-for-glibc-v2.31.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 1a5d6fcbb5e606ab4acdf22afa26361a25f1d43b Mon Sep 17 00:00:00 2001
> -From: Eddie James <eajames@linux.ibm.com>
> -Date: Mon, 10 Aug 2020 09:59:02 -0500
> -Subject: [PATCH] hwclock: Fix settimeofday for glibc v2.31+
> -
> -The glibc implementation changed for settimeofday, resulting in "invalid
> -argument" error when attempting to set both timezone and time with a single
> -call. Fix this by calling settimeofday twice
> -
> -Signed-off-by: Eddie James <eajames@linux.ibm.com>
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> ----
> - util-linux/hwclock.c | 14 +++++++++++---
> - 1 file changed, 11 insertions(+), 3 deletions(-)
> -
> -diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c
> -index dc97d8fb4..2479e7416 100644
> ---- a/util-linux/hwclock.c
> -+++ b/util-linux/hwclock.c
> -@@ -122,16 +122,20 @@ static void to_sys_clock(const char **pp_rtcname, int utc)
> - 	struct timeval tv;
> - 	struct timezone tz;
> - 
> --	tz.tz_minuteswest = timezone/60;
> -+	tz.tz_minuteswest = timezone / 60;
> - 	/* ^^^ used to also subtract 60*daylight, but it's wrong:
> - 	 * daylight!=0 means "this timezone has some DST
> - 	 * during the year", not "DST is in effect now".
> - 	 */
> - 	tz.tz_dsttime = 0;
> - 
> -+	/* glibc v2.31+ returns an error if both args are non-NULL */
> -+	if (settimeofday(NULL, &tz))
> -+		bb_simple_perror_msg_and_die("settimeofday");
> -+
> - 	tv.tv_sec = read_rtc(pp_rtcname, NULL, utc);
> - 	tv.tv_usec = 0;
> --	if (settimeofday(&tv, &tz))
> -+	if (settimeofday(&tv, NULL))
> - 		bb_simple_perror_msg_and_die("settimeofday");
> - }
> - 
> -@@ -283,7 +287,11 @@ static void set_system_clock_timezone(int utc)
> - 	gettimeofday(&tv, NULL);
> - 	if (!utc)
> - 		tv.tv_sec += tz.tz_minuteswest * 60;
> --	if (settimeofday(&tv, &tz))
> -+
> -+	/* glibc v2.31+ returns an error if both args are non-NULL */
> -+	if (settimeofday(NULL, &tz))
> -+		bb_simple_perror_msg_and_die("settimeofday");
> -+	if (settimeofday(&tv, NULL))
> - 		bb_simple_perror_msg_and_die("settimeofday");
> - }
> - 
> --- 
> -2.17.1
> -
> diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
> index 2229379600..dffab21400 100644
> --- a/package/busybox/busybox.hash
> +++ b/package/busybox/busybox.hash
> @@ -1,5 +1,5 @@
> -# From https://busybox.net/downloads/busybox-1.32.0.tar.bz2.sha256
> -sha256  c35d87f1d04b2b153d33c275c2632e40d388a88f19a9e71727e0bbbff51fe689  busybox-1.32.0.tar.bz2
> +# From https://busybox.net/downloads/busybox-1.33.0.tar.bz2.sha256
> +sha256  d568681c91a85edc6710770cebc1e80e042ad74d305b5c2e6d57a5f3de3b8fbd  busybox-1.33.0.tar.bz2
>  # Locally computed
>  sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
>  sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 38c40eeb15..67d2713669 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -BUSYBOX_VERSION = 1.32.0
> -BUSYBOX_SITE = http://www.busybox.net/downloads
> +BUSYBOX_VERSION = 1.33.0
> +BUSYBOX_SITE = https://www.busybox.net/downloads
>  BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
>  BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
>  BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
