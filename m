Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADB3CCD1A5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 15:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3884040DB2;
	Sun, 26 Oct 2025 15:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwJtv-SK2fqw; Sun, 26 Oct 2025 15:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D898540D48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D898540D48;
	Sun, 26 Oct 2025 15:25:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6113ED7
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DB2960A7F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJiC-Ti6XoGY for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 15:25:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 553C960A45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 553C960A45
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 553C960A45
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:25:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 110CF19F5A5;
 Sun, 26 Oct 2025 16:24:57 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Oct 2025 16:24:57 +0100
MIME-Version: 1.0
Date: Sun, 26 Oct 2025 16:24:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>
In-Reply-To: <20251025120712.3262343-1-bernd@kuhls.net>
References: <20251025120712.3262343-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <8d195747771655d04d0dcfad57491f4d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761492300;
 bh=45pFt1jlHgpZyXQBsRJrYvuOe/t8ZpZq1mMHKDK5Taw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ti2cn6BxZv7vRddXyyGGUySC4U26fCf29Ic/VKpJOVvqfz1iq32Wq0msXx7r7lRJT
 Cvq56cJjHnLeh698fpw9FXnOhCLnTqd3PNJo21F+euSAKxIBlhcC7aOhnMdu69Ud0J
 kYOFZAXBo58KYVpzCOE5n54IAhTOjeyueQurG3nNCE0qecNMGKQwvhYVeeUWiNLMeb
 CJrEHfP05vXtntHXh8MTX2wnm7kIILiGpKcy9e/Nh0Rr/65OjRVH5dJoJm8v6AukkO
 W6tE1PFiGLB61geUI2HHMSOYwKFJg9gENJw+mT0Y6D/QNJpTa+q4PpH/RYqRDAadEY
 wezA2PD6rBkww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ti2cn6Bx
Subject: Re: [Buildroot] [PATCH 1/1] package/libdbi-drivers: fix build with
 gcc >= 14.x
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

On 25/10/2025 14:07, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/d30/d3068de2f477d68823c4b7e537f120edf03338bb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
