From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2020 08:54:07 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: use order-only dependency so
 symlinks are made only once
In-Reply-To: <20200713011321.6905-1-danomimanchego123@gmail.com>
References: <20200713011321.6905-1-danomimanchego123@gmail.com>
Message-ID: <20200718065407.GJ18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2020-07-12 21:13 -0400, Danomi Manchego spake thusly:
> The staging symlink is being created on every invocation of "make" as it
> depends on its destination directory, which is modified when the symlink
> is created.  This is prevented by changing the destination directory
> dependency to be order-only.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

I've extended and clarified the comit log, because the wording was a bit
confusing (some would interpret it as "the directory pointed at by the
symlink changes when the symlink is created").

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 04c29b1c71..a8e0ee02c5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -457,12 +457,12 @@ endif
>  
>  ifneq ($(HOST_DIR),$(BASE_DIR)/host)
>  HOST_DIR_SYMLINK = $(BASE_DIR)/host
> -$(HOST_DIR_SYMLINK): $(BASE_DIR)
> +$(HOST_DIR_SYMLINK): | $(BASE_DIR)
>  	ln -snf $(HOST_DIR) $(HOST_DIR_SYMLINK)
>  endif
>  
>  STAGING_DIR_SYMLINK = $(BASE_DIR)/staging
> -$(STAGING_DIR_SYMLINK): $(BASE_DIR)
> +$(STAGING_DIR_SYMLINK): | $(BASE_DIR)
>  	ln -snf $(STAGING_DIR) $(STAGING_DIR_SYMLINK)
>  
>  # Quotes are needed for spaces and all in the original PATH content.
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
