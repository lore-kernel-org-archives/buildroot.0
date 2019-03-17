From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2019 13:51:28 +0100
Subject: [Buildroot] [PATCH] Config.in: add BR2_DL_DIR_OPTS
In-Reply-To: <20181031213930.49837-1-mmayer@broadcom.com>
References: <20181031213930.49837-1-mmayer@broadcom.com>
Message-ID: <20190317125128.GC14237@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, all,

On 2018-10-31 14:39 -0700, Markus Mayer spake thusly:
> Provide a simple mechanism to pass extra arguments to "mkdir" when
> creating download directories. This can be helpful if one needs the
> download directories to be writable multiple users ("shared download
> cache").

We eventually talked about this with Thomas, and we think a better
solution would be that the original umask of the user is saved before
re-entering make, and then exported so that dl-wrapper can use it when
doing the downloads.

Would you like to try and have a go at this alternate solution, instead?

Regards,
Yann E. MORIN.

> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  Config.in               | 14 ++++++++++++++
>  package/pkg-download.mk |  2 +-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index 42cdf7a3ebdc..0442d8403b4a 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -214,6 +214,20 @@ config BR2_DL_DIR
>  
>  	  The default is $(TOPDIR)/dl
>  
> +config BR2_DL_DIR_OPTS
> +	string "Options for mkdir when it creates BR2_DL_DIR"
> +	default ""
> +	help
> +	  Specify command line options for the mkdir command when it
> +	  creates BR2_DL_DIR.
> +
> +	  For example, this can be used to specify directory permissions
> +	  (say, "-m 0775") for directories inside BR2_DL_DIR. One would
> +	  want this if the download directory is a shared "cache" for
> +	  multiple users, so everybody can write to these directories.
> +
> +	  The default empty (no additional options).
> +
>  config BR2_HOST_DIR
>  	string "Host dir"
>  	default "$(BASE_DIR)/host"
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 73ea2a69f829..d6bfe2bb06d0 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -91,7 +91,7 @@ endif
>  endif
>  
>  define DOWNLOAD
> -	$(Q)mkdir -p $($(PKG)_DL_DIR)
> +	$(Q)mkdir $(BR2_DL_DIR_OPTS) -p $($(PKG)_DL_DIR)
>  	$(Q)$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
>  		-c '$($(PKG)_DL_VERSION)' \
>  		-d '$($(PKG)_DL_DIR)' \
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
