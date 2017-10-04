From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Wed, 04 Oct 2017 18:20:27 +0200
Subject: [Buildroot]
	=?iso-8859-1?q?=5BPATCH_v3=5D_HOST=5FDIR/lib=3A_symli?=
	=?iso-8859-1?q?nk_respectively_to_lib32/64?=
In-Reply-To: <1507120908-48104-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1507120908-48104-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <9b8afa0d-6867-4898-9389-678b1cec8458@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On st?eda 4. ??jna 2017 14:41:48 CEST, Matt Weber wrote:
> Discovered the issue on a RHEL7.4 machine where
> the cmake build dynamically selected HOST_DIR/lib64
> as the installation path for the lzo2 library.
>
> Fixes failures like the following:
> host-mtd
> http://autobuild.buildroot.net/results/d31/d31581d2e60f35cf70312683df99c768e2ea8516/
>
> host-squashfs
> http://autobuild.buildroot.net/results/d9c/d9c95231ac774ed71580754a15ebb3b121764310/
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> [Yann
> v2 -> v3
>  - Updated hostarch logic to check for 64bit in the name
>    and if present create link.  This supports all archs
>    vs just x86.
>
> v1 -> v2
>  - Correct the condition used to determine host arch.
>    (Previously used the target arch check)
> ---
>  Makefile | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 9b09589..601de1d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -542,7 +542,7 @@ endif
>  
>  .PHONY: dirs
>  dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
> -	$(HOST_DIR) $(HOST_DIR)/usr $(BINARIES_DIR)
> +	$(HOST_DIR) $(HOST_DIR)/usr $(HOST_DIR)/lib $(BINARIES_DIR)
>  
>  $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
>  	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" 
> HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
> @@ -565,6 +565,13 @@ sdk: world
>  $(HOST_DIR)/usr: $(HOST_DIR)
>  	@ln -snf . $@
>  
> +$(HOST_DIR)/lib: $(HOST_DIR)
> +	@mkdir -p $@
> +	case $(HOSTARCH) in \
> +		(*64) ln -s lib $(@D)/lib64;; \
> +		(*)   ln -s lib $(@D)/lib32;; \
> +	esac
> +
>  # Populating the staging with the base directories is handled 
> by the skeleton package
>  $(STAGING_DIR):
>  	@mkdir -p $(STAGING_DIR)

Thanks, I was hitting a same issue with another package that I was working 
on yesterday. I think that anybody whose distribution sets up CMake to use 
lib64 for libdir will hit that, at least on package which include 
GNUInstallDirs.cmake.

I can confirm that this patch fixes that issue for me.

Reviewed-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
Tested-by: Jan Kundr?t <jan.kundrat@cesnet.cz> (host: x86_64, targets: 
i686, arm)

Cheers,
Jan
