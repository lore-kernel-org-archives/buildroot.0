Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7504CD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 08:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70F5841B14;
	Fri,  8 May 2026 08:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcChkJ_GxuoM; Fri,  8 May 2026 08:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D25F417A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778230335;
	bh=HccbeM6TC/YObQ2R1joYZoov93ELNG3GAHiyk2UnXw0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PQhTXEJuHgaXsbqyJJkBhKJjrelCGefvTBujCC0gO2eL7QGLq1g8jpU2fjTcu7Pqz
	 PIOE/TfU3DtmZQZ6jS7HcfAnui6F+DCxDtDVyDtKR7o684RllOW4K4r91DgZ8iiQHN
	 wh3bpJ0h8d2RcugMm+ufi6q62ije/hnhNapxZzxfoXrUOPcsOHMeoiuYDxoDmGGIWw
	 vrBvAyDXE/ufijTMyj+U4q4tOC6EoqduERAcIbRE2vcBIC2PqcfK+wy0kW6992IBKG
	 4MqQ8DIfR6mDmEAaEvrbVo0AzFaaxqZD1L1CUR6TWrYgN4CdMQpTT9Bwtv951mZ7eZ
	 PmrWRRdTspxrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D25F417A0;
	Fri,  8 May 2026 08:52:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9608E317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 08:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9341F40C7A
 for <buildroot@buildroot.org>; Fri,  8 May 2026 08:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZl3Y9b3BLDx for <buildroot@buildroot.org>;
 Fri,  8 May 2026 08:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8CA634020C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CA634020C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CA634020C
 for <buildroot@buildroot.org>; Fri,  8 May 2026 08:52:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EF4585FFAF;
 Fri,  8 May 2026 10:52:07 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 May 2026 10:52:07 +0200
MIME-Version: 1.0
Date: Fri, 08 May 2026 10:52:07 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260507130813.67423-1-aperez@igalia.com>
References: <20260507130813.67423-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <88771c8d42b899996e30f0b60396049a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778230329;
 bh=QcDZtRcavdBeOVwrIGPdGIH9or9tdg1II4B0FVsL21o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E/+lERfJFRzo3ylL+0HVTLb5sbhQk2FL5Yd7rgtaisQUdeNz5rXFA/xbwrAj21qW5
 GD1Z+rdO5PM0sm/gFFD8suKc8S0i/k0dTQQsbKDpWk63AQkmvUxzR2wjObrQbVwjBo
 9HsuqhmyXEvN5IKleanbn194oAFzffJIB48jQKalOckNvqNLVX7YQ4s49mXsrJ/GRt
 msODvBEW2k5l+nnC0soYCvtVob7+ZNX6SykNJ29JSTVBhvBixEWpfvoh0DtTPpb3kw
 eIMAvhWXiogoSxQsQf+P8gn5Iokm3ogBkYVpqkgLQHP1Mj0Qo0wGPrOqkrr1bHn24M
 yQMMC7/0eKgJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=E/+lERfJ
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: security bump to
 version 0.11.2
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

On 07/05/2026 15:08, Adrian Perez de Castro wrote:
> Fixes CVE-2026-41163, which affects any system using bubblewrap 0.11.x
> using a setuid bubblewrap.
> 
> Release notes:
> 
>   https://github.com/containers/bubblewrap/releases/tag/v0.11.2
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
