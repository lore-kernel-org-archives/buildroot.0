From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 10:20:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/libodb-mysql: fix static build
In-Reply-To: <20200713215943.2240412-1-fontaine.fabrice@gmail.com>
References: <20200713215943.2240412-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714102035.0536d2bd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 23:59:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> mysql needs -lz for static build
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a5447c5105f15606ed562b39ca84c06e7e6b78c0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libodb-mysql/libodb-mysql.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/libodb-mysql/libodb-mysql.mk b/package/libodb-mysql/libodb-mysql.mk
> index 97cbcddf93..1a12220222 100644
> --- a/package/libodb-mysql/libodb-mysql.mk
> +++ b/package/libodb-mysql/libodb-mysql.mk
> @@ -13,4 +13,9 @@ LIBODB_MYSQL_LICENSE = GPL-2.0
>  LIBODB_MYSQL_LICENSE_FILES = LICENSE
>  LIBODB_MYSQL_DEPENDENCIES = libodb mysql
>  
> +ifeq ($(BR2_STATIC_LIBS),y)
> +# mysql needs -lz, so we need to specify it for static builds
> +LIBODB_MYSQL_CONF_ENV += LIBS=-lz
> +endif

zlib is only an optional dependency of mysql. When I build just
oracle-mysql, the libmysqlclient libraries are not linked with zlib:

 0x00000001 (NEEDED)                     Shared library: [libcrypt.so.1]
 0x00000001 (NEEDED)                     Shared library: [libnsl.so.1]
 0x00000001 (NEEDED)                     Shared library: [libm.so.6]
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
 0x0000000e (SONAME)                     Library soname: [libmysqlclient.so.16]

 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libcrypt.so.1]
 0x00000001 (NEEDED)                     Shared library: [libnsl.so.1]
 0x00000001 (NEEDED)                     Shared library: [libm.so.6]
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
 0x0000000e (SONAME)                     Library soname: [libmysqlclient_r.so.16]

So you cannot forcefully link with zlib, as it may not be present.
According to
https://dev.mysql.com/doc/refman/5.7/en/c-api-building-clients-pkg-config.html,
MySQL provides a pkg-config file, but I don't have it installed.
Perhaps it is due to the fact that we use an ancient MySQL version
(5.1.x) ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
