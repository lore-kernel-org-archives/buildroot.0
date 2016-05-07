From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 22:25:56 +0200
Subject: [Buildroot] [PATCH 16/34] reproducibility/lzo: forbid lzo with
 reproducible builds
In-Reply-To: <1462002570-14706-16-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-16-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507222556.0b498615@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 09:49:12 +0200, Gilles Chanteperdrix wrote:
> The lzo archive contains a timestamp.

Missing Signed-off-by line.

> ---
>  fs/tar/Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/fs/tar/Config.in b/fs/tar/Config.in
> index 63663ec..7e4b603 100644
> --- a/fs/tar/Config.in
> +++ b/fs/tar/Config.in
> @@ -33,6 +33,7 @@ config BR2_TARGET_ROOTFS_TAR_LZMA
>  
>  config BR2_TARGET_ROOTFS_TAR_LZO
>  	bool "lzo"
> +	depends on !BR2_REPRODUCIBLE
>  	help
>  	  Do compress the tarball with lzop.
>  
> @@ -43,6 +44,12 @@ config BR2_TARGET_ROOTFS_TAR_XZ
>  
>  endchoice
>  
> +if BR2_REPRODUCIBLE
> +
> +comment "lzo compression is only available with non-reproducible builds"
> +
> +endif

When we are in such situations, we normally do:

comment "blablabla"
	depends on BR2_REPRODUCIBLE

however, in this specific case, I would simply not bother adding a
comment. If we start adding a comment for everything that is not
suitable for reproducible builds, we're going to add hundreds of them I
believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
