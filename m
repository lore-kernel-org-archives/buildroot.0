Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B52FC021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 13:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A85760A81;
	Sun, 23 Feb 2025 13:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eh5rLnWNoSL3; Sun, 23 Feb 2025 13:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44F5360AF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44F5360AF6;
	Sun, 23 Feb 2025 13:34:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AC71943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B4F840296
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XJqsjmm2KTH for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 13:34:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0297C40204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0297C40204
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0297C40204
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:34:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 33F79780506;
 Sun, 23 Feb 2025 14:34:28 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 14:34:28 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 14:34:28 +0100
From: Julien Olivain <ju.o@free.fr>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250218094251.608607-1-eagle.alexander923@gmail.com>
References: <20250218094251.608607-1-eagle.alexander923@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <4d5cbee055f35a5f09f4c2798c1ffa02@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740317669;
 bh=warIOdSS/klLhNFrPBWD9tsdv/VkY0ohzv9lB2aok/c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j9zqyy/9pWtwzuQh/wMOe45xTcDvGO/CkYTXlDkJBLco+/uAV47F+uR5XYbFhTaiO
 TvfdSB5ydGjBKGFoXb9BySA60nFUyCn3gmDl55x63ELNJS25uasnhaf+J4AI8q0jJn
 FNpHsng3RuAWuQjauM+WGLMe5iFfRZMZYmbSSi+S5pGZy6o/5YyuumoA2SCROluIdu
 OOH3S2lIJee5P3KxJ5x91cevjRdfqY425M9gCSK2HJ2S7KMRAClZqN18LQOlyJaCBR
 dUWCLMx/qnAr7GWZy5xLuLRYfeG3AXLm7puwppQG+iRI+r4rIu7Ka2Ex5Sy8NMx7Gd
 6L4CnpJ8zY50w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j9zqyy/9
Subject: Re: [Buildroot] [PATCH] package/kodi: Do not select
 BR2_PACKAGE_LIBDISPLAY_INFO unconditionally
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexander,

Thanks for the submission.

On 18/02/2025 10:42, Alexander Shiyan wrote:
> BR2_PACKAGE_LIBDISPLAY_INFO is selected unconditionally when
> the symbol BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM is evaluated.
> Let's use it only if BR2_PACKAGE_KODI opyion is selected by the user.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>

A similar patch has been merged in:
https://gitlab.com/buildroot.org/buildroot/-/commit/64b2f03f5a2e35b7ab873d6f7db64735a0567d59

I'll just mark this one as "Handled Elsewhere".

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
