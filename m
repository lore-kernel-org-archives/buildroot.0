From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Oct 2013 23:47:02 +0200
Subject: [Buildroot] [PATCH] rsync: use system zlib and popt,
 also do not lose debug options
In-Reply-To: <1381923631-26549-1-git-send-email-denis@mingulov.com>
References: <1381923631-26549-1-git-send-email-denis@mingulov.com>
Message-ID: <525F0956.1040406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/13 13:40, Denis Mingulov wrote:
> rsync by default compiles statically its own zlib and popt
> libraries, it is better to use system wide libraries instead -
> both for disk and memory consumption. Change rsync package
> accordingly.
>
> Also previously a debug configure option has been lost, as
> overwritten by '--with-included-popt' option - fixed.
>
> For example, on ARMv5 rsync binary size is reduced by about 25%.

  I just did a check by building only rsync before and after your patch, 
and although the binary becomes smaller with your patch, the overall 
filesystem becomes larger. I'd therefore propose to only use the system 
library if it is anyway selected. So:


>
> Signed-off-by: Denis Mingulov <denis@mingulov.com>
> ---
>   package/rsync/Config.in | 2 ++
>   package/rsync/rsync.mk  | 4 +++-
>   2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/package/rsync/Config.in b/package/rsync/Config.in
> index be95a7c..b952974 100644
> --- a/package/rsync/Config.in
> +++ b/package/rsync/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_RSYNC
>   	bool "rsync"
>   	# fork()
>   	depends on BR2_USE_MMU
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_POPT

  Remove this.

>   	help
>   	  File transfer program to keep remote files in sync.
>
> diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
> index d8e5f3f..4f336bc 100644
> --- a/package/rsync/rsync.mk
> +++ b/package/rsync/rsync.mk
> @@ -8,7 +8,9 @@ RSYNC_VERSION = 3.1.0
>   RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
>   RSYNC_LICENSE = GPLv3+
>   RSYNC_LICENSE_FILES = COPYING
> +RSYNC_DEPENDENCIES = zlib popt

  Remove this.

>   RSYNC_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
> -RSYNC_CONF_OPT = --with-included-popt
> +RSYNC_CONF_OPT += --with-included-zlib=no
> +RSYNC_CONF_OPT += --with-included-popt=no

  Replace this with something like:

ifeq($(BR2_PACKAGE_ZLIB),y)
RSYNC_CONF_OPT += --with-included-zlib=no
RSYNC_DEPENDENCIES += zlib
else
RSYNC_CONF_OPT += --with-included-zlib=yes
endif

And similar for popt.

  Of course, this is untested and YMMV.

  Regards,
  Arnout

>
>   $(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
