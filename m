Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EF9CA0EDC
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 21:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8593841D5F;
	Tue, 12 Aug 2025 21:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qY1xr6SdLWZF; Tue, 12 Aug 2025 21:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B67DD41D9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B67DD41D9C;
	Tue, 12 Aug 2025 21:47:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E20951B5
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4D1B40107
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ucXDPljYvAnW for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 21:47:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 239AD4008F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 239AD4008F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 239AD4008F
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:47:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0158B13F89A;
 Tue, 12 Aug 2025 23:47:23 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 Aug 2025 23:47:23 +0200
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 23:47:23 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250812073645.2072147-1-peter@korsgaard.com>
References: <20250812073645.2072147-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1ddd100e616642cf96c80f8c1b21e4a2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755035245;
 bh=Fk/j0GWnQNwA5UkqkQYwSuVXJxmble0sYDDl53ujSlE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FOjAkFwCfORKnLzTlU7Dfn0l184SalsNtCjZiavrcsv8b+WCw/XlsAYJ2nJX+51ef
 zYArDDwfEwz30YZBSO3imXbeHvjZMDQthol0zFxlZ/u6KdbQrSIPHhyT3JtLtQghTY
 wsrTVzQYCUIieAtT635Uh7utg7uhnWsVzoT13MPJkgDwrVBeF475nIY+TEMoKx6Z2s
 DKssg5H9zvNHMIL2/GFbxqQR4vRuMurBE2xJO25KiFIKkuGM5WoUyfiX/wT6Q8N240
 sua3l4D81g6pIK4kdwfitOZ+oiOcRdcx/G/hntakZcsx8X3Z124CvcQDSQlukG6QUM
 Ry9ni6YJJLXbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FOjAkFwC
Subject: Re: [Buildroot] [PATCH 1/3] Makefile: release: make manual build
 reproducible
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

On 12/08/2025 09:36, Peter Korsgaard wrote:
> The manual contains build timestamps like:
> 
> Buildroot 2025.08-rc1 manual generated on 2025-08-12 06:43:37 UTC
> 
> Making it not reproducible.  Luckily asciidoc respects 
> SOURCE_DATE_EPOCH, so
> use that to use the timestamp of the latest git commit instead.
> 
> Notice: The release and manual targets are marked as noconfig targets 
> (and
> need to stay like that for make release), so we cannot use the
> BR2_REPRODUCIBLE logic.  Instead manually set SOURCE_DATE_EPOCH.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
