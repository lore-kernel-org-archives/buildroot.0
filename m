Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04612C021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 17:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D4E4074C;
	Sat, 22 Feb 2025 17:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1GHC7-3GE0f; Sat, 22 Feb 2025 17:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2DC64074E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2DC64074E;
	Sat, 22 Feb 2025 17:50:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 133206B
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4824606BF
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrQvs6x6SdTT for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 17:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 195E8606B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 195E8606B3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 195E8606B3
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:50:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C33C919F57B;
 Sat, 22 Feb 2025 18:50:50 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Feb 2025 18:50:50 +0100
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 18:50:50 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20250219210402.146462-1-giulio.benetti@benettiengineering.com>
References: <20250219210402.146462-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <a8c36dde500b5f3b8f438f202fda1695@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740246653;
 bh=29d3yEhXGxdP8pYhgseqWkzbhaIko/aMy+HDBgo7/zk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CiM2CsLHIiiw/YMnC5bLOYv9jVjF5E4OyjKFcc2JK00hPKkIMZqY52bB7fN9RlZj6
 b99OzaG/tW+tMksKiPNFiY5tV5mifuBuWZBDseoUjCHvZFPosCshCbPS1jBv87UtKB
 bNHrs52SOmq6l5TUNRjvBoVjZC8f0Xkw/yrjjV9rQ/fyAORU+SxbTh09gqfDh2FNNY
 02b5OqSr+V5/zLxqTXJ0gpzcGlXHExi79AQvLC94UyR0AEePDQCOVaf7OdU/f5K+eC
 MJYe8i/8xk5wG9wcsFVo6yJTvul8QyeCPG4mIsZ+nUKPAqNpZ4nvBLLfxlmYorL1pl
 TOLRksTXB3s9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CiM2CsLH
Subject: Re: [Buildroot] [PATCH] package/mongoose: bump to version 7.17
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

On 19/02/2025 22:04, Giulio Benetti wrote:
> https://github.com/cesanta/mongoose/releases/tag/7.17
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
