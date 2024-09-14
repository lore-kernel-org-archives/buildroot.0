Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB69C02187
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94990402A2;
	Sat, 14 Sep 2024 22:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwYGens0aM4P; Sat, 14 Sep 2024 22:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05551402B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05551402B0;
	Sat, 14 Sep 2024 22:02:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C22B1BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B6E281B71
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTjUHyV10DJd for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 55F2981B35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55F2981B35
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55F2981B35
 for <buildroot@busybox.net>; Sat, 14 Sep 2024 22:02:47 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1spaqp-0008il-Vw
 for buildroot@busybox.net; Sun, 15 Sep 2024 00:02:43 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 14 Sep 2024 22:02:37 -0000 (UTC)
Message-ID: <vc515t$108g$1@ciao.gmane.io>
References: <vc23rg$llm$1@ciao.gmane.io> <20240914094334.1228db8e@windsurf>
User-Agent: slrn/1.0.3 (Linux)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: Re: [Buildroot] Upgrading buildroot and rootfs/kernel compatibility
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024-09-14, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
> Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> I started with a buildroot 2020.02.7 configuration provided by a
>> silicon vendor that used a linaro-6.3.1-2017.02 toolchain.  That
>> worked OK after I manually upgraded a couple packages that were too
>> old to build using my host system's gcc 13.3.
>> 
>> Now I'm trying to upgrade buildroot to 2024.02.6.  First I tried
>> using the same toolchain as above.  That failed. AFAICT, it was
>> because Fortran support was enabled in the toolchain, and BR 2024
>> can't tolerate that unless Fortran support is also enabled
>> somewhere else (it wasn't clear where).
>
> Do you have more details on what happened? [,,,]

Building 2020.02.7 with linaro-6.3.1-2017.02 seems to work fine (after
upgrading m4 and fakeroot to be compatible with host's modern
glibc). Building 2024.02.6 with same toolchain fails. The same
defconfig file is used it both cases.

Here's the tail of the "make" output in the failure case:

    >>> skeleton  Extracting
    >>> skeleton  Patching
    >>> skeleton  Configuring
    >>> skeleton  Building
    >>> skeleton  Installing to target
    WARNING: no hash file for gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf.tar.xz
    >>> toolchain-external-custom  Extracting
    xzcat /home/rzn1/buildroot/downloads/toolchain-external-custom/gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf.tar.xz | /home/rzn1/buildroot/output/host/bin/tar --strip-components=1 -C /home/rzn1/buildroot/output/build/toolchain-external-custom --exclude='usr/lib/locale/*'   -xf -
    rm -rf /home/rzn1/buildroot/output/host/opt/ext-toolchain
    mkdir -p /home/rzn1/buildroot/output/host/opt/ext-toolchain
    mv /home/rzn1/buildroot/output/build/toolchain-external-custom/* /home/rzn1/buildroot/output/host/opt/ext-toolchain/
    >>> toolchain-external-custom  Patching
    >>> toolchain-external-custom  Configuring
    Fortran support is not selected but is available in external toolchain
    make[2]: *** [package/pkg-generic.mk:273: /home/rzn1/buildroot/output/build/toolchain-external-custom/.stamp_configured] Error 1
    make[1]: *** [Makefile:23: _all] Error 2

Buildroot 2020 only gets upset if you've told it that the toolchain
has Fortran support but it actually doesn't:

buildroot-2020.02.7/toolchain/helpers.mk

   369  # Check that the external toolchain supports Fortran
   370  #
   371  # $1: cross-gfortran path
   372  #
   373  check_fortran = \
   374          __CROSS_FC=$(strip $1) ; \
   375          __o=$(BUILD_DIR)/.br-toolchain-test-fortran.tmp ; \
   376          printf 'program hello\n\tprint *, "Hello Fortran!\\n"\nend program hello\n' | \
   377          $${__CROSS_FC} -x f95 -o $${__o} - ; \
   378          if test $$? -ne 0 ; then \
   379                  rm -f $${__o}* ; \
   380                  echo "Fortran support is selected but is not available in external toolchain" ; \
   381                  exit 1 ; \
   382          fi ; \
   383          rm -f $${__o}* \
   384  

In buildroot-2024, you're not allowed to have Fortan support in your
toolchain unless you've told BR 2024 about it:

buildroot-2024.02.6/toolchain/helpers.mk

   376  #
   377  # Check that the external toolchain supports Fortran
   378  #
   379  # $1: cross-gfortran path
   380  #
   381  check_fortran = \
   382          __CROSS_FC=$(strip $1) ; \
   383          __o=$(BUILD_DIR)/.br-toolchain-test-fortran.tmp ; \
   384          __HAS_FORTRAN=`printf 'program hello\n\tprint *, "Hello Fortran!\\\n"\nend program hello\n' | \
   385                  $${__CROSS_FC} -x f95 -ffree-form -o $${__o} - 2>/dev/null && echo y`; \
   386          rm -f $${__o}* ; \
   387          if [ "$${__HAS_FORTRAN}" != "y" -a "$(BR2_TOOLCHAIN_HAS_FORTRAN)" = y ] ; then \
   388                  echo "Fortran support is selected but is not available in external toolchain" ; \
   389                  exit 1 ; \
** 390          elif [ "$${__HAS_FORTRAN}" = "y" -a "$(BR2_TOOLCHAIN_HAS_FORTRAN)" != y ] ; then \
** 391                  echo "Fortran support is not selected but is available in external toolchain" ; \
** 392                  exit 1 ; \
   393          fi \

I don't really understand the reasoning behind that.  Why would the
unannounced presence of Fortran support in the toolchain be a problem
that should cause the build to fail?

FWIW, my defconfig file contents are below

BR2_arm=y
BR2_cortex_a7=y
BR2_DL_DIR="$(TOPDIR)/../downloads"
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/arm-linux-gnueabihf/gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf.tar.xz"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux-gnueabihf"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_6=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
BR2_PACKAGE_BUSYBOX_CONFIG="$(BR2_EXTERNAL_RZN1_PATH)/board/rzn1/busybox.config"
BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_RZN1_PATH)/board/rzn1/rootfs_overlay"
BR2_ROOTFS_POST_BUILD_SCRIPT="$(BR2_EXTERNAL_RZN1_PATH)/board/rzn1/postbuild.sh"
BR2_PACKAGE_MTD=y
BR2_PACKAGE_MBEDTLS=y
BR2_PACKAGE_JSON_C=y
BR2_PACKAGE_LRZSZ=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_OPKG=y
BR2_PACKAGE_NANO=y
BR2_TARGET_ROOTFS_JFFS2=y
BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
BR2_TARGET_ROOTFS_SQUASHFS=y
BR2_TARGET_ROOTFS_UBI=y
BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=198
BR2_TARGET_ROOTFS_UBIFS_OPTS="-F"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
