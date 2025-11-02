Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380D9CCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 17:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C9376F5C3;
	Sun,  2 Nov 2025 17:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeO2IwjHzfWG; Sun,  2 Nov 2025 17:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C2CB61130
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C2CB61130;
	Sun,  2 Nov 2025 17:03:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CF792A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 17:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 434A642672
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 17:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0LWlpUBkDp3 for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 17:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8913A4266F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8913A4266F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8913A4266F
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 17:03:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 41F962003DA;
 Sun,  2 Nov 2025 18:03:26 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Nov 2025 18:03:25 +0100
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 18:03:25 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251026102229.1323577-1-bernd@kuhls.net>
References: <20251026102229.1323577-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <0c015a3486fa8670803765087c503281@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762103007;
 bh=lz+LytL2Z0rHZ28Xs73r4XLgEixb1oxUcexQoFg85bk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HV7u0ijP3z7hmza5fzL7kucAa9vBkQe/AXcLvGXiGoULJKbZo/g3hlgfjOt+lC6GA
 KDy962vxFD8aI7OpnfD4+HGKX3cNVpL6UhjSuYNajCUAAUrOMmPbKdYq5fQbMsim5U
 NYtmUG9Eb69uICmJ20T01pyyemvi/eWHvE0b7f5DwuPxWfzY1FQrNMZJkv1RmBxaT4
 ydPuhwAMEjX7KKXUdUIfS8jUZfjycwcYSdkbhln5oUW3s7Lpy0zfe1vbzvCx9mYs+c
 SgVjIaw62tZuW+8xbOQBAl1z1jPKhFYO3TAH27pbsL7EjqL8gMajL+5M2xj6Sxg8HQ
 DTY8xCpb0lx2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HV7u0ijP
Subject: Re: [Buildroot] [PATCH 1/2] package/libiconv: fix build with gcc
 15.x
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

On 26/10/2025 11:22, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/387/3875466a80e57dfd96911a2166e496cf7d41bb69/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
