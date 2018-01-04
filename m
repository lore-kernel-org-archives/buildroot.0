From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 4 Jan 2018 12:19:27 +0200
Subject: [Buildroot] [PATCH 1/2] nilfs-utils: need NPTL threads
In-Reply-To: <1515060652-22472-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
References: <1515060652-22472-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20180104101927.oexxtwusya3wppyk@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kurt,

On Thu, Jan 04, 2018 at 11:10:51AM +0100, Kurt Van Dijck wrote:
> nilfs-utils use clock_nanosleep(), which comes with NPTL threads

What is your indication that this is the case? In the uClibc-ng config 
UCLIBC_HAS_REALTIME is selected by both linuxthreads and NPTL. When 
UCLIBC_HAS_REALTIME is enabled, UCLIBC_HAS_ADVANCED_REALTIME is also enabled 
by default. UCLIBC_HAS_ADVANCED_REALTIME provides clock_nanosleep().

> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> ---
>  package/nilfs-utils/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
> index 0c6b7a0..9dda27c 100644
> --- a/package/nilfs-utils/Config.in
> +++ b/package/nilfs-utils/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_NILFS_UTILS
>  	bool "nilfs-utils"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # sem_open()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()

NPTL implies threads support, so the NPTL dependency alone is enough.

You also need to update the comment.

>  	depends on BR2_USE_MMU # util-linux libmount, libblkid
>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
