Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83932C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 09:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ED2981100;
	Mon, 21 Apr 2025 09:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_lZpaT3HYSI; Mon, 21 Apr 2025 09:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74D9C8113D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74D9C8113D;
	Mon, 21 Apr 2025 09:52:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5831E1C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49EEF810EA
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNRvSOT0Lpx1 for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 09:52:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D64080FE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D64080FE8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D64080FE8
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:52:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5F70919F5BE;
 Mon, 21 Apr 2025 11:52:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Apr 2025 11:52:01 +0200
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 11:52:01 +0200
From: Julien Olivain <ju.o@free.fr>
To: Daniel Lang <dalang@gmx.at>
Cc: buildroot@buildroot.org
In-Reply-To: <20250418144256.24452-2-dalang@gmx.at>
References: <20250418144256.24452-2-dalang@gmx.at>
User-Agent: Webmail Free/1.6.10
Message-ID: <7723e423031defd0c9a2543206499677@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745229122;
 bh=sUUF4DLqQ8S5ArDKiiGfYeZ5wjGV2uKkBrj6cS/aDzk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QlMvqsmxs/Zg5pdtxsSZdUL5jPC4XVL2kfm2I5Ff2o18P2z0SGwCRpPOivT5ZJyd+
 85uUCbvOKAgLhCwcpX+iUrys3YRCXvM/7/pAaLfIcgTF6ki9sPnQZdsnLQGyKeYFHA
 wX8L5y6tPEv22pyv1EH7+QuidLay8Eaqool0lnOKwqCnOoDpBzf7QqdnRfYQA6IZL0
 yOA+m/wfo6XPshshnL4WexcWO0/xyz23ka9UGX36Yb9/foh4AD+3clCYIaLaVwPZ4i
 73bc6J9CCUM14pstEtjj1Zqs0+pYeTf0KBBpWRKotF8RDQOzaRMNKIZsMrX/AHg8j4
 QoGD3RoSJZHtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QlMvqsmx
Subject: Re: [Buildroot] [PATCH] package/cairomm1_14: bump to version 1.14.5
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

On 18/04/2025 16:42, Daniel Lang via buildroot wrote:
> https://gitlab.freedesktop.org/cairo/cairomm/-/blob/1.14.5/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
