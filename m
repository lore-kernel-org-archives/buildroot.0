From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 Oct 2017 21:00:35 +0200
Subject: [Buildroot] [PATCH v4] HOST_DIR/lib: symlink respectively to
 lib32/64
In-Reply-To: <1507152799-16949-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1507152799-16949-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <7410f3e8-7aed-f5d0-6e73-396d692d01f3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-10-17 23:33, Matt Weber wrote:
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

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> 
> Changes:
> [Arnout
> v3 -> v4
>  - Added @ infront of case statement
>  - Handled case of HOST_DIR ends up being newer and ln -s
>    would create a link inside of the lib folder.  Add -nf
>    to the args of ln (ie. ln -snf)
> 
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
> index 9b09589..02f7cda 100644
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
>  	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
> @@ -565,6 +565,13 @@ sdk: world
>  $(HOST_DIR)/usr: $(HOST_DIR)
>  	@ln -snf . $@
>  
> +$(HOST_DIR)/lib: $(HOST_DIR)
> +	@mkdir -p $@
> +	@case $(HOSTARCH) in \
> +		(*64) ln -snf lib $(@D)/lib64;; \
> +		(*)   ln -snf lib $(@D)/lib32;; \
> +	esac
> +
>  # Populating the staging with the base directories is handled by the skeleton package
>  $(STAGING_DIR):
>  	@mkdir -p $(STAGING_DIR)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
