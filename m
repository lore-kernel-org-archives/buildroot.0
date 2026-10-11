Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C38CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 142FC40744;
	Sun, 11 Oct 2026 13:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oEswCGBaXMZ; Sun, 11 Oct 2026 13:11:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 32BF4406ED
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724272;
	b=QXmjwE0/Gw8KjVW+UjJPNJ8FlclfeK8Out1XgyV3bcsM9M2ZQNqL9m7DSIcIe/sgBzqM
	 9ZuQskTCTWnNxdWp/U8aTishJtbBgjUCrr5TgBQtuSoP9OgwjL5NcnasJH64Akez/0ojj
	 7O9K0jTnNigqHTCOsCuLh5JG7CMyahJ3uMUmNUeibDRowWwRz4g0EMSwpJQg/UJRicOO+
	 a31sMtWTq5+Zh8ZcJLzTYYz/NZADRl54+xxqxk6SuQl07ZrQCIl96LEF2v3FQHTEFszkM
	 M/dMlH8yVho9a66E/7FVUMYvl0BimRYMUZpAa/ZVbvoTzYMZQaAPAeAiCFhpvxnzdEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724272;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=j9W3wKgTmKmkV+TWbiCTPTKdki94KekBEesLU+GbAOM=;
	b=ZLMQCdb31JcZMSxWJMOWHMxV/78y0DMOrIm7/TF8rUIJkmZK88XAlwj8XLQHWOw34DMY
	 +cz79kk4KIIYWm1Ii2yy2gBN/1P3LueHqGa2RKecaOrw3dNLuPmXL5W03tFIptCUCl58k
	 mZOycrI9u+TuhCVjbe8ohAG0OJaU+fg5llfEef0AvPKWIdzHi91eftlLKtYsqtvUU97cT
	 jgyg1sB7zJyo1lC0AwNS3RssaewaSsyNpj2BgIZM3NPIW69Ox4fP4jLGCODqVjHGjDTed
	 cp7nyuUAyedqdQr5zL4+gHwRuDKI4HGVf7BLUzHfKW8kjnoiPo+KulylKIYemur7OIA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724272;
	bh=j9W3wKgTmKmkV+TWbiCTPTKdki94KekBEesLU+GbAOM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=fR/2l3dzKHKWW3Ppxoc/maS+fCahCwTMtFjlgTP5ivLEi9ZFSkAxBYjPvQxqJolHA
	 5a+DUSdRJv3vuVqbACtshRcpSP0gu5Psvga/hbmRSoe30H8WlTs05d4CE2o9w5rQDL
	 zo2RFP03QaVzM16T4L24gcuVuda8THFqCrZkxttsENJzVKeDBopTF4JXzSvAys4ZU2
	 S1saouCvSEtLLOYxIJ+Lb1uyNFGTYgKAbk8+LIbQWcF81CxYuznmbnsMpJdLe2/g+e
	 iUddef0BplwgBjW5bqkVehLfjCOOA+sRAPns6sNezu3bfaCJwfCjmHsHc0mvK5fJeq
	 4y7D3teCiia+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32BF4406ED;
	Sun, 11 Oct 2026 13:11:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DCE501A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C221B406ED
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXWCVvKnayMc for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:11:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D0D70406CD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724270;
 b=pH4+hpYq3U08ZNyJoZOrGyiaMvQMYfD7r9p/3QBDbIN9PE7/mj0Uz41+6EJdd+5vki9O
 yzqZYsa1szSSDUcz4wKKCFUJ70Jv+LXYHaOjMrjIbX88LtGL1HX7tW96Mqg9iErGnmseg
 /UEZdDepA0FCOcVV68j/CCtBITBZXmKpyKa1b1LL3FyIpkanXl1bJmHf/wqpSQd1+KM/S
 /j/y2uvqYJklERwwOvk6oWcMDykiYwN9Yb5cgE4okWqmnEZ8MtDvwoB2hPgd6zfn5T1Z1
 UIBvihp4uqkKR+/iasyd37xXiLVnWVn9OA30P/brlPA/ypvuyQnO5BCI2v7WCbtt3Hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724270;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=7otgnoyqaS1angxKuMNZUrMnZh7z2/w+QnECXqkE5e0=;
 b=pM6t4E07rEAgl23toHm9q2/Rw2RbnqyZUvyUFHLM7duCvFP4+RJ8ZXSkDuXs84WTgIzs
 wSpI69YdfPsuBhnK1OCUzyHKSRrO0JIUeW/x2oPyjDtLlFpf8xmk4DUVKJSGIiNH7YOfz
 5At9gKQV12Uhd2VUvgW8jR4aEZVsLibJ6nfQ8QNhx+fbX/X9xBLI5MCOmaPB3k4yMJILV
 4CFlpvu0OJRZQ7n+ak8OlCd+SNZhzcIiSOJTMBoB+rqz0cXa0THFK9nKvpFPUg/isAl6w
 NXnuz3qTmUef+j187vCpzJU8UfyMXvFjD1C5pkXUSs/K6MKkqRqXXs3yW1N2m+D3rEw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=dkfvUGwQ; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0D70406CD
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:11:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 18C4BB97A159; Sun, 11 Oct 2026 15:11:04 +0200 (CEST)
Message-ID: <72a25483-5351-4c39-8973-c57065433de2@rnout.be>
Date: Sun, 11 Oct 2026 15:11:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Corentin Labbe <clabbe@baylibre.com>, buildroot@buildroot.org
References: <20231106123705.311899-1-clabbe@baylibre.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20231106123705.311899-1-clabbe@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] linux: Use the choosen rootfs
 compression type when rootfs is builtin
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Corentin,

  Sorry to come back to this only three years later... You probably don't 
remember anything about this, but I'm replying anyway in case anybody comes back 
on this.

On 06/11/2023 13:37, Corentin Labbe wrote:
> I have built a buildroot with:
> BR2_TARGET_ROOTFS_CPIO_XZ=y
> BR2_TARGET_ROOTFS_INITRAMFS=y
> With this buildroot produces an images/rootfs.cpio.xz but the kernel still use gzip (CONFIG_INITRAMFS_COMPRESSION_GZIP)
> as compression for a plain rootfs.cpio
> 
> Setting CONFIG_INITRAMFS_COMPRESSION_XZ in a linux.fragment does not
> work as it seems the fragment is setup before buildroot set
> CONFIG_INITRAMFS_SOURCE which reset the CONFIG_INITRAMFS_COMPRESSION
> choice.
> 
> So buildroot have to change CONFIG_INITRAMFS_COMPRESSION after setup
> CONFIG_INITRAMFS_SOURCE.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>   linux/linux.mk | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 1db5c6046d..d64ebb5119 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -116,6 +116,14 @@ LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_KERNEL_XZ
>   LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_KERNEL_ZSTD
>   LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_UNCOMPRESSED) += CONFIG_KERNEL_UNCOMPRESSED
>   
> +LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_GZIP) += CONFIG_INITRAMFS_COMPRESSION_GZIP
> +LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_LZ4) += CONFIG_INITRAMFS_COMPRESSION_LZ4
> +LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_LZMA) += CONFIG_INITRAMFS_COMPRESSION_LZMA
> +LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_LZO) += CONFIG_INITRAMFS_COMPRESSION_LZO
> +LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_XZ) += CONFIG_INITRAMFS_COMPRESSION_XZ
> +LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_ZSTD) += CONFIG_INITRAMFS_COMPRESSION_ZSTD
> +LINUX_ROOTFS_COMPRESSION_OPT_$(BR2_TARGET_ROOTFS_CPIO_NONE) += CONFIG_INITRAMFS_COMPRESSION_NONE
> +
>   ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL),y)
>   LINUX_DEPENDENCIES += host-openssl
>   endif
> @@ -378,6 +386,10 @@ define LINUX_KCONFIG_FIXUP_CMDS_ROOTFS_CPIO
>   	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio")

  We still use the uncompressed cpio, so shouldn't we simply set 
CONFIG_INITRAMFS_COMPRESSION_NONE ?

  We could use the compressed image here, but I think it's intentional to use 
the uncompressed one, because normally you still compress your kernel afterwards 
(either as a zImage or in the U-Boot wrapper). This will also compress the cpio, 
so compressing it separately just adds overhead.

>   	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0)
>   	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0)
> +	$(call KCONFIG_ENABLE_OPT,$(strip $(LINUX_ROOTFS_COMPRESSION_OPT_y)))
> +	$(foreach opt, $(LINUX_ROOTFS_COMPRESSION_OPT_),
> +		$(call KCONFIG_DISABLE_OPT,$(opt))

  AFAIK for a choice it's not needed to disable all the other options; the last 
=y option wins anyway (if it is not forbidden by other options).

  I've marked the patch as Changes Requested in patchwork.

  Regards,
  Arnout

> +	)
>   endef
>   endif
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
