From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Apr 2014 10:49:16 +0200
Subject: [Buildroot] [PATCH v2 1/2] ccache: change default cache
 directory path to match config setting
In-Reply-To: <1398826359-2711-2-git-send-email-danomimanchego123@gmail.com>
References: <1398826359-2711-1-git-send-email-danomimanchego123@gmail.com>
 <1398826359-2711-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <CAAXf6LXG8LgqvoZHd0sza1A-1nv=MC22r-hBREOwsaozEM7dZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi,

Thanks for refreshing.

On Wed, Apr 30, 2014 at 4:52 AM, Danomi Manchego
<danomimanchego123@gmail.com> wrote:
> Commit 433290761fceb476b095548eec10adf72405e050 changed the hard-coded
> ccache directory location to use BR_CACHE_DIR (then BUILDROOT_CACHE_DIR),
> which is exported by Makefile based on the BR2_CCACHE_DIR config option.
> This allowed the cache location to be changed on-the-fly by setting a
> "make" command line variable, but left the default location of ccache's
> normal default at "$HOME/.ccache".  Since this location does not match the
> default for BR2_CCACHE_DIR, it is basically almost never correct, so
> direct invocation of ccache outside of the buildroot Makefile, such as for
> increasing the cache size, becomes cumbersome.
>
> This patch changes the last-ditch cache location from "$HOME/.ccache" to
> the BR_CCACHE_DIR value defined when host-ccache is configured.  Note that
> the ability to later override the cache location by using a BR_CACHE_DIR
> command line variable is left intact.
>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
> ---
>
> Changes v1 -> v2:
> * Refresh against latest, rather than building on top of unrelated WIP patch.
> * Update patch commit log wording.
> ---
>  package/ccache/ccache.mk |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index 650290d..df92c5e 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -30,9 +30,12 @@ HOST_CCACHE_CONF_OPT += ccache_cv_zlib_1_2_3=no
>  #    the compiler, because in the context of Buildroot, that completely
>  #    defeats the purpose of ccache. Of course, that leaves the user
>  #    responsible for purging its cache when the compiler changes.
> +#  - Change hard-coded last-ditch default to match path in .config, to avoid
> +#    the need to specify BR_CACHE_DIR when invoking ccache directly.
>  define HOST_CCACHE_PATCH_CONFIGURATION
>         sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
>         sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
> +       sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/ccache.c
>  endef

Note that the code you're patching is:

        cache_dir = getenv("CCACHE_DIR");
        if (cache_dir) {
                cache_dir = x_strdup(cache_dir);
        } else {
                const char *home_directory = get_home_directory();
                if (home_directory) {
                        cache_dir = format("%s/.ccache", home_directory);
                }
        }

Obtaining home_directory and checking it for non-NULL is actually no
longer needed, as the cache_dir will become hardcoded. Moreover, using
'format' is also no longer needed.
There is thus some redundant code here, but in my opinion it does not
really hurt and using your patch as-is is preferred because it is more
simple than reworking the code above.

Therefore:
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(tested by running the host ccache manually, with the '-s' option,
before and after this patch)

Best regards,
Thomas
