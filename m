From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 Oct 2017 22:37:15 +0200
Subject: [Buildroot] [PATCH v3] HOST_DIR/lib: symlink respectively to
 lib32/64
In-Reply-To: <1507120908-48104-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1507120908-48104-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <78e41d61-c2f5-1e7f-0e45-66b497f8bff6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Matt,

On 04-10-17 14:41, Matt Weber wrote:
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

 Two small nits...

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
>  	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
> @@ -565,6 +565,13 @@ sdk: world
>  $(HOST_DIR)/usr: $(HOST_DIR)
>  	@ln -snf . $@
>  
> +$(HOST_DIR)/lib: $(HOST_DIR)
> +	@mkdir -p $@
> +	case $(HOSTARCH) in \

 Better put @ in front here.

> +		(*64) ln -s lib $(@D)/lib64;; \

 Probably not really important, but what would HOSTARCH be on a MIP64 n32?

 More importantly: it is possible that HOST_DIR/lib64 exists already but that
HOST_DIR ends up newer - for example because a new directory (e.g. sbin) was
created in it. Then the rule will be executed again, and a new symlink will be
created within the lib directory. So to avoid this, use ln -snf.

 To be sure, could you test with BR2_HOST_DIR set to somewhere else and also
rebuilding?

 Regards,
 Arnout

> +		(*)   ln -s lib $(@D)/lib32;; \
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
