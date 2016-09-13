From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Sep 2016 01:29:41 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: Be sure to reconfigure
 the package on foo-reconfigure
In-Reply-To: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
References: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <edce5ca8-c251-4761-49b4-5665e94ef306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-09-16 00:35, Yann E. MORIN wrote:
> Currently, calling foo-reconfigure for a kconfig-based package will not
> re-trigger the configuration (kconfig-wise) step for the package.
> 
> This can be problematic when using an override-srcdir suring development
> and the content of the veride-srcdir changes (e.g. on a rebase, a merge,
> or during a bisect).
> 
> This is because the configuration (kconfig-wise) of the package is not
> done in the _CONFIGURE_CMDS block, but as a separate action that is not
> part of any step [0].
> 
> So, be sure to remove the stamp file .stamp_kconfig_fixup_done during
> the foo-clean-for-reconfigure rule, so that the configuration is applied
> again with the new source tree.
> 
> We use another rule, foo-clean-kconfig-for-reconfigure, because we do
> not want to override the default foo-clean-for-reconfigure rule, and we
> have no way to add conditional commands to it.

 Well, it could just be added to the -clean-for-reconfigure in the generic
infra, but keeping it in pkg-kconfig like this is probably better.

> 
> [0] The reasons it was not done are not entirely clear in my head, but
> IIRC that was not working at the time we tried with Thomas DS.
> 
> Reported-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/pkg-kconfig.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index b0f5178..ce9bf33 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -118,6 +118,12 @@ $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
>  # Before running configure, the configuration file should be present and fixed
>  $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
>  
> +# Force olddefconfig again on -reconfigure
> +$(1)-clean-for-reconfigure: $(1)-clean-kconfig-for-reconfigure
> +
> +$(1)-clean-kconfig-for-reconfigure:
> +	rm -f $$($(2)_DIR)/.stamp_kconfig_fixup_done
> +
>  # Only enable the foo-*config targets when the package is actually enabled.
>  # Note: the variable $(2)_KCONFIG_VAR is not related to the kconfig
>  # infrastructure, but defined by pkg-generic.mk. The generic infrastructure is
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
