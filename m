Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588FCC36005
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 20:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1924B40934;
	Mon, 24 Mar 2025 20:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W426S-kqHpRC; Mon, 24 Mar 2025 20:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BAB3409BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BAB3409BA;
	Mon, 24 Mar 2025 20:22:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FD13C0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3165740445
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0NGlmkW71TY for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 20:22:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 842D740141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 842D740141
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 842D740141
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:22:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6CDFB2003C3;
 Mon, 24 Mar 2025 21:22:24 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50378])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Mar 2025 21:22:24 +0100
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 21:22:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250323190705.3336274-1-bernd@kuhls.net>
References: <20250323190705.3336274-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <e4cb896cc4b500a0356ce84fd5330e0a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742847745;
 bh=gY/AznjD34nvSiqYLnMLAe1R94YMRgRVkYuL/X/Ja+k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O87Ot2klE0A8V480QRYQh01ATsXjdkb6eadK3Ynztx9xdB0oRSxrdeH9p8SRDtYyu
 i/Oa5AzhmePnUa5E0q0lQzk3Pkki+wSrvRD8/9WdiAERnPrKB9Xj04bZ6QtzJnjtcw
 M+0Mh6XWOlMyWvU8S36/+vy9eHPe1O0f9x+AMyAvfbqGDym6LD0w/2zD6QCcKfAjdY
 2gZ0qHm4M//1kHrqq5hJmOTRY8khGhQ1CJ2etbuwTjez0Mg0wF5sWuhZSW0L4Lsdj/
 WIZ/KecvkooZAKIMyzh8FIxW6DmPpnGtZ3gEHn14jBloep5FFLKfP3uhKgYmKCF3Ja
 hYvc17i2GJM0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O87Ot2kl
Subject: Re: [Buildroot] [PATCH] {linux, linux-headers}: bump 6.{6, 12,
 13}.x series
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

On 23/03/2025 20:07, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
