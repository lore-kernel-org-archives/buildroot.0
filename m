Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FE5CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1688B40953;
	Sat, 30 May 2026 12:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1SzGrjKrsjA; Sat, 30 May 2026 12:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20BD940810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780145772;
	bh=4WByyexcLEozg4cQl9sBaFuZq/GoE2md/nQ3qM+H4u4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R/mBMw9Lk1vY9ks/WxpIdYdqD1bmHI4TRkKAXpQNcajZoPrRYeWdHrtf0nmLREdTb
	 xuc7FtujDl0sTq+1/JHym27Gz6Tv5z39qWaf0x/AxEqhE6oNYX/bWi01JGcRBx5EvS
	 kdvkj6WYO6U5Lc69WGN6TIAC1Iux1Y4rwG7XS23vhDB/D6Pqv2gJ+pL+RDnpWRImy9
	 ZEGOcyCJfJj+7eBgHLz+h6FDPjfTJ7LO2HCZdZMZEoxrclgQrFgC2vly/iUW21g40c
	 O4bmnvK5Pzx0FVMfX7pA+DrlJ+AEC7nS2UrS9EDsuPVHFDD1IuJKH2IBoYZG+rY6+U
	 S6EQK/IKGTgkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20BD940810;
	Sat, 30 May 2026 12:56:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7F59D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DA8C407FD
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bCMsDP8SBNn for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:56:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C200407A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C200407A3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C200407A3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 78780B97C6E0; Sat, 30 May 2026 11:38:06 +0200 (CEST)
Message-ID: <4e9ce8c7-0add-487a-a699-3e4d0fdbb422@rnout.be>
Date: Sat, 30 May 2026 11:38:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Chen Pei <cp0613@linux.alibaba.com>,
 Kory Maincent <kory.maincent@bootlin.com>
References: <20260518185248.237609-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260518185248.237609-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780133888; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=2T+Hdecklpj9ll+td5njqmnghvtQfKLslkFeKLUcoII=;
 b=T8pxs3+jeCyPZ2g+g21uPvAlOQoigwrCUq1Bi+ypmzwlkqSki4LNxdk/J+eakBMj/wpJL1
 lEZdL5HP0QbU4XB6WrjbB8smXxYFLQ1gFMTeyC6DgU9rc49aNoS0Er5+70tyvRKFBu41B0
 9aEv4Lf10/RrssrnfTGI5pWB+td4Se1f9Lt2YJt4+wu9D3Sq/qhX/GIBr4Z9tu6ojjU8BM
 +MyTVAlrvQICgXgaAGsvdK0IF7ErCaB+g6iEhSTWEjxrkY6qmCwHSFYLPtobXJCqfk9zRH
 mF75+w0sbGqd+7gBrW45mKAIE6x2OeC8KoDLWUUY9ukWwAY1c4Zm+MUM8N9spQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=T8pxs3+j
Subject: Re: [Buildroot] [PATCH 1/2] package/drm-info: propagate json-c
 dependencies
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



On 18/05/2026 20:52, Julien Olivain via buildroot wrote:
> Fixes:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_JSON_C
>    Depends on [n]: BR2_TOOLCHAIN_HAS_SYNC_4 [=n]
>    Selected by [y]:
>    - BR2_PACKAGE_DRM_INFO [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/drm-info/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/drm-info/Config.in b/package/drm-info/Config.in
> index 49b8fd6f2c..1a6e11e696 100644
> --- a/package/drm-info/Config.in
> +++ b/package/drm-info/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_DRM_INFO
>   	bool "drm_info"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
>   	select BR2_PACKAGE_JSON_C
>   	select BR2_PACKAGE_LIBDRM
> @@ -9,4 +10,5 @@ config BR2_PACKAGE_DRM_INFO
>   	  https://gitlab.freedesktop.org/emersion/drm_info
>   
>   comment "drm_info needs a toolchain w/ threads"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
