Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F7FC83F1A
	for <buildroot@archiver.kernel.org>; Wed, 23 Jul 2025 22:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51F6D61320;
	Wed, 23 Jul 2025 22:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Ba5yBCtCpG7; Wed, 23 Jul 2025 22:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BCCB61325
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BCCB61325;
	Wed, 23 Jul 2025 22:29:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B11EADA
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 22:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9779261324
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 22:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWBCcGo4wMXD for <buildroot@buildroot.org>;
 Wed, 23 Jul 2025 22:29:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 03A1A61317
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03A1A61317
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03A1A61317
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 22:29:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BAFC919F54D;
 Thu, 24 Jul 2025 00:29:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 24 Jul 2025 00:29:39 +0200
MIME-Version: 1.0
Date: Thu, 24 Jul 2025 00:29:39 +0200
To: Jesse Taube <jesse@rivosinc.com>
Cc: buildroot@buildroot.org, Cyril Bur <cyrilbur@gmail.com>, Thomas Huth
 <huth@tuxfamily.org>
In-Reply-To: <20250722174032.984258-1-jesse@rivosinc.com>
References: <20250722174032.984258-1-jesse@rivosinc.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <fcade89aacd08607a08bbd6572c024c6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753309783;
 bh=/Go26x7JuowdaWeM5ee0GDq2OXPvKd6QPytS6TXxsO4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z5uIz+Ilc6LzbWjyB403Bxk8FReEE+eAr9ctg71HfFlkRRQr1yLlaNBbLuI7o+cZt
 MEq05icE8tTi0s8MoiyVTeCSQYXXykvqNDH2YpTa1293XMOL5Sy6ronBdNpvQyaGjd
 d6GnR6yIgOZ0IorM/e/5Oat12vmp0DiiZU+p8t/BMYJDVz7FiKNT9SoejVErDJpe3N
 M+fQx5ucJSC9aVEIwTnf+H0DP7oMAp6ZrRpyDj5Tov9wj4Ii3GDF/g2s7/Dd1dCuTq
 ngVC2UwNUxzjtguGUUXZ8Dg42akYdNLDkxc8SkGWmZhTvh3Cr4hHJmUWxPxnrbXqOO
 sqzbhQ+w8Y22w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z5uIz+Il
Subject: Re: [Buildroot] [PATCH RESEND] package/kvm-unit-tests: Add RISC-V,
 bump to version 2025-06-05
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

On 22/07/2025 19:40, Jesse Taube wrote:
> A new kvm-unit-tests version has recently been tagged, so let's
> update to that version.
> This version also add suport for RISC-V, add RISC-V to Config.in
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Reviewed-by: Thomas Huth <huth@tuxfamily.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
