Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3EBC021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 13:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0937A8128D;
	Sun, 23 Feb 2025 13:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQ-360VbwNXf; Sun, 23 Feb 2025 13:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20EE781295
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20EE781295;
	Sun, 23 Feb 2025 13:27:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC988943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACAD060A76
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcNtb33uWICR for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 13:27:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB712608C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB712608C2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB712608C2
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:27:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9B472780316;
 Sun, 23 Feb 2025 14:27:01 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 14:27:01 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 14:27:01 +0100
From: Julien Olivain <ju.o@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20250218053718.80431-1-fido_max@inbox.ru>
References: <20250218053718.80431-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.10
Message-ID: <b0cb51f88923afd2519389a986ac0087@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740317222;
 bh=BVuCOd0ALFKohtFqE/95TkRhYeyerqEaGNcU9xam7gk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mh7MvM0az4fa0QiNf5VHkvD0NF/z7ZlQNFE6v9CqDs6cRGkyo+Qda6qn2N3oJ34y7
 b4o2ykJ0O3CuXPfZcm8JY652msGzpwdKl+Pg4siHtyN130dXnnzffTWfFMsLJgUF2e
 Fa3EmMlYvdJwc215ns0SKAHs1g2AwLmHXDZdt80/wtRwk9IDPC2o/ROTtxlw/Awpsz
 tNKDj/+TFtJVMxdoR8w/8mV5VL/L43veNUfMdrEjQly4x9wyxnAh8veJz/yZQUze7G
 4IMN9wJDz2iXxufg/msQ9vsxAxtfCnQxLvnZYdY5JiCpPelA93ik15YFoN2NjDAYy7
 5j4ulVwXChSmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mh7MvM0a
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.5.2
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

On 18/02/2025 06:37, Maxim Kochetkov via buildroot wrote:
> Changelog: https://github.com/postgis/postgis/blob/3.5.2/NEWS
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
