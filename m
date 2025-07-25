Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A745EC87FCE
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 16:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BF0360826;
	Fri, 25 Jul 2025 16:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7kDqBOosNuT; Fri, 25 Jul 2025 16:43:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B071960A68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B071960A68;
	Fri, 25 Jul 2025 16:43:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48F7D1D9
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 16:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A8A241CA0
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 16:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NEMEwJT8jy7s for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 16:43:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 062F241D31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 062F241D31
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 062F241D31
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 16:43:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9101B19F749;
 Fri, 25 Jul 2025 18:43:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Jul 2025 18:43:39 +0200
MIME-Version: 1.0
Date: Fri, 25 Jul 2025 18:43:39 +0200
To: Nathaniel Roach <nroach44@nroach44.id.au>
Cc: buildroot@buildroot.org, Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20250724144342.2090731-1-nroach44@nroach44.id.au>
References: <20250724144342.2090731-1-nroach44@nroach44.id.au>
User-Agent: Webmail Free/1.6.11
Message-ID: <97605c987fcc827a28b0ddcf9297a8d2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753461825;
 bh=NL4h/788sgUOfGUO6HufU5yoKrmyd+KnQMW2yLDlIXs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OBW8sruNfnjVjF9efzgznglEHHv5mV4EObPGWTQW1yfj8MS6yZGElmiylKixd8hw1
 XlCajfg1SatscsB1uA3P/lPUjQG7ejLqdHXU5TD6i8WQV6I5SdVQZeompBO/aYuvMC
 wnt4PAh9ccpjnuKRdQuMc1AqRQDhTDVwC9Q9nq3r/pPt9ZG0XYXks8XlK/1boHMu8l
 kgMpDeMklfOBYdge9iElLUaKO5r/PRMTW+M4XqdvwwZoKdzwESp4WcsgDJtV2o4uWZ
 NUwar1YG2ui0/c2b2hBL95QnGblzgif9v72sxBUTlePQySW85IhMAGs7bDMxdRt73L
 kw+1sLpPdM9Xg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OBW8sruN
Subject: Re: [Buildroot] [PATCH 1/1] package/petitboot: add patches to fix
 build errors with "opaque" ncurses
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

On 24/07/2025 16:43, Nathaniel Roach via buildroot wrote:
> ncurses from 6.4.20231021 enables "NCUSES_OPAQUE_MENU", which hides
> some parts of the code away from the application. This causes
> petitboot to fail building in a few spots where it tries to directly
> access the name of the menu item.
> 
> These two patches were submitted to the petitboot mailing list by
> Nicholas Piggin [1] resolve this issue using accessors, or by making a 
> new item.
> 
> This has been raised upstream but not yet applied [2].
> 
> [1]: 
> https://lists.ozlabs.org/pipermail/petitboot/2024-February/thread.html#1545
> [2]: https://github.com/open-power/petitboot/issues/106
> 
> Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
> Fixes: 
> https://autobuild.buildroot.org/results/bf1/bf173e1e0f8ad3f40534aaa358dc40993cd14ac4/build-end.log

Applied to master, thanks.

For info, I did few minor changes, see:
https://gitlab.com/buildroot.org/buildroot/-/commit/1575584f507d2197fb324216ff41c4a768786075

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
