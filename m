From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 16:57:53 +0000
Subject: [Buildroot] [PATCH 1/3] package/lld: create
 $(HOST_DIR)/$(GNU_TARGET_NAME)/bin before create symlinks
In-Reply-To: <20191024202211.15619-1-romain.naour@smile.fr>
References: <20191024202211.15619-1-romain.naour@smile.fr>
Message-ID: <24e6ecfd-5487-e466-d58f-d4719e5447ec@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Sorry for the late feedback on this, I know it's already been accepted.

On 24/10/2019 21:22, Romain Naour wrote:
> $(HOST_DIR)/$(GNU_TARGET_NAME)/bin directory may not exist before creating
> lld symlinks.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/lld/lld.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/lld/lld.mk b/package/lld/lld.mk
> index a6933e2961..bda5a56ab5 100644
> --- a/package/lld/lld.mk
> +++ b/package/lld/lld.mk
> @@ -14,6 +14,7 @@ HOST_LLD_DEPENDENCIES = host-llvm
>  
>  # GCC looks for tools in a different path from LLD's default installation path
>  define HOST_LLD_CREATE_SYMLINKS
> +	mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
>  	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
>  	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
>  endef
> 

Why do we create symlinks inside the toolchain directory? I think this is
confusing and it breaks external toolchains, because they might not be
located at $(HOST_DIR)/$(GNU_TARGET_NAME). They might be located at:

	$(HOST_DIR)/toolchain/$(GNU_TARGET_NAME)
	/some/random/location/$(GNU_TARGET_NAME)

This change adds a `mkdir -p`, which silences this bug.

I think the right solution is to do away with HOST_LLD_CREATE_SYMLINKS,
and just use a full path to lld (because it is not part of the toolchain):

	-fuse-ld=$(HOST_DIR)/bin/lld

Are you sure HOST_LLD_CREATE_SYMLINKS is needed?

Thanks,
Thomas Preston
