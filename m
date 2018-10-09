From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 21:49:12 +0200
Subject: [Buildroot] [PATCH] systemd: Build with LTO
In-Reply-To: <20181009193340.26242-1-abrodkin@synopsys.com>
References: <20181009193340.26242-1-abrodkin@synopsys.com>
Message-ID: <20181009214912.72b43194@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Oct 2018 22:33:40 +0300, Alexey Brodkin wrote:

> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 4813496670..ebd29c89b0 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -38,7 +38,8 @@ SYSTEMD_CONF_OPTS += \
>  	-Dsulogin-path=/usr/sbin/sulogin \
>  	-Dmount-path=/usr/bin/mount \
>  	-Dumount-path=/usr/bin/umount \
> -	-Dnobody-group=nogroup
> +	-Dnobody-group=nogroup \
> +	-Db_lto=true

I don't think we can do this unconditionally. We have a bunch of
options such as BR2_BINUTILS_ENABLE_LTO and BR2_GCC_ENABLE_LTO to
enable LTO support in the internal toolchain, and we don't today have a
way to know if the external toolchain provided supports LTO or not.

So this needs a much more generic solution:

 - A global Config.in option to enable/disable usage of LTO. It will
   have to interact with the toolchain LTO support.

 - An option that tells whether the toolchain supports LTO. For
   internal toolchains, it's simply selected by BR2_GCC_ENABLE_LTO. For
   external toolchains, we need a check to verify that the toolchain is
   LTO + a visible option for custom external toolchains.

So: yes for using LTO, but we need something more generic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
