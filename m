From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Apr 2013 16:22:09 +0200
Subject: [Buildroot] [PATCH v6 1/7] arch: toolchain: Introduce binary
 formats BINFMT_*.
In-Reply-To: <1366279592-9055-1-git-send-email-sonic.adi@gmail.com>
References: <1366279592-9055-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130425162209.49fb4ec9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Thu, 18 Apr 2013 18:06:26 +0800, Sonic Zhang wrote:


> diff --git a/Config.in.legacy b/Config.in.legacy
> index d90132c..6867ff3 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -104,4 +104,18 @@ config BR2_PACKAGE_INPUT_TOOLS_EVTEST
>  	help
>  	  The evtest program from input-tools is now a separate package.
>  
> +choice
> +	prompt "Target ABI"
> +	depends on BR2_bfin
> +	default BR2_BFIN_FDPIC
> +
> +config BR2_BFIN_FDPIC
> +	bool "FDPIC"
> +
> +config BR2_BFIN_FLAT
> +	bool "FLAT"
> +	select BR2_PREFER_STATIC_LIB
> +
> +endchoice

Hum, that's not how the legacy stuff works. You don't have to duplicate
the choice, but instead do something like:

config BR2_BFIN_FDPIC
	bool "BR2_BFIN_FDPIC is now BR2_BINFMT_FDPIC"
	select BR2_BINFMT_FDPIC
	select BR2_LEGACY

config BR2_BFIN_FLAT
	bool "BR2_BFIN_FLAT is now BR2_BINFMT_FLAT"
	select BR2_BINFMT_FLAT
	select BR2_LEGACY

Once this is fixed, you'll have my Acked-by on this patch, the rest
looks ok to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
