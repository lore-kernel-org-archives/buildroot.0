Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09F3C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 15:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80AF940899;
	Sun, 12 Jul 2026 15:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aB-4RKkqUnXj; Sun, 12 Jul 2026 15:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC4C44089A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783871384;
	bh=r0BoD0Wk0zcC2TYru8OXehbNElt23RQFrKg7lri2H6g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VRBcRP0+VAfLRbD7BsgDX75tjEaYRRZsI6MzftRG5pjJZgq7rifM3R4Bvi95T7kJI
	 5i/yJuRi93uAf5HJO/t05WAinPtxO+40RIfBrSj9T9pKcgwpR/vbTQ3P8M//Xrl8BS
	 mjZeoLj4VCj0qmmxSmDqIZ9WEJ8PzcD3Nz2Ll5gb+ZMnlQxeq/W9cSEHkn3lenKKL6
	 447keFsFl4JX4wJJHfAlZvT4+T5NMjvjJJlNbe9XuTVzxHbcfBgdY105/suX4JbKpP
	 xtmBlZL2biiBWBh+0qi4kbBy3b1I4eLdLygz25ca+DfVf5sk7AvTVdMFQT21OB0EBc
	 oBMdtR2ZkNqgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC4C44089A;
	Sun, 12 Jul 2026 15:49:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC28222F
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D6F1811E9
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xu926303xWj0 for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 15:49:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8F41811E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8F41811E3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8F41811E3
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:49:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9D0802003CA;
 Sun, 12 Jul 2026 17:49:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jul 2026 17:49:34 +0200
MIME-Version: 1.0
Date: Sun, 12 Jul 2026 17:49:34 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof
 <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20260712080622.1335409-1-dario.binacchi@amarulasolutions.com>
References: <20260712080622.1335409-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <a4335a9345ac4c52f4b1c7c985c66ec1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783871380;
 bh=2rRenHTXlKvwsN8+EF69qYRIwl0q9FryD6HKTWYokG4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=duLPcAXR2eqhG5tvjiUBowG3tHB3D3xH6fd3WPsi5THDzbgIJcNCClXYcT89A3mhd
 BhemR3ACR7xNILl96mtKc1f+ngpCocAsBkujkYcYHnwgu+gwbCln4rXLiX36Q45k/k
 XmzqVN0Bh0j75BOc5hXvyTceLq5TTuFvRD6jM+XJTpR2cubwUVQ0XdNjvwhQH+QDcC
 u8L6M/Vc2Cfg+/P2U1AuBvernaBa7iKqonf1CvDw84j6M0qGgUNtQXDyvH1bKss7Xr
 4OHAcxs2LfGuiTSKBb/5cWPrrcccnwDopA3w1LbsJ8dgT+S1GepUBlgY3xXG2MoD7w
 nRK9SGeYiZFJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=duLPcAXR
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump U-Boot and
 Linux versions
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

On 12/07/2026 10:06, Dario Binacchi wrote:
> This patch bumps:
> 
> - U-Boot to version v2026.07
> - Linux kernel to version 6.12.95 (LTS)
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
