Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4840BCA1007
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 21:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA0DC83D7D;
	Mon,  1 Sep 2025 21:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imcpRKd5qMIo; Mon,  1 Sep 2025 21:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2233C83C67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2233C83C67;
	Mon,  1 Sep 2025 21:41:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 83AC910E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 21:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7485E40A1D
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 21:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xp24r4GOwBLF for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 21:41:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C50E40A12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C50E40A12
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C50E40A12
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 21:41:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 356D478034D;
 Mon,  1 Sep 2025 23:41:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 01 Sep 2025 23:41:32 +0200
MIME-Version: 1.0
Date: Mon, 01 Sep 2025 23:41:32 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Marek Belisko <marek.belisko@open-nandra.com>
In-Reply-To: <20250901202846.811867-1-giulio.benetti@benettiengineering.com>
References: <20250901202846.811867-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <103bb7b78d985dda3cfc8cc4eeb556a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756762894;
 bh=jusFlhMjMNjL4o0rsZ5Oi2AqH40ukUySv2mK7az5E8c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QLcRQ1V5XdD+iAhFyGzN5MlVhcVzsyNA53fh1iHTQuwfrtGdwBo7tKKzmNj60pi+E
 7clgXTwAjbYL2uxAwWZ5yn0K2zTpgsdtWtRaN+bJQ9S9pzCDKL8T6Ibzq3tbeZha6w
 MpXBWMgKuzRsFIPjyxXHNarMj+2yCxhYoyAE838FdQ+vAD/gd6cNtZb1wIjiTEqpea
 BORFr7TDj1G/8ab694W8XFVFeT2yzKBjAgbkS118Ks2R+z3hnCmve/jNm/jKG4Rx2M
 Kax4EVhftUM3ZRTTWXcTLB3FcZwmTjY5Vl3FosNPYCTThr7n+wfMMtL4/bOnSMiPv1
 HI1SC+YxNukjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QLcRQ1V5
Subject: Re: [Buildroot] [PATCH] package/udisks: security bump to version
 2.10.2
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

On 01/09/2025 22:28, Giulio Benetti wrote:
> This fixes this security bug:
> https://github.com/storaged-project/udisks/security/advisories/GHSA-742q-gggc-473g
> 
> Release notes:
> https://github.com/storaged-project/udisks/releases/tag/udisks-2.10.2
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
