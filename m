From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Jun 2021 12:12:02 +0200
Subject: [Buildroot] [PATCH 05/15] package/pkg-generic.mk: Perform .la
 files fixup in per-package HOST_DIR
In-Reply-To: <20210621141130.48654-6-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-6-herve.codina@bootlin.com>
Message-ID: <20210622101202.GE44262@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-06-21 16:11 +0200, Herve Codina spake thusly:
> fixup-libtool-files was called on per-package STAGING_DIR.
> Some host-xxxx packages have their .la files with directories
> pointing outside their own per-package directory.
> 
> This commit, calling fixup-libtool-files on HOST_DIR, fixes this
> issue.

Usually, I don't much like that we have a fix for some theoretical bug,
but in this case I think it just does make sense.

And because a .la file is only used to find the libraries at link time,
not runtime, this is has most probably gone unnoticed because, at build
time, the libraries are present in the out-of-package tree, and are
present at runtime in the per-package tree...

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  package/pkg-generic.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f9564831cc..e437050175 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -97,7 +97,8 @@ endif
>  # $2: staging directory of the package
>  ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>  define fixup-libtool-files
> -	$(Q)find $(2)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
> +	$(Q)find $(2) \( -path '$(2)/lib*' -o -path '$(2)/usr/lib*' \) \
> +		-name "*.la" | xargs --no-run-if-empty \
>  		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(1)/:g"

While at it, can you switch over to using find's -print0 and xarg's -0 ?

>  endef
>  endif
> @@ -254,6 +255,7 @@ $(BUILD_DIR)/%/.stamp_configured:
>  	@$(call pkg_size_before,$(TARGET_DIR))
>  	@$(call pkg_size_before,$(STAGING_DIR),-staging)
>  	@$(call pkg_size_before,$(HOST_DIR),-host)
> +	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
>  	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))

Regards,
Yann E. MORIN.

>  	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
>  	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
