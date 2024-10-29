Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A914D3A66D
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 15:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 190D260871;
	Tue, 29 Oct 2024 15:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqP9NBH9seHe; Tue, 29 Oct 2024 15:51:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C771B60851
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C771B60851;
	Tue, 29 Oct 2024 15:51:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DBA634EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 15:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDA9980CD2
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 15:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rp16pTW-xynL for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 15:51:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B2B9180D18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2B9180D18
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2B9180D18
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 15:51:51 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7B3DE2C8301E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:51:49 +0100 (CET)
Message-ID: <f3ea39a0-ec59-461c-bbf8-e2b561bd284e@bubu1.eu>
Date: Tue, 29 Oct 2024 16:51:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241029154911.3268784-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20241029154911.3268784-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1730217109; bh=SYy2jyhXmFOhYXungWicrw37UztysAKYcIcYNJTlObw=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=kUbduy5Ngau0vuba2qxCT/aM7bbCZ4Ex/T4SD7xeva9GRy66dSzvdWiRZnJsak+P7
 8ZrtU4mtsqCqQfvSjz0M+CFIsOS+lGxavceXG9xMut0n8bV0OqBuMnKQK1ZcRez6K4
 VnKGFmX6R2mtqXc7LpLxrIASVdMoPUKfY4rIbTMJaTs3iqhxDunasax14aHTJ5+5tV
 9blpW8zaK2DmEF8PpD9iyKyt+l0uDKJvFcJ8pAt5fSTwYQnruf6QRACgh0OkpzQzry
 VUpKKBHEg5gwm8+Xqvt0Whzi9xB4kMq4/j7XP6p1IRuYAEcOlODA+m9FFSRHxsJQa5
 +l6XpO/BNv/PQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=kUbduy5N
Subject: Re: [Buildroot] [PATCH] package/nghttp2: bump to 1.64.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29.10.24 16:49, Marcus Hoffmann via buildroot wrote:
> Changelog:
> * https://github.com/nghttp2/nghttp2/releases/tag/v1.59.0
> * https://github.com/nghttp2/nghttp2/releases/tag/v1.60.0
> * https://github.com/nghttp2/nghttp2/releases/tag/v1.61.0

Turns out that this fixes a security issue:

Fixes: CVE-2024-28182 [1] - Reading unbounded number of HTTP/2
        CONTINUATION frames to cause excessive CPU usage

[1]: 
https://github.com/nghttp2/nghttp2/security/advisories/GHSA-x6x3-gv8h-m57q

> * https://github.com/nghttp2/nghttp2/releases/tag/v1.62.0
> * https://github.com/nghttp2/nghttp2/releases/tag/v1.63.0
> * https://github.com/nghttp2/nghttp2/releases/tag/v1.64.0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>   package/nghttp2/nghttp2.hash | 2 +-
>   package/nghttp2/nghttp2.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
> index dddf6fe1bd..4b60d6d143 100644
> --- a/package/nghttp2/nghttp2.hash
> +++ b/package/nghttp2/nghttp2.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  4a68a3040da92fd9872c056d0f6b0cd60de8410de10b578f8ade9ecc14d297e0  nghttp2-1.58.0.tar.xz
> +sha256  88bb94c9e4fd1c499967f83dece36a78122af7d5fb40da2019c56b9ccc6eb9dd  nghttp2-1.64.0.tar.xz
>   sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
> diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
> index 7a05e38fa9..98f837e28e 100644
> --- a/package/nghttp2/nghttp2.mk
> +++ b/package/nghttp2/nghttp2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NGHTTP2_VERSION = 1.58.0
> +NGHTTP2_VERSION = 1.64.0
>   NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
>   NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
>   NGHTTP2_LICENSE = MIT

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
