From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 11:37:54 +0100
Subject: [Buildroot] [PATCH] fbdump: Make fbdump available only to
 x86/x86_64/arm architectures
In-Reply-To: <1331719334-12874-1-git-send-email-markos.chandras@imgtec.com>
References: <1331719334-12874-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <20120314113754.17f75aaf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 14 Mar 2012 10:02:14 +0000,
Markos Chandras <markos.chandras@imgtec.com> a ?crit :

> fbdump uses the ioperm() syscall which is only implemented in
> x86/x86_64. The rest of the architectures map ioperm() to
> sys_ni_syscall which is the default function for the unimplemented
> syscalls. Moreover, ARM has its own ioperm() implementation
> in uClibc.

Is ioperm() on ARM only available if uClibc is used, and not when glibc
is used?

> diff --git a/package/fbdump/Config.in b/package/fbdump/Config.in
> index fb4aee6..2f8040f 100644
> --- a/package/fbdump/Config.in
> +++ b/package/fbdump/Config.in
> @@ -1,3 +1,4 @@
> +if BR2_i386 || BR2_x86_64 || BR2_arm
>  config BR2_PACKAGE_FBDUMP
>  	bool "fbdump (Framebuffer Capture Tool)"
>  	help
> @@ -5,4 +6,4 @@ config BR2_PACKAGE_FBDUMP
>  	  framebuffer  device and write them out as a PPM file. Currently,
>  	  most packed-pixel framebuffer formats and the vga16 framebuffer
>  	  are supported.
> -
> +endif

I would prefer:

config BR2_PACKAGE_FBDUMP
	bool "fbdump (Framebuffer Capture Tool)"
	depends on BR_i386 || BR2_x86_64 || BR2_arm

because that's what we do for all other packages.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
