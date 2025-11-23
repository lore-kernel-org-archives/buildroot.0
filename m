Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3B0CFA46B
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 13:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C3264084A;
	Sun, 23 Nov 2025 13:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7bX9A4u5JOh; Sun, 23 Nov 2025 13:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64DE1407CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64DE1407CE;
	Sun, 23 Nov 2025 13:29:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBF2F34E
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 13:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE59060762
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 13:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iibLLWI_75mM for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 13:29:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E346E6075E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E346E6075E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E346E6075E
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 13:29:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5814E5FFAF;
 Sun, 23 Nov 2025 14:29:09 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Nov 2025 14:29:09 +0100
MIME-Version: 1.0
Date: Sun, 23 Nov 2025 14:29:09 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251123104513.157388-1-bernd@kuhls.net>
References: <20251123104513.157388-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c8611ca315ba2a7a987cf28afad011ac@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763904550;
 bh=mu89ruSlyULHxFWm7HQ0Cj3golcwH8YSEapKcEytn0Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H9JIVmnY+qcy3wSSmiwZVXmHKWBuX+M58xkiWMg+tpRg1m6/HvTUe5JiOyJRIbQkq
 g5RhWdBUmfpy7VNy4RkDuO2D+obZqT8C7FWHzaVt68HBPqxeYTTTR9V5NfUD1gJjht
 tdIU2y8mcJwgSi65OOA2zlAQEFJJtLsZEFqB+U/xgp1RNK1VSlHWeNVFgeoXkh+WXn
 D5fiVSabgz6f/Re0jmCN5ToX+15HrYTHjJxaPiJKTJ09MTvNTuJyT7OFaBXuXoleNF
 aXbHErycAA+c4gEZ6PdxbxdnJK6JJPed+Tt77YByGheJRZNlYXs9txRgF5fMfuu+vn
 5uVXUnDyzHOLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H9JIVmnY
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: security bump to
 version 3.8.11
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

On 23/11/2025 11:45, Bernd Kuhls wrote:
> Release notes:
> https://lists.gnupg.org/pipermail/gnutls-help/2025-November/004906.html
> 
> Fixes CVE-2025-9820.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
