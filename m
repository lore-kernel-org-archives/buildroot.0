From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 22:53:02 +0100
Subject: [Buildroot] [PATCH] linux-tools: Add liblockdep
In-Reply-To: <20181111150652.17459-3-alexander.sverdlin@gmail.com>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111150652.17459-3-alexander.sverdlin@gmail.com>
Message-ID: <20181111225302.61f04f5d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this patch, unfortunately, I encountered a number of issues
while testing it, and I have some review comments. See below.

On Sun, 11 Nov 2018 16:06:48 +0100, Alexander Sverdlin wrote:
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  package/linux-tools/Config.in                | 13 ++++++++
>  package/linux-tools/linux-tool-liblockdep.mk | 34 ++++++++++++++++++++

This file should be named linux-tool-liblockdep.mk.in, to follow the
pattern of other files in the same folder.

> +config BR2_PACKAGE_LINUX_TOOLS_LIBLOCKDEP

You need a:

	# <execinfo.h>
	depends on BR2_TOOLCHAIN_USES_GLIBC

because the liblockdep source code uses <execinfo.h>, which is only
provided by glibc.

Also, you forgot:

	select BR2_PACKAGE_LINUX_TOOLS

and therefore if only liblockdep is selected in linux-tools, the
linux-tools package is not built at all.

> +	bool "liblockdep"
> +	help
> +	  liblockdep is a tiny wrapper built around kernel/lockdep.c.
> +	  The aim is to provide the same functionality the kernel gets
> +	  from lockdep to userspace.
> +
> +	  The bulk of the code here is the LD_PRELOAD support which
> +	  provides users an easy way to test their code without having
> +	  to integrate liblockdep into said code.
> +
> +	  http://lwn.net/Articles/536363/

And therefore, you need:

comment "liblockdep needs a toolchain w/ glibc"
	depends on !BR2_TOOLCHAIN_USES_GLIBC

> +LIBLOCKDEP_MAKE_FLAGS = \

We are not very consistent between the different .mk.in files, but I
think I'd prefer to see this variable named LIBLOCKDEP_MAKE_OPTS.

> +define LIBLOCKDEP_BUILD_CMDS
> +	$(Q)if test ! -f $(@D)/tools/lib/lockdep/Makefile ; then \

It clearly doesn't work with $(@D) here, you need to use $(LINUX_DIR)
everywhere.

But even with this fixed, I get:

  CC       lockdep.o
In file included from lockdep.c:8:0:
../../../kernel/locking/lockdep.c:49:10: fatal error: linux/jhash.h: No such file or directory
 #include <linux/jhash.h>
          ^~~~~~~~~~~~~~~
compilation terminated.
mv: cannot stat './.lockdep.o.tmp': No such file or directory

When building with Linux 4.9.

Could you have a look at those issues, and send an updated version ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
