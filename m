From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Jun 2021 23:31:40 +0200
Subject: [Buildroot] [PATCH 01/15] package/pkg-generic.mk: detect files
 overwritten in TARGET_DIR and HOST_DIR
In-Reply-To: <20210621141130.48654-2-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-2-herve.codina@bootlin.com>
Message-ID: <20210621213140.GA44262@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-06-21 16:11 +0200, Herve Codina spake thusly:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Without per-package directory support, a package can happily overwrite
> files installed by other packages. Indeed, because the build order
> between packages is always guaranteed, Buildroot will always produce
> the same output.
> 
> However, with per-package directory support, it is absolutely critical
> that a given package does not overwrite files already installed by
> another package, due to how the final aggregation is done to create
> the complete target/, staging/ and host/ folders. Unfortunately, we
> currently don't have anything in Buildroot that detects this
> situation.
> 
> We used to have check-uniq-files, but it was dropped in commit
> 2496189a4207173e4cd5bbab90256f911175ee57.
> 
> This commit is a new implementation of such a detection, which is
> based on calculating and verifying MD5 hashes of installed files: the
> calculation is done at the beginning of the configure step, the
> verification during the newly introduced "install" step that takes
> place after all installation steps.
> 
> Since preventing file overwrites is really only needed when
> per-package directory support is used, and due to this verification
> having some overhead, it is only enabled when
> BR2_PER_PACKAGE_DIRECTORIES=y. This additional verification cost is
> however not too bad as on average, with per-package directory support,
> the per-package target/ and host/ directories will contain less files
> than with a build that doesn't use per-package directory support. This
> helps a bit in mitigating the additional cost of this verification.
> 
> Note that we are not handling separately HOST_DIR and STAGING_DIR,
> like we're doing with the pkg_size_{before,after} functions. Instead,
> the verification on HOST_DIR walks down into the STAGING_DIR.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

From here...

> This commit is retreived from Thomas's work.
> The first version was discussed
> https://patchwork.ozlabs.org/project/buildroot/patch/20200430095249.782597-9-thomas.petazzoni at bootlin.com/
> This new version was not already submitted by Thomas or I missed it.

... to here: this should have been a post-commit note, after the ---
line...

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---

... here.

Additionally, it would have been nice to summarise the changes made
between the original submission and htis new one, and how the previous
review was handled.

>  package/pkg-generic.mk | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 45589bcbb4..bb9ff4150a 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -102,6 +102,25 @@ define fixup-libtool-files
>  endef
>  endif
>  
> +# Functions to detect overwritten files
> +
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +# $(1): base directory to search in
> +# $(2): suffix of file (optional)
> +define pkg_detect_overwrite_before
> +	LC_ALL=C find $(1) -type f -print0 | xargs -0 -r md5sum > $($(PKG)_DIR)/.files$(2).md5;
> +endef
> +
> +# $(1): base directory to search in
> +# $(2): suffix of file (optional)
> +define pkg_detect_overwrite_after
> +	if test -s $($(PKG)_DIR)/.files$(2).md5 ; then \
> +		LC_ALL=C md5sum --quiet -c $($(PKG)_DIR)/.files$(2).md5 || \
> +		{ echo "ERROR: package $($(PKG)_NAME) has overwritten files installed by a previous package, aborting."; exit 1; } ; \
> +	fi
> +endef
> +endif

And now I see that only part of the problem is handled; it only tries
and detect files which content changes; it does not account for files
which type did change. I.e. a symlink that was onverted over to a file,
or the other way around.

So I think we could change the pkg_detect_overwrite_before macro thusly;

    LC_ALL=C find -L $(1) -type f -print0 |...

That should cover both cases, with just the esception that a symlink is
replaced with a file of the same content (or the other way around).
There's just a little quirk, though:

    find: File system loop detected; ?host/usr? is part of the same file
    system loop as ?host?.

Meh, that's starting to be a bit hairy... We can just ignore it
explicitly, maybe? For merged-usr in target, we should not have that
problem, but there is still the option for a custom skeleton, where
people could provide it as well...

So, to summarise: this patch does not cover all cases, but it is still
acceptable, and brings in the necessary infra that we can later extend
should the need arises.

Regards,
Yann E. MORIN.

>  # Functions to collect statistics about installed files
>  
>  # $(1): base directory to search in
> @@ -235,6 +254,8 @@ $(BUILD_DIR)/%/.stamp_configured:
>  	@$(call pkg_size_before,$(TARGET_DIR))
>  	@$(call pkg_size_before,$(STAGING_DIR),-staging)
>  	@$(call pkg_size_before,$(HOST_DIR),-host)
> +	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
> +	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
>  	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
>  	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
>  	$($(PKG)_CONFIGURE_CMDS)
> @@ -360,6 +381,8 @@ $(BUILD_DIR)/%/.stamp_installed:
>  	@$(call pkg_size_after,$(STAGING_DIR),-staging)
>  	@$(call pkg_size_after,$(HOST_DIR),-host)
>  	@$(call check_bin_arch)
> +	@$(call pkg_detect_overwrite_after,$(TARGET_DIR))
> +	@$(call pkg_detect_overwrite_after,$(HOST_DIR),-host)
>  	$(Q)touch $@
>  
>  # Remove package sources
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
