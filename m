Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE41C021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 11:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 042606068F;
	Sat, 22 Feb 2025 11:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGXnOF_nN8mj; Sat, 22 Feb 2025 11:02:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136DE606F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136DE606F2;
	Sat, 22 Feb 2025 11:02:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42853F11
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 11:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 398FA40678
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 11:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRAIToGYxCiB for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 11:02:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E85D140670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E85D140670
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E85D140670
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 11:02:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D29DAB00585;
 Sat, 22 Feb 2025 12:01:58 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Feb 2025 12:01:58 +0100
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 12:01:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20250222104220.1342617-1-peter@korsgaard.com>
References: <20250222104220.1342617-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <aa80028528c0952a26047e4716a72c7d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740222121;
 bh=E3aI0DgaysBVm5/ClbgN4bdopcIz/TCRpusoBhlS6Ts=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eEEhBSgOAt96BpP9pv8LPYMthQiYcS88u+EtGoT/QCWxXmh6IgDt3ASccCwhS7c/B
 ICpAsSEWVPSz1z3UEfz/bHhnAzD1ZSG8YgoHr6ym/3/eePp01pdWdKp75SURvgch7/
 psErb9zxxF9/xkScfB0dcIX2oyPTvVVJlWu/e1m4W0IdDYUjqnuQBvOeYgUsi7oYH4
 zSLotG+ho5ikK+wggVDuRhxsIDO8foBk9RyTPtSSeYbhnWWX6MaEgNNw17CuzxzK9U
 syuMfuk7CvSLcJxdZdmbrg4LtxVMdG7a/xJthjB0LmCW14syBBu7qiP0ZhobIxhmHD
 yyn3aSXyHz0Rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eEEhBSgO
Subject: Re: [Buildroot] [PATCH] package/libxml2: security bump to version
 2.13.6
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

On 22/02/2025 11:42, Peter Korsgaard wrote:
> Fixes the following security vulnerabilities:
> 
> [CVE-2024-56171] Use-after-free in xmlSchemaIDCFillNodeTables
> https://gitlab.gnome.org/GNOME/libxml2/-/issues/828
> 
> [CVE-2025-24928] Stack-buffer-overflow in xmlSnprintfElements
> https://gitlab.gnome.org/GNOME/libxml2/-/issues/847
> 
> Null-deref in xmlPatMatch
> https://gitlab.gnome.org/GNOME/libxml2/-/issues/861
> 
> https://www.openwall.com/lists/oss-security/2025/02/18/2
> 
> Drop now upstreamed patches:
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/fc72e0833a4e5724aef604e2fd9adb1014cb4844
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/539663626b91567159a70791c0f2b3b167135e9b
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
