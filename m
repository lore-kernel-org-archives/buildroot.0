From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 11:35:49 +0200
Subject: [Buildroot] [PATCH] wget: Depends on libuuid
In-Reply-To: <1404206129-27696-1-git-send-email-a.potashev@geoscan.aero>
References: <1404206129-27696-1-git-send-email-a.potashev@geoscan.aero>
Message-ID: <20140701113549.1d3f2569@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Potashev,

On Tue,  1 Jul 2014 13:15:29 +0400, Alexander Potashev wrote:
> Signed-off-by: Alexander Potashev <a.potashev@geoscan.aero>
> ---
>  package/wget/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/wget/Config.in b/package/wget/Config.in
> index 26a2019..fc7ee26 100644
> --- a/package/wget/Config.in
> +++ b/package/wget/Config.in
> @@ -3,6 +3,8 @@ config BR2_PACKAGE_WGET
>  	# fork()
>  	depends on BR2_USE_MMU
>  	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	help
>  	  Network utility to retrieve files from http, https and ftp.

I don't think libuuid is a mandatory dependency of wget, and if it was,
your patch would not be sufficient, because it does not add
'util-linux' to WGET_DEPENDENCIES.

However, it indeed seems to be a possible optional dependency of wget,
in which case what you want is the following addition in wget.mk:

ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
WGET_DEPENDENCIES += util-linux
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
