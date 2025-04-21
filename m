Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B61FC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 09:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 294A140694;
	Mon, 21 Apr 2025 09:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDggq8iHGdyM; Mon, 21 Apr 2025 09:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D51340680
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D51340680;
	Mon, 21 Apr 2025 09:51:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EB6B68
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FC6460A73
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYOvajxr-CS2 for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 09:51:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D142D60890
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D142D60890
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D142D60890
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:51:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A7612780316;
 Mon, 21 Apr 2025 11:51:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Apr 2025 11:51:21 +0200
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 11:51:21 +0200
From: Julien Olivain <ju.o@free.fr>
To: Daniel Lang <dalang@gmx.at>
Cc: buildroot@buildroot.org
In-Reply-To: <20250418144004.24089-2-dalang@gmx.at>
References: <20250418144004.24089-2-dalang@gmx.at>
User-Agent: Webmail Free/1.6.10
Message-ID: <c84e74d0ea47058cfd153f4289b1291c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745229082;
 bh=PqB62/YEKNBYhrw6fpvqv85+S5rIoQ6MuwQLC+bmQ0M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PbEYX6BOn9MwP079f/xiJJP5fkVcD/7eU7qURuW13R14SQKiemNqAs2X/+S0ydjBc
 inYEtHocvQtA51ngWDAPPb7cWRN0UXifQu5rkzb9u+bFj4QB58mhqd1qleatUNc8yS
 JaiZu1+NCM/kgas9PozdZisMsmvivNaAUO611ABrkibOz0Owapwads9IqtmXqAmqzY
 HBZYoavZy8ABWRSpyK//XWuoRnHC3i/0DQGsyUXMJVEitrzLaeYDzNaI4bVulVtxCe
 6IstP5PC1LEwj1XNI47Y0lzMfqjopkiRrtriHUJWbDRCgxBChs6K74jgJ5mXJyJIuE
 1pQCuezBWxs2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PbEYX6BO
Subject: Re: [Buildroot] [PATCH] package/atkmm2_28: bump to version 2.28.4
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

On 18/04/2025 16:40, Daniel Lang via buildroot wrote:
> https://gitlab.gnome.org/GNOME/atkmm/-/blob/2.28.4/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
