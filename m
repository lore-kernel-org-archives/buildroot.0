From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Jul 2014 19:05:12 +0200
Subject: [Buildroot] [PATCH 6 of 6] uclibc: update-config: preserve
 freshly configured settings
In-Reply-To: <82c951fdcf4851185bcc.1405338630@localhost>
References: <patchbomb.1405338624@localhost>
 <82c951fdcf4851185bcc.1405338630@localhost>
Message-ID: <53C40DC8.8000607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/07/14 13:50, Thomas De Schampheleire wrote:
> In the sequence:
> 
> make uclibc-menuconfig
> make uclibc-update-config
> 
> the freshly configured settings from the menuconfig are lost during the
> update-config step. This is because update-config depends on the configure
> step, which starts by copying the config file to the build directory.
> 
> Instead, stop depending on the configure step from update-config, and
> introduce a new stamp file .stamp_config_fixup_done, which applies any
> fixups on the .config file.

 I think the commit message should explain why this stamp file is preferred over
repeating the fixup in each target.

> 
> This has the added bonus that 'uclibc-update-config' no longer needs the
> toolchain to be available, which makes:
>     make clean uclibc-menuconfig uclibc-update-config
> much faster and user-friendly.
> 
> Additionally, make sure that 'make clean uclibc-update-config' works
> properly, by depending on .stamp_config_fixup_done so that the config file
> is present and fixed.
> 
> Fixes bug #7154 https://bugs.busybox.net/show_bug.cgi?id=7154
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
> rfc->patch:
> - rebase
> - rename .stamp_config_file_fixed into .stamp_config_fixup_done
> - add dependency on .config from .stamp_config_file_fixed (Arnout)
> - remove explicit call to UCLIBC_FIXUP_DOT_CONFIG from configure commands,
>   and instead depend on .stamp_config_fixup_done.
> 
>  package/uclibc/uclibc.mk |  12 ++++++++----
>  1 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff -r 34f3d55304ad -r 82c951fdcf48 package/uclibc/uclibc.mk
> --- a/package/uclibc/uclibc.mk	Sun Jun 22 10:37:22 2014 +0200
> +++ b/package/uclibc/uclibc.mk	Mon Jun 16 20:18:23 2014 +0200
> @@ -432,7 +432,6 @@
>  endef
>  
>  define UCLIBC_CONFIGURE_CMDS
> -	$(UCLIBC_FIXUP_DOT_CONFIG)
>  	$(MAKE1) -C $(UCLIBC_DIR) \
>  		$(UCLIBC_MAKE_FLAGS) \
>  		PREFIX=$(STAGING_DIR) \
> @@ -537,7 +536,11 @@
>  $(UCLIBC_DIR)/.config: $(UCLIBC_CONFIG_FILE) | uclibc-patch
>  	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
>  
> -$(UCLIBC_DIR)/.stamp_configured: $(UCLIBC_DIR)/.config
> +$(UCLIBC_DIR)/.stamp_config_fixup_done: $(UCLIBC_DIR)/.config
> +	$(UCLIBC_FIXUP_DOT_CONFIG)
> +	touch $@

	$(@)touch $@

like the rest of pkg-generic.mk.

 Otherwise, looks good to me.


 Regards,
 Arnout

> +
> +$(UCLIBC_DIR)/.stamp_configured: $(UCLIBC_DIR)/.stamp_config_fixup_done
>  
>  uclibc-menuconfig: $(UCLIBC_DIR)/.config
>  	$(MAKE1) -C $(UCLIBC_DIR) \
> @@ -546,9 +549,10 @@
>  		DEVEL_PREFIX=/usr/ \
>  		RUNTIME_PREFIX=$(STAGING_DIR)/ \
>  		menuconfig
> -	rm -f $(UCLIBC_DIR)/.stamp_{configured,built,target_installed,staging_installed}
> +	rm -f $(UCLIBC_DIR)/.stamp_{config_fixup_done,configured,built}
> +	rm -f $(UCLIBC_DIR)/.stamp_{target,staging}_installed
>  
> -uclibc-update-config: $(UCLIBC_DIR)/.stamp_configured
> +uclibc-update-config: $(UCLIBC_DIR)/.stamp_config_fixup_done
>  	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
>  
>  # Before uClibc is built, we must have the second stage cross-compiler
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
