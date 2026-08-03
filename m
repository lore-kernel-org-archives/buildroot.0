Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCD5C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 18:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7308280BD4;
	Mon,  3 Aug 2026 18:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xcsr1HWUzAb; Mon,  3 Aug 2026 18:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 934E280B40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785783230;
	bh=L3hZZWgR8GPkvnU+R7cG9wq2J+AF5HivM5+bfbe/ad4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K/bXMeHahc/xSrie68fHp+vdsFgik2rJy5pIeEBLkaRwgPpEFmraqttX9GvgcMkS5
	 3P8p5Wc/0ptdmDxwR1pjGtBqWxDDNHF82oF7XfoXsa9O/Xzi/1JJY2EcJyCQMSJt+/
	 3yftFzKloF4/mGu3ctT9WDKnj//eOspG63rRzGHw7MdooT8m74sA39M/iVzbpim2P+
	 3ht8V+kIcolMra4+q77xbe3HPPpncDkKRbxLKJvoScPUKCJn4WjhiL8ujvx0bGjFmc
	 0ZMRMzBASG26+wcakTHXzMBri4Ylhf3nYLbcCUMl1vhBKmsEUVQhoEvMbWiboksRJ0
	 rdSJyI6Tgxm/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 934E280B40;
	Mon,  3 Aug 2026 18:53:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5118C28F
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 18:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 432BD405B6
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 18:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MxkPQsBf756 for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 18:53:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 002BE405AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 002BE405AA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 002BE405AA
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 18:53:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id EF9242003D6;
 Mon,  3 Aug 2026 20:53:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Aug 2026 20:53:43 +0200
MIME-Version: 1.0
Date: Mon, 03 Aug 2026 20:53:43 +0200
To: Frank Vanbever <fvb@funkworks.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260803115121.378977-1-fvb@funkworks.be>
References: <20260803115121.378977-1-fvb@funkworks.be>
User-Agent: Webmail Free/1.6.17
Message-ID: <fc55424be223da7f69c8a7cde49d44f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785783225;
 bh=HJ9CmlW6BliWQO8r8kG/OzrkEvJQk6oa/SKgis9sMbc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KeE7Ca8h0yR9Ey2mQU9sMgkQRWg8D4ZVeQ74owp+SidgTLohyasqLReEfsu+R497q
 b/Y8ghb+yJlXkFUmD8mjif6+1s8RPY1IIkY8QBPBbxNWg57j53nNUGlJXhvzhFzQ1E
 kIMtHt687O4nfiUHRrcGDFG/3mBIShn+f1PPx4DWkP2ljdUYvy7EuTPPZnl5bxIgjD
 xqoRXT1JWyEg7D2QebtbIchcmfyfqRAEjKyxEAe0CtTvdBY9wIPku4U/aOyaN0vcBa
 ORnDm/RqjKXee3ebuHN77G1L0DHIKGqzY2Ue+s2vjPRuOwUXMQGuhuKZsHxot2UdvS
 TWIs9LRmudNuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KeE7Ca8h
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: security bump
 version to 3.0.16
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

On 03/08/2026 13:51, Frank Vanbever wrote:
> https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.16/CHANGES
> 
> Fixes CVE-2026-52761 & CVE-2026-52747
> 
> Signed-off-by: Frank Vanbever <fvb@funkworks.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
