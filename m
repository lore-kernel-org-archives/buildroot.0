From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Mar 2015 22:59:58 +0200
Subject: [Buildroot] [PATCH 20/35] Makefile: use <pkg>-all-legal-info to
 implement the legal-info target
In-Reply-To: <1427650429-9293-21-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-21-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150330205958.GE4318@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> This commit changes the implementation of the global 'legal-info'
> target to use the newly introduced per-package <pkg>-all-legal-info
> target. This allows to avoid using the $(TARGET_HOST_DEPS) and
> $(HOST_DEPS) variables that we are trying to remove.

To be noted:

  - this patch exposes some bugs we have in our packages, whereby the
    dependencies are not properly expressed: the Config.in missese
    either a 'depends on' or a 'select', but the .mk has an
    unconditional _DEPENDENCIES (like xfont_font-adobe-100dpi missing a
    select on xfont_font-util, and at least quitre a bunch of others...)

    This is not a problem with the patch, but bugs in our packages.

  - more host packages are exposed in legal-info than were previously.

    This is a new feature! :-)

What I meant is, maybe the commit log should be extended to mention that
previously forgottent packages will now show up in legal-info, mostly
host-packages, and mention (in a post-commit note) that some target
packages may also appear.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Otherwise:

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 0577b3f..ab54dda 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -415,9 +415,6 @@ HOST_DEPS = $(sort $(foreach dep,\
>  		$($(dep))))
>  HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
>  
> -PACKAGES_LEGAL_INFO := $(patsubst %,%-legal-info,\
> -		$(PACKAGES) $(TARGETS_HOST_DEPS) $(HOST_DEPS))
> -
>  dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>  	$(HOST_DIR) $(BINARIES_DIR)
>  
> @@ -636,7 +633,7 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
>  	@$(call legal-warning,the toolchain has not been saved)
>  	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
>  
> -legal-info: dirs legal-info-clean legal-info-prepare $(PACKAGES_LEGAL_INFO) \
> +legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all-legal-info) \
>  		$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)
>  	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
>  	@if [ -r $(LEGAL_WARNINGS) ]; then \
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
