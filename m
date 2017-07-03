From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 00:11:25 +0200
Subject: [Buildroot] [RFC PATCH v5 09/11] external-toolchain: check if a
 buildroot SDK has already been relocated
In-Reply-To: <1498811828-6893-10-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-10-git-send-email-wg@grandegger.com>
Message-ID: <ce0b59e4-625c-c817-2b65-0367af2c31ff@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 This is really a great solution.

On 30-06-17 10:37, Wolfgang Grandegger wrote:
> The location of the buildroot SDK is stored in the file "sdk-location"
> in "usr/share/buildroot". If it's content does not match the current
> SDK location, ask the user to run the script "relocate-sdk.sh" in the
> top directory once.

 Perhaps explain in the commit log why we can't just relocate it automatically:

The external toolchain may be a pre-installed one in a directory that is not
writeable by us. Therefore, we can't run the script directly.

> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  toolchain/helpers.mk                                   | 15 +++++++++++++++
>  toolchain/toolchain-external/pkg-toolchain-external.mk |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 90834f4..43e89fc 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -479,3 +479,18 @@ define simplify_symlink
>  	ln -sf "$${DOTS}$${REL_DEST}" "$${FULL_SRC}" ; \
>  )
>  endef
> +
> +#
> +# Check if it's a buildroot toolchain and if it's already relocatable by
> +# reading and testing the toolchain location file
> +#
> +# $1: toolchain installation directory
> +#
> +check_buildroot_sdk_relocated = \

 Since this is a multiline command, it's nicer to define it as a define:

define check_buildroot_sdk_relocated

> +	if [ -r $(1)/share/buildroot/sdk-location ]; then \
> +		sdkroot=`dirname "$(1)"`; \

 As you may have noticed, I'm working on removing the usr/ part of the HOST_DIR,
so this won't be needed any more (and in fact will be wrong). I hope that that
series will be committed tomorrow...

> +		if [ "`cat $(1)/share/buildroot/sdk-location`" != "$${sdkroot}" ]; then \
> +			echo "Please relocate the buildroot SDK by executing \"$${sdkroot}/relocate-sdk.sh\" once!" ; \
> +			exit 1 ; \
> +		fi \
> +	fi
endef

> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 8269345..761221b 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -545,6 +545,7 @@ endif
>  # matches the configuration provided in Buildroot: ABI, C++ support,
>  # kernel headers version, type of C library and all C library features.
>  define $(2)_CONFIGURE_CMDS
> +	$$(Q)$$(call check_buildroot_sdk_relocated,$$(TOOLCHAIN_EXTERNAL_INSTALL_DIR))
>  	$$(Q)$$(call check_cross_compiler_exists,$$(TOOLCHAIN_EXTERNAL_CC))
>  	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC))
>  	$$(Q)SYSROOT_DIR="$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC))" ; \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
