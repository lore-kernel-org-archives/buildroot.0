Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0FBD5B15D
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 17:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 597E540711;
	Sat, 13 Dec 2025 17:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n118qZrioAZC; Sat, 13 Dec 2025 17:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D74B406E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765646589;
	bh=wMLENN+qh9kaoCumh2KoM6vEhLvf5/0//NXlvCFI05M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cZNrBiulSU7noX633UJaOzzc4X6bqE0e9S2TaZys6iauhhbGdd+wMlLbZI2+uKXtj
	 yz+DrCCKbPBAvH3bdnGZ8rpR6XhZpGCGpOU2pVwTx1k58VatcHyxHZwIMgph/CGqRS
	 3MpYJiCB5pmUrI4n76WP9py/UFRsLXp1yvfSDIf/M+Owso8BXUAVhlaX4Qd1g/rFls
	 zgoZtz49EupM395B8RU1PxV4jbQWGr8RqkQiM+XFuK/EtDUJYRTtWCN2nZPfYh7gH8
	 GMZC2tD9Ny9pHcImgk7Nh5J2z9stzjyh4EcV5gISTLwulFSIt0hRPtYjWVPbcmFHP0
	 tiZBJehxmG4Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D74B406E6;
	Sat, 13 Dec 2025 17:23:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7BF313D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8FAF81494
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wiENJD8MsKtG for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 17:23:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97FDB813A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97FDB813A3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97FDB813A3
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:23:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 15A1B780375;
 Sat, 13 Dec 2025 18:23:02 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 18:23:02 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 18:23:02 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251212203952.327091-1-giulio.benetti@benettiengineering.com>
References: <20251212203952.327091-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1f235711e210a637583b8e152605e469@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765646585;
 bh=Nktnp0EuCGoqRMcBVqFxUhN8BpvgdhhUwndY9nucrUA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gdK1fNvCWEEv014TUYFDhGvPQvYjIk2nRe9B2zpXj8cvXAZq6Anfo/bJ9jk3XPPUK
 jv7iNftC44yZhsLRVmseOcARrb4uMux6J0cNINlT2kq7Pzs/xvrj0jEZ7MQd4xrB6u
 cUmR8nH800Zan8sT+shjjoCZCHOHXShB75izC3cVTDMZVJiT0arPkE2AOdl7cjZj2p
 3L0xxQDpnDs8XeK4GJhlwlFpmYNnbOYa2uCmmU3LCCT7wzBTjCBXcvZdGpHTJYWbOe
 zK4T1k/u6Wqx8+qQ7a83O3kis44HAolve8jZEhI5FHj0ImjPV5dZS18FnWDk1WkHFp
 ObNKQ0ss2oXaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gdK1fNvC
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to 2025-10-13
 version on branch 5.11.2.1
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

On 12/12/2025 21:39, Giulio Benetti wrote:
> This version allows to build with Linux 6.18.
> 
> Fixes:
> still not occured.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
