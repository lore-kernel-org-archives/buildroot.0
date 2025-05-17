Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C11EC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 223D78123E;
	Sat, 17 May 2025 10:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bg0NW2pcU__Z; Sat, 17 May 2025 10:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4154B812B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4154B812B6;
	Sat, 17 May 2025 10:07:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 209661DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11D6F6080C
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8XVDeRtLKpM for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:07:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39DDA607C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39DDA607C4
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39DDA607C4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:07:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E05CD1C05C0; Sat, 17 May 2025 12:07:10 +0200 (CEST)
Message-ID: <5a24e1fc-0a4c-4388-bf47-cbbf3f6fb9cb@rnout.be>
Date: Sat, 17 May 2025 12:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1747241900.git.yann.morin.1998@free.fr>
 <223330b5594d5cf2be499bb693578d369fd890d1.1747241900.git.yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <223330b5594d5cf2be499bb693578d369fd890d1.1747241900.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747476431; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BeT+tTKufT1XZ2g8ahEyAPWZy7meGfzY10YvHnZ+8HU=;
 b=pPwqfZHNWGgnsZuNvR2z7uPx/onNM0IYz3wsBFeEGVZMmvwfPjzae/wIZHXFeyOYF/TWOL
 DAcR+3WnXhpKXZxbtmFdLBMv6gGgI0qu/a031nRhgI69atkTKNE7iWkY9HjKrraMwP/Rxd
 GnDgUtyjOoa1Hq9ZSOdT/isNli7kfwXhcmzQLpo1e9itORGf+IeUxmOTVF7g1RktRuVMKG
 6ton69akSRiGCmet5UFzy8MNSmoBsoqP01j+BcIb9Kyh5yjgwSskhZS33wLUFqmzLUIGc5
 RBEP1dlvTA3PN0/Sym/09IxWyOeJPcgwcQYMmIorwPnRskTXL5d3xmyx6crdzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=pPwqfZHN
Subject: Re: [Buildroot] [PATCH 01/13] system: reword merged-usr prompt
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



On 14/05/2025 18:58, Yann E. MORIN wrote:
> The current pro;pt is overly verbose, and departs from the usual
> terminology used to refer to merged /usr, which, 10 years later [0],
> makes it a little bit difficult to find or understand.
> 
> Furthermore, we're going to add another similar prompt for merged
> /usr/sbin, and there's no way we want to introduce as similarly
> convoluted prompt then.
> 
> Reword the prompt for the merged /usr option to the explicit "merged
> /usr" everyone expects and understands.
> 
> [0] see commit c5bd8af65e50 (system: add options for /bin /sbin and
> /lib to be symlinks into /usr)
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle <arnout@mind.be>

> ---
>   system/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 8ff6c7213e..f747fdbc56 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -336,7 +336,7 @@ config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
>   	  Support extended attributes handling in device tables
>   
>   config BR2_ROOTFS_MERGED_USR
> -	bool "Use symlinks to /usr for /bin, /sbin and /lib"
> +	bool "Merged /usr"
>   	help
>   	  If you say 'n' here, then /bin, /sbin and /lib and their
>   	  counterparts in /usr will be separate directories. This

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
