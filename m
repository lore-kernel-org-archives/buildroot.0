From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 7 Feb 2017 11:21:49 +0100
Subject: [Buildroot] [Patch v3 1/9] skalibs: new package
In-Reply-To: <1482182955-23916-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1482182955-23916-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAAXf6LW89DOiymoq5JS41H6-d5LKAmLEQ1-i8EgWFTqp0Pen7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 19, 2016 at 10:29 PM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> This new package provides skalibs, a collection of free software / open
> source C development files used for building all softwares from
> skarnet.org.
>
> Note that, though skalibs (and all skarnet softwares) follows the
> "./configure; make; make install" convention, it does not behave like a
> traditional autotools project:
>
>  - static libraries are installed in $prefix/usr/lib/skalibs.
>  - pkg-config and libtool are not used: instead a custom system called
>    "sysdeps" is used and locations to libraries and headers are to be
>    passed explicitly via options of the './configure' script.
>
> The host variant is provided to allow building the host variants of the
> other skarnet softwares.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in                                  |  1 +
>  .../0001-No-runtime-tests-for-endianness.patch     | 95 ++++++++++++++++++++++
>  .../0002-No-runtime-tests-for-type-sizes.patch     | 54 ++++++++++++
>  package/skalibs/Config.in                          |  9 ++
>  package/skalibs/skalibs.hash                       |  2 +
>  package/skalibs/skalibs.mk                         | 59 ++++++++++++++
>  6 files changed, 220 insertions(+)
>  create mode 100644 package/skalibs/0001-No-runtime-tests-for-endianness.patch
>  create mode 100644 package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
>  create mode 100644 package/skalibs/Config.in
>  create mode 100644 package/skalibs/skalibs.hash
>  create mode 100644 package/skalibs/skalibs.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index be0d150..760eaff 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1366,6 +1366,7 @@ endif
>         source "package/qhull/Config.in"
>         source "package/qlibc/Config.in"
>         source "package/shapelib/Config.in"
> +       source "package/skalibs/Config.in"
>         source "package/sphinxbase/Config.in"
>         source "package/startup-notification/Config.in"
>         source "package/tinycbor/Config.in"
> diff --git a/package/skalibs/0001-No-runtime-tests-for-endianness.patch b/package/skalibs/0001-No-runtime-tests-for-endianness.patch
> new file mode 100644
> index 0000000..4390d44
> --- /dev/null
> +++ b/package/skalibs/0001-No-runtime-tests-for-endianness.patch
> @@ -0,0 +1,95 @@
> +From 1e6f0b094c6ce6454be572704b866d2ce0962e59 Mon Sep 17 00:00:00 2001
> +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Date: Sun, 4 Dec 2016 19:10:40 +0100
> +Subject: [PATCH] No runtime tests for endianness
> +
> +Replace build and execution of runtime test programs for determining
> +the endianness of the target with compile time test programs.
> +
> +This improves support for cross-compilation.
> +
> +Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +---
> + configure                     | 15 +++++++++++----
> + src/sysdeps/trybigendian.c    | 16 ++++++++++++++++
> + src/sysdeps/trylittleendian.c | 16 ++++++++++++++++
> + 3 files changed, 43 insertions(+), 4 deletions(-)
> + create mode 100644 src/sysdeps/trybigendian.c
> + create mode 100644 src/sysdeps/trylittleendian.c
> +
> +diff --git a/configure b/configure
> +index 1579025..4da9c5e 100755
> +--- a/configure
> ++++ b/configure
> +@@ -463,13 +463,20 @@ EOF
> +   fi
> +   exec 3>&-
> +
> +-  echo "Checking system endianness..."
> +-  $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO -o tryendianness src/sysdeps/tryendianness.c
> +-  endianness=$(./tryendianness) || fail "$0: unable to determine endianness"
> ++    echo "Checking system endianness..."
> ++  if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO -o trybigendian src/sysdeps/trybigendian.c 2>/dev/null; then
> ++      endianness=big
> ++  else
> ++      if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO -o trylittleendian src/sysdeps/trylittleendian.c 2>/dev/null; then
> ++          endianness=little
> ++      else
> ++          fail "$0: unable to determine endianness"
> ++      fi
> ++  fi
> +   echo "endianness: $endianness" >> $sysdeps/sysdeps
> +   echo "#define ${package_macro_name}_ENDIANNESS \"$endianness\"" >> $sysdeps/sysdeps.h
> +   echo "  ... $endianness"
> +-  rm -f tryendianness
> ++  rm -f trybigendian trylittleendian
> +
> +   trytypesize ushort USHORT "unsigned short"
> +   trytypesize uint UINT "unsigned int"
> +diff --git a/src/sysdeps/trybigendian.c b/src/sysdeps/trybigendian.c
> +new file mode 100644
> +index 0000000..d857572
> +--- /dev/null
> ++++ b/src/sysdeps/trybigendian.c
> +@@ -0,0 +1,16 @@
> ++#if defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN) ||               \
> ++      defined(__BYTE_ORDER__) && (__BYTE_ORDER__  == __ORDER_BIG_ENDIAN__) || \
> ++      defined(__BIG_ENDIAN) ||                                       \
> ++      defined(__ARMEB__) ||                                          \
> ++      defined(__THUMBEB__) ||                                \
> ++      defined(__AARCH64EB__) ||                                      \
> ++      defined(_MIPSEB) || defined(__MIPSEB) || defined(__MIPSEB__)
> ++#define YEAH
> ++#else
> ++#error "not big endian"
> ++#endif
> ++
> ++int main(void)
> ++{
> ++      return 0;
> ++}
> +diff --git a/src/sysdeps/trylittleendian.c b/src/sysdeps/trylittleendian.c
> +new file mode 100644
> +index 0000000..eba065a
> +--- /dev/null
> ++++ b/src/sysdeps/trylittleendian.c
> +@@ -0,0 +1,16 @@
> ++#if defined(__BYTE_ORDER) && (__BYTE_ORDER == __LITTLE_ENDIAN) ||     \
> ++      defined(__BYTE_ORDER__) && (__BYTE_ORDER__  == __ORDER_LITTLE_ENDIAN__) || \
> ++      defined(__LITTLE_ENDIAN) ||                                     \
> ++      defined(__ARMEL__) ||                                           \
> ++      defined(__THUMBEL__) ||                                 \
> ++      defined(__AARCH64EL__) ||                                       \
> ++      defined(_MIPSEL) || defined(__MIPSEL) || defined(__MIPSEL__)
> ++#define YEAH
> ++#else
> ++#error "not little endian"
> ++#endif
> ++
> ++int main(void)
> ++{
> ++      return 0;
> ++}
> +--
> +2.5.5
> +
> diff --git a/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
> new file mode 100644
> index 0000000..3f16171
> --- /dev/null
> +++ b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
> @@ -0,0 +1,54 @@
> +From d868600a3f437750bc44a783d677a25a48100096 Mon Sep 17 00:00:00 2001
> +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Date: Sun, 4 Dec 2016 19:11:25 +0100
> +Subject: [PATCH] No runtime tests for type sizes
> +
> +Replace build and execution of runtime test programs for determining
> +some type sizes of the target with compile time test programs.
> +
> +This improves support for cross-compilation.
> +
> +Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +---
> + configure | 24 +++++++++++++++++++++---
> + 1 file changed, 21 insertions(+), 3 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 4da9c5e..b5926ca 100755
> +--- a/configure
> ++++ b/configure
> +@@ -157,10 +157,28 @@ choose () {
> +
> + trytypesize () {
> +   echo "Checking size of $3..."
> +-  $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o trysizeof$1 src/sysdeps/trysizeof$1.c
> +-  type_size=$(./trysizeof$1) || fail "$0: unable to determine size of $3"
> ++  r=false
> ++  type_size=0
> ++  while true; do
> ++    cat<<EOF>trysizeof$1.c
> ++#include <sys/types.h>
> ++
> ++int main(void)
> ++{
> ++  static int v = 1 / !!((sizeof($3) == $type_size));
> ++  return 0;
> ++}
> ++EOF
> ++    if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o trysizeof$1 trysizeof$1.c 2>/dev/null; then
> ++        r=true
> ++        break
> ++    fi
> ++    type_size=$(expr $type_size + 1)
> ++    test $type_size -le 16 || break
> ++  done
> ++  test $r = true || fail "$0: unable to determine size of $3"
> +   type_bits=$(expr 8 \* $type_size)
> +-  rm -f trysizeof$1
> ++  rm -f trysizeof$1 trysizeof$1.c
> +   echo "sizeof$1: $type_size" >> $sysdeps/sysdeps
> +   echo "#define ${package_macro_name}_SIZEOF$2 $type_size" >> $sysdeps/sysdeps.h
> +   echo "#define ${package_macro_name}_$2_BITS $type_bits" >> $sysdeps/sysdeps.h
> +--
> +2.5.5
> +
> diff --git a/package/skalibs/Config.in b/package/skalibs/Config.in
> new file mode 100644
> index 0000000..7802ae3
> --- /dev/null
> +++ b/package/skalibs/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_SKALIBS
> +       bool "skalibs"
> +       depends on BR2_USE_MMU # fork()
> +       help
> +         skalibs is a package centralizing the FOSS C development
> +         files used for building all software at skarnet.org:
> +         it contains essentially general-purpose libraries.
> +
> +         http://skarnet.org/software/skalibs/
> diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
> new file mode 100644
> index 0000000..195ac47
> --- /dev/null
> +++ b/package/skalibs/skalibs.hash
> @@ -0,0 +1,2 @@
> +# Locally generated
> +sha256 0708172bc2ec9825f8a4f312d35f8dcd94da5f291425a598c33c873b3de77df8 skalibs-2.4.0.2.tar.gz
> diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
> new file mode 100644
> index 0000000..e525378
> --- /dev/null
> +++ b/package/skalibs/skalibs.mk
> @@ -0,0 +1,59 @@
> +################################################################################
> +#
> +# skalibs
> +#
> +################################################################################
> +
> +SKALIBS_VERSION = 2.4.0.2
> +SKALIBS_SITE = http://skarnet.org/software/skalibs
> +SKALIBS_LICENSE = ISC
> +SKALIBS_LICENSE_FILES = COPYING
> +SKALIBS_INSTALL_STAGING = YES
> +
> +SKALIBS_CONF_OPTS = \
> +       --prefix=/usr \
> +       --with-default-path=/sbin:/usr/sbin:/bin:/usr/bin \
> +       $(SHARED_STATIC_LIBS_OPTS)
> +
> +define SKALIBS_CONFIGURE_CMDS
> +       (cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(SKALIBS_CONF_OPTS))
> +endef
> +
> +define SKALIBS_BUILD_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define SKALIBS_REMOVE_STATIC_LIB_DIR
> +       rm -rf $(TARGET_DIR)/usr/lib/skalibs
> +endef
> +
> +SKALIBS_POST_INSTALL_TARGET_HOOKS += SKALIBS_REMOVE_STATIC_LIB_DIR
> +
> +define SKALIBS_INSTALL_TARGET_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef
> +
> +define SKALIBS_INSTALL_STAGING_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
> +endef
> +
> +HOST_SKALIBS_CONF_OPTS = \
> +       --prefix=$(HOST_DIR)/usr \
> +       --disable-static \
> +       --enable-shared \
> +       --disable-allstatic
> +
> +define HOST_SKALIBS_CONFIGURE_CMDS
> +       (cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_SKALIBS_CONF_OPTS))
> +endef
> +
> +define HOST_SKALIBS_BUILD_CMDS
> +       $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define HOST_SKALIBS_INSTALL_CMDS
> +       $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))
> --

This patch was already applied; I will mark it as such in patchwork.
