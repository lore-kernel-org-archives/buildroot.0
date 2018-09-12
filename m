From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 10:17:24 +0200
Subject: [Buildroot] BR2_PACKAGE_EXPAT
In-Reply-To: <CAOURK2sWHUyT8MbQbfhA7wEFPNbt9AxZW=_if7ght8La5Wi_Bw@mail.gmail.com>
References: <CAOURK2sWHUyT8MbQbfhA7wEFPNbt9AxZW=_if7ght8La5Wi_Bw@mail.gmail.com>
Message-ID: <20180912101724.66d7f57b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

On Tue, 11 Sep 2018 17:07:58 -0400, Chris LaRocque wrote:

> I am building for Beaglebone black and everything is working; except that
> now I need libexpat for the target and it is not in sysroot even
> though BR2_PACKAGE_EXPAT=y. I searched the archives and found threads
> discussing issues with GDB and not wanting libexpat in sysroot but did not
> follow why this is an issue.
> 
> Could someone enlighten me on why having target libexpat in sysroot is an
> issue and also why I can't find the libraries?

I'd say there is something you did incorrectly, because the expat
package definitely installs the expat library and headers to staging.

$ cat > .config <<EOF
BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2018.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_EXPAT=y
# BR2_TARGET_ROOTFS_TAR is not set
EOF
$ make olddefconfig
$ make
$ find output/staging/ | grep expat
output/staging/usr/share/doc/expat
output/staging/usr/share/doc/expat/AUTHORS
output/staging/usr/share/doc/expat/changelog
output/staging/usr/lib/pkgconfig/expat.pc
output/staging/usr/lib/libexpat.so
output/staging/usr/lib/libexpat.so.1
output/staging/usr/lib/libexpat.so.1.6.8
output/staging/usr/lib/libexpat.la
output/staging/usr/include/expat_external.h
output/staging/usr/include/expat.h
output/staging/usr/include/expat_config.h

If you're still having an issue, please:

 (1) Do a clean rebuild, using "make clean all".

 (2) Provide your complete .config file.

 (3) Post on some pastebin site (like http://code.bulix.org) the entire
     build log.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
