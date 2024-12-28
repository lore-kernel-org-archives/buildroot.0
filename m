Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD56E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 10:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77429605E8;
	Sat, 28 Dec 2024 10:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1v2NS_HdkXfA; Sat, 28 Dec 2024 10:12:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7408F60681
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7408F60681;
	Sat, 28 Dec 2024 10:12:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A15CE0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 680E380ADE
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpBnqK5SwLuW for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 10:12:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D05880AD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D05880AD9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D05880AD9
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:12:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 12132B00576;
 Sat, 28 Dec 2024 11:12:02 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52560])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Dec 2024 11:12:02 +0100
MIME-Version: 1.0
Date: Sat, 28 Dec 2024 11:12:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241227215811.2830716-1-thomas.petazzoni@bootlin.com>
References: <20241227215811.2830716-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <2e4b7631431e31fd99b7d3302136a526@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735380724;
 bh=YQ+SQIwuDI5gaabNYtBiVl2PN47ROM+ajJqiH3o201A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qx2DRR5nMOF/mAGKOQHlu4daYLbAaxr6b+dqRP56RKxsIfHatne29nXDU5sZf94aq
 rO0FpTlRrvAvHNF+mUeYrOmm1t4hsxVZD3cecCfyS3pMtKXxkd5qE1ntZLJpzWs3Qh
 B6fuMUL98zBEAg5DZ050HfAYYSQwN6GDJhBhSCWzQWceYUd1au+oZmn5/Jswm1U8LP
 c2Ny2nTtYTGoIqqrYWvyMCNOP1z5Ps3Bjt3Iy6Jzg3ewp4yruhHFG6S2KU8PuoQcJ0
 8ozd5/yxNUNvCa+YqFmIWQ46Gp0F5krBJd80sgvu2SMRbmtz/u+Lbod7Zmxc1m4M4x
 TdOT63Afv7xcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qx2DRR5n
Subject: Re: [Buildroot] [PATCH 1/2] package/monit: reformat patch 0001 as
 git formatted patch
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

On 27/12/2024 22:58, Thomas Petazzoni wrote:
> This will make it easier to edit the patch if needed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
