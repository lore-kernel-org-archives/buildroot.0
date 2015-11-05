From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Nov 2015 20:55:29 +0100
Subject: [Buildroot] [PATCH] toolchain/external:: Fix gdbserver install
 with linaro 2015.08
In-Reply-To: <1446752721.4553.8.camel@rtred1test09.kymeta.local>
References: <1446752721.4553.8.camel@rtred1test09.kymeta.local>
Message-ID: <20151105195529.GC3781@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trent, All,

On 2015-11-05 19:45 +0000, Trent Piepho spake thusly:
> It's now in bin/gdbserver from the install dir of the toolchain.

Indeed...

> Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 958ab18..843b1f8 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -645,7 +645,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
>  	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
>  		$(call MESSAGE,"Copying gdbserver") ; \
>  		gdbserver_found=0 ; \
> -		for d in $${ARCH_SYSROOT_DIR}/usr $${ARCH_SYSROOT_DIR}/../debug-root/usr $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} ; do \
> +		for d in $${ARCH_SYSROOT_DIR}/usr $${ARCH_SYSROOT_DIR}/../debug-root/usr $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} ${TOOLCHAIN_EXTERNAL_INSTALL_DIR}; do \

It might be time to split this overly-long line, like so:

        for d in $${ARCH_SYSROOT_DIR}/usr \
                 $${ARCH_SYSROOT_DIR}/../debug-root/usr \
                 $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
                 ${TOOLCHAIN_EXTERNAL_INSTALL_DIR}; do \

Also, we use the $(FOO) construct when refering to Makefile variables,
and TOOLCHAIN_EXTERNAL_INSTALL_DIR *is* a Makefile variable. Care to fix
and respin, please?

Thank you! :-)

Regards,
Yann E. MORIN.

>  			if test -f $${d}/bin/gdbserver ; then \
>  				install -m 0755 -D $${d}/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
>  				gdbserver_found=1 ; \
> -- 
> 1.8.3.1
> 
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
