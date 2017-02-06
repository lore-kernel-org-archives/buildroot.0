From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 6 Feb 2017 22:04:40 +0100
Subject: [Buildroot] [PATCH 2/6] pkg-generic: add check_shlibs_deps hooks
In-Reply-To: <20161114132238.6569-3-jezz@sysmic.org>
References: <20161114132238.6569-1-jezz@sysmic.org>
 <20161114132238.6569-3-jezz@sysmic.org>
Message-ID: <CAHXCMM+6Fk-TQaBWDF+C=JrrGcWuAOpArFybGJ3XHndjJOsNUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me, all,

On Mon, Nov 14, 2016 at 2:22 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> Call check-shlibs-deps after each package. Errors reported by this hooks mean
> the package could compile differently depending of build order (= missing
> optional dependency).
>
> Currently, missed dependencies are only logged to
> `$(BUILD_DIR)/missing-dependencies.txt'. In future, we may remove `-w' in order
> to make these errors fatal.
>
> In order to get correct results from step_check_shlibs_deps, we need to compute
> recursive dependencies for package. get_recursive_dependencies is brittle, don't
> try to add spaces or line breaks inside its definition.
>
> A good idea to find many missed optional dependencies would be to use this
> script with LTP. Unfortunately, check-shlibs-deps does not (yet) work with it.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/pkg-generic.mk | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 827de62..987efa6 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -110,6 +110,26 @@ define step_check_build_dir
>  endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_check_build_dir
>
> +# Compute dependencies for a set of packages recursively
> +# $(1): list of package to check
> +# $(2): list of package already processed. Only used for internal recursion.
> +#     Keep empty for normal usage.
> +# Example usage:
> +#     $(call get_recursive_dependencies,util-linux,)

You could introduce a inner-get_recursive_dependencies that takes 2
arguments and keep the user API get_recursive_dependencies only taking
1 argument, which just calls inner-get_recursive_dependencies with an
empty 2nd argument.

> +define get_recursive_dependencies
> +$(sort $(foreach d,$(1),$(if $(filter $(d),$(2)),$(d),$(call get_recursive_dependencies,$(d) $($(call UPPERCASE,$(d))_DEPENDENCIES),$(d) $(2)))))
> +endef
> +
> +define step_check_shlibs_deps
> +       $(if $(filter install-target,$(2)),\
> +               $(if $(filter end,$(1)),support/scripts/check-shlibs-deps \
> +                       -b $(CONFIG_DIR) -p $(3) -w \

Here $(CONFIG_DIR) looks dubious... Why do you use it instead of $(O)?

> +                       -d $(subst $(space),$(comma),$(call get_recursive_dependencies,$(3),)) \
> +                       | tee -a $(BUILD_DIR)/missing-dependencies.txt
> +               ))
> +endef
> +GLOBAL_INSTRUMENTATION_HOOKS += step_check_shlibs_deps
> +
>  # User-supplied script
>  ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
>  define step_user
> --
> 2.9.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
