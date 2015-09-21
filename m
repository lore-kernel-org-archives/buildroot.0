From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 21 Sep 2015 23:43:43 +0200
Subject: [Buildroot] [PATCH 18/19] ccache: use mtime for external
 toolchain, CONF_OPTS for internal toolchain
In-Reply-To: <1442777319-24164-5-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442777319-24164-1-git-send-email-arnout@mind.be>
 <1442777319-24164-5-git-send-email-arnout@mind.be>
Message-ID: <CAHXCMMLkNi47MQg+KCMNjtG1s4byAOO=aJqOGYHYC6Af_6WwpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Just some minor comments below.

On Sun, Sep 20, 2015 at 9:28 PM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
[...]
>
> +ifeq ($(BR2_CCACHE),y)
> +HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
> +HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(GCC_VERSION)/*.patch
> +ifeq ($(BR2_xtensa),y)
> +HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_XTENSA_OVERLAY_TAR)
> +endif
> +ifeq ($(ARCH),powerpc)
> +ifneq ($(BR2_SOFT_FLOAT),)
> +HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(GCC_VERSION)/1000-powerpc-link-with-math-lib.patch.conditional
> +endif
> +endif

Maybe it is a rare case, should not the gcc's patches from the
BR2_GLOBAL_PATCH_DIR location be added to the
HOST_GCC_COMMON_CCACHE_HASH_FILES list as well?

> +
> +HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_HASH=\"`\
> +       printf '%s' $($(PKG)_CONF_OPTS) $(GCC_VERSION) \
> +               | sha256sum - $(HOST_GCC_COMMON_CCACHE_HASH_FILES) \
> +               | cut -c -64 | tr -d '\n'`\"

Depending on the number of items in the
HOST_GCC_COMMON_CCACHE_HASH_FILES list, the BR_CCACHE_HASH definition
can be quite long...

> +endif # BR2_CCACHE
> +
[...]


Regards,


-- 
Samuel
