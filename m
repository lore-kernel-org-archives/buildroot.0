From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 23:07:01 +0200
Subject: [Buildroot] [PATCHv6] package/golang: new package
In-Reply-To: <1438277053-10053-1-git-send-email-yann.morin.1998@free.fr>
References: <1438277053-10053-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151021230701.4701e646@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Christian,

On Thu, 30 Jul 2015 19:24:13 +0200, Yann E. MORIN wrote:

> We're adding a host package to get the golang cross-compiler, and a
> target package to get the golang interpreter on the target.

As discussed on IRC, I tested the host package, and it is not a
cross-compiler, but a regular compiler, which makes it pretty useless:

$ ./output/host/usr/bin/go build toto.go 
$ file toto
toto: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped

> diff --git a/package/golang/Config.in b/package/golang/Config.in
> new file mode 100644
> index 0000000..8dbd75a
> --- /dev/null
> +++ b/package/golang/Config.in
> @@ -0,0 +1,22 @@
> +comment "golang needs a toolchain w/ threads, dynamic library"
> +	depends on BR2_PACKAGE_GOLANG_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +
> +# golang only supports x86, x86_64 and ARM (LE) targets.
> +# For ARM, armv5 or above is required.
> +config BR2_PACKAGE_GOLANG_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on BR2_USE_MMU
> +	depends on BR2_i386 || BR2_x86_64 || BR2_arm
> +	depends on !BR2_ARM_CPU_ARMV4
> +
> +config BR2_PACKAGE_GOLANG
> +	bool "golang"
> +	depends on BR2_PACKAGE_GOLANG_ARCH_SUPPORTS
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Go compiler and cli tool.

I think this is fairly confusing. We should instead say:

	  Go interpreter.

and indicate that if people want to run Go applications that have been
built on their host machine, then they don't need the golang target
package.


> diff --git a/package/golang/golang.mk b/package/golang/golang.mk
> new file mode 100644
> index 0000000..58d5847
> --- /dev/null
> +++ b/package/golang/golang.mk
> @@ -0,0 +1,84 @@
> +################################################################################
> +#
> +# GOLANG

should be lower case, as already noted by Jerzy.


> +# We must install both the src/ and include/ subdirs because they
> +# contain the go "runtime".
> +define GOLANG_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/go $(TARGET_DIR)/usr/bin/go
> +	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/gofmt $(TARGET_DIR)/usr/bin/gofmt

Why do we install gofmt on the target? Buildroot doesn't install tools
to do development on the target, so installing gofmt seems weird.

> +	mkdir -p $(TARGET_DIR)/usr/lib/go/
> +	cp -a $(@D)/src $(TARGET_DIR)/usr/lib/go/
> +	cp -a $(@D)/include $(TARGET_DIR)/usr/lib/go/
> +	cp -a $(@D)/pkg $(TARGET_DIR)/usr/lib/go/

If I understand correctly, all of this "runtime" is actually only
needed if you use "go" as an interpreter on the target. If you use "go"
on the host as a cross-compiler to build your application, you don't
need any of this "runtime". This stuff is actually quite huge (around
70 MB!).

Note that we more commonly use "cp -dprf" in Buildroot rather than "cp
-a", but I guess it's not a super-strict rule.

I've marked the patch as Changes Requested in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
