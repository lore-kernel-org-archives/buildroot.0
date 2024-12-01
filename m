Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A5ED49789
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 21:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 952166070A;
	Sun,  1 Dec 2024 21:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwVx0ULSoMFn; Sun,  1 Dec 2024 21:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF0206082D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF0206082D;
	Sun,  1 Dec 2024 21:05:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 923266C
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 21:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8069285074
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 21:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZUwOV8cDnjE for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 21:05:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD1758506C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD1758506C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD1758506C
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 21:05:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 076D719F5C3;
 Sun,  1 Dec 2024 22:05:27 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53064])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Dec 2024 22:05:27 +0100
MIME-Version: 1.0
Date: Sun, 01 Dec 2024 22:05:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241201162741.61891-1-vjardin@free.fr>
References: <20241201162741.61891-1-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <ccdc7b70ca33f0839caa1809e22c95d7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733087129;
 bh=+Kzk5bcxSca6doFY8YQtoHgoaUkDF7MeMjPPxuOYMgg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b4RnrOZWut9wc1pucrw8tiO+VaUc7oWQOhpraFzlxt86f+y0bBmGgs8d22UZBwCiP
 6vGNvGFkq7o1SIeHURW7miw96/ShpaKqYt2yHq0zUeasgoN3OoUpNEQxiz6Pt2pLbv
 6hBglG8/CtUf8hQAhy9qgupnMQJLYEih1DO8fDOvTvtZFX8PT9G7jwCJq/6uD0Xrfn
 8xp6HONfy7gtEemclsaDvSB7irRwnihLKHReIVDIm8a0W15n3AEyS/miU1GOI6KRBj
 QTkLRBsRRhFkQ/+Bd0qOqcbmDfemHv53MqMibwtMN3Blva+llkXtZ6j3XFAe7vxsxJ
 Ef6Kl3Fje8oaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b4RnrOZW
Subject: Re: [Buildroot] [PATCH 1/1] package/libpam-radius-auth: bump to
 version 3.0.0
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

Hi Vincent,

On 01/12/2024 17:27, Vincent Jardin wrote:
> See:
> https://github.com/FreeRADIUS/pam_radius/blob/release_3_0_0/Changelog
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

I applied to branch next. I reworked the patch a bit, to switch
to github release files, to allow PGP signature checking.
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/bd94801092f6cdce71f78423abb602b0b72f6bec

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
