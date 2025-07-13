Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7D1C83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 15:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8A1281448;
	Sun, 13 Jul 2025 15:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ne5o-UWMtDBp; Sun, 13 Jul 2025 15:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F17D881463
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F17D881463;
	Sun, 13 Jul 2025 15:44:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A10CBDF
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86F9C60726
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EY8EaUmUrTln for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 15:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B2693606D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2693606D9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2693606D9
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:44:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3E2C95FF95;
 Sun, 13 Jul 2025 17:44:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Jul 2025 17:44:05 +0200
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 17:44:05 +0200
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250609105610.1261827-1-m.niestroj@grinn-global.com>
References: <20250609105610.1261827-1-m.niestroj@grinn-global.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c019f1b496fc087da87864845fb5e8a0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752421447;
 bh=YMPeVXQWkm5g98gAk5CObZ2aX2gnTbah//f1/DV8qzA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=swmT6lfBmpTP+RnxHJnSLwKtr1M6atrg+SdOtRCnxNVj0x4HzC9sBm0FBV7fyzrRe
 wINcL9V5ybFLo5Bj0U0kTf1YvwOo8lsZPrVyBKBDz9v7DgyaqipuoDaYro3dp7fQqB
 tVmGfredM04NlaNqYlLqIp9DqAQeWamtIGOsEMMkH4DkGXEFPZXB2lRvTK+WAFNt8x
 TNjFzeiScxXtWKIKwgMcVVT/P528j3e0A49EC0WvpYwzOQQxcHFWBVlJHiEBioKrUV
 SNTFidnxZLQFL6M8fIWkmT+r35yzGcqZ/AxGo76Y6CDYgLAXFP3yfSuTt2TcmhcLvF
 J0c5dLKON2tVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=swmT6lfB
Subject: Re: [Buildroot] [PATCH] package/python-packaging: bump to 25.0
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

On 09/06/2025 12:56, Marcin Niestroj wrote:
> See [1] for changelog.
> 
> [1] 
> https://github.com/pypa/packaging/blob/main/CHANGELOG.rst#250---2025-04-19
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
