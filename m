Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C06CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 145C8413F6;
	Thu, 27 Nov 2025 20:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYYupMVgkKCZ; Thu, 27 Nov 2025 20:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACFAE413ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACFAE413ED;
	Thu, 27 Nov 2025 20:02:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 800B3708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71B6E40420
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cpzl8ZPPeyxa for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:02:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5AFEA4023A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AFEA4023A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AFEA4023A
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:02:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 78D4DB979CE5; Thu, 27 Nov 2025 21:02:30 +0100 (CET)
Message-ID: <ba7fe043-c1b5-4245-a142-9e6fd562e720@rnout.be>
Date: Thu, 27 Nov 2025 21:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yi Zheng <goodmenzy@gmail.com>, buildroot <buildroot@buildroot.org>
References: <CAJPHfYOf7dNbKiJ4W_MpOUF3h4s-2_LuSph_LrbRC3VHW5JFFw@mail.gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <CAJPHfYOf7dNbKiJ4W_MpOUF3h4s-2_LuSph_LrbRC3VHW5JFFw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273750; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=tyrjuRVoI4cDuWYnM/MHkXKYEaIdPDreEszGneWTNks=;
 b=VGDvrOzWjLdtXpEX9rtXZq7ntnWyxycJHz6jgNBaiYzRHwE+vnzOi6OqBQlpoIjMgMxp8d
 udVv4eRgMd41dRzrK/10SWkukid94Nvpb0weoBQXau/3hIxaT4w2Q7d4trejKftXnYQaNr
 g8PnneaThQckHSnZx7kL24/Q11mD+/p9J+T7YiZNMmnfV62k+H2CD4+Ka+4xQrOGzF6SRn
 ZuEDNuaC5TFWpdFXfp6v/Iqd20M1PMq3F87RTuZQ6xl0v3eXQXv7/NDOocaTzAzqoFlGUr
 pJuG+EFS/+xXyu6cwEXdaDmRf3mrXXl8iggVJvbFTMVNd3bJi5MfgP3rKKx50A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VGDvrOzW
Subject: Re: [Buildroot] fs/squashfs/Config.in typo, arm arch-name
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



On 18/11/2025 06:24, Yi Zheng wrote:
> BR_aarch64 is not defined. it seems should be BR2_aarch64
> 
> i can not access gitlab freely, so the only way to report bug is a mail.
> Sorry.
> 

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
> fs/squashfs/Config.in | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
> index 4f898bfdd4..cb2f5ec969 100644
> --- a/fs/squashfs/Config.in
> +++ b/fs/squashfs/Config.in
> @@ -114,7 +114,7 @@ config BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS
>         default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
>         default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_LZO
>         default "-Xhc" if BR2_TARGET_ROOTFS_SQUASHFS4_LZ4
> -       default "-Xbcj arm,armthumb" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ
> && (BR2_arm || BR_aarch64)
> +       default "-Xbcj arm,armthumb" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ
> && (BR2_arm || BR2_aarch64)
>         default "-Xbcj powerpc" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ &&
> (BR2_powerpc || BR2_powerpc64)
>         default "-Xbcj sparc" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ &&
> (BR2_sparc || BR2_sparc64)
>         default "-Xbcj x86" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ &&
> (BR2_i386 || BR2_x86_64)
> --
> 2.51.2
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
