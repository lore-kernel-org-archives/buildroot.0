From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Mar 2016 00:38:35 +0100
Subject: [Buildroot] [PATCH 3/8] core/pkg-generic: add help about
 package-specific rules
In-Reply-To: <4eab88cfca5a4ef3139e51c664782f3c41e43cad.1457561521.git.yann.morin.1998@free.fr>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <4eab88cfca5a4ef3139e51c664782f3c41e43cad.1457561521.git.yann.morin.1998@free.fr>
Message-ID: <56E0B3FB.7060906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/09/16 23:22, Yann E. MORIN wrote:
> Add a package-variable to store the package-specific make rules.
>
> Although this variable would be seldom used, we still document it.
> However, we make sure the documentation explicitly states that this
> variable should not be used (if it needs to be, the submitter of a
> package will be told so during reviews).
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  pending of course the rename or removal of the HELP_RULE function.

  Regards,
  Arnout

> ---
>   Makefile                                | 1 +
>   docs/manual/adding-packages-generic.txt | 6 ++++++
>   package/pkg-generic.mk                  | 2 ++
>   3 files changed, 9 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index d24793b..72935b0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -932,6 +932,7 @@ help:
>   	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
>   	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
>   	@echo '  <pkg>-rebuild          - Restart the build from the build step'
> +	@$(call HELP_RULE,$(PACKAGE_HELP))
>   ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>   	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
>   endif
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 8ed7fe8..fb20e2d 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -436,6 +436,12 @@ information is (assuming the package name is +libfoo+) :
>     FLAT binary format is only 4k bytes. If the application consumes more stack,
>     append the required number here.
>
> +* +LIBFOO_HELP+ defines the help entries visible when running `make help`.
> +  The expected content for this variable is a list of single- or double-
> +  quoted strings, with each string in the format "action : help for action".
> +  This is seldom used, as packages rarely have custom rules. Do not use
> +  this variable.
> +
>   The recommended way to define these variables is to use the following
>   syntax:
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 3904c09..335b811 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -910,6 +910,8 @@ ifeq ($$(patsubst %/,ERROR,$$($(2)_SITE)),ERROR)
>   $$(error $(2)_SITE ($$($(2)_SITE)) cannot have a trailing slash)
>   endif
>
> +PACKAGE_HELP += $$($(2)_HELP)
> +
>   endif # $(2)_KCONFIG_VAR
>   endef # inner-generic-package
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
