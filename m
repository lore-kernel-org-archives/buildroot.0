From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Apr 2018 09:56:48 +0200
Subject: [Buildroot] [PATCH v3 2/6] zstd: add host libzstd support
In-Reply-To: <20180416193953.19924-2-ps.report@gmx.net>
References: <20180416193953.19924-1-ps.report@gmx.net>
 <20180416193953.19924-2-ps.report@gmx.net>
Message-ID: <20180423075648.GK12688@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-04-16 21:39 +0200, Peter Seiderer spake thusly:
> For the host only the libzstd library is built (no
> need for host-lz4 host-xz host-zlib dependencies
> because they affect only the cmdline tool).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Just a note, see below...

> ---
> Changes v2 -> v3:
>   - fix trailing spaces
>   - clarify the no need for host-lz4 host-xz host-zlib dependency
>     (suggested by Yann E. MORIN)
> 
> Changes v1 -> v2:
>   - split off host libzstd support (suggested by Yann E. MORIN)
>   - no ZSTD_OPTS for host libarary build
> ---
>  package/zstd/zstd.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index c0fa88026c..98f8f779aa 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -46,4 +46,16 @@ define ZSTD_INSTALL_TARGET_CMDS
>  		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
>  endef
>  
> +# note: no 'HAVE_...' options for host library build only
> +define HOST_ZSTD_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
> +		-C $(@D) lib
> +endef
> +
> +define HOST_ZSTD_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
> +		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/lib install

For the build command, you do:      -C $(@D) lib
while for the install, you do:      -C $(@D)/lib install

It is not very consistent (not your fault, just the package's). But
would it be possible to build with: -C $(@D)/lib

This way, we would get a semblance of artificial consistency...

But that does not bar this from be applied as is...

Regards,
Yann E. MORIN.

> +endef
> +
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))
> -- 
> 2.16.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
