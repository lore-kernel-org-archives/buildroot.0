From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 10:06:22 +0200
Subject: [Buildroot] [PATCH 1/9] skalibs: new package
In-Reply-To: <1470690140-18803-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1470690140-18803-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160809100622.4b18f1c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Aug 2016 23:02:12 +0200, Eric Le Bihan wrote:

> diff --git a/package/skalibs/Config.in b/package/skalibs/Config.in
> new file mode 100644
> index 0000000..db35681
> --- /dev/null
> +++ b/package/skalibs/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_SKALIBS
> +	bool "skalibs"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL

Can  you add a quick comment that explains why uClibc cannot build this
package?

> +comment "skalibs need an (e)glibc or musl toolchain"

Use just "glibc" instead of "(e)glibc", we have removed eglibc support.

> + trytypesize() {
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

Instead of doing this loop to find the size of the different types,
what about using the following compiler pre-built defines (like you're
doing for little endian vs. big endian detection below) :

$ sparc-linux-gcc -dM -E - </dev/null | grep SIZEOF
#define __SIZEOF_INT__ 4
#define __SIZEOF_POINTER__ 4
#define __SIZEOF_LONG__ 4
#define __SIZEOF_LONG_DOUBLE__ 16
#define __SIZEOF_SIZE_T__ 4
#define __SIZEOF_WINT_T__ 4
#define __SIZEOF_PTRDIFF_T__ 4
#define __SIZEOF_FLOAT__ 4
#define __SIZEOF_SHORT__ 2
#define __SIZEOF_WCHAR_T__ 4
#define __SIZEOF_DOUBLE__ 8
#define __SIZEOF_LONG_LONG__ 8

> ++#if defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN) ||	       \
> ++	defined(__BYTE_ORDER__) && (__BYTE_ORDER__  == __ORDER_BIG_ENDIAN__) || \
> ++	defined(__BIG_ENDIAN) ||				       \
> ++	defined(__ARMEB__) ||					       \
> ++	defined(__THUMBEB__) ||				       \
> ++	defined(__AARCH64EB__) ||				       \
> ++	defined(_MIPSEB) || defined(__MIPSEB) || defined(__MIPSEB__)

Is there a reason why __BYTE_ORDER == __BIG_ENDIAN is not sufficient?
It's not available for all compilers/compiler versions?

> +SKALIBS_VERSION = v2.3.10.0
> +SKALIBS_SITE = git://git.skarnet.org/skalibs.git

Please use the tarball at
http://skarnet.org/software/skalibs/skalibs-2.3.10.0.tar.gz instead and
add a hash file.

> +ifeq ($(BR2_STATIC_LIBS),y)
> +SKALIBS_CONFIGURE_OPTS +=  --enable-static --disable-shared
> +else
> +SKALIBS_CONFIGURE_OPTS +=  --disable-static --enable-shared --disable-allstatic
> +endif

You forget the BR2_SHARED_STATIC_LIBS case, where we want both the
shared and static libraries.

> +HOST_SKALIBS_CONFIGURE_OPTS = \
> +	--prefix=/usr \
> +	--disable-static \
> +	--enable-shared \
> +	--disable-allstatic

You're adding of host variants of the packages, but I haven't yet
understood why.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
