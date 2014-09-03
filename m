From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Sep 2014 08:43:51 +0000 (UTC)
Subject: [Buildroot] [Bug 7352] [2014.08-rc3] diffutils-3.3 failed on
	building
In-Reply-To: <bug-7352-163@https.bugs.busybox.net/>
References: <bug-7352-163@https.bugs.busybox.net/>
Message-ID: <20140903084351.966889D5D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7352

--- Comment #3 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-09-03 08:43:51 UTC ---
I cannot reproduce this issue. Variable S is:
S=../src
here, which I checked by editing man/Makefile and adding
$(warning S=$(S))
above the line that you showed (where cmp.c is referenced).

This S variable is set from man/Makefile itself, as follows: (line 1069)

S = $(top_srcdir)/src

and top_srcdir is above:

top_srcdir = ..

Looking at man/Makefile.in, the definition of S is fixed, while top_srcdir is
derived from @top_srcdir at . This variable is set from the autoconf value
ac_top_srcdir, which in turn is derived by the configure script using some
logic around line 2198.

Can you try:
make diffutils-dirclean diffutils 

to make sure there is nothing odd going on, and if the problem persists add
some echo statements in the configure script to see how the value of
ac_top_srcdir is derived for you.

Please also send the output of the configure command from the build log, for me
it is:

>>> diffutils 3.3 Configuring
(cd /home/tdescham/repo/contrib/buildroot-bugs/output/build/diffutils-3.3/ &&
rm -rf config.cache &&
PATH="/home/tdescham/repo/contrib/buildroot-bugs/output/host/bin:/home/tdescham/repo/contrib/buildroot-bugs/output/host/sbin:/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin:/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/sbin:/home/tdescham/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
AR="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-ar"
AS="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-as"
LD="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-ld"
NM="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-nm"
CC="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-gcc"
GCC="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-gcc"
CPP="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-cpp"
CXX="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-g++"
FC="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-gfortran"
RANLIB="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-ranlib"
READELF="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-readelf"
STRIP="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-strip"
OBJCOPY="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-objcopy"
OBJDUMP="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/include"
CFLAGS_FOR_BUILD="-O2
-I/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/tdescham/repo/contrib/buildroot-bugs/output/host/lib
-L/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/lib
-Wl,-rpath,/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-as"
DEFAULT_LINKER="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/mips-linux-gnu-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe
-march=1004kc -mtune=1004kc -mdspr2 -mmt -O3 -g2" CXXFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -march=1004kc -mtune=1004kc
-mdspr2 -mmt -O3 -g2" LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/bin/pkg-config"
STAGING_DIR="/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/mipsel-buildroot-linux-gnu/sysroot"
ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no  ./configure
--target=mipsel-buildroot-linux-gnu --host=mipsel-buildroot-linux-gnu
--build=x86_64-unknown-linux-gnu --prefix=/usr --exec-prefix=/usr
--sysconfdir=/etc --program-prefix="" --disable-gtk-doc --disable-doc
--disable-docs --disable-documentation --with-xmlto=no --with-fop=no
--disable-dependency-tracking   --enable-ipv6 --enable-static --enable-shared  
)
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-doc,
--disable-docs, --disable-documentation, --with-xmlto, --with-fop,
--enable-ipv6, --enable-static, --enable-shared

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
