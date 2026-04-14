Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C753AF9D0F1
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 19:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9434A6ECE9;
	Tue, 14 Apr 2026 19:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sy1HT638J45q; Tue, 14 Apr 2026 19:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F09B6F4D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776193825;
	bh=yd8k9pd+Onp/8hB4PmBS2bCWFnswdKwL4r1A9WLfYXU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IczR6EHcP50MIo8sx1fFfauk38qdGztTHn+B6IfoEpovu4qHZfLVUtrMqh1bFAd/+
	 1mO1f9DliyMXqsnOuF4NxasG0bp1aVo/1LgnDAITZkrf6B/2ygn/DWeG28XnjakFHx
	 Zu/ZHMcDgzWIv+L9Z+PF6dCjJJpmBNH72gZQKH9hN8n2mk2xj9U2Nv8Z55PTnLfXda
	 ZM7lv4qUvS+W/1hoAapOQygrBZ+/cAw1sqTGKFQWBM+ZddP6yUEABv4Zv4m4tIRgUb
	 Hbsgc3jxhZgGOn4xXh0nFWa88s6I8vV/5l5vAicxazf1oRLwuldXxAP5TXkAECL/7D
	 4I6JwNDZbLAMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F09B6F4D3;
	Tue, 14 Apr 2026 19:10:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0646A375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E053A406A0
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJ67-kLGT7QE for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 19:10:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DDF394067C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDF394067C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDF394067C
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:10:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EB61A19F57B;
 Tue, 14 Apr 2026 21:10:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Apr 2026 21:10:20 +0200
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 21:10:20 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260413103329.2557294-1-giulio.benetti@benettiengineering.com>
References: <20260413103329.2557294-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <ea7bac71c3d6a27ce8a86fabe341ee68@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776193822;
 bh=jqvZmRiBpnKNoZ27iDlunxOM1turqESRKercnFgYkNU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fyq9Iy7miQ2F0ov0ZcugT+ObZWZUaT1p09JfOR2uUa4ewiyHKge54CTzj762c1xaC
 lpRyqcOgDlV7/gwJa0d19u1DIy5gKchP3wiP1La7ieQWBYoC75oFdvhNaQ8iQdlV6h
 LVQUU68Sec33+/Ejvc1Zn5C3lg5iCRokwAM0n9JlDnCqonyATcbHo+Di1qoBKKm9NB
 f1DHZ8T9jRYGC/ADo0wss/pYAY07uqWwTp2vTR5wTTVbULRTDJ/nppWJRGQZsLgV3u
 cRNKtGttq6aItaQvIq/s0xji5ODl8Jib6EkYy5KHbITBbgIJJ2H8BbRqdj6yfGhi+z
 l+K82gjxC1s+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fyq9Iy7m
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: bump to version 1.0.6
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

On 13/04/2026 12:33, Giulio Benetti wrote:
> Release notes:
> https://github.com/espressif/esp-hosted/releases/tag/release%2Fng-1.0.6
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
