From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 01:08:01 +0200
Subject: [Buildroot] [Patch v7 02/10] rust-bin: new package
In-Reply-To: <20170723081206.7774-3-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
 <20170723081206.7774-3-eric.le.bihan.dev@free.fr>
Message-ID: <fc4e8074-48fc-39bc-43c2-ac38547547bb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 10:11, Eric Le Bihan wrote:
[snip]
> +define HOST_RUST_BIN_INSTALL_CMDS
> +	for exe in $$(find $(@D) -name install.sh -executable); do \

 I don't like this very much. Is this one install.sh per package that you
install here (i.e. rustc, host-rust-std and rust-std)? In that case, it will
resolve itself when you split off rust-std in a separate package. Or is there
really a bunch of install.sh scripts scattered around?

> +		$${exe} \
> +			--prefix=$(HOST_DIR) \
> +			--docdir=$(HOST_DIR)/share/doc/rust \

 Would it be possible to avoid installing docs completely?

> +			--libdir=$(HOST_DIR)/lib \
> +			--mandir=$(HOST_DIR)/share/man \

 Same here.

> +			--disable-ldconfig; \
> +	done
> +endef
> +
> +$(eval $(host-generic-package))
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index fef78a7..7f2c276 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -1,5 +1,46 @@
> +config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on  BR2_i386 || BR2_x86_64 \
> +		|| BR2_arm  || BR2_aarch64 \
> +		|| BR2_powerpc  || BR2_powerpc64 \
> +		|| BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> +	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
> +	depends on !BR2_MIPS_NABI32
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

 Ah, it depends on glibc... That voids my earlier questions about TARGET_OS,
LIBC and ABI support.

 This entire piece should be kept together with the part in the first patch that
defines RUST_TARGET_NAME etc. Unlike Joerg, I kind of like this stuff to already
be done in the patch that adds the virtual package, but either way works.

> +
> +config BR2_PACKAGE_HOST_RUSTC
> +	bool "host rustc"
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> +	help
> +	  Select the desired provider for the Rust compiler.

 This help text is not relevant, should rather be something like "Compiler for
the Rust language".

> +
> +	  http://www.rust-lang.org
> +
> +if BR2_PACKAGE_HOST_RUSTC
> +
> +choice
> +	prompt "Rust compiler variant"
> +	default BR2_PACKAGE_HOST_RUST_BIN
> +	help
> +	  Choose a provider for the Rust compiler.
> +
> +config BR2_PACKAGE_HOST_RUST_BIN
> +	bool "host rust (pre-built)"
> +	select BR2_PACKAGE_HAS_HOST_RUSTC
> +	help
> +	  This package will install pre-built versions of the compiler
> +	  for the host and the Rust standard library for the target.

 When rust-std{,-bin} becomes a separate package, I do think that it should be a
hidden package, i.e. selected automatically when host-rust-bin is selected. So
this help text is OK as it is even when rust-std-bin is a separate package.

 Regards,
 Arnout

> +
> +endchoice
> +
>  config BR2_PACKAGE_HAS_HOST_RUSTC
>  	bool
>  
>  config BR2_PACKAGE_PROVIDES_HOST_RUSTC
>  	string
> +	default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN
> +
> +endif

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
