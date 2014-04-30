From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Apr 2014 11:08:31 +0200
Subject: [Buildroot] [PATCH v2 2/2] ccache: provide capability to do
 initial ccache setup
In-Reply-To: <1398826359-2711-3-git-send-email-danomimanchego123@gmail.com>
References: <1398826359-2711-1-git-send-email-danomimanchego123@gmail.com>
 <1398826359-2711-3-git-send-email-danomimanchego123@gmail.com>
Message-ID: <CAAXf6LWWxL2te_qi9xT52+Ho1dhwLnaTyQRqSnNRVdXCp1OEAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi,

On Wed, Apr 30, 2014 at 4:52 AM, Danomi Manchego
<danomimanchego123@gmail.com> wrote:
> For example, if your project is known to require more space
> than the default max cache size, then you might want to
> automatically increase the cache size to a suitable amount
> using the -M option.
>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
> ---
>
> Changes v1 -> v2:
> * Refresh against latest
> * Also, remove needless line-breaks in existing hooks
> ---
>  Config.in                |   15 ++++++++++++++-
>  package/ccache/ccache.mk |   18 ++++++++++++++----
>  2 files changed, 28 insertions(+), 5 deletions(-)
>
> diff --git a/Config.in b/Config.in
> index 5823274..8ecd4ed 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -256,7 +256,7 @@ config BR2_CCACHE
>         help
>           This option will enable the use of ccache, a compiler
>           cache. It will cache the result of previous builds to speed
> -         up future builds. The cache is stored in
> +         up future builds. By default, the cache is stored in
>           $HOME/.buildroot-ccache.
>
>           Note that Buildroot does not try to invalidate the cache
> @@ -273,6 +273,19 @@ config BR2_CCACHE_DIR
>         help
>           Where ccache should store cached files.
>
> +config BR2_CCACHE_INITIAL_SETUP
> +       string "Compiler cache initial setup"
> +       depends on BR2_CCACHE

Since there is another option above (cache location) also using
'depends on BR2_CCACHE', it is better to create an
if BR2_CCACHE
...
endif
block around both options, and remove the 'depends on' statements.

> +       help
> +         Additional ccache setup options, such as max-files or max-size.
> +
> +         For example, if your project is known to require more space
> +         than the default max cache size, then you might want to
> +         automatically increase the cache size to a suitable amount
> +         using the -M option.

I would change this wording to:

Initial ccache settings to apply, such as --max-files or --max-size.

For example, if your project is known to require more space
than the default max cache size, then you might want to
increase the cache size to a suitable amount using the
-M (--max-size) option.

The string you specify here is passed verbatim to ccache, so
see the ccache help for more details.

> +
> +         Applied at time of ccache compilation.

This statement is a bit confusing to me: it gave me the impression
that the values are encoded inside the ccache build which is not the
case. While this is an interpretation error on my side, maybe the
sentence could read:

These initial settings are applied after ccache has been compiled.

> +
>  config BR2_DEPRECATED
>         bool "Show packages that are deprecated or obsolete"
>         help
> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index df92c5e..5be6b16 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -38,15 +38,25 @@ define HOST_CCACHE_PATCH_CONFIGURATION
>         sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/ccache.c
>  endef
>
> -HOST_CCACHE_POST_CONFIGURE_HOOKS += \
> -       HOST_CCACHE_PATCH_CONFIGURATION
> +HOST_CCACHE_POST_CONFIGURE_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
>
>  define HOST_CCACHE_MAKE_CACHE_DIR
>         mkdir -p $(BR_CACHE_DIR)
>  endef
>
> -HOST_CCACHE_POST_INSTALL_HOOKS += \
> -       HOST_CCACHE_MAKE_CACHE_DIR
> +HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_MAKE_CACHE_DIR

The above two changes aren't really related to the initial cache setup
and could have been put in a separate patch, but I assume it's ok (not
sure if there is a strict policy on this).


> +
> +# Provide capability to do initial ccache setup (e.g. increase default size)
> +BR_CCACHE_INITIAL_SETUP = $(call qstrip,$(BR2_CCACHE_INITIAL_SETUP))
> +ifneq ($(BR_CCACHE_INITIAL_SETUP),)
> +define HOST_CCACHE_DO_INITIAIL_SETUP

typo: INITIAL

> +       @$(call MESSAGE,"Do initial host ccache setup")

Maybe this could be: "Applying initial settings"
which would render the displayed string as:

>>> host-ccache 3.1.8 Applying initial settings

> +       $(CCACHE) $(BR_CCACHE_INITIAL_SETUP)
> +       $(CCACHE) -s
> +endef
> +
> +HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_DO_INITIAIL_SETUP

Same typo of course.


Do you have time to refresh the patch taking into account these comments?
Alternatively I can refresh it for you (keeping your credit, of course).
Just let me know..

Best regards,
Thomas
