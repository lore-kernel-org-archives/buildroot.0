Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E207D0EE18
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 20:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 751CF408BF;
	Tue, 25 Nov 2025 20:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4T1XA1jSJts; Tue, 25 Nov 2025 20:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BE2C40899
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BE2C40899;
	Tue, 25 Nov 2025 20:35:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CD1A23F
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32FCA4044E
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RazhQi3c1is for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 20:35:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 11ADF4003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11ADF4003D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11ADF4003D
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:35:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D494A2003C1;
 Tue, 25 Nov 2025 21:35:30 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Nov 2025 21:35:30 +0100
MIME-Version: 1.0
Date: Tue, 25 Nov 2025 21:35:30 +0100
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251026114420.3409017-1-aperez@igalia.com>
References: <20251026114420.3409017-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <fca33a22e8cdbfcd89bad55f2bbddcef@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764102932;
 bh=QgYLySBoEz30WheZzl33A+f83bF1Cpx92KYu7VbyBBU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sciblzrhSk9sN+urXk952rdJT1UHJPmr/T1z3dcoRfISNaLz0l+gCeo/z/d1VSvZc
 VYerRwRqpncZkwhCnP7oxUswT7XyPG5lFcYIFX+RTC7vXnaAnhtPBMO0MFdSq3fBQ2
 wBXBbtJUBNDphjz8h2nGKkcD/WMHJhgvukPqqITQ4jtl6EIYhsbSQFwkA9pTHC4GbV
 aHbpK0KzW5oGlNQsBg9bzI2GbG+ZXiUQyk8x51jqpi6lQ5iznHcuBEqqpDrjNxTR51
 14WoX5D+s3Qdp+CaDRlvs+3Fk9aYtZzMRhd5EMCflqiaePrZHTUx7MJICD7sIGvZt5
 Zi8epZ8G2YFGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sciblzrh
Subject: Re: [Buildroot] [PATCH] package/woff2: fix cmake 4 compatibility
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

On 26/10/2025 12:44, Adrian Perez de Castro wrote:
> Add a patch fixing cmake 4 compatibility.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
