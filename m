From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Dec 2014 21:41:26 +0100
Subject: [Buildroot] [PATCH v4] package/gdb: fix shared-only build
In-Reply-To: <1418852225-7144-1-git-send-email-romain.naour@openwide.fr>
References: <1418852225-7144-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141221204125.GA4207@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-12-17 22:37 +0100, Romain Naour spake thusly:
> The shared build only of gdb is actually not supported.
> 
> When --disable-static is given to the gdb's main configure script,
> it also disable the static build of bundled libraries like bfd, readline
> and opcodes, which must be build statically.
> 
> Force the static build of bundled libraries by adding --enable-static in
> GDB_CONF_OPTS.
> 
> Fixes:
> http://autobuild.buildroot.net/results/219/21979e730dca1fce5bdda9a4c7fad4485e788866/
> http://autobuild.buildroot.net/results/c10/c1096d0bd22de5c6feba848f743601ad0416a944/
> http://autobuild.buildroot.net/results/d8a/d8a5bcc7fa374fb0c916a9d0f33ef283109cb404/
> http://autobuild.buildroot.net/results/22a/22a86d0f1df0fc4698c0f734f3d659e6317404a4/
> http://autobuild.buildroot.net/results/404/404e61e5c30040ee5756f4b5839149dca38660d4/
> 
> And many more.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

This is starting to bug some real users, as recently reported on the IRC
channel.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v4: Fix typos (ThomasP)
> v3: Add a comment in gdb.mk (ThomasP)
> v2: D'ont patch gdb, just enable static build.
> ---
>  package/gdb/gdb.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index dbec760..aa22193 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -74,6 +74,8 @@ GDB_CONF_ENV = \
>  	bash_cv_have_mbstate_t=yes \
>  	gdb_cv_func_sigsetjmp=yes
>  
> +# The shared only build is not supported by gdb, so enable static build for
> +# build-in libraries with --enable-static.
>  GDB_CONF_OPTS = \
>  	--without-uiout \
>  	--disable-gdbtk \
> @@ -83,7 +85,8 @@ GDB_CONF_OPTS = \
>  	$(if $(BR2_PACKAGE_GDB_SERVER),--enable-gdbserver) \
>  	--with-curses \
>  	--without-included-gettext \
> -	--disable-werror
> +	--disable-werror \
> +	--enable-static
>  
>  ifeq ($(BR2_PACKAGE_GDB_TUI),y)
>  	GDB_CONF_OPTS += --enable-tui
> -- 
> 1.9.3
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
