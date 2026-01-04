Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A894EC2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 14:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5981840535;
	Sun,  4 Jan 2026 14:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAiVKERayGlZ; Sun,  4 Jan 2026 14:29:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AFDD40522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767536984;
	bh=U3XCvXK9TKBop3hbzWqdZgBgGCoVylt7ig7MrryO7tg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QSNXXhLC6V9LMF2d4p2wl7cinsCyD33CSFznXsR1Fpq2qVfY0kNuAyWvafCJ3VfR0
	 vTTJN/aNFj2DV75wZRf+PThSp4qz9NQwWgaLZddj3fHl6yZ2/MNdPSKruxq0BvLrBi
	 WXoi40tO7nyn0qBESR7h2q/KHidjxQPIy37pq285fvbR+FNlVP5zioNDC7yQnAsrTE
	 8XeoPo4WM8j9QBU/SSc6Dgpncj1hl1YQiNWiCAlJ0hqTOc/K689PbgzwI9PvJVjS1Q
	 8UAv9C/W9Uel5O7mccsHeAZ69c3W7wEtaRgoiaCv7+x0UTNz5FpVD2JcsKtHQEZC4d
	 PcTkcV+xTHiYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AFDD40522;
	Sun,  4 Jan 2026 14:29:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFF1B2DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9646D80E2F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ni7kwFjmHKgZ for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 14:29:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 863AE80E1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 863AE80E1F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 863AE80E1F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:29:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9D22D5FFAA;
 Sun,  4 Jan 2026 15:29:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Jan 2026 15:29:38 +0100
MIME-Version: 1.0
Date: Sun, 04 Jan 2026 15:29:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260104120426.1233789-1-bernd@kuhls.net>
References: <20260104120426.1233789-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <bfd9f4a0cb0888bead4b6697b02b3081@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767536979;
 bh=yaV/2KwiBZQD5F9BXdM5PXjszX7K9wAdikUHF1STBtU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hvnUzyVWzltA/TqHb6j4eQz9M068qElFaWsypgpCiZG/pHl4/XjwNm5+WqxlCs/PA
 AXzbINPVC5Qu8bkZkVced5IX0RdeIhshDCrfQtmjda3Pg/vE92LV5X7ENCqoSznl2I
 3ayhlR+i00rdlST1tfe0IURyJsfdL59hkgyw3rn0qlbjGCoNJG6don0ZzaI/VNetlb
 mfGv540VYCNzmN4IGHr8kZTRNw4+LQQUMNpXEkExhOuNsuK6IXoE83yUS9BQgiWm3B
 s+kdFAwDM3HTPb6dUQQEEs5/8FRZ4Txl9DDqusnyoVgtpOPwwAbgjAgYQN+rNNYeaj
 83dFafcnhYQzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hvnUzyVW
Subject: Re: [Buildroot] [PATCH 1/1] package/e2tools: bump version to 0.1.2
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

On 04/01/2026 13:04, Bernd Kuhls wrote:
> Upstream project was moved to https://github.com/e2tools/e2tools
> https://github.com/ndim/e2tools/commit/8829023675b316cd3e32559000101403cd63c8f3
> 
> Switched to tarball provided by upstream, dropped autoreconf.
> 
> Updated lisense hash due to upstream commit
> https://github.com/e2tools/e2tools/commit/5201a6882b4bec33256f0dad89d52a7f1d0ca893
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
