From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 7 Feb 2017 15:52:01 +0100
Subject: [Buildroot] [PATCH v5 08/19] reproducible: try to detect most
 common errors
In-Reply-To: <1482241596-31688-9-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-9-git-send-email-jezz@sysmic.org>
Message-ID: <CAHXCMM+auV3cG9e_hPKC9FMBJRuz=nUTMEg=qnuUP1G-AjuLGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me, all,

On Tue, Dec 20, 2016 at 2:46 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> Some package includes some information from build environment in their results.
> This practice is incompatible with reproducible builds.
>
> This patch scans final target to research most common patterns.
>
> Since we only search fixed strings (grep is called with -F), this search is
> fast (on my station, 60ms for a target of 40MB).
>
> Note, it could be a good idea to also match current user name. However, build
> path often contains username and, until now, we do not try to avoid build path
> in result.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

> ---
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index ad7fde5..5b504c1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -708,6 +708,11 @@ endif
>                 $(call MESSAGE,"Executing post-build script $(s)"); \
>                 $(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +       grep -raoF -e "`uname -r`" -e "`uname -v`" -e "`uname -n`" $(TARGET_DIR) | \
> +               sed 's/\(.*\):\(.*\)/Warning: \1 may contain unreproducible information: \2/' | uniq
> +endif
> +
>  target-post-image: $(TARGETS_ROOTFS) target-finalize
>         @$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
>                 $(call MESSAGE,"Executing post-image script $(s)"); \
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
