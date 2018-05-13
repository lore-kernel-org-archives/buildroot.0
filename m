From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:19:43 +0200
Subject: [Buildroot] [PATCH v2 1/2] toolchain/buildroot: Fix symbol for
 uClibc
In-Reply-To: <20180509163323.30172-1-petr.vorel@gmail.com>
References: <20180509163323.30172-1-petr.vorel@gmail.com>
Message-ID: <20180513211943.6a0e19b8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo,

On Wed,  9 May 2018 18:33:22 +0200, Petr Vorel wrote:
> Symbol BR2_TOOLCHAIN_UCLIBC doesn't exist, it was meant to be
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC.
> 
> Fixes: 493b1177b9 toolchain/buildroot: default to uClibc
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  toolchain/toolchain-buildroot/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 2f6624d217..75e8191f46 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -22,7 +22,7 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
>  
>  choice
>  	prompt "C library"
> -	default BR2_TOOLCHAIN_UCLIBC
> +	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC

Just like I added a checker in check-package to verify automatically
the issue raised by PATCH 2/2 of Petr's series [1], I wanted to add a
checker to detect the problem raised by this patch.

My idea was to have something that:

 (1) Collects options defined by "config BR2_<something>"

 (2) Collects references to option, in "select", "depends on",
     "default" clauses, etc.

 (3) Ensures that all references to options have a matching option
     definition.

However, this requires a global pass on all Config.in files to do (1)
and (2) before doing (3), and I'm not sure how this fits in the current
check-package logic, which seems very per-file oriented.

What do you think about this ? Should this be done as part of
check-package, or a separate checker ?

Best regards,

Thomas

[1] http://patchwork.ozlabs.org/patch/910991/
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
