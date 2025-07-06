Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5583C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 11:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C22680DBA;
	Sun,  6 Jul 2025 11:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nycb4VripkOX; Sun,  6 Jul 2025 11:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C85AD81013
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C85AD81013;
	Sun,  6 Jul 2025 11:38:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FDE919C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 11:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0654B608A7
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 11:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Em9pqm3WJo2 for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 11:38:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B6B06089A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B6B06089A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B6B06089A
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 11:38:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6EF052003C3;
 Sun,  6 Jul 2025 13:38:50 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Jul 2025 13:38:50 +0200
MIME-Version: 1.0
Date: Sun, 06 Jul 2025 13:38:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250706070615.543413-1-bernd@kuhls.net>
References: <20250706070615.543413-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <a2711ee992220bae12589e06a0a81c11@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751801931;
 bh=TZ/RQqYmFYmogxAzE6FQHgsWRL1MYU/KE2Ay6bdqmoI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V50oySGwPwncppyhH0kjWC4Te6Ghgqp/Qdq64vl4xr27mk6j9Jc0J4RrUAPbmypO9
 MpWFQ5jfE/OQvR0cVoJTWg7etF85BAYw8sdBQshO0+sufgfx9LrWtwIHOyJyMJlEoW
 tutB6A1iWq1pqNG9gPQnF3C+FU59q6rGlDHHDMtHdCOUQ+24Yp4CPfO08CjYgK5MQn
 uzG08V1/2nkiSnMLhyR4718OvjL+7YQTu1yjwgt2lr8nVrk2UVdLKW85DgutEaqjVh
 VwRBaiaWuaXu+Z9ZWDEU4D0gR7ILrXR/oqQBqe1MpM0maJlnc3jXTy1PeI9yeLKIBK
 xFx3T6NNEL6KA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=V50oySGw
Subject: Re: [Buildroot] [PATCH 1/1] package/hddtemp: fix build without nls
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

On 06/07/2025 09:06, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.org/results/06b44df261318ce1d07f6cb20b26e4ad64222940/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
