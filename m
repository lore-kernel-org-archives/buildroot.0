From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Jul 2016 22:55:44 +0200
Subject: [Buildroot] [PATCH] linux/tools: make it a real,
	separate package
In-Reply-To: <1468009430-18011-1-git-send-email-yann.morin.1998@free.fr>
References: <1468009430-18011-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160708205544.GC3757@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2016-07-08 22:23 +0200, Yann E. MORIN spake thusly:
> The kernel source tree also contains the sources for various userland
> tools, of which cpupower, perf or selftests.
> 
> Currently, we have support for building those tools as part of the
> kernel build procedure. This looked the correct hing to do so far,
> because, well, they *are* part of the kernel source tree and some
> really have to be the same version as the kernel that will run.
> 
> However, this is causing quite a non-trivial-to-break circular
> dependency in some configurations. For example, this defconfig fails to
> build (similar to the one reported by Paul):
[--SNIP--]
> The only solution is to break the loop at the linux-tools level, by
> moving them away in their own package, so that the linux package will no
> longer have the opportunity to depend on another package via a
> dependency of one the tools.
[--SNIP--]
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 4101cb0..e44e8a9 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,27 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2016.08"
>  
> +config BR2_LINUX_KERNEL_TOOL_CPUPOWER
> +	bool "linux-tool cpupower"
> +	depends on BR2_LINUX_KERNEL
> +	select BR2_PACKAGE_LINUX_TOOLS_CPUPOWER

I forgot to select BR2_LEGACY (for all three symbols).

Fixed locally. I'll wait for other reviews before respinning...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
