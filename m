Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E934EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 14:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 682318135D;
	Fri, 18 Mar 2022 14:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id anP_WSHK0mtD; Fri, 18 Mar 2022 14:38:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42D298132C;
	Fri, 18 Mar 2022 14:38:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B75D31BF232
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 14:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5DDB60736
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 14:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KczdzIb6jAG for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 14:38:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C857F60648
 for <buildroot@uclibc.org>; Fri, 18 Mar 2022 14:38:31 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1nVDkK-0007bz-3d
 for buildroot@uclibc.org; Fri, 18 Mar 2022 15:38:28 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Fri, 18 Mar 2022 14:38:21 -0000 (UTC)
Message-ID: <t125gt$rl6$1@ciao.gmane.io>
User-Agent: slrn/1.0.3 (Linux)
Subject: [Buildroot] openssl-1.1.1n build failure (with older buildroot)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I tried upgrading my openssl package from 1.1.1d to 1.1.1n, and the
newer version won't build. My base buildroot version is rather old at
2016.11.2, but many of the packages are fairly recent. The configure
step appears to be failing because no OS/compiler was specified (see
output below).  I assume this is because my buildroot is old. I'm
hoping that a simple hack on the libopenssl.mk file will allow me to
add the missing os/compiler info.

Can somebody point me towards a clue?

Upgrading to a newer version of buildroot is only an option if I can
keep all of existing package versions (is that feasible)?

Thanks...



========================================================================

openssl-1.1.1n.tar.gz: OK (sha256: 40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a)

>>> libopenssl 1.1.1n Extracting
gzip -d -c /home/nextgen/buildroot/downloads/openssl-1.1.1n.tar.gz | tar --strip-components=1 -C /home/nextgen/buildroot/output/build/libopenssl-1.1.1n   -xf -

>>> libopenssl 1.1.1n Patching

Applying 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch using patch:
patching file Configurations/unix-Makefile.tmpl

Applying 0002-Reproducible-build-do-not-leak-compiler-path.patch using patch:
patching file crypto/build.info

Applying 0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch using patch:
patching file crypto/mem_sec.c
Hunk #1 succeeded at 491 (offset 6 lines).

Applying 0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch using patch:
patching file Configure
Hunk #1 succeeded at 1424 (offset 7 lines).

Applying 0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch using patch:
patching file crypto/perlasm/ppc-xlate.pl

Applying 0006-Add-support-for-io_pgetevents_time64-syscall.patch using patch:
patching file engines/e_afalg.c

Applying 0007-Fixup-support-for-io_pgetevents_time64-syscall.patch using patch:
patching file engines/e_afalg.c
Hunk #1 succeeded at 121 (offset -3 lines).

>>> libopenssl 1.1.1n Configuring
(cd /home/nextgen/buildroot/output/build/libopenssl-1.1.1n; ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no  PATH="/home/nextgen/buildroot/output/host/bin:/home/nextgen/buildroot/output/host/sbin:/home/nextgen/buildroot/output/host/usr/bin:/home/nextgen/buildroot/output/host/usr/sbin:/home/grante/bin:/home/grante/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/13/bin:/sbin:/opt/ecos:/opt/ecos/gnutools/arm-elf/bin:/opt/ecos/gnutools/arm-eabi/bin" AR="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar" AS="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-as" LD="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueab
 i-ld" NM="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm" CC="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc" GCC="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc" CPP="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cpp" CXX="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++" FC="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gfortran" F77="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gfortran" RANLIB="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib" READELF="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-readelf" STRIP="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-strip" OBJCOPY="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objcopy" OBJDUMP="/hom
 e/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objdump" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld" CPPFLAGS_FOR_BUILD="-I/home/nextgen/buildroot/output/host/usr/include" CFLAGS_FOR_BUILD="-O2 -I/home/nextgen/buildroot/output/host/usr/include" CXXFLAGS_FOR_BUILD="-O2 -I/home/nextgen/buildroot/output/host/usr/include" LDFLAGS_FOR_BUILD="-L/home/nextgen/buildroot/output/host/lib -L/home/nextgen/buildroot/output/host/usr/lib -Wl,-rpath,/home/nextgen/buildroot/output/host/usr/lib" FCFLAGS_FOR_BUILD="" DEFAULT_ASSEMBLER="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-as" DEFAULT_LINKER="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld" CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -
 Os " CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os " LDFLAGS="" FCFLAGS=" -Os " FFLAGS=" -Os " PKG_CONFIG="/home/nextgen/buildroot/output/host/usr/bin/pkg-config" STAGING_DIR="/home/nextgen/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot" INTLTOOL_PERL=/usr/bin/perl ./Configure  --prefix=/usr --openssldir=/etc/ssl  threads shared  no-rc5 enable-camellia enable-mdc2 no-tests no-fuzz-libfuzzer no-fuzz-afl no-chacha no-rc5 no-rc2 no-rc4 no-md2 no-md4 no-mdc2 no-blake2 no-idea no-seed no-des no-rmd160 no-whirlpool no-bf no-ssl no-ssl2 no-ssl3 no-weak-ssl-ciphers no-psk no-cast no-unit-test no-crypto-mdebug-backtrace no-crypto-mdebug no-autoerrinit no-dynamic-engine  no-comp zlib-dynamic  )
Usage: Configure [no-<cipher> ...] [enable-<cipher> ...] [-Dxxx] [-lxxx] [-Lxxx] [-fxxx] [-Kxxx] [no-hw-xxx|no-hw] [[no-]threads] [[no-]shared] [[no-]zlib|zlib-dynamic] [no-asm] [no-egd] [sctp] [386] [--prefix=DIR] [--openssldir=OPENSSLDIR] [--with-xxx[=vvv]] [--config=FILE] os/compiler[:flags]

pick os/compiler from:
BS2000-OSD BSD-generic32 BSD-generic64 BSD-ia64 BSD-riscv64 BSD-sparc64
BSD-sparcv8 BSD-x86 BSD-x86-elf BSD-x86_64 Cygwin Cygwin-i386 Cygwin-i486
Cygwin-i586 Cygwin-i686 Cygwin-x86 Cygwin-x86_64 DJGPP MPE/iX-gcc UEFI UWIN
VC-CE VC-WIN32 VC-WIN32-ARM VC-WIN32-ONECORE VC-WIN64-ARM VC-WIN64A
VC-WIN64A-ONECORE VC-WIN64A-masm VC-WIN64I aix-cc aix-gcc aix64-cc aix64-gcc
android-arm android-arm64 android-armeabi android-mips android-mips64
android-x86 android-x86_64 android64 android64-aarch64 android64-mips64
android64-x86_64 bsdi-elf-gcc cc darwin-i386-cc darwin-ppc-cc
darwin64-arm64-cc darwin64-ppc-cc darwin64-x86_64-cc gcc haiku-x86
haiku-x86_64 hpux-ia64-cc hpux-ia64-gcc hpux-parisc-cc hpux-parisc-gcc
hpux-parisc1_1-cc hpux-parisc1_1-gcc hpux64-ia64-cc hpux64-ia64-gcc
hpux64-parisc2-cc hpux64-parisc2-gcc hurd-x86 ios-cross ios-xcrun ios64-cross
ios64-xcrun iossimulator-xcrun iphoneos-cross irix-mips3-cc irix-mips3-gcc
irix64-mips4-cc irix64-mips4-gcc linux-aarch64 linux-alpha-gcc linux-aout
linux-arm64ilp32 linux-armv4 linux-c64xplus linux-elf linux-generic32
linux-generic64 linux-ia64 linux-mips32 linux-mips64 linux-ppc linux-ppc64
linux-ppc64le linux-sparcv8 linux-sparcv9 linux-x32 linux-x86 linux-x86-clang
linux-x86_64 linux-x86_64-clang linux32-s390x linux64-mips64 linux64-riscv64
linux64-s390x linux64-sparcv9 mingw mingw64 nextstep nextstep3.3 sco5-cc
sco5-gcc solaris-sparcv7-cc solaris-sparcv7-gcc solaris-sparcv8-cc
solaris-sparcv8-gcc solaris-sparcv9-cc solaris-sparcv9-gcc solaris-x86-gcc
solaris64-sparcv9-cc solaris64-sparcv9-gcc solaris64-x86_64-cc
solaris64-x86_64-gcc tru64-alpha-cc tru64-alpha-gcc uClinux-dist
uClinux-dist64 unixware-2.0 unixware-2.1 unixware-7 unixware-7-gcc vms-alpha
vms-alpha-p32 vms-alpha-p64 vms-ia64 vms-ia64-p32 vms-ia64-p64 vos-gcc
vxworks-mips vxworks-ppc405 vxworks-ppc60x vxworks-ppc750 vxworks-ppc750-debug
vxworks-ppc860 vxworks-ppcgen vxworks-simlinux

NOTE: If in doubt, on Unix-ish systems use './config'.
Configuring OpenSSL version 1.1.1n (0x101010efL) for
Using os-specific seed configuration
make: *** [package/pkg-generic.mk:209: /home/nextgen/buildroot/output/build/libopenssl-1.1.1n/.stamp_configured] Error 1
make: Leaving directory '/home/nextgen/buildroot/buildroot-2016.11.2'
***** finished build FAIL at Fri Mar 18 09:22:16 AM CDT 2022 *****
***** elapsed time 0:04:53 *****

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
