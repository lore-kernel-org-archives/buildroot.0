Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A39CCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 13:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B997381264;
	Sun, 19 Oct 2025 13:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9HlgCeM9QyY; Sun, 19 Oct 2025 13:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7653183F17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7653183F17;
	Sun, 19 Oct 2025 13:51:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D246F43F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B861A83F72
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pI632Xjz1R5m for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 13:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAC8F83F7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAC8F83F7E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAC8F83F7E
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:51:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C183F13F8A2;
 Sun, 19 Oct 2025 15:51:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 15:51:08 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 15:51:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251018171916.1369130-1-bernd@kuhls.net>
References: <20251018171916.1369130-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <8b04f013d2930d223f7c94300a1d9c92@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760881871;
 bh=eFRNjNmucjuWeCo4Ul8PrjElAILeEb8ajVGpDkjixcg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BAbW/S4vSWdHEZnd6kGOZ7OudyEh4QZde3c9t8UO9/mDWVgFOV0xBrxaos5sZCgeh
 VCR2f49f7w658EnuaOpk25Mqq4TujDV1TGFfMU0FLX0dw2bxJjOYEzCE+tsnB4UweH
 Vful40fCWIz6tbkJOJ1GXrrhmtL2hevNULbL1ljDSbpY1Z3i8QZJP+W5ZMJySkKIrv
 ZnWDYOYF/pF112kpnMreUPQMQzWL/nItAQipR00fOhm2Eb6qjXvmIHrB1g7ReVyJuO
 GP/nryLWQ/NyOuebBYfnuo3WhZyFNgNCjkkU85Ykel+58sjPf5H4vM9YfL9surVGkE
 fboMVAjRhajxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BAbW/S4v
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.31.9
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

On 18/10/2025 19:19, Bernd Kuhls wrote:
> Fixes build error with libcurl 8.16.0 introduced by buildroot commit
> fb5fb06ee5a886df5036c5c5e6c4536f2bc8e1c1
> 
> Fixes:
> https://autobuild.buildroot.net/results/92b/92b1ed36e750d9ad756793814f9d1133bda0e013/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
