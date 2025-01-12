Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A99E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 17:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 426CE8050E;
	Sun, 12 Jan 2025 17:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4RyF70y3XKn; Sun, 12 Jan 2025 17:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7725D80B98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7725D80B98;
	Sun, 12 Jan 2025 17:35:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2374940
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 17:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0B6940141
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 17:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrFd7uP2SZyJ for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 17:35:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7FCB4402C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FCB4402C7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FCB4402C7
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 17:35:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id CD05A60128;
 Sun, 12 Jan 2025 18:35:08 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 18:35:08 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 18:35:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111182258.2930651-1-james.hilliard1@gmail.com>
References: <20250111182258.2930651-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <d380311175e876b50eac61f696ba8f32@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736703309;
 bh=unXcl0tuZtOMqw25pOwq4bJnrGsuFwVGrtcYnoKMraU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BLh/TNzpC4eTZvIz5gByemi56C9BJRhDDD/XR47JC/lPFQ4CLGtb332puhxYXTrMx
 a/gDYvEkfZUsOX2dY45/yH3cDEn5ymkdHvQ7v8D8ZftXiD9VtTidxKM04AROct5WO2
 PTggK/LbXYB62Mm6qX3KfSHtL5u/TmEuWLmtlocXcZ4HjvTslzEA7tB4uFy3uGDvi1
 MoYGe9iPWY/C9JtF4nVDI5pzSB2AwhEtmDf3y3ObuvNcf8svEbtisHQcwu2c4rPpu/
 P6ih4dRAGNoIWECIcSYmSwpMQ/nzs32IBNsXcO5zjZQSVhsUPfpZaGRCgSW1lPK/Nj
 lTFq61EvsSH4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BLh/TNzp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tomli: bump to version
 2.2.1
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

On 11/01/2025 19:22, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
