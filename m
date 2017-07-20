From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 23:11:34 +0200
Subject: [Buildroot] [PATCH v8 06/10] core: introduce "sdk" target to
 make a relocatable SDK
In-Reply-To: <1500561321-6623-7-git-send-email-wg@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-7-git-send-email-wg@grandegger.com>
Message-ID: <12b29063-e931-6599-32f0-d28f61479378@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-07-17 16:35, Wolfgang Grandegger wrote:
> We use a separate make target to build a relocatable SDK.
> We first sanitize the RPATH in host tree depending on
> the toolchain.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index d4faa02..3019081 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -552,6 +552,11 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>  .PHONY: world
>  world: target-post-image
>  
> +.PHONY: sdk
> +sdk: toolchain

 As mentioned by Thomas, this should depend on "world", not just toolchain.
Indeed, plenty of host packages are built *after* the toolchain. You could add
${PACKAGES} as a dependency, but that still misses the dependencies of the
rootfs targets that don't have a Kconfig option. So depending on "world" is the
easiest.

 With that (and updating the commit message accordingly):
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout


> +	@$(call MESSAGE,"Rendering the SDK relocatable")
> +	$(TOPDIR)/support/scripts/fix-rpath host
> +
>  # Compatibility symlink in case a post-build script still uses $(HOST_DIR)/usr
>  $(HOST_DIR)/usr: $(HOST_DIR)
>  	@ln -snf . $@
> @@ -1001,6 +1006,7 @@ help:
>  	@echo 'Build:'
>  	@echo '  all                    - make world'
>  	@echo '  toolchain              - build toolchain'
> +	@echo '  sdk                    - build relocatable SDK'
>  	@echo
>  	@echo 'Configuration:'
>  	@echo '  menuconfig             - interactive curses-based configurator'
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
