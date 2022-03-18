Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84585C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 15:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2155B40164;
	Fri, 18 Mar 2022 15:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XzWWeneyI9Lm; Fri, 18 Mar 2022 15:18:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B9E84049C;
	Fri, 18 Mar 2022 15:18:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13A0B1BF23C
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 15:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10E8C415E7
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 15:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FqNZEpW_og7V for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 15:18:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 420F9415E6
 for <buildroot@uclibc.org>; Fri, 18 Mar 2022 15:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647616730;
 bh=BgWJjVjrI1X1Bt/70G4Pe+JFKn81fqm65JojfpzelhY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=XqG0pklq70CgCtZa/+8gZ5l2+6zK5nG43sNumddHt+e9oGf5D1Ze5+utFUoht0DJ+
 DETrvUwDph0hH/fLoaXW6j6z5leMGo9c2w9FwV5A1+euyItixcGQoNdmXSWp4rPeuC
 T+dWMedlLmIytBvBibzzjaE1K9LdDrdMiip3VU0c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.203]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowKc-1nsjcy1uj0-00qR0m; Fri, 18
 Mar 2022 16:18:50 +0100
Date: Fri, 18 Mar 2022 16:18:30 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Grant Edwards <grant.b.edwards@gmail.com>
Message-ID: <20220318161830.49f60486@gmx.net>
In-Reply-To: <t125gt$rl6$1@ciao.gmane.io>
References: <t125gt$rl6$1@ciao.gmane.io>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:6F6Mc4bnyUTb/eedaO8+9gL+hZQQ9ISM0CesN1H5251OVmPZz+d
 TEHukGq+OgrNBuRG5oEwxo5KYHRySF/clTtqlpESgIeGzJrm5l+CqremIpNr5MovV3AHEn6
 jMbGx6pWNph3YSlMWVLbRzIdUlEEk+hOQPeAgdxOsxX8Dgz0PeHdilywdHX/HkPgOuA/YPu
 DqP7Z6cHDEdrv0yes+q1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LwsO+MpIIzE=:JRbTueBHUPfdrDAHM2gXYm
 +9L1FjJHy0cyatqd8SEv8watwC+JfZf9Ud66bCERwYjcaW5mDURdJ3fZOP1/fROUmiRXYfq5w
 ErSRKazmB9X134OzZ7R4tYVYu9KOVwU4ARjtjOY2/9JQ2e79aI4GJzvcBsyoF4i1zIXrIG1kq
 YvaaBJOlWnqAqtibqD7ssXcIPYh3d816BdxG7FxgXGACRlRZ1BxW9m82HH7h1Nm1XegLP/v6T
 gp5pDCwAMwiVVbzAwEJEGvBpG6HfyX0n8lLm3iSfmpkb58mNJdySY3MkdeCwaz+nuRCc1Imc7
 whyuZ5qdGD0bGAUzQC8XgVn++u+/+A9g+D2GbDf/OxOL6MxDQedlkqxMedF4h2mBWBTLckebA
 dzHIpoGFGmXP68EbbDPUbxikqQYlgeGTCtRMgGQ+hNoZN9jEM4te1BQu6r7RB7fV0qOHVJvR8
 QJNFvQN5vttdUOp2Kwnq9Wcm5I5HVd3BsVOjjlCkpegIEJ6oQiokbXTW6zO2oC6GFroDgzo/e
 /k+/e1ArQS68cmXr/LVepn2KjntwDK2IHg1y3b7w8lt5bojlvquL0a3wxTDGs2V/y428WOFJn
 513Tqp6jmAdckBL1v/YtsUOgSK9dIHPHOPZEaacpdTwF+3kvhA/c/xn36CwO0kdFtJg2Y7jJI
 6DVzJG8TVrTC5/4j08/UMwY/rP2Sd4Vsto/lDQTRyi8VQxDXke9h7nDQahAQFrfFAJ+KjsZXl
 1cns6XcGAOT1+XMB/RUIL5lLumRmDYUMr8nl2K0Yqo6azhoj9crz9POpKAtidkMgSWO7Hog8O
 c0GnqVtuPOZm0z/d2m8hS/F6N7lCnhstN9jeD/hLuak1xSVPgm9R4QTVrXDxBvupVsQ7+ey3D
 5j4DZt8p9itwKs4xT6F6PMGNj5PcGDpQu4TEwct6YDoa5PzsGFW5hVMMn21RU96QyWvxG0pdL
 2tCNeyb5P3c13ckfETWmIge/ZIwK7I6hcAJIaeN+o2Tv54ZXZNPPr3PNovKm4bVOOGDrDNhyq
 QAKNPAJzuZqdHj625mUCEx8skDcjfNRMpNW/KXiSNR7cxnG4U7m+T3cQS81oqVJM0+V9S6ktT
 t3SRvknL4e5xys=
Subject: Re: [Buildroot] openssl-1.1.1n build failure (with older buildroot)
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Edwards,

On Fri, 18 Mar 2022 14:38:21 -0000 (UTC), Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I tried upgrading my openssl package from 1.1.1d to 1.1.1n, and the
> newer version won't build. My base buildroot version is rather old at
> 2016.11.2, but many of the packages are fairly recent. The configure
> step appears to be failing because no OS/compiler was specified (see
> output below).  I assume this is because my buildroot is old. I'm
> hoping that a simple hack on the libopenssl.mk file will allow me to
> add the missing os/compiler info.
>
> Can somebody point me towards a clue?
>
> Upgrading to a newer version of buildroot is only an option if I can
> keep all of existing package versions (is that feasible)?
>
> Thanks...
>
>
>
> ========================================================================
>
> openssl-1.1.1n.tar.gz: OK (sha256: 40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a)
>
> >>> libopenssl 1.1.1n Extracting
> gzip -d -c /home/nextgen/buildroot/downloads/openssl-1.1.1n.tar.gz | tar --strip-components=1 -C /home/nextgen/buildroot/output/build/libopenssl-1.1.1n   -xf -
>
> >>> libopenssl 1.1.1n Patching
>
> Applying 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch using patch:
> patching file Configurations/unix-Makefile.tmpl
>
> Applying 0002-Reproducible-build-do-not-leak-compiler-path.patch using patch:
> patching file crypto/build.info
>
> Applying 0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch using patch:
> patching file crypto/mem_sec.c
> Hunk #1 succeeded at 491 (offset 6 lines).
>
> Applying 0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch using patch:
> patching file Configure
> Hunk #1 succeeded at 1424 (offset 7 lines).
>
> Applying 0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch using patch:
> patching file crypto/perlasm/ppc-xlate.pl
>
> Applying 0006-Add-support-for-io_pgetevents_time64-syscall.patch using patch:
> patching file engines/e_afalg.c
>
> Applying 0007-Fixup-support-for-io_pgetevents_time64-syscall.patch using patch:
> patching file engines/e_afalg.c
> Hunk #1 succeeded at 121 (offset -3 lines).
>
> >>> libopenssl 1.1.1n Configuring
> (cd /home/nextgen/buildroot/output/build/libopenssl-1.1.1n; ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no  PATH="/home/nextgen/buildroot/output/host/bin:/home/nextgen/buildroot/output/host/sbin:/home/nextgen/buildroot/output/host/usr/bin:/home/nextgen/buildroot/output/host/usr/sbin:/home/grante/bin:/home/grante/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/13/bin:/sbin:/opt/ecos:/opt/ecos/gnutools/arm-elf/bin:/opt/ecos/gnutools/arm-eabi/bin" AR="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar" AS="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-as" LD="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnue
 ab
>  i-ld" NM="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm" CC="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc" GCC="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc" CPP="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cpp" CXX="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++" FC="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gfortran" F77="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gfortran" RANLIB="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib" READELF="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-readelf" STRIP="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-strip" OBJCOPY="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objcopy" OBJDUMP="/h
 om
>  e/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objdump" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld" CPPFLAGS_FOR_BUILD="-I/home/nextgen/buildroot/output/host/usr/include" CFLAGS_FOR_BUILD="-O2 -I/home/nextgen/buildroot/output/host/usr/include" CXXFLAGS_FOR_BUILD="-O2 -I/home/nextgen/buildroot/output/host/usr/include" LDFLAGS_FOR_BUILD="-L/home/nextgen/buildroot/output/host/lib -L/home/nextgen/buildroot/output/host/usr/lib -Wl,-rpath,/home/nextgen/buildroot/output/host/usr/lib" FCFLAGS_FOR_BUILD="" DEFAULT_ASSEMBLER="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-as" DEFAULT_LINKER="/home/nextgen/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld" CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
  -
>  Os " CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os " LDFLAGS="" FCFLAGS=" -Os " FFLAGS=" -Os " PKG_CONFIG="/home/nextgen/buildroot/output/host/usr/bin/pkg-config" STAGING_DIR="/home/nextgen/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot" INTLTOOL_PERL=/usr/bin/perl ./Configure  --prefix=/usr --openssldir=/etc/ssl  threads shared  no-rc5 enable-camellia enable-mdc2 no-tests no-fuzz-libfuzzer no-fuzz-afl no-chacha no-rc5 no-rc2 no-rc4 no-md2 no-md4 no-mdc2 no-blake2 no-idea no-seed no-des no-rmd160 no-whirlpool no-bf no-ssl no-ssl2 no-ssl3 no-weak-ssl-ciphers no-psk no-cast no-unit-test no-crypto-mdebug-backtrace no-crypto-mdebug no-autoerrinit no-dynamic-engine  no-comp zlib-dynamic  )
> Usage: Configure [no-<cipher> ...] [enable-<cipher> ...] [-Dxxx] [-lxxx] [-Lxxx] [-fxxx] [-Kxxx] [no-hw-xxx|no-hw] [[no-]threads] [[no-]shared] [[no-]zlib|zlib-dynamic] [no-asm] [no-egd] [sctp] [386] [--prefix=DIR] [--openssldir=OPENSSLDIR] [--with-xxx[=vvv]] [--config=FILE] os/compiler[:flags]
>
> pick os/compiler from:
> BS2000-OSD BSD-generic32 BSD-generic64 BSD-ia64 BSD-riscv64 BSD-sparc64
> BSD-sparcv8 BSD-x86 BSD-x86-elf BSD-x86_64 Cygwin Cygwin-i386 Cygwin-i486
> Cygwin-i586 Cygwin-i686 Cygwin-x86 Cygwin-x86_64 DJGPP MPE/iX-gcc UEFI UWIN
> VC-CE VC-WIN32 VC-WIN32-ARM VC-WIN32-ONECORE VC-WIN64-ARM VC-WIN64A
> VC-WIN64A-ONECORE VC-WIN64A-masm VC-WIN64I aix-cc aix-gcc aix64-cc aix64-gcc
> android-arm android-arm64 android-armeabi android-mips android-mips64
> android-x86 android-x86_64 android64 android64-aarch64 android64-mips64
> android64-x86_64 bsdi-elf-gcc cc darwin-i386-cc darwin-ppc-cc
> darwin64-arm64-cc darwin64-ppc-cc darwin64-x86_64-cc gcc haiku-x86
> haiku-x86_64 hpux-ia64-cc hpux-ia64-gcc hpux-parisc-cc hpux-parisc-gcc
> hpux-parisc1_1-cc hpux-parisc1_1-gcc hpux64-ia64-cc hpux64-ia64-gcc
> hpux64-parisc2-cc hpux64-parisc2-gcc hurd-x86 ios-cross ios-xcrun ios64-cross
> ios64-xcrun iossimulator-xcrun iphoneos-cross irix-mips3-cc irix-mips3-gcc
> irix64-mips4-cc irix64-mips4-gcc linux-aarch64 linux-alpha-gcc linux-aout
> linux-arm64ilp32 linux-armv4 linux-c64xplus linux-elf linux-generic32
> linux-generic64 linux-ia64 linux-mips32 linux-mips64 linux-ppc linux-ppc64
> linux-ppc64le linux-sparcv8 linux-sparcv9 linux-x32 linux-x86 linux-x86-clang
> linux-x86_64 linux-x86_64-clang linux32-s390x linux64-mips64 linux64-riscv64
> linux64-s390x linux64-sparcv9 mingw mingw64 nextstep nextstep3.3 sco5-cc
> sco5-gcc solaris-sparcv7-cc solaris-sparcv7-gcc solaris-sparcv8-cc
> solaris-sparcv8-gcc solaris-sparcv9-cc solaris-sparcv9-gcc solaris-x86-gcc
> solaris64-sparcv9-cc solaris64-sparcv9-gcc solaris64-x86_64-cc
> solaris64-x86_64-gcc tru64-alpha-cc tru64-alpha-gcc uClinux-dist
> uClinux-dist64 unixware-2.0 unixware-2.1 unixware-7 unixware-7-gcc vms-alpha
> vms-alpha-p32 vms-alpha-p64 vms-ia64 vms-ia64-p32 vms-ia64-p64 vos-gcc
> vxworks-mips vxworks-ppc405 vxworks-ppc60x vxworks-ppc750 vxworks-ppc750-debug
> vxworks-ppc860 vxworks-ppcgen vxworks-simlinux
>
> NOTE: If in doubt, on Unix-ish systems use './config'.
> Configuring OpenSSL version 1.1.1n (0x101010efL) for
> Using os-specific seed configuration
> make: *** [package/pkg-generic.mk:209: /home/nextgen/buildroot/output/build/libopenssl-1.1.1n/.stamp_configured] Error 1
> make: Leaving directory '/home/nextgen/buildroot/buildroot-2016.11.2'
> ***** finished build FAIL at Fri Mar 18 09:22:16 AM CDT 2022 *****
> ***** elapsed time 0:04:53 *****

Seems your BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH/LIBOPENSSL_TARGET_ARCH variable is empty,
the Configure line should look (something) like the following:

	[...] ./Configure linux-armv4 --prefix=/usr [...]

Yours:

	[...] ./Configure  --prefix=/usr [...]

See [1] for a starting point of the handling in buildroot git mainline...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/tree/package/libopenssl/libopenssl.mk#n73


>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
