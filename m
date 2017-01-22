From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jan 2017 17:28:20 +1100
Subject: [Buildroot] [git commit] xorg-server: not available with musl
 on ARM
In-Reply-To: <20170121125742.776B97FA45@busybox.osuosl.org>
References: <20170121125742.776B97FA45@busybox.osuosl.org>
Message-ID: <20170122172820.0086ea0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Jan 2017 13:55:07 +0100, Peter Korsgaard wrote:

> diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
> index 0f1d1fe..1c8f8cf 100644
> --- a/package/x11r7/xserver_xorg-server/Config.in
> +++ b/package/x11r7/xserver_xorg-server/Config.in
> @@ -1,6 +1,11 @@
> +comment "xorg-server needs a glibc or uClibc toolchain"
> +	depends on BR2_arm && BR2_TOOLCHAIN_USES_MUSL
> +
>  config BR2_PACKAGE_XSERVER_XORG_SERVER
>  	bool "xorg-server"
>  	depends on BR2_USE_MMU # fork()
> +	# xserver uses inb/outb on arm, which aren't available with musl
> +	depends on !(BR2_arm && BR2_TOOLCHAIN_USES_MUSL)

This looks a bit weird to me. X.org is a major piece of software, and
there are musl-based distributions that do run X, though perhaps not on
ARM. Has the issue been reported to the musl developers?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
