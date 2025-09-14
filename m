Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF289CAC587
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 20:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3FD86F682;
	Sun, 14 Sep 2025 20:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MS_oUW5PTgGz; Sun, 14 Sep 2025 20:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 438B56F68A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 438B56F68A;
	Sun, 14 Sep 2025 20:41:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28C25255
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FDC141F4E
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zaaSxBfjpeR for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 20:41:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 306A641F36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 306A641F36
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 306A641F36
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:41:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2ED2860129;
 Sun, 14 Sep 2025 22:40:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Sep 2025 22:40:58 +0200
MIME-Version: 1.0
Date: Sun, 14 Sep 2025 22:40:58 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250913190434.2224911-1-thomas@devoogdt.com>
References: <20250913190434.2224911-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <033857809a87a530c356003bc867ecee@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757882460;
 bh=n+hzOWwNlWQeO51dMhp+G7Lk7CwXwgEmgr2XYiIkSqQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cGuvXPfUXRa+cHv8H2YEXHImTrbNH8m8Po0blXKxO3ys7gwGppikwrOy0OQk61V/r
 ZjlXzObMXPmMCV5QOYj3hBhQKpy/5LG4/xnX9hlLjZgroGemgqwH6K0FrYyGKWtah3
 zGBxGRMLr1jlxwtbRK7mlwtSnqUGtByhgN7zxEhhZ+q6yONB3FoBpD8fQhpnEmtQEf
 pWZAs38rOJewvpJtpLSZGtgZXG/ddejLJROatEbMCZ0doODHn1ViHJ4debvzpACpey
 EkF7H4PWQJ159De0FHYW3RiPI6lOL33RmxltWqAN5WPPWUdzBmT3uM6VVkW4mBIXSl
 Ofn8anhNoKCgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cGuvXPfU
Subject: Re: [Buildroot] [PATCH v1 1/4] package/wayland-protocols: bump to
 1.45
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

On 13/09/2025 21:04, Thomas Devoogdt wrote:
> News:
>  - 1.43: 
> http://lists.freedesktop.org/archives/wayland-devel/2025-April/044134.html
>  - 1.44: 
> http://lists.freedesktop.org/archives/wayland-devel/2025-April/044161.html
>  - 1.45: 
> https://lore.freedesktop.org/wayland-devel/aEw0AP7h6T8l11ug@gmail.com/T/#u
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
