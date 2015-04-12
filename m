From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 11:25:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: Add optional dependencies
In-Reply-To: <1428777116-24382-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428777116-24382-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150412092545.GC4218@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-11 20:31 +0200, Bernd Kuhls spake thusly:
> To allow reproducable builds add some optional dependencies
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/gdb | grep NEEDED | sort
>  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libexpat.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
>  0x00000001 (NEEDED)                     Shared library: [libm.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libpython2.7.so.1.0]
>  0x00000001 (NEEDED)                     Shared library: [libutil.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gdb/gdb.mk |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 9818320..34f7b5c 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -36,6 +36,11 @@ else
>  GDB_DEPENDENCIES = ncurses
>  endif
>  
> +GDB_DEPENDENCIES += \
> +	$(if $(BR2_PACKAGE_EXPAT),expat) \
> +	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
> +	$(if $(BR2_PACKAGE_ZLIB),zlib)

Do we need those dependencies even when only gdbserver is built?

If not, move the dependencies into the if-block just above.
If yes, add a comment about it.

Regards,
Yann E. MORIN.

>  # For the host variant, we really want to build with XML support,
>  # which is needed to read XML descriptions of target architectures. We
>  # also need ncurses.
> -- 
> 1.7.10.4
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
