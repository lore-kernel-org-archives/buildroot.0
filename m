Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB61C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 10:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA95B4149F;
	Sun,  6 Aug 2023 10:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA95B4149F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GuMOK8O7xARZ; Sun,  6 Aug 2023 10:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D07C4139E;
	Sun,  6 Aug 2023 10:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D07C4139E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C49C41BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 10:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35915605EA
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 10:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35915605EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ivjEwRpXyyCY for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 10:49:48 +0000 (UTC)
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 846F260A91
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 10:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 846F260A91
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id B006C4406E6;
 Sun,  6 Aug 2023 13:49:26 +0300 (IDT)
References: <20230806102554.46261-1-thomas.petazzoni@bootlin.com>
 <20230806102554.46261-3-thomas.petazzoni@bootlin.com>
User-agent: mu4e 1.9.21; emacs 28.2
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 06 Aug 2023 13:47:41 +0300
In-reply-to: <20230806102554.46261-3-thomas.petazzoni@bootlin.com>
Message-ID: <878rao78e2.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1691318966;
 bh=rZDFkbxH9ojj9HXTG/+gzHy4xjrTlx5c6tUuGforxhE=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=TjTgg7j0tUvFsKK1hwmCkz8cCIUqEKptHM7nZBMrHkf0WWQFWkCudywN3y31JpHfK
 /lkWJJmyBo+dM2nZPEACeJm+RhdrCUSEaGMg0SvJqsmkxms8NTmxGnfLCOAW5LsCLs
 VLzwnXnCRF8a+fBHxfm19rikr3zU5DZiNMRrsG/VulL/s5XIKRobDg39MRyVvZxH/G
 2Rzelb7cg4gOM4pqfbzoTxX+SmK49FW9rRLlSYT7WVzTx4QJr8xqSlMQajo11JsUp+
 qX3axaPWdBiLfQK55YwRNZE4AUsTvusqANUqi4DRRZKrak9XT9Ljkan7FPWWsECvFM
 2s/SpN4mwL+bQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=TjTgg7j0
Subject: Re: [Buildroot] [PATCH 3/3] package/elf2flt: fix build with
 binutils >= 2.41 due to libbfd location
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sun, Aug 06 2023, Thomas Petazzoni via buildroot wrote:
> elf2flt needs to link against libbfd.a and libiberty.a which are
> provided by host-binutils, but not installed, so we poke directory
> into the host-binutils build directory. While not very nice, it has
> already been like this for a long time. We could build host-binutils
> with --enable-install-libbfd and --enable-install-libiberty so that
> those libraries are installed, but we prefer to do this separately,
> and there is a serious potential for perturbations to other packages
> by having libbfd/libiberty installed in $(HOST_DIR).
>
> In the mean time, an issue of poking directly into the host-binutils
> build directory is that the location of libbfd.a has changed in
> binutils >= 2.41, so we special case binutils 2.39 and 2.40, which are
> the two remaining versions still using the "old" path".
>
> Note: the ARC-special binutils version is not considered because
> Buildroot only supports ARC CPUs with a MMU and therefore host-elf2flt
> is never used on ARC.
>
> Fixes:
>
> gcc: error: /builds/buildroot.org/toolchains-builder/build/output/build/host-binutils-2.41/bfd/libbfd.a: No such file or directory
>
> When build host-elf2flt against host-binutils 2.41.
>
> This issue is not visible in the autobuilders as it is hidden by the
> BFD_VMA_FMT issue fixed in the previous commit.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/elf2flt/elf2flt.mk | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
> index 6cd0786c3d..a524b1b737 100644
> --- a/package/elf2flt/elf2flt.mk
> +++ b/package/elf2flt/elf2flt.mk
> @@ -14,12 +14,27 @@ HOST_ELF2FLT_DEPENDENCIES = host-binutils host-zlib
>  # 0001-elf2flt-handle-binutils-2.34.patch
>  HOST_ELF2FLT_AUTORECONF = YES
>  
> +# elf2flt needs to link against libbfd.a and libiberty.a which are
> +# provided by host-binutils, but not installed, so we poke directory

s/directory/directly/, I believe.

The same issue in also the commit log above.

baruch

> +# into the host-binutils build directory. Turns out that the location
> +# of libbfd.a has changed in binutils >= 2.41, so we special case
> +# binutils 2.39 and 2.40, which are the two remaining versions still
> +# using the "old" path". Note: the ARC-special binutils version is not
> +# considered because Buildroot only supports ARC CPUs with a MMU and
> +# therefore host-elf2flt is never used on ARC. libiberty.a has
> +# remained at the same location.
> +ifeq ($(BR2_BINUTILS_VERSION_2_39_X)$(BR2_BINUTILS_VERSION_2_40_X),y)
> +HOST_ELF2FLT_LIBBFD_PATH = $(HOST_BINUTILS_DIR)/bfd/libbfd.a
> +else
> +HOST_ELF2FLT_LIBBFD_PATH = $(HOST_BINUTILS_DIR)/bfd/.libs/libbfd.a
> +endif
> +
>  # It is not exactly a host variant, but more a cross variant, which is
>  # why we pass a special --target option.
>  HOST_ELF2FLT_CONF_OPTS = \
>  	--with-bfd-include-dir=$(HOST_BINUTILS_DIR)/bfd/ \
>  	--with-binutils-include-dir=$(HOST_BINUTILS_DIR)/include/ \
> -	--with-libbfd=$(HOST_BINUTILS_DIR)/bfd/libbfd.a \
> +	--with-libbfd=$(HOST_ELF2FLT_LIBBFD_PATH) \
>  	--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
>  	--target=$(GNU_TARGET_NAME) \
>  	--disable-werror


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
