Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0BCC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 15:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12B9640B65;
	Sat, 17 May 2025 15:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3dEo15OD1aU; Sat, 17 May 2025 15:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FA434095E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FA434095E;
	Sat, 17 May 2025 15:00:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A69B31DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97205831DA
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmAyjYrI8ciZ for <buildroot@buildroot.org>;
 Sat, 17 May 2025 15:00:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3D1D8203B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3D1D8203B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3D1D8203B
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:00:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 617472003C8;
 Sat, 17 May 2025 17:00:44 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 May 2025 17:00:44 +0200
MIME-Version: 1.0
Date: Sat, 17 May 2025 17:00:44 +0200
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250514195151.684820-1-james.hilliard1@gmail.com>
References: <20250514195151.684820-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <8242fbbb81989658e4ae36c6b642ab33@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747494046;
 bh=z2BFQLRNq+8GRgbBrjIm7ZAYD8tyJReqkPahcUeiL4Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=buEEwEWnveSaS+DdWjfgcRjCmRC6y0QXqN5pH4AyaFNwtmDaf2tZL7n1+GVmhfP4r
 ml7tBpTkW5MB57tU6zcbpK4WI9n5XUBFAmtpZVohW3/AqJjPD+/hfEM7yISG3LXB6z
 t6HM1egwfoPS7BqGMvW2/ulhJgRCFDK0/P7ZJki/5WnYwYTXr+x5/15Z6tlxQm9Gtk
 QkWetbBwgujAwICPuus8/U2FKiUYDMgFiaT9V+KmjINDaGMTp8P8WIeKVKefxVFCrZ
 7kPnrZL9LdQIG+/RZEJlQkSXyhBnko+4qJEnmywZ1dKDHwHqro9+hC1Pk2JcLU4ZBG
 JtMUrdLx/dP9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=buEEwEWn
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-mediadriver: fix cmake 4
 compatibility
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

On 14/05/2025 21:51, James Hilliard wrote:
> Add a patch fixing cmake 4 compatibility.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
