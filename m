From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 22:53:29 +0200
Subject: [Buildroot] [PATCH] kconfig: support read-only Buildroot source
 directories
In-Reply-To: <1439504572-20085-1-git-send-email-hollis_blanchard@mentor.com>
References: <1439504572-20085-1-git-send-email-hollis_blanchard@mentor.com>
Message-ID: <20150817225329.6b4e8453@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hollis,

On Thu, 13 Aug 2015 15:22:52 -0700, Hollis Blanchard wrote:
> merge_config.sh currently tries to create a .tmp file in the top-level
> Buildroot source tree. This fails when that directory is read-only, leading
> to unexpected .config file contents (affecting the configuration of Buildroot
> itself, Linux, and Busybox).
> 
> Fix it by using mktemp --tmpdir to create the .tmp file in $TMPDIR or /tmp.
> 
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> ---
>  support/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
> index 81b0c61..19d968b 100755
> --- a/support/kconfig/merge_config.sh
> +++ b/support/kconfig/merge_config.sh
> @@ -82,7 +82,7 @@ shift;
>  
>  MERGE_LIST=$*
>  SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
> -TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
> +TMP_FILE=$(mktemp --tmpdir .tmp.config.XXXXXXXXXX)
>  
>  echo "Using $INITFILE as base"
>  cat $INITFILE > $TMP_FILE

Thanks for this patch! It looks good in principle, but is not done
correctly. support/kconfig/ is directly inherited from the kernel
source code, and we keep a series of patches in
support/kconfig/patches/ to clearly identify the changes we made
compared to the original kernel version. See
support/kconfig/README.buildroot for details.

Could you rework your patch to also add a patch to
support/kconfig/patches/ ? Can you check whether the problem also
exists in the kernel kconfig code, and if so, report the problem to the
kernel developers ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
