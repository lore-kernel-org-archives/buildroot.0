Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D400107BCE6
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D90FC60DF0;
	Fri, 13 Mar 2026 21:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hnKxg217q7y; Fri, 13 Mar 2026 21:12:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87AA460BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773436336;
	bh=3rpgtwNvPr8nWlmnDw/AyanySwi9QrW6kNyG7wn6JM4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rFHxMwlH6O68xPSw36Z6pQ34lJvjFkLmD84slPe8Qh0RVpGPAa/Qflp9oAirkhHMF
	 FPoYXgtwW/K9xLjGWUNNqybkmQXvTjvyGEghS2e2L/G4L3DrXkSZc3mI5P9oXhzRXD
	 034pQkK7DUX0ZQ42nm4YWgeR/JQjb/INTgBtqEWRaEY/SJHALyy9g5H0QKG28qO482
	 dNLBPuaUAscGmnIrET1ZEsMz2LLC/QTaN1I2ZChX+R+iaFKn3jFI6wrhLfkQ36ABoO
	 CLCl/zzdFRidc+iIpLJN19n2fAeQAgb3ZqoSOnlMBvc/2dZUTdXFOzy+3QSSWYL7lR
	 Kf3Wm9WwH0SJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87AA460BAA;
	Fri, 13 Mar 2026 21:12:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9594786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AC4C40099
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4RzkboCv-y8 for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:12:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 007224005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 007224005A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 007224005A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:12:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B176419F576;
 Fri, 13 Mar 2026 22:12:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Mar 2026 22:12:08 +0100
MIME-Version: 1.0
Date: Fri, 13 Mar 2026 22:12:08 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260313063639.1700676-1-bernd@kuhls.net>
References: <20260313063639.1700676-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <e0caf595ec8a3d6f4b71ff8c058f44d1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773436329;
 bh=vdOj3q6l1DTowCCy1gKQwyH7balo+Ss7DIShkGvprTI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DCEM9z5BsOVfmDJNjTKJJy+zKpt+xKjXsRfh0SrzuGBI4XnuYzbPxAKD7B4uQ5T9x
 qamNBmgwdHnqXX11iYeLqsKvDqFdOQqTqPucFw2OROhjn9chj6hB+OXV8B7IaJmaU/
 /meADIXaCGkml3NKUjH02NKRoMzVvDeLrLs9ezNO2FhN8j3Z0cYU5lL4NfgbuJwefg
 5ydT7E9Iy6U5NzCz7JBbjz6E6vhuZAS2OWxQ0WtJmx8hJTZAaJZsZBOnoK4Us1mlmz
 UrVDVjqgMjZwpl8hx/2UL3mb90pHR0KOQOdNGSGrTwcOj6+scIh+1niRLAJ6Fhf3Ji
 6KjkOUsIvzY7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DCEM9z5B
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.5.4
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

On 13/03/2026 07:36, Bernd Kuhls wrote:
> https://www.php.net/ChangeLog-8.php#8.5.4
> https://news-web.php.net/php.announce/486
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
