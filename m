Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8FDC02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDF2380ADA;
	Tue,  4 Feb 2025 15:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id To-N9bM8bFAv; Tue,  4 Feb 2025 15:49:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF43C80EC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF43C80EC4;
	Tue,  4 Feb 2025 15:49:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F07A212A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFF0E80EC4
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1bzs0fPsdUc for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:49:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 021C380ADA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 021C380ADA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 021C380ADA
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:49:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2694119F746;
 Tue,  4 Feb 2025 16:49:24 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:45812])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Feb 2025 16:49:24 +0100
MIME-Version: 1.0
Date: Tue, 04 Feb 2025 16:49:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250204081005.1212940-1-thomas.petazzoni@bootlin.com>
References: <20250204081005.1212940-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <dc5c670774889bbb5218caf0f359a22b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738684165;
 bh=djJbeNsz8XQYqf5jUiQa96/sKQGteTWQH76iGei1pig=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bAlSaEaDcQTLX5ADmRTqxk/+VLkcOA2o9VJ0WTlU6L6DyP4DByCmesoOdWCh3TJpb
 q3v8GzmTYb9DR+rUpvPgMkBNIAnvbP6/gvJqTFNSGq7IlONxq1H1ZOHNc4RQxcxNS5
 H6LiowqH57Q/mCfCCA9joXy/slUSiNZwgNEVVgutUycQ01AR4O4FFSeEwKcv0ajzhf
 /hYaqAEpk/Z4SgNj82zv98SLmWxflu0vyBzGNgh5+cfKMDpUpEts7Y25OiXLUhuWFW
 GIPLfkEtSRWRsnEdJY/vEgWDnAfR514qZpTEV4OnlMrnFyy8xVhkBfRZsAqL8pZSCn
 gGl5yeqyFWaHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bAlSaEaD
Subject: Re: [Buildroot] [PATCH] package/cross-ldd: use Github download
 location
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

On 04/02/2025 09:10, Thomas Petazzoni via buildroot wrote:
> The crosstool-ng.org download link no longer works (probably a server
> configuration of some sort), so let's switch to a Github
> download. It's not an auto-generated tarball, but really the release
> tarball, identical to the one on crosstool-ng.org, with the same hash.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/2ef16c821c4dcaaaa12b9b6c582da21a0592e453/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
