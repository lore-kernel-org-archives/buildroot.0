Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056D4E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 21:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAFFB60740;
	Tue,  7 Jan 2025 21:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHNOUwpfw674; Tue,  7 Jan 2025 21:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C811C60723
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C811C60723;
	Tue,  7 Jan 2025 21:58:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 022B41EB8
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3B3B40120
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upWh4LtNWp6g for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 21:58:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B89140421
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B89140421
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B89140421
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:58:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2D1332003C3;
 Tue,  7 Jan 2025 22:58:11 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36630])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Jan 2025 22:58:11 +0100
MIME-Version: 1.0
Date: Tue, 07 Jan 2025 22:58:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
In-Reply-To: <20250106101809.787854-1-buildroot@heine.tech>
References: <20250106101809.787854-1-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.9
Message-ID: <63e3f54cc29b544414af872bb8d776be@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736287092;
 bh=B1jX3R3r1II3FwFZ3R1dXU+pnE6yaCEnYsVRQUdIfH4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nceOFzpT4jQhaWXGH3zFShaRYdOkBPRjpsGyXkohoP84oZlgjPZtjGeSFi7brDbiF
 oGJnKQZwHAtQzo8ubeXNGRJBMS7Fg/E1kOWJySI5kRglkN30HL4+SQPMjiCbUi600F
 LJK9FeaxpIFysJDi4sengTlo6Yk5GEbEQ7pyMhj/mNOhVQMfsc/UujOp7owpBnX+ev
 uro3/BRFP1IIAh8Iv6meOggLggSJ4izXg5HRiWMFhJaIvhNtbxDRQGxRoNgjFqZBXk
 BR5FBBKPtDiCmtOjsueCxBcH5y2PhzlMZVD9G+3yD5OmzWSppIYrdvciv3gygQmuJX
 02y6JJZxnymeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nceOFzpT
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.8.0
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

On 06/01/2025 11:17, Michael Nosthoff via buildroot wrote:
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
For info, I added a link to the release note in the commit log.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
