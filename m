Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0477C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 20:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A73E140661;
	Tue, 13 May 2025 20:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHM_3imKUEIh; Tue, 13 May 2025 20:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D964D406E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D964D406E3;
	Tue, 13 May 2025 20:36:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6439712A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5592A60813
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RgCH2ZWn-Ta for <buildroot@buildroot.org>;
 Tue, 13 May 2025 20:36:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 77ABC60642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77ABC60642
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77ABC60642
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:36:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6F398B00573;
 Tue, 13 May 2025 22:36:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 May 2025 22:36:51 +0200
MIME-Version: 1.0
Date: Tue, 13 May 2025 22:36:51 +0200
From: Julien Olivain <ju.o@free.fr>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250507194456.11172-1-fl@n621.de>
References: <20250507194456.11172-1-fl@n621.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <a52b0165de7160fc79278e44363155b5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747168612;
 bh=8cr+OLNGrUnCj9Ip+XynL/1ucpkyRYZAodYfasMB4+8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MCAL5qsJlS7nTzwciV4egGjbrBC73ik73CayR/fW1uaWwQr7IgQv5sLybBy5K+Z9O
 w3i7bf/waice7fn95Juqp7zra8d/GcgX/KMNQbUa3xyyNF0/d0M+9Q0v+dqgoSg2L7
 Cxt7Qq5cQIg6PkjX47AH8dcug1OgdIveP+7FBt9wHQT+cYR8A25nqKL+REfUzFs0dv
 tzKP+FnI0q4VH0ntNVZYpDVCwRGtc1dcZAwKwSpHkXPi/Mp9183GT9IvY94EFwSjoE
 VSlMSiB95bpROP8/uKyktpdJHgjkTP/xshfB8haHqa3OSYqEUEc7oRpqvr13DmIfYp
 SKAAnO/JS1MYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MCAL5qsJ
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus-glib: bump to version 0.114
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

Hi Florian,

On 07/05/2025 21:44, Florian Larysch wrote:
> Fixes GCC 15 build issues and some deprecation warnings.
> 
> The COPYING checksum change is just the result of some 
> restructuring[1],
> not an actual license change.
> 
> https://gitlab.freedesktop.org/dbus/dbus-glib/-/blob/dbus-glib-0.114/NEWS
> 
> [1] 
> https://gitlab.freedesktop.org/dbus/dbus-glib/-/commit/ad08ba0c6ba2d69783d41254e0cf03b2ae1647db
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

For info, I applied the patch from Bernd. I also reused parts of your
commit log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/778da2b7195f8ba93d17282c00a4aaffaf5d4908

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
