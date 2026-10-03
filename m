Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4274CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CCDB60E5A;
	Sat,  3 Oct 2026 16:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXP1-D9-CU9O; Sat,  3 Oct 2026 16:38:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 62F55606C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791045512;
	b=UinC6IyHaTDoJuG025OjUmibgWFfRTab87fSx8c2ZBjPI/MWRkoJsTXo0Ts+rUvEZSrG
	 ieDMH5LFMZuUzbEtmWuIRg5CRX/AiSr5Sc0w/tBBVkyy1AkqjIXX2nUehvO4k5DlC958F
	 2REsdbJLHmUIx96mLTGGOhFYee0zO5RUfMiBk9ZOiZTc0mrv5kMO46Ep0Ycbs6kCISU6v
	 YUkY95aGR2yodxarcLbSJD19/P0C9mGRbqHQ9qEeE2j21wifwTNNQKtvoPt3kl2qfGqhM
	 a9GqQLPEchXjtf3DSxL9pRWv9RFTykfwYyGYQ3AW9trIg1xWEDJf+AJFwnhRxOyQDnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791045512;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=fexMB+fF8NyGsVy2tXqXld2m+GtOR2h1JIa0O0KglLs=;
	b=MnaZDwG5fjwVmlQONqhb1Z01mlE3d0vIK1D7FblVyTk/WWNWFA15ztK8pe4IRXdOoh2m
	 Df0Q8HaLBdQbLt5a+pLa4meD9JN+MOgNiqaSGXklbKSEEIaObTPl2qdmIJ0eGOaBzzKxH
	 Bj4TYUSKpTwed6VL/MoY2vo8ywt2WGpV8j286O5OJZ7rhS8Q8jHqggoY0Tx/K70rdgA9V
	 AowVJtcJ7mc6O7z/N0a4DLYNxoZdRPWZK7OyXlgRyafdo23BKSCdrmux9hsr3XVaD+Q7B
	 wpdHCmON0OKR/082qCh1/WT7DezKhy5+7D/Zv366kjlJ/WTrBjZ0VByzIQUAtD+r3nw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791045512;
	bh=fexMB+fF8NyGsVy2tXqXld2m+GtOR2h1JIa0O0KglLs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LQIPHPB4MRIYMgdUHx9vWCXOrDsPcpDrlnZmQTraelQ0Ox93SGJriLRMQ+RVDNoNj
	 sGUHKEFtsP9aGOO/T2Ss1CPO2hb8fUonQAAGeuHQtf491ge2D8Fy8xvSI4d/talHAW
	 DKq9Svia0XFlAlGQlfRXZTtNQem9AeQbEEBikTh2fyc0dZm9KnFaaDSiuwZRaas/rP
	 8RnSpyk3q0L+Q/BJeLzZAv0dKH4KcqVX2zCaQVGnza49osKu0Wex7PWbYKJGxZ6flL
	 EpzKY0Xy3+e7ht8bfA1lHTKXFr4hjCQGQZsUnfaMKcw6P/vHhJ614pTY8kcG0CZ4Fu
	 02LiioCxpSNzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F55606C4;
	Sat,  3 Oct 2026 16:38:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AE341D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20E2B40048
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZ1aaAfS4v_z for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:38:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2771A40024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791045507;
 b=VyrSwnH3xedxjfYkxGps03rMUdFedwtcsKHNrV6BBRq4gneLgYt57SLs9IhxntrDC0MC
 l7jNVGn/xznlIpIMw74o50peiDCfRtvd3t0wT8tWDNg/7kn7ia+YzkTzolJRJHUWi4Q7c
 UIX9I0vfGsewjANCSZa3Pz9Gm8RK6R7LXkGkPrgFhHeANZ54R5IN4urvdI22AtG4OD0Jt
 uH2KWdQKolmehAU2couZF/jD7t0glGREL/VGURey/IRsH88vPr9peNV0p5pPCkSNsGfeS
 qD17rgkJrC3AqzrlyrYPxUxuQok+D4qkw5Dd4tZM59zhstwvjb/6B+9IL7GDaelmdSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791045507;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=us2lTxP/0Y4boVvwu9RQOnYg7mE6sGOL5IcFE7Hg7yw=;
 b=KURPoADxVl7KcV/fSE1pxDujj2vhVq0abIWqNm9oBmo5oNcgcq56qrFPYOPqO4TyZe52
 T2VwxX9PoYowpWaDUHFJuVlrvKn7A40V3CadFLXtdlkFjL6VcUltrzeWYc82CxDVetPo6
 0QZIYAnbhVfJZClIQTRoDW94AHWcuvZHG8qt2DnzQikc9BnRkGoSfLClEtohLXWwnuvNd
 6OMnzYYBhJAXFbneZcH1/z4UMd+u7o2bd3u3X4Cvmk7p/OIxaIotv+koRwEqO+4ys1ldx
 5KxekANUAIn+jFDYps6SxDI3ZYTFhRWNa7Ir7NvH75x+fIttdUWuHqF5534WazDn3cw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="sJl7YQ/u"; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2771A40024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:38:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 49A20B00539;
 Sat,  3 Oct 2026 18:38:23 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:34620])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Oct 2026 18:38:23 +0200
MIME-Version: 1.0
Date: Sat, 03 Oct 2026 18:38:23 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003151639.3618082-1-fiona.klute@gmx.de>
References: <20261003151639.3618082-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.19
Message-ID: <e17f1a0be92b9562abe20231793ee2a5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libseccomp: security bump to
 version 2.6.1
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

On 03/10/2026 17:16, Fiona Klute via buildroot wrote:
> The upstream changelog [1] lists three security fixes (without CVEs):
> 
> * Incorrect 64-bit comparison merge in libseccomp can weaken seccomp 
> filters
>   
> https://github.com/seccomp/libseccomp/security/advisories/GHSA-4q85-33p6-j5g6
> 
> * Oversized seccomp filters can trigger libseccomp double free
>   
> https://github.com/seccomp/libseccomp/security/advisories/GHSA-46fr-jh49-xvhx
> 
> * Oversized seccomp filters can trigger libseccomp heap corruption
>   
> https://github.com/seccomp/libseccomp/security/advisories/GHSA-2hqh-5c36-grrm
> 
> [1] https://github.com/seccomp/libseccomp/releases/tag/v2.6.1
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
