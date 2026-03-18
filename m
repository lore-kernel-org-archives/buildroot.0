Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61A1103E16C
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 12:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A2C960A80;
	Wed, 18 Mar 2026 12:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5acxB2E4sB5Q; Wed, 18 Mar 2026 12:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 770D660A70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773836537;
	bh=CKxNep7jSSx57iHQ7/ZMCGdhCMJCxUmzfl1a7EsJCmo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VVom+RF9aH5L7GBRC+WaoS75EsfG9fkRBUEgTXhQFGDuo1Kw7nBl4CJd+Iwe9VRoq
	 vFT+07uIY/BYy5oK/TyULwRk7hw5zCUkE9M7fQxBmmp0w/qSz0VZ4VhsOqsmpMgkRb
	 Vhm/fdA7Zpof8twA2T5/686ucWOJNlsbcLGNGuurHE5N0kamsOgYGO19RmFOj6w02U
	 b/WhV2bIo4I3NPpp2Wt/qIXnr0JwGCoVxdXzuTgZaNnpNdJlHEVzeUK+4ymB/IyIKg
	 z9DobMDqR0YzIfv1KnOcl2C9Y6suo/3RT7i4Mlabf6O1WsUOSEAMePNUa0a4DB2A1I
	 WcT4sUdh0HKdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 770D660A70;
	Wed, 18 Mar 2026 12:22:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 564171BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4740A40A7F
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToHkB5moD8ip for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 12:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D8B640CE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D8B640CE3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D8B640CE3
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:22:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 074BF60129;
 Wed, 18 Mar 2026 13:22:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 13:22:11 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 13:22:11 +0100
To: Roberto Medina <robertoxmed@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260316213647.6721-2-robertoxmed@gmail.com>
References: <20260316213647.6721-1-robertoxmed@gmail.com>
 <20260316213647.6721-2-robertoxmed@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <f9c73213c0a81bb767e05aa8dc02bf67@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773836533;
 bh=cfqLBmT65GzB+7Mpduw2W126XGRhGAgK+WFXMe2AUlc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jjYLrUin2d1ncIYs+GFgVpyODcqGo3fiuSM92yGVbz4NuzeMdTKPjlrRnOqkovi8z
 B9Bv0J442C1TGU9z1lUbQGe0mz9eIRP19RTwJGXUZVwlqdr77H85eK9ZqnA1wf7ikU
 H0MDyiAeDRK6h0CPGeldnKYOeqLJFtFsLKfjwzVGYHj2frOszpyOyopkzwazuTgnAe
 6G2gX0S94Qqf+nDQYca+Wm42Ne1wSVPm5nV60gvUjorgwhntJRc5YbC0OtYU6SecAd
 bQdnQ4JxOhBMUXwMoW2h0pavbmpIle+aBu43ooNbMOKBRAls0TnVwa1KRws5qwmM0b
 I9dhdBqHL1/xQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jjYLrUin
Subject: Re: [Buildroot] [PATCH 1/1] configs/roc_pc_rk3399: Bump Linux, TF-A,
 U-Boot
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

On 16/03/2026 22:36, Roberto Medina wrote:
> - Bump Linux: 6.18.18
> - Bump TF-A: v2.14
> - Bump U-Boot: 2026.01
> - Update hashes for relevant components
> 
> Signed-off-by: Roberto Medina <robertoxmed@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
