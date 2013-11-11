From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Nov 2013 09:16:42 +0100
Subject: [Buildroot] [PATCH 2/4] pkg-infra: introduce pre/post-step hooks
In-Reply-To: <8fad5e960285a79ff9ff75467cd3e595fa16cd4d.1384127173.git.yann.morin.1998@free.fr>
References: <cover.1384127173.git.yann.morin.1998@free.fr>
 <8fad5e960285a79ff9ff75467cd3e595fa16cd4d.1384127173.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXM5zj2xaEEzGOwrV2dj4RNM2jcjiLBh1DRAZYh4pFOsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Nov 11, 2013 at 12:51 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> This hooks will let us instrument the build process in many ways:
>   - log current step to see what broke
>   - time each step to see what is worth optimising
>   - sanity-check installed files (rpath, overwritten files...)
>   - call user-provided script
>   - ...
>
> The steps are coarse-grain, and all have a 'start' and a 'end' hooks.
> Here is the list of available steps (8 total):
>   - extract
>   - patch
>   - configure
>   - build
>   - install-host
>   - install-staging
>   - install-image
>   - install-target
>
> The download, clean and uninstall steps are not instrumented on purpose.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  package/pkg-generic.mk | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 75fda02..02ab8a3 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -21,6 +21,29 @@
>  ################################################################################
>
>  ################################################################################
> +# Helper functions to catch start/end of each step
> +################################################################################
> +
> +# Those two functions are called by each step below.
> +# They are responsible for calling all hooks defined in $(STEP_HOOKS)

This comment should match the new name.

> +# and pass each of them two arguments:
> +#   $1: either 'start' or 'end'
> +#   $2: the name of the step
> +#   $3: the name of the package
> +
> +# Start step
> +# $1: step name
> +define step_start
> +       $(foreach hook,$(GLOBAL_INSTRUMENTATION_HOOKS),$(call $(hook),start,$(1),$($(PKG)_NAME))$(sep))

What a great name you picked ;-)

Best regards,
Thomas
