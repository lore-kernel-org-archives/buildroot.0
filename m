Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A08AC83F17
	for <buildroot@archiver.kernel.org>; Wed, 23 Jul 2025 20:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07230413F2;
	Wed, 23 Jul 2025 20:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZLYbUeOOm9z; Wed, 23 Jul 2025 20:59:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45CE1413F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45CE1413F8;
	Wed, 23 Jul 2025 20:59:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF9CBDA
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 20:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A162B61278
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 20:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNz5-B19p8Ps for <buildroot@buildroot.org>;
 Wed, 23 Jul 2025 20:59:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EFD461142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EFD461142
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EFD461142
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 20:59:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 910A413F880;
 Wed, 23 Jul 2025 22:59:27 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Jul 2025 22:59:27 +0200
MIME-Version: 1.0
Date: Wed, 23 Jul 2025 22:59:27 +0200
To: Jesse Taube <jesse@rivosinc.com>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>
In-Reply-To: <20250723151258.1015918-1-jesse@rivosinc.com>
References: <20250723151258.1015918-1-jesse@rivosinc.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <559f607b371cbe72ec1bed9f42399de2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753304370;
 bh=wJc/rn5YrcivfPpwhNYxeX2sd2J3M5FDUWTzzxLCXBQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KH3wlvM8qpsyFTF+39K2lCb9S3I+LHzIE5rxm6h6XaWvyDf6B1CGLY477XNYQzW54
 DzDkYub0lqX0KA1hRouLmsfj/qgl3FvixvpwLZ0AQIAgB7ln7qqJUMHM5iVwNyx7YQ
 WQ0Jv6jXbhBmq1V42PfdN02pJP/pYvWEifPGNheyXXfu7x1roTl4xX3bExHCMlpMNV
 zHXBBisJ2vVziIhYyL7KPTlX81lqLwYOcB0p1vLuwUhwA6VI/XRyKqjCyEWYO0Q92m
 cuA3uyrHmY4rBi8UBg0aUj+Vl+Ujj2fqouaRIa3NsHhm6TzYeezONnQ4GQ+iXteG5/
 TB4wuzxml27bA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KH3wlvM8
Subject: Re: [Buildroot] [PATCH] boot/opensbi: bump version to 1.7
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

On 23/07/2025 17:12, Jesse Taube wrote:
> Release notes at:
> https://github.com/riscv-software-src/opensbi/releases/tag/v1.7
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>

Applied to master, thanks.

For info, I added the missing BR2_TARGET_OPENSBI_VERSION default value. 
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/38c5b1e29eff8eb47d39b7eb13e91190c8b5ba7f

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
