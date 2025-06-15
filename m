Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863BDC61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 20:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 561BA60B02;
	Sun, 15 Jun 2025 20:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5K-3oC39wQ1f; Sun, 15 Jun 2025 20:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BD6D60BC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BD6D60BC5;
	Sun, 15 Jun 2025 20:31:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE8E9151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D080940499
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wOm3q1w0CCI for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 20:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2523B40497
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2523B40497
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2523B40497
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:31:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6B35813F86A;
 Sun, 15 Jun 2025 22:31:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 22:31:15 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 22:31:15 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Cc: buildroot@buildroot.org, Johan Oudinet <johan.oudinet@gmail.com>
In-Reply-To: <20250610100622.1755003-1-thomas.claveirole@green-communications.fr>
References: <20250610100622.1755003-1-thomas.claveirole@green-communications.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <6c99dbf34db1b91238e9e0f1e5d3099f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750019477;
 bh=mxdtvV13VJJ4GsaJ1nCp2dnwX+rTc9/QEepNPb9VseU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ufO9IooJ5hT43TGxOVdgHx0vGqYbCj6EM/jQmre67MvsKZR3GzOLZMtIbpbj0dpZF
 ogvrMbHiUlMuM3/ZoqyU1kRhQcPzX28LLQerg2goGnjMJbAzKGeKqF7qoHqtsxvF73
 ng5q6uKtQYUIcxjH20QMoceFrc3ADUFc+WRkx7zLcgLSDlakvN0aXP5UF3tz6YcODm
 Rv8nrTX1Vn1WCbP6v2vh/AxxCkTg9uy19s09wMc/4YzTdMew6SVO7/i8XnXVu/X0bm
 JH4wKKgiBucTghJDo6BjYdYVuU38s7cQSxAZ5uchLVkjR2A83KqQCyTCr4ak6/xS6z
 GYOfLSGsw4dqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ufO9IooJ
Subject: Re: [Buildroot] [PATCH 1/2] package/vuejs: bump to version 3.5.16
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

On 10/06/2025 12:06, Thomas Claveirole wrote:
> Signed-off-by: Thomas Claveirole 
> <thomas.claveirole@green-communications.fr>

Series applied to master, thanks.

For info, I added a link to the change log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/c675522f55e98ec85a9fac7e8c5839155a39f75e

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
