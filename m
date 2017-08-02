From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 22:15:44 +0200
Subject: [Buildroot] [PATCH v2] systemd: allow to build with uClibc
 toolchains
In-Reply-To: <20170625182533.GA24682@waldemar-brodkorb.de>
References: <20170625182533.GA24682@waldemar-brodkorb.de>
Message-ID: <20170802221544.031370ab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Jun 2017 20:25:33 +0200, Waldemar Brodkorb wrote:
> Both patches where applied upstream.
> We need to disable any systemd parts using either IDN or NSS.
> IDN is only disabled in C library function call to getnaminfo(),
> it does not effect libidn/libidn2 usage in systemd.
> 
> Tested in qemu-system-arm.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   - added Upstream commit URL suggested by Thomas Petazzoni
>   - rework enable/disable options suggested by Thomas Petazzoni
>   - extend commit message a little bit
> ---
>  .../0004-Make-IDN-support-conditional.patch        | 74 ++++++++++++++++++++++
>  ...0005-make-nss-systemd-support-conditional.patch | 62 ++++++++++++++++++
>  package/systemd/Config.in                          |  2 +
>  package/systemd/systemd.mk                         | 11 ++++
>  system/Config.in                                   |  6 +-
>  5 files changed, 152 insertions(+), 3 deletions(-)
>  create mode 100644 package/systemd/0004-Make-IDN-support-conditional.patch
>  create mode 100644 package/systemd/0005-make-nss-systemd-support-conditional.patch

I've applied this patch on top of systemd 234 (which is nice because
the two patches you were adding can be dropped, as they are upstream).

Unfortunately, it fails to build:

In file included from src/libsystemd-network/sd-radv.c:23:0:
/home/thomas/projets/outputs/TestInitSystemSystemdRwFull/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/linux/in6.h:30:8: error: redefinition of ?struct in6_addr?
 struct in6_addr {
        ^
In file included from /home/thomas/projets/outputs/TestInitSystemSystemdRwFull/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/icmp6.h:24:0,
                 from src/libsystemd-network/sd-radv.c:20:
/home/thomas/projets/outputs/TestInitSystemSystemdRwFull/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/in.h:197:8: note: originally defined here
 struct in6_addr
        ^
In file included from src/libsystemd-network/sd-radv.c:23:0:
/home/thomas/projets/outputs/TestInitSystemSystemdRwFull/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/linux/in6.h:41:8: error: redefinition of ?struct sockaddr_in6?
 struct sockaddr_in6 {
        ^
In file included from /home/thomas/projets/outputs/TestInitSystemSystemdRwFull/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/in.h:24:0,
                 from /home/thomas/projets/outputs/TestInitSystemSystemdRwFull/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/icmp6.h:24,
                 from src/libsystemd-network/sd-radv.c:20:
/home/thomas/projets/outputs/TestInitSystemSystemdRwFull/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/socket.h:91:17: note: originally defined here
 typedef union { __SOCKADDR_ALLTYPES
                 ^
In file included from src/libsystemd-network/sd-radv.c:23:0:
/home/thomas/projets/outputs/TestInitSystemSystemdRwFull/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/linux/in6.h:49:8: error: redefinition of ?struct ipv6_mreq?
 struct ipv6_mreq {
        ^
In file included from /home/thomas/projets/outputs/TestInitSystemSystemdRwFull/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/icmp6.h:24:0,
                 from src/libsystemd-network/sd-radv.c:20:
/home/thomas/projets/outputs/TestInitSystemSystemdRwFull/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/in.h:278:8: note: originally defined here
 struct ipv6_mreq
        ^
Makefile:18205: recipe for target 'src/libsystemd-network/libsystemd_network_la-sd-radv.lo' failed
make[4]: *** [src/libsystemd-network/libsystemd_network_la-sd-radv.lo] Error 1

To produce this, I:

 - Tweaked InitSystemSystemdBase in
   support/testing/tests/init/test_systemd.py to use a pre-built uClibc
   toolchain

 - Removed the BR2_TOOLCHAIN_HAS_SSP dependency from INIT_SYSTEMD,
   because my pre-built uClibc does not have SSP support.

   I believe this dependency is no longer needed. Indeed, it was added
   in Buildroot commit 2c66e4429d23c6e293f9789cdef01b760399fccb, which
   bumped systemd to v207. However, in version v208, systemd changed
   the configure logic to use AC_LINK_IFELSE() instead of
   AC_COMPILE_IFELSE() to test if a given compiler flag is supported or
   not (see systemd commit d8c8508bad097c5cc354b684866a5b7a83fce394).
   Thanks to that, the configure script now properly detects that
   -fstack-protector is not supported, and systemd does not use it.
   Therefore, this BR2_TOOLCHAIN_HAS_SSP dependency can be removed.

 - Ran ./support/testing/run-tests -o ../outputs/ -k
   tests.init.test_systemd.TestInitSystemSystemdRwFull

And the build failed as shown above.

Could you have a look ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
