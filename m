From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Nov 2020 22:14:12 +0100
Subject: [Buildroot] [PATCH v2,
 2/2] package/abootimg: use util-linux-libs
In-Reply-To: <20201103205745.123950-2-fontaine.fabrice@gmail.com>
References: <20201103205745.123950-1-fontaine.fabrice@gmail.com>
 <20201103205745.123950-2-fontaine.fabrice@gmail.com>
Message-ID: <20201103211412.GL2887157@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-11-03 21:57 +0100, Fabrice Fontaine spake thusly:
> abootimg only needs libblkid from util-linux-libs
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Select util-linux-libs instead of util-linux
> 
>  package/abootimg/Config.in   | 2 +-
>  package/abootimg/abootimg.mk | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/abootimg/Config.in b/package/abootimg/Config.in
> index 30e5bd1fb0..8aa4cb414c 100644
> --- a/package/abootimg/Config.in
> +++ b/package/abootimg/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_ABOOTIMG
>  	bool "abootimg"
>  	depends on BR2_USE_MMU	# libblkid
> -	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBS
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID

BR2_PACKAGE_UTIL_LINUX_LIBBLKID is an option of util-linux, so you can't
drop the "select BR2_PACKAGE_UTIL_LINUX"

That's again probably my fault, because I was maybe not exhaustive
enough on my previous reply in the libglib2 thread.

However, please see what I replied to the v1 of this series.

Still, it is not trivial, so we colectively need to think about it...

Regards,
Yann E. MORIN.

>  	help
>  	  Tool to manipulate Android Boot Images, either on files
> diff --git a/package/abootimg/abootimg.mk b/package/abootimg/abootimg.mk
> index e906546948..d139d58ceb 100644
> --- a/package/abootimg/abootimg.mk
> +++ b/package/abootimg/abootimg.mk
> @@ -9,8 +9,8 @@ ABOOTIMG_SITE = $(call github,ggrandou,abootimg,$(ABOOTIMG_VERSION))
>  ABOOTIMG_LICENSE = GPL-2.0+
>  ABOOTIMG_LICENSE_FILES = LICENSE
>  
> -# depends on libblkid from util-linux
> -ABOOTIMG_DEPENDENCIES = util-linux
> +# depends on libblkid from util-linux-libs
> +ABOOTIMG_DEPENDENCIES = util-linux-libs

>  define ABOOTIMG_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> -- 
> 2.28.0
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
