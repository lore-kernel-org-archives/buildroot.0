Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D6DC3600B
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 19:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C96E34059B;
	Mon, 31 Mar 2025 19:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51BiiQQ_-DyT; Mon, 31 Mar 2025 19:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0229D40586
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0229D40586;
	Mon, 31 Mar 2025 19:47:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C7291ED5
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 19:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C19360E4C
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 19:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ucejRZ20y5r for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 19:47:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FB4E608C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FB4E608C0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FB4E608C0
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 19:47:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D21DA780371;
 Mon, 31 Mar 2025 21:47:04 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47928])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 31 Mar 2025 21:47:04 +0200
MIME-Version: 1.0
Date: Mon, 31 Mar 2025 21:47:04 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250329200354.178980-1-thomas@devoogdt.com>
References: <20250329200354.178980-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <dea406b24b15d576492fca2ffba6c6e1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743450427;
 bh=iqR2X/rXar6RWS3UCwvJeC2smcKExAS6uYdIwJg6s1k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BerYpsg8I+8mC/VfVTrHg6olzG6KQf7AAxYWeiUxOM93XVgqar7egp7QXCvADP1Oc
 gpPsbC1Esci+4y1KDhDD1xXkveDBAzPk8Bfx2THGE0BRSXo6dHAho8SbUzi53W4i3P
 ufMJmAVWnLx6difxnVKZIhAiEP61bGdUXq/G0moL9S7b5XuUrvxglnnmTlDCMeDpV8
 Vm7dzwxTwyf6ZsqFnHk+0OS1zNHVdbaO9zBMl4q8da7P7GUW7ws4r1YBhlifmFblVz
 f7kxTk2tg+r8iOZg3xSrSIj/SHqH+Rxjl29f7Dw2A6kdHLMqgIdAXqVENcjZHRk6gw
 AN+PfdvVhjM/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BerYpsg8
Subject: Re: [Buildroot] [PATCH v1] package/cairo: bump to 1.18.4
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

On 29/03/2025 21:03, Thomas Devoogdt wrote:
> News:
> - https://www.cairographics.org/news/cairo-1.18.4/
> 
> Other changes:
> - 0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch
>   has been dropped because it's upstream. [1]
> 
> - c_std=gnu11 override has been dropped because
>   it's upstream. [2]
> 
> - Use the new 'lzo' option. [3]
> 
> [1] 
> https://gitlab.freedesktop.org/cairo/cairo/-/commit/9607e19a9e4c1784e7b656772e1df82aea26f6e7
> [2] 
> https://gitlab.freedesktop.org/cairo/cairo/-/commit/b60f47dfd5bbe98aec43f6c356ba3be9a1b7989e
> [3] 
> https://gitlab.freedesktop.org/cairo/cairo/-/commit/c1748e79f0b18d44891bda2b6aa877175d802660
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
