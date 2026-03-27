Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B0A10F286A
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 20:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 034A14123E;
	Fri, 27 Mar 2026 20:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t98F8zGHaT1Q; Fri, 27 Mar 2026 20:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E52E411FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774643639;
	bh=30H5FGuOgEL7WDSxTsc4XH8f45r+7TiF2RYRtGqEhUA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oNUWoc+lBMUriMmbr/9blngyJoXJCGZbe4NrJ8dho4s4GOzIdDG9ybHpSDFJoI0iq
	 oZ1d4BwvK0JBXvB/cjRqjAmBRHe4voCy2SEyEb0bbuXskHBQFtBP6ZWQEHTU1GmfXx
	 373H4sUonOjZq25an/Eif1uvXQbvUcxtW17XLSoD5UsoI6HOkKt4WY8csR22cNjTHP
	 B0E8ONle4B2zaWC4xVuRWYI4tF8piqDDAfpvmTzTHcwiu0I+qHHPkoCuyw47FvcXLo
	 qpbzRSgKHa1xWMoBzXc2uQBXEn6oKH7ZuzS/ORaDySRVL5jkQ6/+ImEhkzgEfn/sLC
	 kiNOZHptlNVWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E52E411FE;
	Fri, 27 Mar 2026 20:33:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EE941D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63EBF408CA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id la31UHKYg2m7 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 20:33:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A17A840029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A17A840029
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A17A840029
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:33:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 62355B0053E;
 Fri, 27 Mar 2026 21:33:54 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Mar 2026 21:33:54 +0100
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 21:33:54 +0100
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260313110739.90948-2-chakrabortyshubham66@gmail.com>
References: <20260313110739.90948-1-chakrabortyshubham66@gmail.com>
 <20260313110739.90948-2-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <385f1d375fd309cc023fef4b7105ba3c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774643635;
 bh=kWKX/nSXuxPVKXlKVq6mblnQT1738NpVF+cXYar9EnM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ifnL9k9URvxFsS+sznNHSvEMXlnkHnxw7OetLrafj/5qtkt4XNS4mBDHkz3N67IDj
 EFc9HA8KxKv3yKiVSSnuzBbYfSOIrz39DcVnwUn/2EBK7UscxHT9R5YchONnzze0um
 9zyn2aQWQ7VRYTImuZ1Qu//R2jwsR/ZRiCa6MqxQ82x/fyKlE+gXX3plFD8KG9UMso
 ICtGuGayMaNfzAvK7STJ3dvy/YorixuUHPKqLdpp0k8+vZbeeGW0n6TEi+/rroBsUL
 TxKAgbwVwWbpKkroSN2030EucddJvwJjaqCo/unSrRs9XXeNrtFDdNCuhpPtJoWJwy
 0tRvUl0OlKWmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ifnL9k9U
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Shubham Chakraborty as
 ccache maintainer
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

On 13/03/2026 12:07, Shubham Chakraborty wrote:
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
