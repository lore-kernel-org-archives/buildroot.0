Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F224ACCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 13:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12E466F555;
	Sun,  2 Nov 2025 13:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aa3lTB7mZ9FZ; Sun,  2 Nov 2025 13:46:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E2E5615DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E2E5615DF;
	Sun,  2 Nov 2025 13:46:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 511702A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37A1241930
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkzaxpdObLbq for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 13:46:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05743418B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05743418B7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05743418B7
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:46:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E156D780389;
 Sun,  2 Nov 2025 14:46:30 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Nov 2025 14:46:30 +0100
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 14:46:30 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251102124514.2343128-1-bernd@kuhls.net>
References: <20251102124514.2343128-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <dee8b588cf80abdf726f3b0bcb466616@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762091192;
 bh=sfc4yTMM/rSlWPJ99H4K3Z+e0TDDe5knq/zLEQLmBOw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JZKyby8oU+WLtBtoGbYSvUGaq0c0hryCR3cg4r5982EnuguXsIylnn0Wuv/560kr/
 A9jIHK3kJD21DiqDfgfRwT3qBdssSKOsKfSqFuTRggHIUaTrzKfctuV8CcrEa1n+Ar
 ijyOmSsBswO10t+BNzSnsoFsLUmFVZe9SH3rY8FaOZHNqq4rVyTHnGCjEqBJ6l2ivF
 o+sSghBYL9H8zuMM+aOGzEyqQyvBAsDPUlmszoiziL5OGamav/N0zyS4s0u0rOn/7f
 mHHzXicM+XMc9ZJWqfwjrqz+JVN15N24/G8qAbPvKOqD3gx7SUFm0udujy3YsXtKpi
 h6apI8YvnPo4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JZKyby8o
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.128
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

On 02/11/2025 13:45, Bernd Kuhls wrote:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2025-November/003639.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
