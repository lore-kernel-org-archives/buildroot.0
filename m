From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 28 Aug 2015 14:45:39 +0100
Subject: [Buildroot] [RFC PATCH] pkg-generic: detect incorrectly used
 package
In-Reply-To: <1440768358-31040-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1440768358-31040-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <55E06603.2090100@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

I tried to test your patch and I have found this:

ERROR: package TOOLCHAIN_EXTERNAL is being built but is not enabled in
the configuration.

Regards,

Vincent.

On 08/28/2015 02:25 PM, Thomas Petazzoni wrote:
> In Buildroot, the selection of a package from a Config.in level and
> from a Makefile level are completely disconnected. This can lead to
> issues where the build of a package is triggered at the Makefile level
> due to the package being listed in another package <pkg>_DEPENDENCIES
> variable, even if that package is not enabled in the configuration.
> 
> This has for example been the case recently with python-can having
> 'python' in its <pkg>_DEPENDENCIES, while python-can could be enabled
> when Python 3.x is used, in which case the 'python' package should not
> be built.
> 
> To detect such issues more easily, this patch adds a check in the
> package infrastructure. When the build process of a package is being
> triggered, we verify that the package is enabled in the
> configuration. We do this check in the "configure" step, since this
> step is the first common step between the normal download case and the
> "local site method" / "package override" case.
> 
> Since this check should only be done for target packages (most of the
> host packages don't have Config.in options), we pass the type of the
> package from inner-generic-package down to the configure rule, through
> a target variable named 'TYPE'.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> This is labeled as RFC because I have only quickly tested it, and I
> haven't thought about all the possible corner cases that may make my
> simplistic approach invalid. Comments and reviews are welcome.
> ---
>  package/pkg-generic.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 6a7d97e..fa66be8 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -143,6 +143,10 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
>  
>  # Configure
>  $(BUILD_DIR)/%/.stamp_configured:
> +	$(Q)if test "$(TYPE)" = "target" -a -z "$(BR2_PACKAGE_$(PKG))" ; then \
> +		echo "ERROR: package $(PKG) is being built but is not enabled in the configuration." ; \
> +		exit 1 ; \
> +	fi
>  	@$(call step_start,configure)
>  	@$(call MESSAGE,"Configuring")
>  	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
> @@ -664,6 +668,7 @@ $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
>  $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
>  $$($(2)_TARGET_BUILD):			PKG=$(2)
>  $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
> +$$($(2)_TARGET_CONFIGURE):		TYPE=$(4)
>  $$($(2)_TARGET_RSYNC):                  SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
>  $$($(2)_TARGET_RSYNC):                  PKG=$(2)
>  $$($(2)_TARGET_PATCH):			PKG=$(2)
> 
