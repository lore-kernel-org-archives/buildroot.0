Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36807CFA442
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 20:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0926C6F512;
	Thu, 20 Nov 2025 20:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fk66XnHmCqsL; Thu, 20 Nov 2025 20:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C36F6EC9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C36F6EC9C;
	Thu, 20 Nov 2025 20:15:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0A53158
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3028418DA
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RG31KYYDcgzF for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 20:15:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4EBC418D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4EBC418D9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4EBC418D9
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:15:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E35B66012F;
 Thu, 20 Nov 2025 21:15:25 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Nov 2025 21:15:25 +0100
MIME-Version: 1.0
Date: Thu, 20 Nov 2025 21:15:25 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20251119215420.3354837-1-bernd@kuhls.net>
References: <20251119215420.3354837-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <f81750b884c39162c50b33469d2edaa9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763669728;
 bh=Vhwc8q6VZs9CUJKOMHCkXZv6DmmGm8dKjbOCzsw4Kqw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DCICE0bGrfpMJx1S6imG5XOjwtHSRqAg5MgvInpH04jZ+uBSMueVPR7mCz6obplAg
 s+mfdmdG6/deokUTLevJA5KbO6zYZ0OZikOXmbcqtrXE6HXeXwEqD4ACGua6pLQBrW
 gEy5kQHOdaQIba+jJ+ro7PB8rKk4qL2+ZUOKgvKdq38MPNBYpqlD6716e/8igFzDJD
 v8SqE4pxXObAAq5msP6VVautr8Uckf7v8W9KmFXLYeM4TuZGFvW6aM5zZxrYzks45d
 +95Ex8/b1mWLqKJrYtfkt9VQBl+nThlRO8CJH/SNGrB2gO98x3L/0rRPrx6f1iRCPq
 hi3kdZIZ4dCdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DCICE0bG
Subject: Re: [Buildroot] [PATCH 1/1] package/mender-artifact: bump version
 to 4.2.0
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

On 19/11/2025 22:54, Bernd Kuhls wrote:
> Release notes:
> https://github.com/mendersoftware/mender-artifact/releases/tag/4.2.0
> 
> https://github.com/mendersoftware/mender-artifact/releases/tag/4.1.1
> (mentions CVE-2025-22868 as fixed, but this is a host-only package)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
