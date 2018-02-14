From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Wed, 14 Feb 2018 12:13:50 +0100
Subject: [Buildroot] Adding package libgit2
Message-ID: <20180214111351.4801-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While testing this package, there were lots of failures due to zlib-ng
and libressl, but none due to libgit2.  None of these failures appears
in the autobuilders.  Do they have trouble testing virtual packages ?

I tested this package using something like this script:

i=0
while true; do
	left=$i
	i=$((i+1))
	maybe () {
		local count=$#
		shift $((left % count))
		left=$((left / count))
		printf "%s\n" $1 | grep '.' || true
	}
	{
		printf '%s\n' BR2_PACKAGE_LIBGIT2=y
		maybe "" BR2_PACKAGE_LIBSSH=y
		maybe "" \
			"BR2_PACKAGE_LIBCURL=y" \
			"BR2_PACKAGE_LIBCURL=y BR2_PACKAGE_GNUTLS=y" \
			"BR2_PACKAGE_OPENSSL=y BR2_PACKAGE_LIBRESSL=y" \
			"BR2_PACKAGE_OPENSSL=y BR2_PACKAGE_LIBOPENSSL=y" \
		"BR2_PACKAGE_LIBCURL=y BR2_PACKAGE_OPENSSL=y BR2_PACKAGE_LIBRESSL=y" \
		"BR2_PACKAGE_LIBCURL=y BR2_PACKAGE_OPENSSL=y BR2_PACKAGE_LIBOPENSSL=y"
		maybe BR2_PACKAGE_LIBZLIB=y BR2_PACKAGE_ZLIB_NG=y
		[ "$left" != 0 ] && break
	} > test.config
	cat test.config
	./utils/test-pkg -c test.config -p libgit2 || exit 1
done | tee -a test-complete.log
echo "Summary (Legend:  . -> OK, s -> SKIPPED, F -> FAILED)"
sed -r -e '
:moreconf
/=y$/ {
	s/\n//
	s/BR2_PACKAGE_(.*)=y/,\1/
	s/^,/ /
	N
	b moreconf
}
:moreres
/: (FAILED|OK|SKIPPED)$/ {
	s/^(\S*) (\S+)\n.*: OK/\1. \2/
	s/^(\S*) (\S+)\n.*: FAILED/\1F \2/
	s/^(\S*) (\S+)\n.*: SKIPPED/\1s \2/
	N
	b moreres
}
s/\n.*//p
d
' test-complete.log


Summary (Legend:  . -> OK, s -> SKIPPED, F -> FAILED)
............................................... LIBGIT2,LIBZLIB
.......s.sss..s................................ LIBGIT2,LIBSSH,LIBZLIB
............................................... LIBGIT2,LIBCURL,LIBZLIB
.......s.sss..s................................ LIBGIT2,LIBSSH,LIBCURL,LIBZLIB
....s..s..s...s........s....................... LIBGIT2,LIBCURL,GNUTLS,LIBZLIB
....s..s.sss..s........s....................... LIBGIT2,LIBSSH,LIBCURL,GNUTLS,LIBZLIB
.......s.F.s..sFF.....F........................ LIBGIT2,OPENSSL,LIBRESSL,LIBZLIB
.......s.sss..sFF.....F........................ LIBGIT2,LIBSSH,OPENSSL,LIBRESSL,LIBZLIB
............................................... LIBGIT2,OPENSSL,LIBOPENSSL,LIBZLIB
.......s.sss..s................................ LIBGIT2,LIBSSH,OPENSSL,LIBOPENSSL,LIBZLIB
.......s.F.s..sFF.....F........................ LIBGIT2,LIBCURL,OPENSSL,LIBRESSL,LIBZLIB
.......s.sss..sFF.....F........................ LIBGIT2,LIBSSH,LIBCURL,OPENSSL,LIBRESSL,LIBZLIB
............................................... LIBGIT2,LIBCURL,OPENSSL,LIBOPENSSL,LIBZLIB
.......s.sss..s................................ LIBGIT2,LIBSSH,LIBCURL,OPENSSL,LIBOPENSSL,LIBZLIB
FFFF...F..FF..FFFFFFFFFFFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,ZLIB_NG
FFFF...s.sss..sFFFFFFFFFFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,LIBSSH,ZLIB_NG
FFFF...F..FF..FFFFFFFFFFFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,LIBCURL,ZLIB_NG
FFFF...s.sss..sFFFFFFFFFFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,LIBSSH,LIBCURL,ZLIB_NG
FFFFs..s..sF..sFFFFFFFFsFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,LIBCURL,GNUTLS,ZLIB_NG
FFFFs..s.sss..sFFFFFFFFsFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,LIBSSH,LIBCURL,GNUTLS,ZLIB_NG
FFFF...s.FFs..sFFFFFFFFFFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,OPENSSL,LIBRESSL,ZLIB_NG
FFFF...s.sss..sFFFFFFFFFFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,LIBSSH,OPENSSL,LIBRESSL,ZLIB_NG
FFFF...F..FF..FFFFFFFFFFFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,OPENSSL,LIBOPENSSL,ZLIB_NG
FFFF...s.sss..sFFFFFFFFFFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,LIBSSH,OPENSSL,LIBOPENSSL,ZLIB_NG
FFFF...s.FFs..sFFFFFFFFFFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,LIBCURL,OPENSSL,LIBRESSL,ZLIB_NG
FFFF...s.sss..sFFFFFFFFFFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,LIBSSH,LIBCURL,OPENSSL,LIBRESSL,ZLIB_NG
FFFF...F..FF..FFFFFFFFFFFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,LIBCURL,OPENSSL,LIBOPENSSL,ZLIB_NG
FFFF...s.sss..sFFFFFFFFFFFFFFF..F.F.FFFFFFFFF.. LIBGIT2,LIBSSH,LIBCURL,OPENSSL,LIBOPENSSL,ZLIB_NG



I identified 6 different failure reasons:


1) zlib-ng (armv5-ctng-linux-gnueabi, armv7-ctng-linux-gnueabihf,
	    sourcery-arm-armv4t, sourcery-arm, sourcery-arm-thumb2)

-- The following features have been enabled:
[...]
 * WITH_ACLE , Build with ACLE CRC
 * WITH_NEON , Build with NEON intrinsics
 * ACLE_CRC , Support CRC hash generation using the ACLE instruction set, using "-march=armv8-a+crc"
 * NEON_FILLWINDOW , Support NEON instructions in fill_window_arm, using "-mfloat-abi=softfp -mfpu=neon"

[...]
armv5-ctng-linux-gnueabi-gcc: error: unrecognized argument in option '-march=armv8-a+crc'

This option apparently appeared with GCC 4.9.  Should i send a patch ?

2) zlib-ng (br-aarch64-glibc, linaro-aarch64)

-- The following features have been disabled:

 * WITH_ACLE , Build with ACLE CRC
 * WITH_NEON , Build with NEON intrinsics

-- Configuring done
[...]
[ 96%] Linking C executable minigzip64
libz.so.1.2.11.zlib-ng: undefined reference to `crc32_acle'
libz.so.1.2.11.zlib-ng: undefined reference to `adler32_neon'
libz.so.1.2.11.zlib-ng: undefined reference to `crc32_acle'
libz.so.1.2.11.zlib-ng: undefined reference to `adler32_neon'



3) zlib-ng (br-arm-full-static)
[ 86%] Linking C static library libz.a
/home/cavallar/br-test-pkg/br-arm-full-static/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): In function `__uClibc_fini':
__uClibc_main.c:(.text+0x164): undefined reference to `__fini_array_end'
__uClibc_main.c:(.text+0x168): undefined reference to `__fini_array_start'
__uClibc_main.c:(.text+0x16c): undefined reference to `__fini_array_start'
/home/cavallar/br-test-pkg/br-arm-full-static/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): In function `__uClibc_main':
__uClibc_main.c:(.text+0x59c): undefined reference to `__preinit_array_start'
__uClibc_main.c:(.text+0x5a0): undefined reference to `__preinit_array_end'
__uClibc_main.c:(.text+0x5a4): undefined reference to `__preinit_array_start'
__uClibc_main.c:(.text+0x5a8): undefined reference to `__init_array_start'
__uClibc_main.c:(.text+0x5ac): undefined reference to `__init_array_end'
__uClibc_main.c:(.text+0x5b0): undefined reference to `__init_array_start'
/home/cavallar/br-test-pkg/br-arm-full-static/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: libz.so.1.2.11.zlib-ng: hidden symbol `__fini_array_end' isn't defined
/home/cavallar/br-test-pkg/br-arm-full-static/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: final link failed: Bad value
collect2: error: ld returned 1 exit status

I don't know much about static linking.

4) zlib-ng (all other toolchains)

-- The following features have been enabled:
[...]
 * SSE2 , Support the SSE2 instruction set, using "-msse2"
[...]
/home/cavallar/br-test-pkg/br-arcle-hs38/build/zlib-ng-a17fefa147942edbf80ab22a16bcbc2419def12d/arch/x86/x86.c:17:10: fatal error: cpuid.h: No such file or directory
 #include <cpuid.h>
          ^~~~~~~~~
compilation terminated.


5) libressl (br-arm-full-nothread)
PATH="$HOME/br-test-pkg/br-arm-full-nothread/host/bin:$HOME/br-test-pkg/br-arm-full-nothread/host/sbin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"  /usr/bin/make -j25  -C $HOME/br-test-pkg/br-arm-full-nothread/build/libressl-2.6.4/
Making all in crypto
/usr/bin/make  all-am
  CC       compat/arc4random.lo
In file included from compat/arc4random.h:16:0,
                 from compat/arc4random.c:66:
compat/arc4random_linux.h:28:21: fatal error: pthread.h: No such file or directory
 #include <pthread.h>
                     ^
compilation terminated.

Only this file seems to use locks.  It could be patched away, or
libressl could depends on threads, but i don't think kconfig will like
that?

6) libressl (br-microblazeel-full, br-m68k-68040-full, br-openrisc-uclibc)
Making all in ocspcheck
  CCLD     ocspcheck
/home/cavallar/br-test-pkg/br-m68k-68040-full/build/libressl-2.6.4/crypto/.libs/libcrypto.so: undefined reference to `__register_atfork'
collect2: error: ld returned 1 exit status

They have a MMU, but uclibc still doesn't provide __register_atfork() ?
