From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 18:56:53 +0100
Subject: [Buildroot] [PATCH v3 5/7] package/nodejs: remove version choice
In-Reply-To: <1450872968-5834-5-git-send-email-martin@barkynet.com>
References: <1450872968-5834-1-git-send-email-martin@barkynet.com>
 <1450872968-5834-5-git-send-email-martin@barkynet.com>
Message-ID: <20151223185653.19830dfe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin,

On Wed, 23 Dec 2015 12:16:06 +0000, Martin Bark wrote:

> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index eb3aeec..1aac38e 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_NODEJS
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	# ARM needs BLX, so v5t+
>  	depends on !BR2_ARM_CPU_ARMV4
> +	depends on BR2_PACKAGE_NODEJS_0_10_X || BR2_PACKAGE_NODEJS_5_X

I don't like that the main BR2_PACKAGE_NODEJS option depends on
BR2_PACKAGE_NODEJS_0_10_X || BR2_PACKAGE_NODEJS_5_X.

Instead, please do something like:

BR2_PACKAGE_NODEJS_VERSION
	string
	default "5.3.0"   if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && BR2_USE_WCHAR
	default "0.10.41"

And then use BR2_PACKAGE_NODEJS_VERSION in nodejs.mk to find which
version to use.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
