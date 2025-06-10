Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6735BC61DB2
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 22:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F342608D6;
	Tue, 10 Jun 2025 22:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGJqfApezGrJ; Tue, 10 Jun 2025 22:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82C1B60B26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C1B60B26;
	Tue, 10 Jun 2025 22:01:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26EE91F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 22:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CE1683E05
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 22:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNpDYwBbTmvY for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 22:01:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78A4A83E01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78A4A83E01
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78A4A83E01
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 22:01:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 431DBB00548;
 Wed, 11 Jun 2025 00:01:12 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 11 Jun 2025 00:01:12 +0200
MIME-Version: 1.0
Date: Wed, 11 Jun 2025 00:01:12 +0200
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <aEfq8DJK2zFDgfjn@yd-6wlzhs3>
References: <0cc8c132abc7f2117de95906fc1ae4729100c564.1748355369.git.yann.morin@orange.com>
 <7c0c1993b8789a5c5e2af275c8dc9882@free.fr> <aD1K1vCLJt7/3/i4@yd-6wlzhs3>
 <2a3ddf239d7e5422e401019cb91ecace@free.fr> <aEfq8DJK2zFDgfjn@yd-6wlzhs3>
User-Agent: Webmail Free/1.6.11
Message-ID: <4ac5f73a3b47c01fa82b574bfe194fe7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749592873;
 bh=DvS/HdPj21OTxU401yXz+01zdgQkFPcUAjmKxSE2tms=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZKrBoVojyq+XbqwJWRm86RBsi3IPO5H9xrcObCjYTEwvyFqwHzCxmdhLzcmg2mGHR
 99dxuDwILqNbgUwovWSGCZ/TjqoKVujnuq78rLs3eRTeb5uwJzCbiWlwzYpAUcV7qz
 Vt7aMVmWSkWDAtukOLUglm0dW1jFjj206u5pzZ7QJ4NgHpePXSYEMBTbm1VQHumIPK
 u715Hm3MwVQm8DKuG6mojV8FgalPlO1QrKkwYS0lK8gxjihAiXQn5J57kVkW2BL5HU
 1DmO3EvVWpnvaYbjt9War9wdFNYcVe3Bvp4ngYEp2Alxx4Tge0rUEybQ01tyddNUxZ
 Jn4rcEWGHyZ7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZKrBoVoj
Subject: Re: [Buildroot] [PATCH] package/gpsd: bump to 3.26.1
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

Hi Yann,

On 10/06/2025 10:21, yann.morin@orange.com wrote:
> Julien, All,
[...]
> PS. In the commit log for 9188bf42e4e, you mentioned adding the legacy
> entry; but IIRC I did add it. Or did I miss someting? Or did you mean
> you fixed it to apply to 2025.08, not 2025.05?

I simply added the upstream version number "v3.26" which removed the
option in the Kconfig comment.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
