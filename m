From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Dec 2014 19:00:24 +0100
Subject: [Buildroot] [git commit] pkg-download: VERIFY_HASH: use same
 hash file for host and target downloads
In-Reply-To: <20141208075330.0542F80144@busybox.osuosl.org>
References: <20141208075330.0542F80144@busybox.osuosl.org>
Message-ID: <20141208180024.GD4105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-12-08 08:52 +0100, Peter Korsgaard spake thusly:
> commit: http://git.buildroot.net/buildroot/commit/?id=cf902845e7c23da7acddd82dc591255e4657d730
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Fixes (or atleast stops the build with a saner description):
> http://autobuild.buildroot.net/results/1a9/1a9643f8633db038d4fe5ca4a32e4d52e70a3a1a/
> 
> We're using the same sources for host and target downloads, so it makes
> sense to use the same <pkg>.hash file as well to ensure the host version
> gets verified without us having to maintain a seperate host-<pkg>.hash file.

Damn, I had this in my download-hash series:
    http://lists.busybox.net/pipermail/buildroot/2014-December/114493.html

I'll have to rebase it now... Hehe! ;-p

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/pkg-download.mk |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index f3409bd..190b5b7 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -174,7 +174,7 @@ define DOWNLOAD_SCP
>  	$(EXTRA_ENV) support/download/wrapper scp \
>  		$(DL_DIR)/$(2) \
>  		'$(call stripurischeme,$(call qstrip,$(1)))' && \
> -	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
> +	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_RAWNAME).hash,$(DL_DIR)/$(2))
>  endef
>  
>  define SOURCE_CHECK_SCP
> @@ -211,7 +211,7 @@ define DOWNLOAD_WGET
>  	$(EXTRA_ENV) support/download/wrapper wget \
>  		$(DL_DIR)/$(2) \
>  		'$(call qstrip,$(1))' && \
> -	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
> +	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_RAWNAME).hash,$(DL_DIR)/$(2))
>  endef
>  
>  define SOURCE_CHECK_WGET
> @@ -227,7 +227,7 @@ define DOWNLOAD_LOCALFILES
>  	$(EXTRA_ENV) support/download/wrapper cp \
>  		$(DL_DIR)/$(2) \
>  		$(call stripurischeme,$(call qstrip,$(1))) && \
> -	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
> +	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_RAWNAME).hash,$(DL_DIR)/$(2))
>  endef
>  
>  define SOURCE_CHECK_LOCALFILES
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
