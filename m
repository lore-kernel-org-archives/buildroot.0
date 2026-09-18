Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D31AC982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 14:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F2360DA9;
	Fri, 18 Sep 2026 14:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-zqayLH592J; Fri, 18 Sep 2026 14:05:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7AA1E60DA3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789740322;
	b=m7TqF6nZc/pvO5sx4SCS2/oGbZ4UBej5Mreh9VAmFe+b5tpZSFn3Q1jp1w5KNUw7JCzi
	 Bzi+bO0cZzgmd/2dB1KzYXKDqibMX1KWxRnpHokaAezohkW45I0CYY5W5uuXJClMKDvub
	 35dKWP1MsRfI+m/5z1AJi1NJoMqPjg+5g0wFgWI89qkU9GCcimpYwn1u0kGmhPoZ9t1VE
	 oZ7HzPqOZYGnqY4X1JiiOFivLZVjdhu3UUofS+XJO8ODF76bNZmsARQ5TFsf38KiLQwk+
	 +m2IRoyAYoSNa50rIw2HEaFCNuNogHuiXBHz4bu/VdpbQRprnrpEp2pdYqKDiJSfSyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789740322;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:X-Infomaniak-Routing:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=3V4AJaPLiQDauxuPDmh6O+1baYPo+F+cd81ApJcJplE=;
	b=Ui1hs+G0+pCfvChSY/0vbHo3TKt42JSgIEw85tn4JZgwhyiUxnhgAYRrZwnkNHdPb+mA
	 mXH4EccJ25ZCYN6Y7eFzbUrH2FjOb8ajjCJ/W0jGYvpd3OW+GiSLL7k2JDt6iBp5vZ0kP
	 Wl0lFCPQKFQB/Xo0kTcxQzBlrnb93iuwHSyzWqmUsulTlWJZhEA5la04QEcjGGEZlKMCW
	 E6aD/NT31TyLjN/+HMN9yFVwr5lv+dDN5LslUUYI38fOx1gUEJsrAaj1PPtTUPMOcWQnF
	 HQJTzWRDmGF4M6zfQ1Xp2A3sNMQmiW0RUlm8eyUxYkDv8SHEqDQBJj8Ry5IcWxzAtVQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789740322;
	bh=3V4AJaPLiQDauxuPDmh6O+1baYPo+F+cd81ApJcJplE=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GRght+bMtGM9TUN6/zOaLQxHYHKTRObeS5iS8axmL/vwIJqqB5FKJbD81cVOAbNbb
	 bZ+EvRPYtcp7Fq16H5wAMEA+ZHjMASuBpVDh39BvYwMzutLxu/GnjPMXPDpqCF9ett
	 2dXdecbN9j36DZEAXbWWf1hU3UcvVkOvUP/AHQulJXG38cq9xdDfSPdoGeD2GTIaeK
	 4wF1+wabNgQFkEGc9gLX7ltqn1pCohKgLH4waXzX3tYqdK4d30ygTczRGYatamyTWL
	 k+aUVJx69X4hxJKBQal2cNnHNarne6IMnoPaRMGdLfsMR5ehd1Ni0/kvX4neJajNse
	 39UPJhmhtpGAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA1E60DA3;
	Fri, 18 Sep 2026 14:05:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B74B279
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 14:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D59740CFA
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 14:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZJEp_FDVlnc for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 14:05:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 548AE40CFD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789740320;
 b=auPXRWr2CE/1YpVdTh/Jx6CWijclpZ+XtLkAk2p31Z3iXs9IGqGQbNN0+8flhYP7FSot
 qlsRK2FbJxBSkvz9isj/fYQ3tS6Hu5wv/BwgD/k6V/Xhgn9CQHcAnoR5GHRN10Db8n3Ka
 5SHm84ZGtsI9GuRr2iP0ZXh72iqoU8Hn/7SDgmnfjW24Xsn6KL6yi9lmMWmWqj7ZgAmRj
 UEvt5CDn9lB6vpj6mjW3c3E1nS5nSk04L4e9SIFJ3vrLv4K9ZCHUHOHRaFmfIs9d3Dxy8
 GJvT1i+8gdQq/S5CCbFMnNL7fiv63xj96zEEuRjBeJRUfmSVG2lWqbUNFOv5jWmdivw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789740320;
 h=X-Greylist:Received-SPF:Received:DKIM-Signature:Received:Message-ID:
 Date:MIME-Version:User-Agent:To:From:Content-Language:Subject:
 Content-Type:Content-Transfer-Encoding:X-Infomaniak-Routing;
 bh=0gIF8XMxgiWjfufehlQg3UcFOljYJF+Hy7O0Vu+A4a4=;
 b=jopDGUDjYMp8FAECtxVJU+zEtTW0JNVO7SGexwV45thj+CZTMYNeQBRi1o2QnPhpQbed
 sz8hyUrMGswED0qKsYG5heOqnLD59w3Rs8gE8oRoeDaMcfKPiL59CLao81imkBpwLr645
 cW0cd3esEXXrfefG8SoPFFz6peUlEhBKlOSRLjaCaCpIKzLR6346UffStd7EgwlPJqTb0
 0xWic6wLOk70ZNvtEaTBmH+C6jPmr2WocUf4sQOJ5OqkM1N8G05/OAbMBEPf2h48x2wph
 NukwoldbXd+I+w9hvevfk6ILUveWG6U2yjnwpkQsfuprkOBTSEm8iMZ8skWEWzpHwUw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=linatsea.fr; 
 dkim=pass header.d=linatsea.fr header.i=@linatsea.fr header.a=rsa-sha256
 header.s=20260404 header.b=XygaupUH; 
 arc=none smtp.remote-ip="2001:1600:19:5550::190c"
X-Greylist: delayed 1130 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 18 Sep 2026 14:05:19 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:1600:19:5550::190c; helo=smtp-190c.mail.infomaniak.ch;
 envelope-from=thierry.bultel@linatsea.fr; receiver=<UNKNOWN> 
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch
 [IPv6:2001:1600:19:5550::190c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 548AE40CFD
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 14:05:18 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hmYnF61FfzdZc
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 15:46:25 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4hmYnF32l1zyJM
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 15:46:25 +0200 (CEST)
Message-ID: <1c085135-c356-4e1e-bdf7-2aef0478fa07@linatsea.fr>
Date: Fri, 18 Sep 2026 15:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Content-Language: fr, en-US
X-Infomaniak-Routing: alpha
Subject: [Buildroot] roadmap / status of imx95 support ?
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
From: Thierry Bultel via buildroot <buildroot@buildroot.org>
Reply-To: Thierry Bultel <thierry.bultel@linatsea.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Being about to be on a project involving an IMX95 SOC, I would like to 
get a scope
of the support for it on buildroot.
I can see the submitted patch series (from February):
https://lists.buildroot.org/pipermail/buildroot/2026-February/796112.html
but not much feedback on this thread.
Is this part of features that are likely to come in a future release, or 
is it postponed for some reason ?

Thanks !
Thierry
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
