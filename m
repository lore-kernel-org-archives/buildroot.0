Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75719C7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 20:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43E2560B56;
	Wed, 18 Jun 2025 20:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSYPuvbHSxbU; Wed, 18 Jun 2025 20:18:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8289160B58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8289160B58;
	Wed, 18 Jun 2025 20:18:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1337E2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2B5260B58
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXWOFlOYM99h for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 20:18:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE2F560B56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE2F560B56
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE2F560B56
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:18:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 127D8B00548;
 Wed, 18 Jun 2025 22:18:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Jun 2025 22:18:29 +0200
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 22:18:29 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250618184751.755758-1-bernd@kuhls.net>
References: <20250618184751.755758-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7bb8f1ffea1668bd262d5eb14075d610@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750277911;
 bh=PnbtabZ897o5XvghREyuu+nUhCuikRMu9siyk2lOzxs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qFynCeAd+9dVlVF7n87qi0duH3EcodcGh+hw/CnZpXSHqn5T2mA0dDA+kVwPufzua
 2jPh1FZO1ygozwi8p4kbdMWgogzMXZ9Acuo3T2L5OjvbCzFPmcGZzrywt4krygtUkp
 pREdJvPjTsy2zCKyhxEkj48xc1bvls1wh5F5AvBbZhWDpUdU2SqIxypGLjwsRW7NkA
 YTeoiiSQfZtUbDpjJEglD9m0fHG9WylpPksnoZa3PRv7Qb896MabQHNM+XbKzLS7su
 7h6zcJrv1+NL9eE01ytgjrIIksnCreXod2hDZpRcveDeF7D2k6A5RTPXn1pCVTjt9S
 P+HkiSRYX1Tnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qFynCeAd
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 1.0.9
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

On 18/06/2025 20:47, Bernd Kuhls wrote:
> Fixes CVE-2025-20260:
> "The code flaw was present prior to version 1.0.0, but a change in
>  version 1.0.0 that enables larger allocations based on untrusted data
>  made it possible to trigger this bug."
> https://blog.clamav.net/2025/06/clamav-143-and-109-security-patch.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
