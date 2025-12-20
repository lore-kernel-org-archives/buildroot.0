Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6785E668B1
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 15:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BC5540554;
	Sat, 20 Dec 2025 15:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5s2q3DX4VYzb; Sat, 20 Dec 2025 15:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7952740499
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766246036;
	bh=D10lS8SiLME0MEnKIAkWO2TaX9DWA3fa5gsII+vO9hQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kdqScj4MSugO7brxCI9MNkBtD1Kkqrzl9PIuIHNq7bGerj4ya5RjTTJQaC+B7dfY3
	 6AgnOxvrLKtI16JvHdRXJpvbD2dZt0qaJwLO8Z8q1kaG3g18fVd/sDK7HFp+UDQUNW
	 lvaoP9RdXSfLNaMrrrnfg6LCkjlBnwXA2jdi+REf/N3j8Lxz5XQUMRhcNrw2IBK7Zr
	 wg1osaxRLEo4MoMTvGkA5LqYrTBk88U8C+fgnFmDEJW9+duV3Shw7JOIDXziCQtA7I
	 NrIEClYlXedo9SIvfuwv/u+nlyItiQ2qXHIEjceaeLLm6KiIN4Z1q3Nl8TqtsVucZS
	 u3Pne82QXLUaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7952740499;
	Sat, 20 Dec 2025 15:53:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FB2C1A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5580060836
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlsADU7L0XRM for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 15:53:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8AD2160769
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AD2160769
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AD2160769
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:53:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 3CBBE2003CC;
 Sat, 20 Dec 2025 16:53:51 +0100 (CET)
Received: from [37.167.178.5:29268] via [37.167.178.5] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 16:53:51 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 16:53:51 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251215224353.2285071-1-troglobit@gmail.com>
References: <20251215224353.2285071-1-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <c168366abed7a65f7c26bef19eaf7029@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766246032;
 bh=6vcbvoCXkL6YfnjDRJi7GlHY5sAHfLmcKUjOWx3HEys=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XoJ3BEOo5uO3T4sLYZSDG0RmCqOCUpYEdWvwNInzAwATEy+QPOOrp58jwly1H09oS
 3Uh8aawYFa5hWX9gmaZ91w1ZuveqAuA+hRqWEUDLzcv47sLm61vbJQkzThSuHHnFyV
 zVdDgVk7529I4ipaPUMUKDWGUbo0yUJtDf+QdNdg5SBQJQRlk2y64oDARzoq7YLSM3
 OuQVFmF73D4wAKmcVZp03evCk7NVkWnzmdc95OwnzzCcR6M5TLDZoxrh9XHYn3ne8Z
 X/X+iqWhiTCa1R34IJGPvVSAhlA11OqWW7lkSSJbHioEp9edEivIeae6WLNQavXoQa
 freghCcgVBbNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XoJ3BEOo
Subject: Re: [Buildroot] [PATCH 1/1] package/inadyn: bump to v2.13.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/12/2025 23:43, Joachim Wiberg wrote:
> Changes:
>  - Add support for Porkbun DDNS provider
>  - Add support for domene.shop (Norwegian DDNS provider)
>  - Add support for round-robin records to Cloudflare
>  - Add example config for DuckDNS IPv6
>  - Cloudflare: omit proxy setting if unset in config
>  - Cloudflare: omit TTL update if unset in config
>  - Simply.com provider fixed and re-enabled
>  - Support for long ddns-path requests (increased buffer size)
> 
> Fixes:
>  - Do not use an IP resolution method different than the one
>    specified in configuration
>  - Fix support for Namecheap
>  - Fix Dynu IPv6 issue
>  - Default value -1 not used for ttl setting
>  - Fix IPv6 detection for providers with "v6" in their name,
>    e.g., ipv64.net and dynv6.com
>  - Fix dnspod error: "Communication with checkip server failed"
>  - Fix cache directory creation on --help or --check-config
>  - Fix cache directory not writeable and no $HOME
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
