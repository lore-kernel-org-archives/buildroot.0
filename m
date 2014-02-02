From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 02 Feb 2014 17:51:43 +0100
Subject: [Buildroot] [PATCH 1/3] gnupg: depend on libiconv if appropriate
References: <BLU0-SMTP112B1A733C43DA19ABF8DF9D9CE0@phx.gbl>
Message-ID: <vl92saxilm.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <berndkuhls@hotmail.com> wrote in
news:BLU0-SMTP112B1A733C43DA19ABF8DF9D9CE0 at phx.gbl: 

> -GNUPG_DEPENDENCIES = zlib ncurses
> +GNUPG_DEPENDENCIES = zlib ncurses $(if
> $(BR2_PACKAGE_LIBICONV),libiconv) 

Hi,

this a follow-up for Thomas? question:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/75233

Today I tested the necessity of my patch without a custom uClibc
configuration file, only with this defconfig applied to a current git 
checkout:

BR2_JLEVEL=8
BR2_ENABLE_DEBUG=y
BR2_OPTIMIZE_2=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREAD_DEBUG=y
# BR2_UCLIBC_INSTALL_UTILS is not set
BR2_BINUTILS_VERSION_2_23_2=y
BR2_GCC_VERSION_4_8_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBICONV=y
BR2_PACKAGE_GNUPG=y

Building these targets in the following order

- toolchain
- libiconv
- gnupg

results in a gpg binary linked to libiconv

$ /home/fli4l/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-
readelf -a /home/fli4l/buildroot/output/target/usr/bin/gpg | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Removing

BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBICONV=y

from defconfig results in this gpg binary:

/home/fli4l/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-
readelf -a /home/fli4l/buildroot/output/target/usr/bin/gpg | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

I hope this proves why my patches are necessary.

Regards, Bernd
