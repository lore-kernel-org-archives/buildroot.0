From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 18 Mar 2014 18:51:37 +0100
Subject: [Buildroot] [PATCH 2/4] legal-info: save license files even for
 no-redistribute packages
In-Reply-To: <dbdd65bfe908d6eead2e047dff4c8bb96e236ee3.1395097170.git.yann.morin.1998@free.fr>
References: <cover.1395097170.git.yann.morin.1998@free.fr>
 <dbdd65bfe908d6eead2e047dff4c8bb96e236ee3.1395097170.git.yann.morin.1998@free.fr>
Message-ID: <532887A9.3010901@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> The reason to save license files even for no-redistribute packages
> is that the license still applies to the files distributed as part
> of the rootfs, even if the sources are not themselves redistributed.
>
> Move the copy of license files out of the non-local, non-overriden
> package case.
>
> Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>   package/pkg-generic.mk | 27 ++++++++++++++++-----------
>   1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 3d8f0da..006f862 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -575,6 +575,22 @@ $(2)_MANIFEST_TARBALL ?= not saved
>
>   # legal-info: produce legally relevant info.
>   $(1)-legal-info:
> +# Save license files if defined
> +# We save the license files for any kind of package: normal, local,
> +# overriden, or non-redistributable alike.
> +# The reason to save license files even for no-redistribute packages
> +# is that the license still applies to the files distributed as part
> +# of the rootfs, even if the sources are not themselves redistributed.
> +ifeq ($(call qstrip,$$($(2)_LICENSE_FILES)),)
> +	@$(call legal-license-nofiles,$$($(2)_RAWNAME),$(call UPPERCASE,$(4)))
> +	@$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
> +else
> +# Double dollar signs are really needed here, to catch host packages
> +# without explicit HOST_FOO_LICENSE_FILES assignment, also in case they
> +# have multiple license files.
> +	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$(call UPPERCASE,$(4)))$$(sep))
> +endif # license files
> +
>   # Packages without a source are assumed to be part of Buildroot, skip them.
>   ifneq ($(call qstrip,$$($(2)_SOURCE)),)

I like this change in general, but I have another minor nit here.

You moved code out of the big
   ifneq ($(call qstrip,$$($(2)_SOURCE)),)
cited above.

So we're now doing stuff also for packages that are part of Buildroot.

Assuming these will never have _LICENSE_FILES defined, which is fair,
we not have one more warning:
   WARNING: toolchain: cannot save license (TOOLCHAIN_LICENSE_FILES \
         not defined)

Probably that ifneq should be moved just before the part of code you're
moving up, but that should be checked carefully.

If you feel like this bunch of lines are an annoying mess to handle, I'm
with you.

So, once more, I cannot give my Reviewed-by... :(

-- 
Luca
