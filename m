From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jun 2017 16:34:42 +0200
Subject: [Buildroot] [PATCH v3,1/1] boinc: new package
In-Reply-To: <1497771592-119110-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1497771592-119110-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <20170618163442.59260235@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Jun 2017 09:39:52 +0200, Fabrice Fontaine wrote:

>  package/Config.in                  |  1 +
>  package/boinc/Config.in            | 22 ++++++++++++++
>  package/boinc/S99boinc-client      | 37 +++++++++++++++++++++++
>  package/boinc/boinc-client.service | 10 +++++++
>  package/boinc/boinc.hash           |  4 +++
>  package/boinc/boinc.mk             | 60 ++++++++++++++++++++++++++++++++++++++

Entry in the DEVELOPERS file missing.

> +BOINC_VERSION_MAJOR = 7.6
> +BOINC_VERSION = $(BOINC_VERSION_MAJOR).34
> +# client_release can be used to build the Client and Manager but not the Server
> +# part. The Server currently has no versioning (see
> +# https://github.com/BOINC/boinc/pull/1798).
> +BOINC_SITE = \
> +	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
> +BOINC_LICENSE = LGPLv3

We use SPDX license codes now. In addition, all source files have the
"or later" statement. So: LGPL-3.0+.

I would have fixed those issues myself, but unfortunately, boinc does
not build properly for me in what is our default ARM uClibc
configuration:

  CXX      switcher.o
  CXXLD    switcher
libtool: warning: library '/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/lib/libstdc++.la' was moved.
  CXXLD    boinccmd
libtool: warning: library '/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/lib/libstdc++.la' was moved.
  CXXLD    boinc_client
libtool: warning: library '/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/lib/libstdc++.la' was moved.
libtool: warning: library '/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/lib/libstdc++.la' was moved.
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: attempted static link of dynamic object `/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcurl.so'
collect2: error: ld returned 1 exit status
Makefile:709: recipe for target 'boinccmd' failed
make[4]: *** [boinccmd] Error 1
make[4]: *** Waiting for unfinished jobs....
libtool: warning: library '/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/lib/libstdc++.la' was moved.
libtool: warning: library '/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/lib/libstdc++.la' was moved.
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: attempted static link of dynamic object `/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcurl.so'
collect2: error: ld returned 1 exit status
Makefile:705: recipe for target 'boinc_client' failed

And indeed, it's trying to build static binaries, even if it's a
BR2_SHARED_LIBS build. To reproduce this, you can test with:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-444-g6c704ba.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_BOINC=y
# BR2_TARGET_ROOTFS_TAR is not set

A test of the package with support/scripts/test-pkg would have pointed
out this build issue :-)

Could you have a look and submit an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
