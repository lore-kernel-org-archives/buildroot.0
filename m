Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA59EC52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 17:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4503640AFE;
	Tue, 13 Aug 2024 17:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5MVBjSkYK6i; Tue, 13 Aug 2024 17:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A994D40AD1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A994D40AD1;
	Tue, 13 Aug 2024 17:39:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C4151BF59C
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 17:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AD8D80B56
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 17:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8P_oQRuPdJ8 for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 17:39:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA14880B08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA14880B08
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA14880B08
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 17:39:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C3365780509;
 Tue, 13 Aug 2024 19:39:34 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43518])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 Aug 2024 19:39:34 +0200
MIME-Version: 1.0
Date: Tue, 13 Aug 2024 19:39:34 +0200
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
In-Reply-To: <ZrraEO8+HVHX+CZG@waldemar-brodkorb.de>
References: <ZrraEO8+HVHX+CZG@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.7
Message-ID: <2485a4d214db9225d4fac5cb785bb842@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723570775;
 bh=7QtDwpqXAV8gkea728M/tgHeAAZTDH9iNG2Tvy0zXbo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pn/agY3mUsSZO2QM6S2ZQqmixxMLlQwQoL00zqkExy3mBP6VotSpf5SqLYca1B9oV
 eX54hDq+2sDp19QJHUkt0MvNWDn255yJUw8S0Zgxi2f0knJx4ansUojHWmGWLeziqi
 mSfdp4TP1pN1ncccftNjalSFtoQ5NeIT7Ps8fvFpLr7lnj829xDey19JPakCm0Jxv8
 8phLqVtOD2YaT+JT8j5eJ2wKTU/fm7+JBN2sMmd3elIn2MXFFUZ4bz2Lk2Hz5lFxym
 236x6YCU+ArcKo11dGChvwrRZrXb7GMIfAV+q4StQvGGhVkD2s0E5uz+4jtHDsfNnm
 OJ3iMebfBTddQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Pn/agY3m
Subject: Re: [Buildroot] [PATCH next] package/xfsprogs: update to 6.9.0
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,

Thank you for the patch.

On 13/08/2024 05:59, Waldemar Brodkorb wrote:
> Patch 0001 no longer required, upstream fixed the situation.

Could you include a comment in the commit log with a link to a
changelog, please?

For example:
"""
For a change log since v6.4.0, see:
https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/doc/CHANGES?h=v6.9.0
"""

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...-do-not-try-to-run-the-crc32selftest.patch | 47 -------------------
>  package/xfsprogs/xfsprogs.hash                |  2 +-
>  package/xfsprogs/xfsprogs.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 49 deletions(-)
>  delete mode 100644 
> package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
> 
> diff --git 
> a/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch 
> b/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
> deleted file mode 100644
> index 77bdc19127..0000000000
> --- 
> a/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 94ae5db7d017480e103aa6f07cc86648b613d114 Mon Sep 17 00:00:00 2001
> -From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Date: Sun, 18 Dec 2016 15:37:27 +0100
> -Subject: [PATCH] libxfs: do not try to run the crc32selftest
> -
> -Even though the crc32selftest is natively compiled (because it is to 
> be
> -executed), it fails in cross-compilation as the host may lack the
> -required headers, like uuid/uuid.h (e.g. in a minimal environment).
> -
> -Moreover, running the crc32selftest natively is completely wrong,
> -because it passing on the host does not mean it would still pass n the
> -target (because endianness or bitness or alignment differences).
> -
> -So, just disable running the crc32selftest altogether.
> -
> -Note that there's a remaining bug-in-hiding, because the crc32 table
> -generator is natively built, but with the target CFLAGS.
> -
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Signed-off-by: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
> -[Update for 4.18.0: crc32 has been moved from libxfs to libfrog]
> -[Julien: rebased on v6.4.0]
> -Signed-off-by: Julien Olivain <ju.o@free.fr>
> -Upstream: patch to be superseded by 
> https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=e51b89e657af7843d8c7aea3df49fe1f0f1d4ac2
> ----
> - libfrog/Makefile | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/libfrog/Makefile b/libfrog/Makefile
> -index f292afe3..1d0d2083 100644
> ---- a/libfrog/Makefile
> -+++ b/libfrog/Makefile
> -@@ -57,9 +57,9 @@ ifeq ($(HAVE_GETMNTENT),yes)
> - LCFLAGS += -DHAVE_GETMNTENT
> - endif
> -
> --LDIRT = gen_crc32table crc32table.h crc32selftest
> -+LDIRT = gen_crc32table crc32table.h
> -
> --default: crc32selftest ltdepend $(LTLIBRARY)
> -+default: ltdepend $(LTLIBRARY)
> -
> - crc32table.h: gen_crc32table.c crc32defs.h
> - 	@echo "    [CC]     gen_crc32table"
> ---
> -2.45.2
> -
> diff --git a/package/xfsprogs/xfsprogs.hash 
> b/package/xfsprogs/xfsprogs.hash
> index 8c73e14905..94f3724f70 100644
> --- a/package/xfsprogs/xfsprogs.hash
> +++ b/package/xfsprogs/xfsprogs.hash
> @@ -1,5 +1,5 @@
>  # From 
> https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
> -sha256  
> c31868418bfbf49a3a9c47fc70cdffde9d96f4ff0051bd04a0881e6654648104  
> xfsprogs-6.4.0.tar.xz
> +sha256  
> 975284783fb3fbc4e1ae640bd804d788e4237a86b07582acee86b6e48f6521b7  
> xfsprogs-6.9.0.tar.xz
> 
>  # Hash for license files
>  sha256  
> f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  
> LICENSES/GPL-2.0
> diff --git a/package/xfsprogs/xfsprogs.mk 
> b/package/xfsprogs/xfsprogs.mk
> index e657c8086d..4c301eec05 100644
> --- a/package/xfsprogs/xfsprogs.mk
> +++ b/package/xfsprogs/xfsprogs.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -XFSPROGS_VERSION = 6.4.0
> +XFSPROGS_VERSION = 6.9.0

Also, testing this new version in this patch, on branch next at
commit 74cb378 with the command:

     utils/test-pkg -a -p xfsprogs

shows many build failures:

                              arm-aarch64 [ 1/41]: FAILED
                    bootlin-aarch64-glibc [ 2/41]: FAILED
                bootlin-arcle-hs38-uclibc [ 3/41]: SKIPPED
                     bootlin-armv5-uclibc [ 4/41]: FAILED
                      bootlin-armv7-glibc [ 5/41]: OK
                    bootlin-armv7m-uclibc [ 6/41]: SKIPPED
                       bootlin-armv7-musl [ 7/41]: FAILED
                 bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
                bootlin-m68k-68040-uclibc [ 9/41]: SKIPPED
              bootlin-microblazeel-uclibc [10/41]: SKIPPED
                 bootlin-mipsel32r6-glibc [11/41]: FAILED
                    bootlin-mipsel-uclibc [12/41]: FAILED
                      bootlin-nios2-glibc [13/41]: FAILED
                  bootlin-openrisc-uclibc [14/41]: SKIPPED
         bootlin-powerpc64le-power8-glibc [15/41]: FAILED
            bootlin-powerpc-e500mc-uclibc [16/41]: FAILED
                    bootlin-riscv32-glibc [17/41]: OK
                    bootlin-riscv64-glibc [18/41]: OK
                     bootlin-riscv64-musl [19/41]: FAILED
                  bootlin-s390x-z13-glibc [20/41]: OK
                       bootlin-sh4-uclibc [21/41]: SKIPPED
                    bootlin-sparc64-glibc [22/41]: FAILED
                     bootlin-sparc-uclibc [23/41]: SKIPPED
                     bootlin-x86-64-glibc [24/41]: OK
                      bootlin-x86-64-musl [25/41]: FAILED
                    bootlin-x86-64-uclibc [26/41]: FAILED
                    bootlin-x86-i686-musl [27/41]: FAILED
                    bootlin-xtensa-uclibc [28/41]: SKIPPED
                             br-arm-basic [29/41]: SKIPPED
                     br-arm-full-nothread [30/41]: SKIPPED
                       br-arm-full-static [31/41]: FAILED
                    br-i386-pentium4-full [32/41]: FAILED
                       br-mips64-n64-full [33/41]: FAILED
                  br-mips64r6-el-hf-glibc [34/41]: OK
                br-powerpc-603e-basic-cpp [35/41]: FAILED
                br-powerpc64-power7-glibc [36/41]: OK
                        linaro-aarch64-be [37/41]: FAILED
                           linaro-aarch64 [38/41]: FAILED
                               linaro-arm [39/41]: FAILED
                          sourcery-mips64 [40/41]: FAILED
                            sourcery-mips [41/41]: FAILED
     41 builds, 11 skipped, 23 build failed, 0 legal-info failed, 0 
show-info failed

It seems there is two big groups of failures.

The first one is a new usage of the fscrypt v2 policy. It seems older
kernel are missing a definition. The xfsprogs package is failing to
build with output:

     encrypt.c:53:36: error: 'FSCRYPT_KEY_IDENTIFIER_SIZE' undeclared 
here (not in a function)
        53 |         __u8 
master_key_identifier[FSCRYPT_KEY_IDENTIFIER_SIZE];
           |                                    
^~~~~~~~~~~~~~~~~~~~~~~~~~~
     encrypt.c:61:42: error: field 'v1' has incomplete type
        61 |                 struct fscrypt_policy_v1 v1;
           |                                          ^~

FSCRYPT_KEY_IDENTIFIER_SIZE was introduced in Kernel 5.4, in commit:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=5dae460c2292dbbdac3a7a982cd566f470d957a2

The second group is a new usage of memfd_create(). Build is failing 
with:

     
/br-test-pkg/bootlin-mipsel-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/12.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: 
../libxfs/.libs/libxfs.a(xfile.o): in function 'xfile_create_fd':
     
/br-test-pkg/bootlin-mipsel-uclibc/build/xfsprogs-6.9.0/libxfs/xfile.c:56:(.text+0x350): 
undefined reference to 'memfd_create'

Basically, this introduces a dependency on Kernel >= 3.17. I fixed a
similar issue in kexec-tools a while back. See:
https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=6419b008fde783fd0cc2cc266bd1c9cf35e99a0e
https://gitlab.com/buildroot.org/buildroot/-/commit/719921bebe1704f5b88b7419bac1fb1105c0c151

Could you investigate how to fix those?

>  XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
>  XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
>  XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few 
> headers)
> --
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
