From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Sep 2017 23:28:55 +0200
Subject: [Buildroot] gdb/binutils - two versions of libbfd installed
In-Reply-To: <trinity-43ed5438-6812-4ad2-a78d-3b069e067897-1505302098589@3c-app-gmx-bs48>
References: <trinity-43ed5438-6812-4ad2-a78d-3b069e067897-1505302098589@3c-app-gmx-bs48>
Message-ID: <029c9703-1597-8c20-c427-78bc4eec9a7e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 13:28, Peter Seiderer wrote:
> BR2_BINUTILS_VERSION_2_29_X=y
> BR2_BINUTILS_VERSION="2.29"
> BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
> BR2_PACKAGE_BINUTILS=y
> 
> BR2_GDB_VERSION_8_0=y
> BR2_GDB_VERSION="8.0"
> BR2_PACKAGE_GDB_ARCH_SUPPORTS=y
> BR2_PACKAGE_GDB=y
> BR2_PACKAGE_GDB_SERVER=y
> BR2_PACKAGE_GDB_DEBUGGER=y
> 
> two versions of libbfd are installed into the target directory:
> 
>  ./target/usr/lib/libbfd-2.28.51.so
>  ./target/usr/lib/libbfd-2.29.so
>  ./target/usr/lib/libbfd.so -> libbfd-2.28.51.so
> 
> one from gdb-8.0 (2.28.51) and one from the binutils-2.29 package (and
> I believe the link from libbfd.so points to the wrong one).
> 
> With the following patch (inspired by [1] found by search for
> 'gdb disable dynamic libbfd build'):
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 7e86ba0..8c4188b 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -111,7 +111,7 @@ GDB_CONF_OPTS = \
>         --with-curses \
>         --without-included-gettext \
>         --disable-werror \
> -       --enable-static
> +       --enable-static --disable-shared
>  
>  # When gdb is built as C++ application for ARC it segfaults at runtime
>  # So we pass --disable-build-with-cxx config option to force gdb not to
> 
> the installation of the gdb libbfd version is prevented...

 The usual approach would be something like

ifeq ($(BR2_PACKAGE_BINUTILS),y)
GDB_DEPENDENCIES += binutils
GDB_CONF_OPTS += ... whatever is needed to make sure it uses binutils libbfd
endif

 Is that an option?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
