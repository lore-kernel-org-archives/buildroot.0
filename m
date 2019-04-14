From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 17:27:33 +0200
Subject: [Buildroot] [PATCH v8 5/9] toolchain/toolchain-ext: glibc
 cpe-info support
In-Reply-To: <1552082667-46877-6-git-send-email-matthew.weber@rockwellcollins.com>
References: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1552082667-46877-6-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <7449fc47-63a6-0d5d-e973-28d9f8458341@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/03/2019 23:04, Matt Weber wrote:
> From: Shruthi Singh <shruthi.singh@rockwellcollins.com>
> 
> This commit adds the correct CPE string for glibc, describing CPE ID,
> VERSION, PACKAGE NAME and URL.
> 
> Signed-off-by: Shruthi Singh shruthi.singh at rockwellcollins.com
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 This handles just glibc. However, the toolchain consists of several components
that end up on the target: libgcc and libstdc++ coming from gcc,
glibc/uClibc/musl, linux-headers, gdbserver. So we might need to be able to
specify several CPE_IDs.

> ---
> Changes
> 
> v8
>  - No change
> 
> v7
>  - New
> ---
>  package/pkg-generic.mk                                 | 14 ++++++++++++++
>  toolchain/toolchain-external/pkg-toolchain-external.mk |  7 +++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1b895d0..f9cedd2 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -924,8 +924,22 @@ $(2)_CPE_PREFIX = $(CPE_PREFIX_APP)
>  endif
>  
>  $(1)-cpe-info: PKG=$(2)
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> +$(1)-cpe-info: toolchain
> +endif
>  $(1)-cpe-info:
>  ifeq ($$($(2)_TYPE),target)
> +ifneq ($$($(2)_NAME),toolchain-external)
> +ifneq ($(findstring TOOLCHAIN_EXTERNAL, $(2)),)
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
> +	$$(eval $(2)_VERSION = $$(shell $$(call TOOLCHAIN_CPE_INFO)))

 That should have been _CPE_VERSION, obviously.

 You don't need the $(call) construct because there are no arguments.

> +	$$(eval $(2)_CPE_ID_VENDOR = gnu)
> +	$$(eval $(2)_CPE_ID_NAME = glibc)

 This kind of thing clearly does NOT belong in the generic package
infrastructure. It can easily be moved to pkg-toolchain-external.mk. This has
the additional advantage that it will go with the specific external toolchain.


> +	$$(eval $(2)_ACTUAL_SOURCE_SITE = https://github.com/bminor/glibc/releases)
> +	$$(eval $(2)_RAWNAME = glibc)

 What are these two things doing here?

> +endif # ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC),y)
> +endif # ifneq ($(findstring TOOLCHAIN_EXTERNAL, $(2)),)
> +endif # ifneq ($$($(2)_NAME),toolchain-external)
>  ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  	@$$(call MESSAGE,"Collecting cpe info")
>  	$(Q)$$(call cpe-manifest,$$($(2)_CPE_PREFIX):$$($(2)_CPE_ID):$(CPE_SUFFIX),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index db3570d..aed06c5 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -440,6 +440,13 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
>  	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
>  endef
>  
> +define TOOLCHAIN_CPE_INFO
> +	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +	MAJ=`awk '{ if ($$1 = /#define/ && ($$2= /__GLIBC__/)){printf $$3};}' $${ARCH_SYSROOT_DIR}/usr/include/features.h` ; \
> +	MIN=`awk '{ if ($$1 = /#define/ && ($$2 = /_GLIBC_MINOR/)){printf $$3};}' $${ARCH_SYSROOT_DIR}/usr/include/features.h` ; \
> +	echo $${MAJ}.$${MIN}

 This could be simplified into:

	echo '__GLIBC__.__GLIBC_MINOR__' | \
		cat $${ARCH_SYSROOT_DIR}/usr/include/features.h - | \
		cpp -P | tr -d ' '

 However, it brings up a new problem... This will only work if the toolchain has
been extracted already (or if it's a preinstalled toolchain, which is the same).
However, there is no dependency of cpe-info (or show-info) on
toolchain-external-foo-extract.

 If that is anyway the case, we can simplify things even more by requiring the
toolchain to be installed. Then, we can use $(STAGING_DIR) instead of
$${ARCH_SYSROOT_DIR}.

 But we should handle the case when the toolchain has not been
extracted/installed yet, and issue a warning (and return *) if that is the case.

 So, this could become something like this (directly inside
inner-external-toolchain):

$(2)_GLIBC_VERSION = $$(if $$(wildcard $$(STAGING_DIR)/usr/include/features.h),\
	$$(shell echo '__GLIBC__.__GLIBC_MINOR__' | \
		cat $$(STAGING_DIR)/usr/include/features.h - | \
		cpp -P | tr -d ' '),\
 	*$$(warning "External toolchain glibc version can only be detected after
toolchain installation"))

 Please test both the case when it has and has not been extracted before
submitting :-)


 Regards,
 Arnout

> +endef
> +
>  # Create a symlink from (usr/)$(ARCH_LIB_DIR) to lib.
>  # Note: the skeleton package additionally creates lib32->lib or lib64->lib
>  # (as appropriate)
> 
