From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Mar 2012 16:30:11 +0100
Subject: [Buildroot] [PATCH 1/3] intltool: no business defining PERLLIB
In-Reply-To: <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120319163011.27d669d2@skate>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Le Sun, 11 Mar 2012 22:58:49 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/intltool/intltool.mk |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
> index 6d13cc1..1e749ea 100644
> --- a/package/intltool/intltool.mk
> +++ b/package/intltool/intltool.mk
> @@ -9,8 +9,6 @@ INTLTOOL_SOURCE = intltool-$(INTLTOOL_VERSION).tar.bz2
>  INTLTOOL_SITE = http://ftp.acc.umu.se/pub/GNOME/sources/intltool/0.40/
>  
>  HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
> -HOST_INTLTOOL_CONF_OPT = \
> -  PERLLIB=$(HOST_DIR)/usr/lib/perl

I am sorry, but after testing this, the build definitely fails on
machines that have just a Perl interpreter installed (and the
XML::Parser Perl module not installed).

See:

make[1]: Leaving directory `/home/test/test/output/build/host-libxml-parser-perl-2.36'
[3m>>> host-intltool 0.40.6 Configuring[23m
(cd /home/test/test/output/build/host-intltool-0.40.6/ && rm -rf config.cache; PATH=/home/test/test/output/host/bin:/home/test/test/output/host/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/games AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm" CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp" CFLAGS="-O2 -I/home/test/test/output/host/include -I/home/test/test/output/host/usr/include" CXXFLAGS="-I/home/test/test/output/host/include -I/home/test/test/output/host/usr/include" LDFLAGS="-L/home/test/test/output/host/lib -L/home/test/test/output/host/usr/lib -Wl,-rpath,/home/test/test/output/host/usr/lib" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG="/home/test/test/output/host/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_LIBDIR="/home/test/test/output/host/usr/lib/pkgconfig:/home/test/test/output/host/usr/share/pkgconfig" PERLLIB="/home/test/test/output/host/usr/lib/perl" LD_LIBRARY_PATH="/home/test/test/output/host/usr/lib:" CFLAGS="-O2 -I/home/test/test/output/host/include -I/home/test/test/output/host/usr/include" LDFLAGS="-L/home/test/test/output/host/lib -L/home/test/test/output/host/usr/lib -Wl,-rpath,/home/test/test/output/host/usr/lib"  ./configure --prefix="/home/test/test/output/host/usr" --sysconfdir="/home/test/test/output/host/etc" --enable-shared --disable-static PERLLIB=/home/test/test/output/host/usr/lib/perl )
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking for perl... /home/test/test/output/host/usr/bin/perl
checking for perl >= 5.8.1... 5.12.4
checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool
make: *** [/home/test/test/output/build/host-intltool-0.40.6/.stamp_configured] Error 1

So this commit should be reverted, in my opinion, unless host-microperl
becomes a dependency of host-intltool which I am not really in favor of.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
