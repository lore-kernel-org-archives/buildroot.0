Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA66C61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 11:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C448180E50;
	Sun, 15 Jun 2025 11:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyJUbknwzNQA; Sun, 15 Jun 2025 11:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05D7680E4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D7680E4F;
	Sun, 15 Jun 2025 11:31:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9B23151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B67B80E4D
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvGjpngFCpLD for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 11:31:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0410E80E48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0410E80E48
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0410E80E48
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:31:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DF6A0B0055A;
 Sun, 15 Jun 2025 13:31:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 13:31:44 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 13:31:44 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250615102550.26903-1-bernd@kuhls.net>
References: <20250615102550.26903-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <a100d79334dd474ec133adc6193b7dad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749987106;
 bh=uU1iXWd3yyKxsw8BdUj6kkRCt9UdGORof85I0jP5NSc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jHAMZz2VuMHXPCav9FhL1ElYjo02+c3CcsM0jwxoW/fOz9EDUi0ETQjEzApDmydao
 gkc33HvJgxnkYbkSeSJ1x1MU99nKFRV60WKbBPPmD0qDF7Ht/zATiV0eJXhVNEUkej
 5CXdCijrgeX8QFZrrzu/ltPyysOgyaNdPUfhS3cQ5VZrq2ijrmqB5Dq+keObduLnD5
 fc4UhfCa1//BPC68MLeypKoZ0/quDQkcvF2rFK9kZX2QSGuiJT0WpaXd5VNtK/FuB9
 VBQdKGrQ4KUMP5BkwVwm9Ytr3ViPrtx+/WksDt37uT7mmJy5WDhPw69wb7BaIWdihY
 vWXNCt8X50ixQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jHAMZz2V
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-waipu: bump version to
 21.12.0-Omega
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

On 15/06/2025 12:25, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

I also applied the previous bump to 21.11.2-Omega you sent,
and rebased this patch on top of it. Patchwork is currently a
bit slow, and I applied it about at the same time you sent
this updated version.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
