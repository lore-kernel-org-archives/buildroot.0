Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD63C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC541608D9;
	Sun, 18 May 2025 14:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWoQDeKMCLqN; Sun, 18 May 2025 14:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E24A6064D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E24A6064D;
	Sun, 18 May 2025 14:43:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CF111BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 097A040916
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcyTnrW5hqQ3 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:43:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FDAC4092A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FDAC4092A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FDAC4092A
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:43:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 298F31C1001; Sun, 18 May 2025 16:43:44 +0200 (CEST)
Message-ID: <6928279c-3668-459c-b77c-73132a11208d@rnout.be>
Date: Sun, 18 May 2025 16:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250516172258.2692710-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516172258.2692710-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579424; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YiEMLmn3BKegnsZu5Fcbk6iYoT2NEcJJiAvgY5Vu8Ao=;
 b=UrKUhmVbXNcpqi8ghuNVB9PjS5EEnc7iyTUObI+0b/Ig2+jVrerqo5bXC7BZlhkXWswnmS
 6MMlch5FKlsskKDbEcQHJEIgpgSQcZEVELvOctH6puL2q8HBSQTO1rXwAYleZoY6fWRToa
 GzvBvi/NEeu1xOo5TYB6/h47cJeGbZNr8EmnQiBEwBJniNt/CnmMhCaIuQtEMA2IqdslVE
 6MwjFxC7dZElqGci505C0wl6lPtWjBA/IX1ADz28LV8GcT14vzjMcyuLpTkfZ7ZHJIOUB0
 rTJsY2jZ0pZn08w8TYD0m4secmPINI3p74/26ANlmrXT1/zue5aZhSrOEJl7hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=UrKUhmVb
Subject: Re: [Buildroot] [PATCH] fs/erofs: unbreak custom compression
 handling
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



On 16/05/2025 19:22, Peter Korsgaard wrote:
> Fixes:
> https://autobuild.buildroot.net/results/0f856def945b9a863f45f7a58553b62f6875720b/
> 
> Commit a02e43741719 ("fs/erofs: add custom compression option with optional
> compress-hints file") added logic for custom compression, but in fact it did
> not work.
> 
> BR2_TARGET_ROOTFS_EROFS_COMPRESSION_{ALGORITHMS,HINTS} are kconfig string
> variables, so we need to use qstrip rather than strip.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   fs/erofs/erofs.mk | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
> index 6543a364f1..881ecea053 100644
> --- a/fs/erofs/erofs.mk
> +++ b/fs/erofs/erofs.mk
> @@ -11,9 +11,9 @@ ROOTFS_EROFS_ARGS += -zlz4hc,$(BR2_TARGET_ROOTFS_EROFS_LZ4HC_LEVEL)
>   else ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZMA),y)
>   ROOTFS_EROFS_ARGS += -zlzma,$(BR2_TARGET_ROOTFS_EROFS_LZMA_LEVEL)
>   else ifeq ($(BR2_TARGET_ROOTFS_EROFS_CUSTOM_COMPRESSION),y)
> -ROOTFS_EROFS_ARGS += -z$(strip $(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_ALGORITHMS))
> -ifneq ($(strip $(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS)),)
> -ROOTFS_EROFS_ARGS += --compress-hints $(strip $(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS))
> +ROOTFS_EROFS_ARGS += -z$(call qstrip,$(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_ALGORITHMS))
> +ifneq ($(call qstrip,$(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS)),)
> +ROOTFS_EROFS_ARGS += --compress-hints $(call qstrip,$(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS))
>   endif
>   endif
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
