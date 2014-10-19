From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 11:41:37 +0200
Subject: [Buildroot] [PATCH v3] modplugtools: Added package
In-Reply-To: <1413676846-23424-1-git-send-email-maarten@treewalker.org>
References: <1413662640-16030-1-git-send-email-maarten@treewalker.org>
 <1413676846-23424-1-git-send-email-maarten@treewalker.org>
Message-ID: <20141019114137.1f0e8d09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Sun, 19 Oct 2014 02:00:46 +0200, Maarten ter Huurne wrote:
> This installs the 'modplug123' command line tool to play tracker music
> files (MOD, S3M, XM etc.) using libmodplug.
> 
> The modplugtools package can build two players: modplugplay that plays
> directly via OSS and modplug123 that plays via libao. Since modplugplay
> won't work without OSS support and modern kernels are likely to have no
> OSS or OSS emulation, we build only modplug123.
> 
> If you have a system without ALSA support for some reason, you can
> still use modplug123 to play over OSS via libao.
> 
> http://modplug-xmms.sourceforge.net/
> 
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>

Thanks, applied. But there was one missing that Yann didn't spot (!),
see below:

> diff --git a/package/modplugtools/Config.in b/package/modplugtools/Config.in
> new file mode 100644
> index 0000000..386bae9
> --- /dev/null
> +++ b/package/modplugtools/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_MODPLUGTOOLS
> +	bool "modplugtools"
> +	depends on BR2_INSTALL_LIBSTDCPP # libmodplug
> +	select BR2_PACKAGE_LIBAO
> +	select BR2_PACKAGE_LIBMODPLUG
> +	help
> +	  This installs the 'modplug123' command line tool to play music files
> +	  in the tracker formats supported by libmodplug: MOD, S3M, XM etc.
> +	  Audio output is handled by libao.
> +
> +	  http://modplug-xmms.sourceforge.net/

Since you depend on C++, there should be a comment here about this
dependency. I've added it and applied your patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
