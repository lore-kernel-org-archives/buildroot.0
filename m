From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 02 May 2018 13:21:34 +0000
Subject: [Buildroot] [PATCH 1/2] qemu: bump to 2.12.0
In-Reply-To: <bfc190a7-fd11-67f0-ac43-52d6db711a6b@gmail.com>
References: <20180427154055.23272-1-aduskett@gmail.com>
 <bfc190a7-fd11-67f0-ac43-52d6db711a6b@gmail.com>
Message-ID: <CAFSsvmr2SWWAeC8MtWvmFxFbZLq6=rHz-iYb1GyFz7GxGQPLVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Romain;

On Tue, May 1, 2018 at 10:58 AM Romain Naour <romain.naour@gmail.com> wrote:

> Hi Adam,

> Thanks for this new version.

> Le 27/04/2018 ? 17:40, Adam Duskett a ?crit :
> > In addition:
> >   - Update
0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> >     with new line numbers and file location.
> >   - Remove upstream 0002-memfd-fix-configure-test.patch
> >   - Add new options found in 2.12.0 in qemu.mk as disabled.
> >   - Remove --with-system-pixman as it's no longer optional.
> >
> > Tested with test-pkg:
> >
> > ./utils/test-pkg -p qemu -c configs/qemu_min_defconfig
> >                              br-arm-full [1/6]: OK
> >                   br-arm-cortex-a9-glibc [2/6]: OK
> >                    br-arm-cortex-m4-full [3/6]: SKIPPED
> >                           br-x86-64-musl [4/6]: OK
> >                       br-arm-full-static [5/6]: OK
> >                 armv5-ctng-linux-gnueabi [6/6]: OK
> > 6 builds, 1 skipped, 0 build failed, 0 legal-info failed

> Maybe you can complete the test-pkg result with a runtime test with qemu
> configs? see [1] for example.

> Note that Qemu 2.12 has deprecated SDL support in favor of 2.0 series [2].
> Maybe it's time to switch to SDL2.

> Best regards,
> Romain

While it's true that it deprecated support for SDL in favor of 2.0, I would
disagree with removing
SDL support AND updating in a single patch. Also, even though it's
deprecated, it still works.

Thanks!
Adam
> [1]

https://git.buildroot.net/buildroot/commit/?id=477756b257c4b72e03679b9142104860e1d4dabc
> [2]
https://git.qemu.org/?p=qemu.git;h=e52c6ba34149b4f39c3fd60e59ee32b809db2bfa

> >
> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > ---
> >  ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch | 10 ++--
> >  package/qemu/0002-memfd-fix-configure-test.patch   | 58
----------------------
> >  package/qemu/qemu.hash                             |  2 +-
> >  package/qemu/qemu.mk                               | 13 ++++-
> >  4 files changed, 18 insertions(+), 65 deletions(-)
> >  delete mode 100644 package/qemu/0002-memfd-fix-configure-test.patch
> >
> > diff --git
a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> > index 6d6d024d9d..2763737fe6 100644
> > ---
a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> > +++
b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> > @@ -13,15 +13,17 @@ general case of using uc_mcontext.arm_pc, which
works fine with
> >  uClibc.
> >
> >  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > +[aduskett at gmail.com: Update for 2.12.0]
> > +Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> >  ---
> >   user-exec.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > -diff --git a/user-exec.c b/user-exec.c
> > +diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> >  index 6db0758..2b3d116 100644
> > ---- a/user-exec.c
> > -+++ b/user-exec.c
> > -@@ -409,7 +409,7 @@ int cpu_signal_handler(int host_signum, void
*pinfo,
> > +--- a/accel/tcg/user-exec.c
> > ++++ b/accel/tcg/user-exec.c
> > +@@ -463,7 +463,7 @@ int cpu_signal_handler(int host_signum, void
*pinfo,
> >
> >   #if defined(__NetBSD__)
> >       pc = uc->uc_mcontext.__gregs[_REG_R15];
> > diff --git a/package/qemu/0002-memfd-fix-configure-test.patch
b/package/qemu/0002-memfd-fix-configure-test.patch
> > deleted file mode 100644
> > index 3e06c0e932..0000000000
> > --- a/package/qemu/0002-memfd-fix-configure-test.patch
> > +++ /dev/null
> > @@ -1,58 +0,0 @@
> > -From 75e5b70e6b5dcc4f2219992d7cffa462aa406af0 Mon Sep 17 00:00:00 2001
> > -From: Paolo Bonzini <pbonzini@redhat.com>
> > -Date: Tue, 28 Nov 2017 11:51:27 +0100
> > -Subject: [PATCH] memfd: fix configure test
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=UTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -Recent glibc added memfd_create in sys/mman.h.  This conflicts with
> > -the definition in util/memfd.c:
> > -
> > -    /builddir/build/BUILD/qemu-2.11.0-rc1/util/memfd.c:40:12: error:
static declaration of memfd_create follows non-static declaration
> > -
> > -Fix the configure test, and remove the sys/memfd.h inclusion since the
> > -file actually does not exist---it is a typo in the memfd_create(2) man
> > -page.
> > -
> > -Cc: Marc-Andr? Lureau <marcandre.lureau@redhat.com>
> > -Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > -Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ----
> > -Upstream status: commit 75e5b70e6b5
> > -
> > - configure    | 2 +-
> > - util/memfd.c | 4 +---
> > - 2 files changed, 2 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/configure b/configure
> > -index 9c8aa5a98bd4..99ccc1725ace 100755
> > ---- a/configure
> > -+++ b/configure
> > -@@ -3923,7 +3923,7 @@ fi
> > - # check if memfd is supported
> > - memfd=no
> > - cat > $TMPC << EOF
> > --#include <sys/memfd.h>
> > -+#include <sys/mman.h>
> > -
> > - int main(void)
> > - {
> > -diff --git a/util/memfd.c b/util/memfd.c
> > -index 4571d1aba866..412e94a405fc 100644
> > ---- a/util/memfd.c
> > -+++ b/util/memfd.c
> > -@@ -31,9 +31,7 @@
> > -
> > - #include "qemu/memfd.h"
> > -
> > --#ifdef CONFIG_MEMFD
> > --#include <sys/memfd.h>
> > --#elif defined CONFIG_LINUX
> > -+#if defined CONFIG_LINUX && !defined CONFIG_MEMFD
> > - #include <sys/syscall.h>
> > - #include <asm/unistd.h>
> > -
> > ---
> > -2.16.2
> > -
> > diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
> > index 1173c1bf3d..fc0b4e87bf 100644
> > --- a/package/qemu/qemu.hash
> > +++ b/package/qemu/qemu.hash
> > @@ -1,4 +1,4 @@
> >  # Locally computed, tarball verified with GPG signature
> > -sha256
fcfdaa1ecdaac8aead616fe811bfb8fe4a8f2cd59796aa446c5175b5af0e829f
  qemu-2.10.2.tar.xz
> > +sha256
e69301f361ff65bf5dabd8a19196aeaa5613c1b5ae1678f0823bdf50e7d5c6fc
  qemu-2.12.0.tar.xz
> >  sha256
6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
> >  sha256
48ffe9fc7f1d5462dbd19340bc4dd1d8a9e37c61ed535813e614cbe4a5f0d4df
  COPYING.LIB
> > diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> > index f6f4a2b870..975dfba490 100644
> > --- a/package/qemu/qemu.mk
> > +++ b/package/qemu/qemu.mk
> > @@ -4,7 +4,7 @@
> >  #
> >

################################################################################
> >
> > -QEMU_VERSION = 2.10.2
> > +QEMU_VERSION = 2.12.0
> >  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
> >  QEMU_SITE = http://download.qemu.org
> >  QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause,
Others/BSD-1c
> > @@ -230,7 +230,6 @@ define QEMU_CONFIGURE_CMDS
> >               ./configure \
> >                       --prefix=/usr \
> >                       --cross-prefix=$(TARGET_CROSS) \
> > -                     --with-system-pixman \
> >                       --audio-drv-list= \
> >                       --enable-kvm \
> >                       --enable-attr \
> > @@ -255,6 +254,16 @@ define QEMU_CONFIGURE_CMDS
> >                       --disable-strip \
> >                       --disable-seccomp \
> >                       --disable-sparse \
> > +                     --disable-mpath \
> > +                     --disable-sanitizers \
> > +                     --disable-hvf \
> > +                     --disable-whpx \
> > +                     --disable-malloc-trim \
> > +                     --disable-membarrier \
> > +                     --disable-vhost-crypto \
> > +                     --disable-libxml2 \
> > +                     --disable-capstone \
> > +                     --disable-git-update \
> >                       $(QEMU_OPTS) \
> >       )
> >  endef
> >
