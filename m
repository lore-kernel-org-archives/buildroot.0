Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AFEC83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 23:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37CB741101;
	Mon, 28 Jul 2025 23:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uS6CERRj_yJ; Mon, 28 Jul 2025 23:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 581FB410C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 581FB410C4;
	Mon, 28 Jul 2025 23:03:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC04215C
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DA1A410C4
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ep5T2e5gMRTw for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 23:03:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB3A2410A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB3A2410A6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB3A2410A6
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:03:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EF2B7B00563;
 Tue, 29 Jul 2025 01:03:44 +0200 (CEST)
Received: from [192.214.236.6:44558] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Jul 2025 01:03:44 +0200
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 01:03:44 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250727095526.1006204-1-thomas.perale@mind.be>
References: <20250727095526.1006204-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <b91af82817807676caa11f7b6a4a9fe9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753743826;
 bh=DBUwRkRGMWqv+eQNX4lDtGNjg9sUuDfKPZ+MvvyWvC4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gd3PO2ucmbLy9eR4CgZ5QI5c8TTbHAhhMTOUcYWBHjti1Sjsg62xcykdJlyv+r0y/
 NeZP/v8FUcf4NVlBp6CPkX4RqUTmpv9Wa4dLKR08vE2bPvN0CGmmkTVtzPx4rvZezy
 eL8l8yeUbPM8fq8rLKXp6rFl+lWtMWLtubP+Yq4Qi8FNmMdp43E+AwNk/KmlMpEeOe
 L4ggMCePdcEWVivuAs7gWJ1Fp0TJ/DiqbKmgJjJ/X8enZ2HXPv90V1U1TVnF5eNIn9
 Ei93s3k0WnxDR1l2wMuIE9Uye19fDJbWUdzMsdPqceL8ynXOG029/XJ9oow2FG8+DT
 5T3H0aZVW3FlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gd3PO2uc
Subject: Re: [Buildroot] [PATCH 1/3] package/orc: add CPE identifier
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

On 27/07/2025 11:55, Thomas Perale via buildroot wrote:
> The cpe:2.3:a:gstreamer:orc:0.4.34:*:*:*:*:*:*:* is
> valid for this package.
> 
> See 
> https://nvd.nist.gov/products/cpe/detail/37DFA009-0707-4825-B28A-62451B1E2AFC
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
