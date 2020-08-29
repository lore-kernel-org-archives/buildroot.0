From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Aug 2020 21:40:27 +0200
Subject: [Buildroot] [PATCH v2 04/12] package/clang: install a
 toolchain-wrapper for the host clang cross-compiler
In-Reply-To: <20190907094027.9537-5-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
 <20190907094027.9537-5-romain.naour@smile.fr>
Message-ID: <1382a615-5308-8d0f-959e-e9db9964025a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/09/2019 11:40, Romain Naour wrote:
> Since host-clang is always build by Buildroot as an internal toolchain,
> we have to use a second toolchain-wrapper called toolchain-wrapper-clang
> when an external toolchain is used.
> Inded, the two wrapper use a different path BR_CROSS_PATH_SUFFIX in this
> case.

 I didn't think this was very clear, so I reworded it as follows:

    host-clang refers to an existing GCC-based toolchain (internal or
    external) for libstdc++. However, a Buildroot external toolchain gets a
    different BR_CROSS_PATH_SUFFIX. Therefore, we can't reuse the
    toolchain-wrapper that gets built for the GCC-based toolchain, but
    instead have to compile an additional clang-specific wrapper, called
    toolchain-wrapper-clang.

 BTW, I've also fixed small typos in the commit messages here and there, and
also some check-package warnings, I'm not going to mention those explicitly.

> Use a post install hook to rename the clang-8 binary to clang-8.br_real
> and recreate all symlinks:
> 
>  # clang -> toolchain-wrapper-clang
>  # clang++ -> toolchain-wrapper-clang
>  # clang-8 -> toolchain-wrapper-clang
>  # clang-8.br_real
>  # clang++.br_real -> clang-8.br_real

 Are these *.br_real -> clang-8.br_real symlinks useful for anything? I don't
think so, since nobody "knows" that clang++.br_real even exists.

>  # clang.br_real -> clang-8.br_real
>  # clang-cl -> toolchain-wrapper-clang
>  # clang-cl.br_real -> clang-8.br_real
>  # clang-cpp -> toolchain-wrapper-clang
>  # clang-cpp.br_real -> clang-8.br_real
[snip]
> +define HOST_CLANG_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
> +	$(Q)cd $(HOST_DIR)/bin; \
> +	for i in clang clang-$(CLANG_VERSION_MAJOR) clang++ clang-cl clang-cpp; do \
> +		case "$$i" in \
> +		*clang-$(CLANG_VERSION_MAJOR)) \

 This loop with cases is not needed here. With gcc and friends, we need it
because we loop over a wildcard. Here, however, we know exactly what we loop
over. So it's much simpler to move this outside of the loop.

> +			rm -f $$i.br_real; \
> +			mv $$i $$i.br_real; \
> +			ln -sf toolchain-wrapper-clang $$i; \
> +			;; \
> +		*) \
> +			ln -snf toolchain-wrapper-clang $$i; \
> +			ln -snf clang-$(CLANG_VERSION_MAJOR).br_real $$i.br_real; \

 Given the remark above, I removed this line.

 Regards,
 Arnout

> +			;; \
> +		esac; \
> +	done
> +endef
> +
> +define HOST_CLANG_TOOLCHAIN_WRAPPER_BUILD
> +	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
> +		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
> +		toolchain/toolchain-wrapper.c \
> +		-o $(@D)/toolchain-wrapper-clang
> +endef
> +
> +define HOST_CLANG_TOOLCHAIN_WRAPPER_INSTALL
> +	$(INSTALL) -D -m 0755 $(@D)/toolchain-wrapper-clang \
> +		$(HOST_DIR)/bin/toolchain-wrapper-clang
> +endef
> +
> +HOST_CLANG_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
> +HOST_CLANG_POST_BUILD_HOOKS += HOST_CLANG_TOOLCHAIN_WRAPPER_BUILD
> +HOST_CLANG_POST_INSTALL_HOOKS += HOST_CLANG_TOOLCHAIN_WRAPPER_INSTALL
> +HOST_CLANG_POST_INSTALL_HOOKS += HOST_CLANG_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
