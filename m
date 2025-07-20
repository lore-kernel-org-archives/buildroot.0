Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D31C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 22:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 503C440F43;
	Sun, 20 Jul 2025 22:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJeAD-PGtJOt; Sun, 20 Jul 2025 22:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A170341033
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A170341033;
	Sun, 20 Jul 2025 22:22:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6719B127
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 22:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58B57401AD
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 22:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V53Gz6B9mZgx for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 22:22:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84C244098A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84C244098A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84C244098A
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 22:22:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 653A9780333;
 Mon, 21 Jul 2025 00:22:11 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Jul 2025 00:22:11 +0200
MIME-Version: 1.0
Date: Mon, 21 Jul 2025 00:22:11 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250720215907.3303734-1-james.hilliard1@gmail.com>
References: <20250720215907.3303734-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d0be35a0513c7edc33ea5608d0c6f1f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753050132;
 bh=FZMAAZ2NKnSl8KgIIwgME5v2pbaRrT+ZR86QzzHlN08=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ko6DqP+I6gtWZG73nkAUVDUz5tsmrR/4mPSYYh+ge18g7biZCH/BOYMAHAl/CNfof
 dYfl4vyrzQBili3r1FGL0CYsCuhDOXNox5D7osyuF3gcOjU+B8wSnA6u2OkLfw1SF1
 kXT4O54bKkgSV5m60TnB7f2CeYUPowUi8DfPM8uFlaDLCvTaJvGJqi4qaWvzj8yYXo
 l/riC0d3DvLk3QLCCsWuumAfqzlWwml+Egf6CA7v4yRy4dkHjUGQWb+Vs3V/oCq1bf
 mvqninRE7VWfUSn3AahIKWky0AFkeVtOK6GHHb9OOcLgLyVBhmVJpGw5JLnkZyQbXc
 OCOsto//L+mOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ko6DqP+I
Subject: Re: [Buildroot] [PATCH 1/1] package/python-propcache: bump to
 version 0.3.2
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

On 20/07/2025 23:59, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
