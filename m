From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 28 Nov 2013 09:33:50 +0100 (CET)
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile	code to be integrated
In-Reply-To: <1385591508-4174-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1776793705.15288726.1385627630446.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just an overall comment, this patch serie is great, it will help us 
a lot

by allowing us to clearly show to our customers what is specific 
to their board and what is changes to the buildroot unfrastructure
it will make it much easier for us to upstream all the non-specific 
parts


on this particular one, if I remember correctly the kconfig infrastructure
will not work correctly if one of the include is missing... so shouldn't
your infrastructure check if $(BR2_EXTERNAL)/package/Config.in 
exists, and create one if it doesn't ? 

Cordialement 

J?r?my Rosen 
+33 (0)1 42 68 28 04

fight key loggers : write some perl using vim 


Open Wide Ingenierie

23, rue Daviel
75012 Paris - France
www.openwide.fr





----- Mail original -----
> This commit allows the BR2_EXTERNAL directory to contain additional
> Buildroot packages:
> 
>  - Buildroot automatically includes the
>    $BR2_EXTERNAL/package/Config.in in the "Target packages"
>    configuration sub-menu.
> 
>  - Buildroot automatically includes the BR2_EXTERNAL/package/*/*.mk
>    files in the build logic.
> 
> We also add a dummy Config.in file in support/dummy-external/ to
> ensure that the source "$BR2_EXTERNAL/Config.in" line will point to
> an
> existing file even when BR2_EXTERNAL is not used by the user.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile                                 | 4 ++++
>  package/Config.in                        | 2 ++
>  support/dummy-external/package/Config.in | 0
>  3 files changed, 6 insertions(+)
>  create mode 100644 support/dummy-external/package/Config.in
> 
> diff --git a/Makefile b/Makefile
> index a46418e..013b646 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -368,6 +368,10 @@ include boot/common.mk
>  include linux/linux.mk
>  include system/system.mk
>  
> +ifeq ($(BR2_EXTERNAL_USED),y)
> +include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
> +endif
> +
>  TARGETS+=target-finalize
>  
>  ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> diff --git a/package/Config.in b/package/Config.in
> index 311cc6c..fafaa2b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -997,4 +997,6 @@ source "package/vim/Config.in"
>  endif
>  endmenu
>  
> +source "$BR2_EXTERNAL/package/Config.in"
> +
>  endmenu
> diff --git a/support/dummy-external/package/Config.in
> b/support/dummy-external/package/Config.in
> new file mode 100644
> index 0000000..e69de29
> --
> 1.8.1.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
