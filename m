Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27019D66B85
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 19:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE1F440C5D;
	Wed, 17 Dec 2025 19:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2tGN0XuUu28; Wed, 17 Dec 2025 19:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C3D340BA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766001093;
	bh=wRmi37FEW2Nda0mTbqwERo7kdWjYPk3mI2dOuPgyx1A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Cl5t14p2Gmk2ke5qF5MiC4VaC9EM4Fmfij5vjdQsgQXZIELNw28EKJmpwkaaDm7ve
	 oyCXcwdgIB1o//BNPlgzaV6H/KGhq0VF98Eropc9iggvXXYJ5SXUvIQkHNbagDaxYI
	 FJBojNGKAHkYb0idH0JyxxG1jrpZMeryBOvzJMehv3mzUOqJBTVzNIMcmPolRwzh6E
	 qJ8skQD0A/HfDgersJK8kWJMyyPyJMASkEqJdtsTXKlRKIXWRaXYWJEECiL0Wd3wqk
	 Y/oOvfuNHHhGV1YDFB+rmG+125QoqRLI9ndQM4WrMDkhLm5YN3eUMZ2YS8oploTnE9
	 7+YoDQxYJnisQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C3D340BA5;
	Wed, 17 Dec 2025 19:51:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFE8D375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A67C140B9A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zH7shQ_sH3rY for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 19:51:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 819B940AC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 819B940AC5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 819B940AC5
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:51:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 37EEC19F57E;
 Wed, 17 Dec 2025 20:51:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Dec 2025 20:51:26 +0100
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 20:51:26 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20251217181314.3675513-1-bernd@kuhls.net>
References: <20251217181314.3675513-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <78884d745af721ba68ebeb60c549f0b3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766001088;
 bh=g7ZMMRL1Ui08c4kofLo7r4AZrFzbUCkJp/1ScI0RWfY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B29YtaVrO96p8J5efDmh6ZW5X6eiQhwLNguuj8SfqLawC4fOYhNL+61uzcBYVwxwI
 woyNuEghcVyQTtYT/t7s5VFVUImqLzPgP4kgVlzdgn8zZjdGmiKB+29A3hhvSUUUIk
 gdH7Lr+l/SG60O7DyCO0DDN/TkEJA1iwmG3ZQL3+uRxoR6F+ugLngTjBclCcXfkMHz
 Tiwc2aIAMyXyyEs0FKB8k3XX2+47FmgKitCE/qeH30di2hbREigSP1zpykpoXs6Yo4
 1MmVIYMk3Fzqy658pAwcpIMM9t/tRS09Ho5d1J2XLNQmH78+jL/lsMowT04SBBfGIx
 doVauD7fb28tA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B29YtaVr
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.1
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

On 17/12/2025 19:13, Bernd Kuhls wrote:
> Release notes:
> https://lists.exim.org/lurker/message/20251217.151548.85d1a2bc.en.html
> 
> Fixes CVE-2025-67896:
> https://code.exim.org/exim/exim/src/branch/exim-4.99+fixes/doc/doc-txt/exim-security-2025-12-09.1/report.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
