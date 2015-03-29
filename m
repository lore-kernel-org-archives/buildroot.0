From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2015 22:48:21 +0200
Subject: [Buildroot] [PATCH 02/35] pkg-generic: fix the logic showing
 the "Downloading" message
In-Reply-To: <1427650429-9293-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150329204821.GC4093@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> Even though the .stamp_downloaded target is executed for each package
> being built, the pkg-generic infrastructure tries to not display the
> "Downloading" message when there is in fact nothing to download.
> 
> Unfortunately, the logic was incorrect for the patch download: it
> forgot the fact that <pkg>_PATCH can contain either file names (in
> which case we assume the patch should be downloaded from <pkg>_SITE),
> or full URLs. The latter case was not properly handled, as we were
> checking if $(DL_DIR)/<full URL> existed, while we should be testing
> if $(DL_DIR)/`basename <full URL>` exists.
> 
> This patch fixes that, which makes sure the "Downloading" message is
> displayed only when necessary.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Romain Naour <romain.naour@openwide.fr>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index c1b379b..b44d476 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -77,7 +77,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
>  		$(call MESSAGE,"Downloading") ; \
>  	else \
>  		for p in $($(PKG)_PATCH) ; do \
> -			if test ! -e $(DL_DIR)/$$p ; then \
> +			if test ! -e $(DL_DIR)/`basename $$p` ; then \
>  				$(call MESSAGE,"Downloading") ; \
>  				break ; \
>  			fi ; \
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
