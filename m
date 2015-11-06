From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Nov 2015 10:06:21 +0100
Subject: [Buildroot] [PATCHv3] core/pkg-generic: check proper package
	installation
In-Reply-To: <1446756756-12147-1-git-send-email-yann.morin.1998@free.fr>
References: <1446756756-12147-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <563C6D8D.10005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Yann,

 Sorry to be annoying, but...

On 05-11-15 21:52, Yann E. MORIN wrote:
> Some packages misbehave, and install files in either of;
>   - $(STAGING_DIR)/$(O) or $(TARGET_DIR)/$(O),
>   - $(STAGING_DIR)/$(HOST_DIR) or $(TARGET_DIR)/$(HOST_DIR).
> 
> One common reason for that is that pkgconf now prepends the sysroot path
> to all the paths it returns. Other reasons vary, but are mostly due to
> poorly writen generic-packages.
> 
> And a new step hooks to check that no file gets installed in either
> locations, called after the install-target and install-staging steps.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Romain Naour <romain.naour@openwide.fr>
> 
> ---
> Changes v2 -> v3;
>   - also check for $(HOST_DIR) in case the user specified an
>     out-of-build-dir locatiopn  (Arnout)
> 
> ---
> Note that, in the current state of Buildroot, this *will* cause a lot of
> build failures until all those packages are fixed. Among the known to
> break are quite a few Xorg packages, plus many packages that need to
> call moc (from Qt4 for sure, possibly from Qt5 too).

 Still not true for moc :-)

> ---
>  package/pkg-generic.mk | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a5d0e57..2fb3fd8 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -87,6 +87,25 @@ define step_pkg_size
>  endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
>  
> +define step_check_build_dir_one
> +	if [ -d $(2) ]; then \

 Perhaps it would be better to handle the $(HOST_DIR) / $(O) combination here, so:

	if [ -d $(2)/$(HOST_DIR) -o -d $(2)/$(O) ]; then \

> +		printf "ERROR: package %s installs files in %s\n" $(1) $(2) >&2; \
> +		exit 1; \
> +	fi
> +endef
> +
> +define step_check_build_dir
> +	$(if $(filter install-staging,$(2)),\
> +		$(if $(filter end,$(1)),\
> +				$(call step_check_build_dir_one,$(3),$(STAGING_DIR)/$(HOST_DIR)); \
> +				$(call step_check_build_dir_one,$(3),$(STAGING_DIR)/$(O))))
> +	$(if $(filter install-target,$(2)),\
> +		$(if $(filter end,$(1)),\
> +				$(call step_check_build_dir_one,$(3),$(TARGET_DIR)/$(HOST_DIR)); \
> +				$(call step_check_build_dir_one,$(3),$(TARGET_DIR)/$(O))))
> +endef
> +GLOBAL_INSTRUMENTATION_HOOKS += step_check_build_dir

 You never replied to my comment that I think this would fit better directly in
the .stamp_install_* rules rather than as hooks. My reasoning is that it is much
more difficult to find out why some commands are being called when they're
hidden in hooks. That's not too bad for things like gathering statistics since
they're supposedly inobtrusive, but here you're throwing an error so it is
really useful to be able to find easily in the source where this error comes from.


 Regards,
 Arnout

> +
>  # User-supplied script
>  ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
>  define step_user
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
