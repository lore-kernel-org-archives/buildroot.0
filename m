Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972F2E9270E
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 588E0607C8;
	Sat, 27 Dec 2025 23:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sc0mWc-lSu69; Sat, 27 Dec 2025 23:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA0D7607BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766876566;
	bh=8NAz9onwJxLZj2yBlpRWCQo2zRZcV+BOqVIgXGDJZY4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CzeBkLvaLEHcgQBsdfx5URfu9E0bPKJ1RKTvZCCrvOPwGvQcpfKw66MRVKzAOKbnp
	 DFqNEu+qhtNEFpDrcexZS05ZOb8taLPlcFVq1DRLdd3EuIT1cNOhRiC02pckeLgYEb
	 hsigkBq75iqx6uFZVDxFChefXB9D1d5bs/brVdFoz8+ndyQOa8RJB7CuV7Ocr4vN2/
	 AtIhZrOFT7eOYXNEJc1bHVRQ2N0lI3IG0w/zBedVQf+IpauylUiOhkMcTojNwX3dy/
	 YFPFKNrB6hUZyNd3MW6IjNTICXJHZm8NkrrlsrdsFaHKer+QK28JPVLQvjaUK+5NTc
	 wq2RDA7GD5kPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA0D7607BB;
	Sat, 27 Dec 2025 23:02:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8071B9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03817607B2
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnAmuIl_aWfR for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:02:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5615607C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5615607C2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5615607C2
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:02:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4946113F861;
 Sun, 28 Dec 2025 00:02:35 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Dec 2025 00:02:35 +0100
MIME-Version: 1.0
Date: Sun, 28 Dec 2025 00:02:35 +0100
To: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20251119153854.52628-1-andrea.ricchi@amarulasolutions.com>
References: <20251119153854.52628-1-andrea.ricchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <64105e74b136ceb9ed083c3fa5d9ed35@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766876557;
 bh=Zzzy5wifCQ7CM86dsAe2zwiV+acZ9Pd7FT/3TUOK7ZY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K38QKEprDnxjg7ioJT5dofy0vgYDQ78szI/4gEvxKzH/wdSHWXkdesVjn5t1e2mWW
 mHH18gOjG9kdzDAJbnn37smtR7kCNBb672UqVR5n5MjNI33OH7Au2pY80SzlnEtWhc
 UvH9W59dKrPA+j/E7pbmhCyhRt6h5Y5+0hnwPHCF6xtzXsy8sTTbKdLQOKNSIiALWe
 Gjyg8gY9zqt+eZv4rRCXhkLCDIsa7J3s4L4IsM8HLn2tQohAh4XtgYSbDiM61PAQx+
 WPOa8prNd6+X7QeTJ8xQeLmFtCyBsfHiCpA8bDrbiOOf5OM3xWrO5WfGlmmMyHzM/M
 MGvmE/EztourQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K38QKEpr
Subject: Re: [Buildroot] [PATCH v1 1/1] package/cutekeyboard: bump version
 to 1.5.0
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

On 19/11/2025 16:38, Andrea Ricchi wrote:
> Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>

Applied to master, thanks.
For info, I added a link to the change log in the commit log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/147236691d82b729f21abd7f6372e36736b5c703

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
