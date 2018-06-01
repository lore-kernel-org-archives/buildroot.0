From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Jun 2018 23:12:38 +0200
Subject: [Buildroot] [PATCH RFC] linux: disable attribute alias with gcc
 >= 8.1
In-Reply-To: <20180531203745.4799-1-romain.naour@gmail.com>
References: <20180531203745.4799-1-romain.naour@gmail.com>
Message-ID: <20180601231238.3db86d56@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Thu, 31 May 2018 22:37:45 +0200, Romain Naour wrote:
> gcc-8 started warning about function aliases that have a non-matching
> prototype. This seems rather useful in general, but it causes tons of
> warnings in the Linux kernel, where we rely on abusing those aliases
> for system call entry points, in order to sanitze the arguments passed
> from user space in registers.
> 
> See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
> 
> Add a new conditional patch that disable the attribute-alias warning
> introduced by gcc-8 by adding -Wno-attribute-alias to KBUILD_CFLAGS.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> 
> Fixes most of build errors reported by toolchains-builder on Gitlab.
> https://gitlab.com/free-electrons/toolchains-builder/pipelines/22921464

Thanks, but unfortunately, it doesn't fix a lot of those build errors,
because your patch doesn't apply as soon as the Linux kernel version is
a bit different.

For example, if you take qemu_mips32r2el_malta_defconfig, which builds
a 4.11.3 kernel, your patch doesn't apply, and so the bug appears.

So instead, I would like to suggest something like this:

ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
LINUX_MAKE_ENV += KCFLAGS=-Wno-attribute-alias
endif

which works without any patch, and therefore works with potentially all
kernel versions.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
