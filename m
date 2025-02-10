Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E708C02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 21:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2733E60BF8;
	Mon, 10 Feb 2025 21:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsZT48DBtdRu; Mon, 10 Feb 2025 21:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3234160C21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3234160C21;
	Mon, 10 Feb 2025 21:11:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51AD7C2
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 21:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40D5460BF8
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 21:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPc_X0kCV0jl for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 21:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CDCA60C19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CDCA60C19
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CDCA60C19
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 21:11:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A2CC3780368;
 Mon, 10 Feb 2025 22:11:08 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Feb 2025 22:11:08 +0100
MIME-Version: 1.0
Date: Mon, 10 Feb 2025 22:11:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20250210024245.1954529-1-fancp2007@gmail.com>
References: <20250210024245.1954529-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8939a272cf7ee5073db9b29abdc61689@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739221871;
 bh=nyakEs8Ko6Da6s0gi9oXPqeDHHAmbuNs7E/KvEpYoSQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N4fNZNUpOCbpTv2la4+1Xck81ssJ1Bj/pwjFllOsrqFmRorp6NnrlrrQdmeHPRNWI
 QHi4nO6PIz3DBGneSAN2/vf4jStO/gOuRUXbQfp11hJL9KU2YWBCZNLA4M4rBdLmNs
 FqdjMu8OqJXr7jMXpwVyHAuyyM47Qx75hl0AwZ0Vi/6uyggCozLAqVGgoRBUp1sUSG
 /GMMU075Gz3MOm58vtxmOl5eppOxzY7+UWWjKGCU9LdbMxvaox7dAWwkJOck0rhHQG
 V5LIT11mzJPVVIGJ9I6WK6uss00blGnT51Xhp4OYEblXin/yU3a3//NTRIV6tXwgyb
 XC93efT3rrvCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=N4fNZNUp
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.18.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/02/2025 03:42, Scott Fan wrote:
> Release notes: 
> https://github.com/timescale/timescaledb/blob/2.18.0/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
