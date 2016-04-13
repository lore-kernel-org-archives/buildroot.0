From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 23:02:19 +0200
Subject: [Buildroot] [PATCH v12 01/31] package/freeswitch: new package
In-Reply-To: <1460281299-2385-2-git-send-email-bernd.kuhls@t-online.de>
References: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
 <1460281299-2385-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160413230219.73e299ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Apr 2016 11:41:09 +0200, Bernd Kuhls wrote:
> This commit adds freeswitch without any configured modules and with a
> minimal set of non-optional dependencies. All other dependencies and
> modules will be added by further patches in this series.
> 
> PLease note that freeswitch source repo bundles some libraries which are
> also available as buildroot packages. The freeswitch build system does
> not allow to use system libraries in these cases:
> 
> apr, apr-util, libsrtp, libvpx, libyuv, sofia-sip, tiff
> 
> The reason are patches to these packages by the freeswitch project which
> are not yet upstream. There is an open JIRA report for this situation:
> https://freeswitch.org/jira/si/jira.issueviews:issue-html/FS-353/FS-353.html
> 
> More historic infos can be found here:
> http://article.gmane.org/gmane.comp.telephony.freeswitch.devel/2715
> https://freeswitch.org/the-missing-link/
> 
> In the 1.6.7 version bump libvpx & libyuv were also moved in-tree:
> https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/febe0f8dacea2d2a31902b3dc469be757f8c3c4d
> https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/44da905b4f6b3b35e94b4948fb70dec7b5071ded
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I'm sorry, but this still doesn't build, with the exact same error I
had in my previous test of the freeswitch package:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2016.02-3-g762b7c9.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_FREESWITCH=y
# BR2_TARGET_ROOTFS_TAR is not set

gives:

  CCLD   fs_cli
libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemWipe':
/home/thomas/projets/buildroot/output/build/freeswitch-1.6.7/libs/libzrtp/third_party/bnlib/lbnmem.c:69: undefined reference to `zrtp_memset'
libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemAlloc':
/home/thomas/projets/buildroot/output/build/freeswitch-1.6.7/libs/libzrtp/third_party/bnlib/lbnmem.c:78: undefined reference to `zrtp_sys_alloc'
libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemFree':
/home/thomas/projets/buildroot/output/build/freeswitch-1.6.7/libs/libzrtp/third_party/bnlib/lbnmem.c:87: undefined reference to `zrtp_sys_free'
collect2: error: ld returned 1 exit status
Makefile:1259: recipe for target 'fs_cli' failed
make[4]: *** [fs_cli] Error 1
make[4]: *** Waiting for unfinished jobs....

*** Warning: Linking the shared library libfreeswitch.la against the
*** static library libs/libzrtp/libzrtp.a is not portable!

*** Warning: Linking the shared library libfreeswitch.la against the
*** static library libs/libzrtp/third_party/bnlib/libbn.a is not portable!
Makefile:2803: recipe for target 'all-recursive' failed
make[3]: *** [all-recursive] Error 1
Makefile:1066: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:195: recipe for target '/home/thomas/projets/buildroot/output/build/freeswitch-1.6.7/.stamp_built' failed
make[1]: *** [/home/thomas/projets/buildroot/output/build/freeswitch-1.6.7/.stamp_built] Error 2
Makefile:36: recipe for target '_all' failed
make: *** [_all] Error 2

Note that I have only PATCH 01/31 applied. If an ARM/uClibc
configuration doesn't build, a package is definitely not ready to go. I
would be OK to merge a package that doesn't build with musl, or on some
weird architectures, but certainly not something that doesn't build on
ARM/uClibc.

Could you look into this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
