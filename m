From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Nov 2015 23:31:33 +0100
Subject: [Buildroot] [PATCH 2/2 v2] core/pkg-generic: check proper
 package installation
In-Reply-To: <fe19a41362f17e9435b0da14097ce9fecda38780.1446577223.git.yann.morin.1998@free.fr>
References: <cover.1446577223.git.yann.morin.1998@free.fr>
 <fe19a41362f17e9435b0da14097ce9fecda38780.1446577223.git.yann.morin.1998@free.fr>
Message-ID: <563935C5.30002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-11-15 20:06, Yann E. MORIN wrote:
> Some packages misbehave, and install files in either $(STAGING_DIR)/$(O)
> or in $(TARGET_DIR)/$(O)
> 
> One common reason for that is that pkgconf now prepends the sysroot path
> to all the paths it returns. Other reasons vary, but are mostly due to
> poorly writen generic-packages.
> 
> And a new step hooks to check that no file gets installed in either
> location, called after the install-target and install-staging steps.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Romain Naour <romain.naour@openwide.fr>
> 
> ---
> Note that, in the current state of Buildroot, this *will* cause a lot of
> build failures until all those packages are fixed. Among the known to
> break are quite a few Xorg packages, plus many packages that need to
> call moc (from Qt4 for sure, possibly from Qt5 too).

 Well, the latter will not cause _new_ build failures, because there the problem
is that the moc path returned by pkgconfig is incorrect, while it is installed
in the right place.


 There are a few things in here that I don't like, but I don't want to block the
urgency.

> ---
>  package/pkg-generic.mk | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 3db616c..59b0938 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -87,6 +87,21 @@ define step_pkg_size
>  endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
>  
> +define step_check_build_dir_one
> +	if [ -d $(2) ]; then \
> +		printf "%s: installs files in %s\n" $(1) $(2) >&2; \
> +		exit 1; \
> +	fi

 I think this could also be

	$(if $(wildcard $(2)),$(error $(1) installs files in $(2)))

but not sure if that is better readable.

> +endef
> +
> +define step_check_build_dir
> +	$(if $(filter install-staging,$(2)),\
> +		$(if $(filter end,$(1)),$(call step_check_build_dir_one,$(3),$(STAGING_DIR)/$(O))))

 Is this correct? Shouldn't that be $(HOST_DIR) instead of $(O)? If a custom
BR2_HOST_DIR is configured, then the wrong pkgconfig stuff will put stuff into
$(STAGING_DIR)/$(HOST_DIR), no?


> +	$(if $(filter install-target,$(2)),\
> +		$(if $(filter end,$(1)),$(call step_check_build_dir_one,$(3),$(TARGET_DIR)/$(O))))

 Actually, I wonder if it shouldn't be HOST_DIR here as well.

 Perhaps, to be sure, both should be checked.

> +endef
> +GLOBAL_INSTRUMENTATION_HOOKS += step_check_build_dir

 I don't see much point to add this as instrumentation hooks, it could be done
directly in the .stamp rule.


Note that this patch will make it impossible to have $(O) equal to some path
that happens to exist on the target, e.g. O=/tmp/build if /tmp/build happens to
exist in the custom skeleton or rootfs overlay. (Same story with HOST_DIR of O
is replaced by HOST_DIR above). Granted, it's not very likely.


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
