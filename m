Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3645CE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 17:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F233240294;
	Sun, 29 Dec 2024 17:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5XqtCCN4W0a; Sun, 29 Dec 2024 17:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0FF1403D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0FF1403D5;
	Sun, 29 Dec 2024 17:51:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E40772
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 17:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EB93401D5
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 17:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySR6f04VwX_F for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 17:51:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AEAB54012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEAB54012F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEAB54012F
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 17:51:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 84A51B0051E;
 Sun, 29 Dec 2024 18:51:02 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47364])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Dec 2024 18:51:02 +0100
MIME-Version: 1.0
Date: Sun, 29 Dec 2024 18:51:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20241229170639.1307928-1-bernd@kuhls.net>
References: <20241229170639.1307928-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <b23694461e5f3b72d4ab2c2ce1d96a76@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735494663;
 bh=xfX/QShO8+b/uekp6UQwW3NMySthzBS5S8UHh13OB7M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B3+lrtzqTCkV/kqP2/NObzkGceGJbq78nmaTRYGmCZURYt0TcruO/8IFUl8v7ymEX
 wVQArbEADuSSWk4cRwF4PUyrl9/2Kc0ej32KxJ6i7saLeTilxxvxZ/L0YSDZ/8H4I6
 QFCCSO3hTG1fk0a7DP4ADD69YhwR/rVdu182hDn1yRSuZrf5VLL9OC3k4HoFpvaeVt
 NcuE9iOR+Mj4nKb+criUv7Cxu1YPyR18x/5BSN3aLXRFRmk8tia2JIEY/ZolVylMc3
 LmWRQHbq+24MnT+AdC0+amq8vk774E1o1tQUcp2mHDV+bxdEWQSmD8kl4FqqVqnjmK
 sOi++HhOufBGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B3+lrtzq
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12}.x series
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

On 29/12/2024 18:06, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
