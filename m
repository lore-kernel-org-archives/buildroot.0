From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 18:30:26 +0100
Subject: [Buildroot] [PATCH v1 1/1] package/delve: new package
In-Reply-To: <20201216080013.547261-6-christian@paral.in>
References: <20201216080013.547261-1-christian@paral.in>
 <20201216080013.547261-6-christian@paral.in>
Message-ID: <20210102183026.0de43d73@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Wed, 16 Dec 2020 00:00:13 -0800
Christian Stewart <christian@paral.in> wrote:

> Delve is a debugger for the Go programming language.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

I have applied, but after doing some changes. See below.

> diff --git a/package/delve/Config.in b/package/delve/Config.in
> new file mode 100644
> index 0000000000..008f00d789
> --- /dev/null
> +++ b/package/delve/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_DELVE
> +	bool "delve"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # go, cgo
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # go

There is no such dependency on glibc && !uclibc in Go.

> +	depends on BR2_USE_MMU # go

There is no dependency on BR2_USE_MMU in Go.

So both of these do not make sense. However, delve has indeed a limited
set of CPU architectures it supports. Apparently, just aarch64, i386
and x86-64, according to pkg/proc/native/support_sentinel.go in the
code base.

So I've replaced the Config.in file with this:

# Supported architectures are listed in
# pkg/proc/native/support_sentinel.go
config BR2_PACKAGE_DELVE_ARCH_SUPPORTS
        bool
        default y if BR2_aarch64
        default y if BR2_i386
        default y if BR2_x86_64
        depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
        depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS

config BR2_PACKAGE_DELVE
        bool "delve"
        depends on BR2_PACKAGE_DELVE_ARCH_SUPPORTS
        depends on BR2_TOOLCHAIN_HAS_THREADS
        help
          Delve is a debugger for the Go programming language.

          https://github.com/go-delve/delve

comment "delve needs a toolchain w/ threads"
        depends on BR2_PACKAGE_DELVE_ARCH_SUPPORTS
        depends on !BR2_TOOLCHAIN_HAS_THREADS

I have verified that it builds fine on uClibc/i386 and musl/aarch64 for
example, which confirms that the glibc && !uclibc dependency was not
correct.

Applied with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
