From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 08 Apr 2015 22:13:11 +0200
Subject: [Buildroot] [PATCH 1/2] infra/pkg-kconfig: don't require a
 kconfig file for disabled packages
In-Reply-To: <25c5ce55fd15b63fae1635bdc6940527079acdf6.1428512591.git.yann.morin.1998@free.fr>
References: <cover.1428512591.git.yann.morin.1998@free.fr>
 <25c5ce55fd15b63fae1635bdc6940527079acdf6.1428512591.git.yann.morin.1998@free.fr>
Message-ID: <55258BD7.70601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/15 19:08, Yann E. MORIN wrote:
> When a package is not enabled, we need not check that it provides
> a .config/defconfig file.
> 
> So far, all our pkg-kconfig packages unconditionally set their
> _KCONFIG_FILE, even to an empty value. But some packages (e.g.
> at91bootstrap3) wanted to set it only when enabled, and broke.
> 
> So, only do the check when the package is enabled.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/pkg-kconfig.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 04ac37d..fd9f19d 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -36,11 +36,6 @@ $(2)_KCONFIG_EDITORS ?= menuconfig
>  $(2)_KCONFIG_OPTS ?=
>  $(2)_KCONFIG_FIXUP_CMDS ?=
>  
> -# FOO_KCONFIG_FILE is required
> -ifndef $(2)_KCONFIG_FILE
> -$$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
> -endif
> -
>  # The config file could be in-tree, so before depending on it the package should
>  # be extracted (and patched) first
>  $$($(2)_KCONFIG_FILE): | $(1)-patch
> @@ -72,6 +67,11 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
>  # already called above, so we can effectively use this variable.
>  ifeq ($$($$($(2)_KCONFIG_VAR)),y)
>  
> +# FOO_KCONFIG_FILE is required
> +ifndef $(2)_KCONFIG_FILE
> +$$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
> +endif
> +
>  # Configuration editors (menuconfig, ...)
>  $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
>  	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
