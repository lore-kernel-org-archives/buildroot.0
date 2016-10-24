From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 24 Oct 2016 11:38:08 -0400
Subject: [Buildroot] [PATCH 1/1] package/erlang: add optional dependency
 to unixodbc
In-Reply-To: <20161023153403.18413-1-bernd.kuhls@t-online.de>
References: <20161023153403.18413-1-bernd.kuhls@t-online.de>
Message-ID: <CA+-urNRZhGgK-ku2bbHzvwVtRzyrFdVtJ4DamuTZRM+yhLreJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 23, 2016 at 11:34 AM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Quote from erlang configure without unixodbc:
>
> checking for odbc in standard locations... no
> configure: WARNING: No odbc library found skipping odbc
> configure: WARNING: "ODBC library - header check failed"
> configure: WARNING: "ODBC library - link check failed"
>
> Quote from erlang configure with unixodbc:
>
> checking for odbc in standard locations... -L/home/buildroot/br3_couchdb/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib
> checking for SQLAllocHandle in -lodbc... yes
>
> To check for unixodbc support used by erlang use readelf:
>
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/erlang/lib/odbc-2.11.1/priv/bin/odbcserver | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libodbc.so.2]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
>
> Tested using this minimal defconfig:
>
> BR2_PACKAGE_ERLANG=y
> BR2_PACKAGE_ERLANG_SMP=y
> BR2_PACKAGE_UNIXODBC=y
>

Looks good to me. I tried it out by running Erlang, starting the odbc
application and running a couple functions against it to see that it
would call into the library fine. I didn't connect to a database, but
I could tell that it was interacting with the unixodbc library based
on the error messages. If something changes and you need to test it
again, I think this is sufficient:

# erl
Eshell V7.3  (abort with ^G)
1> odbc:start().
ok
2> odbc:connect("DSN=sql-server;UID=aladdin;PWD=sesame", []).
{error,"[unixODBC][Driver Manager]Data source name not found, and no
default driver specified SQLSTATE IS: IM002 Connection to database
failed."}

Tested-by: Frank Hunleth <fhunleth@troodon-software.com>

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/erlang/erlang.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
> index 6efffde..c9d7b22 100644
> --- a/package/erlang/erlang.mk
> +++ b/package/erlang/erlang.mk
> @@ -55,6 +55,10 @@ else
>  ERLANG_CONF_OPTS += --without-ssl
>  endif
>
> +ifeq ($(BR2_PACKAGE_UNIXODBC),y)
> +ERLANG_DEPENDENCIES += unixodbc
> +endif
> +
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  ERLANG_CONF_OPTS += --enable-shared-zlib
>  ERLANG_DEPENDENCIES += zlib
> --
> 2.9.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Frank Hunleth
Troodon Software LLC
Embedded Software Development
http://troodon-software.com/
