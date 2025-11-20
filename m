Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD85FCF9C7B
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 18:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6502A848A3;
	Thu, 20 Nov 2025 18:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C88jBzPiykYC; Thu, 20 Nov 2025 18:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7A158488A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7A158488A;
	Thu, 20 Nov 2025 18:16:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 140DA381
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 18:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 063686F4CF
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 18:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BzmUww5dAcr for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 18:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21F546090C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21F546090C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21F546090C
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 18:16:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 871662003E0;
 Thu, 20 Nov 2025 19:16:52 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Nov 2025 19:16:52 +0100
MIME-Version: 1.0
Date: Thu, 20 Nov 2025 19:16:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251119202120.752806-1-bernd@kuhls.net>
References: <20251119202120.752806-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <850d763941693ae7d36f711030f542b0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763662613;
 bh=rMyZ6YKRZGfBypRYNOcbLbVjIX41VHRQbU6eKbWO5Fk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Uqb4MC0AvuvaTi4FKqb+d26Pl8S5WFUZ3bVruDKqIlgJCFfqc/WYTh3LiFI1xq0wS
 q7KkBv9NTJZnktYKm/T1UGs+m2Z5xrnINzT1iIyqXReuZEc+gv8ZVEn/Q7KuRNoADb
 ocSi4X6J7UXJY1Q0CupA45PCbGH1ML75vPEZAfCMeFOYf15ysydqGZP4Mp7GP1Abaj
 MuXaLntoIEVdsdQixn6qIwsro3Jx8x3TOSgrn5sdMCb/2/qiJRNjHuVx4aNf1GefJh
 66OsYwpSLHq2oObKl0Ii/A8T2qfkTRu9aZNa+X9tZvoJON/btCBPkl/rFaSc8zUTHz
 kmNo7ecgjmoNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Uqb4MC0A
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre2: bump version to 10.47
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

On 19/11/2025 21:21, Bernd Kuhls wrote:
> Release notes:
> https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.47
> 
> Updated license hash due to upstream commits:
> https://github.com/PCRE2Project/pcre2/commit/4f5a2ada2ec070896f96a2652ae05df41c4be14c
> https://github.com/PCRE2Project/pcre2/commit/1fffb0d44e7a62ad290cf24586c78bc04b689144
> https://github.com/PCRE2Project/pcre2/commit/d8a9f2fe55b47934cc6095df6e113e7986805064
> 
> Added license file for sljit:
> https://github.com/PCRE2Project/pcre2/commit/d8a9f2fe55b47934cc6095df6e113e7986805064
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
