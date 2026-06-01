Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415BBCD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 146EC4072F;
	Mon,  1 Jun 2026 20:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBONn-xmRpJq; Mon,  1 Jun 2026 20:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69C5A4065F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780345072;
	bh=5eFF3ITC3hFIETmWs34UAhDILpicLsjAA3tkKh7rI0U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kAY6gfsRBGxRtWoSzZGfd7ahj6Y4UKJBT9MAJnK7MSgvGipVen7kwyh9YrZbcYWYG
	 9gr8GDfx41Izho9HHuZxGrfytIn2ulJ9KRyRnjnfBxVNARHyW8bmAMEToNPfT9ahip
	 GwJrNiwCxM21bgzjbIxTYBTdNP7hF8zvOkEMnzzLacNFlGnk4aRtfnCZPKV4Qzh27L
	 vlJCA+H6ibb0kVDWleJW3rUq2FeSrrc1SkrKuke6FAR8Mtog6NlBVD8zUrj9Y37s70
	 y30CJK3CBnPMtuvWL2ADlbLXUJEcLOHuuYmtOJA1aRentF1x5tWxJVtdECjpxMQZSU
	 QOF23TTxwqxZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69C5A4065F;
	Mon,  1 Jun 2026 20:17:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29AFA223
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BCE74015E
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UhY5j3D2WOK for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:17:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E9454015A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E9454015A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E9454015A
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:17:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7761813F8B5;
 Mon,  1 Jun 2026 22:17:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 01 Jun 2026 22:17:45 +0200
MIME-Version: 1.0
Date: Mon, 01 Jun 2026 22:17:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260601192158.3687045-1-bernd@kuhls.net>
References: <20260601192158.3687045-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <978aed3dfbee5f3ad47858e12b76671f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780345066;
 bh=V/zKr9BmV7GmiHsaN8z2sPrwRmbfe+b4Sv9piz25ZyY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TuGCybMxr8g848AS2Jjdx74txNz825uGI/u/CsbJdgFEnnxdMDwHtW/4M//8GtS5Z
 yX8P5HWN8CmdsTICHWZV2U2rdaYcm5YGMMRxtFX9Lu+0+ADQfRpG1Pj7RSIEcthXy8
 CWzCluFYhyu0Zqlu6YxhcWP4aYUbgGi/0yalsVwChRnGhHc1bI9hGdag/+5Fo7wPeA
 oJMQ/GOUJL4gRI/llRIdpkicI1OlIyIsLtbIHzYJEEq+sUaGSWdA+cFtDr4YhwA4UI
 Lt2n7i0FNgio2PSs8/2yIKoj5zYsxQweOSDh2v7jjUB0Kn1ZwX1l+UJOWUex4/el21
 qU+ve0ekUVPZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TuGCybMx
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.9
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

On 01/06/2026 21:21, Bernd Kuhls wrote:
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.9/ReleaseNotes
> 
> Fixes
> TROVE-2026-013, TROVE-2026-014, TROVE-2026-015, TROVE-2026-016,
> TROVE-2026-017, TROVE-2026-018, TROVE-2026-019, TROVE-2026-020,
> TROVE-2026-021 & TROVE-2026-022.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
