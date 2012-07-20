From: =?utf-8?Q?=C3=89meric?= Vigier <emeric.vigier@savoirfairelinux.com>
Date: Fri, 20 Jul 2012 11:34:44 -0400 (EDT)
Subject: [Buildroot] [PATCH] pkg-infra: limit -reconfigure and
	-rebuild	actions
In-Reply-To: <1342791572-18657-1-git-send-email-rbraun@sceen.net>
Message-ID: <2133019142.1267214.1342798484932.JavaMail.root@mail.savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for coming up with a patch following yesterday discussion. Got some comments though:

----- Mail original -----
> The -reconfigure and -rebuild per package targets unconditionally
> recreate the root filesystem image by depending on the all target.
> Restrict their actions to their package instead.
> 
> Signed-off-by: Richard Braun <rbraun@sceen.net>
> ---
>  package/pkg-generic.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index c01440e..f5b05a3 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -389,12 +389,12 @@ endif
>  			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
>  			rm -f $$($(2)_TARGET_INSTALL_HOST)
>  
> -$(1)-rebuild:		$(1)-clean-for-rebuild all
> +$(1)-rebuild:		$(1)-clean-for-rebuild $(1)
>  
>  $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
>  			rm -f $$($(2)_TARGET_CONFIGURE)
>  
> -$(1)-reconfigure:	$(1)-clean-for-reconfigure all
> +$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)-configure

Your patch makes -reconfigure clean-for-rebuild and then (just) -configure, without rebuilding.
That's ok to me, but you have to choose between:

1. updating docs/manual/rebuilding-packages.txt accordingly, especially:
"For convenience, most packages support the special make targets
<package>-reconfigure and <package>-rebuild to repeat the configure
and build steps"

2. or keep -reconfigure rebuilding the entire package, i.e.:
-+$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)-configure
++$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)

>  
>  # define the PKG variable for all targets, containing the
>  # uppercase package variable prefix
> --
> 1.7.2.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Emeric
