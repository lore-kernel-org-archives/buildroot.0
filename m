Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54832CAC5BB
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 10:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22FA140649;
	Sun, 28 Sep 2025 10:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMqlM2zK2oAr; Sun, 28 Sep 2025 10:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5245A40699
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5245A40699;
	Sun, 28 Sep 2025 10:19:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03548197
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 007716070D
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M52BL95lD7cF for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 10:19:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6273606FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6273606FD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6273606FD
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:19:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7E7A1B00576;
 Sun, 28 Sep 2025 12:19:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Sep 2025 12:19:29 +0200
MIME-Version: 1.0
Date: Sun, 28 Sep 2025 12:19:29 +0200
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20250926111120.357053-1-raphael.pavlidis@gmail.com>
References: <20250926111120.357053-1-raphael.pavlidis@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7c823183eb069e32d7584173b999296f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759054772;
 bh=kkNegVFf1GQRriyaLXZgtJ9qjPhCXpKeb5w9IJnWH20=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ISlp1PwRQWxC59WtAo8LGMVQk58WyuDx03JCbe+2Mr6zfUx9HK07l6sR0qvI0SG8B
 wBu7+oyboBdGhdIkPH0L+7D7+YfotRBDBhleM/YpnWoXRA301KWp4QAsGoZyITyWGG
 ws9N+JkPzfejE4RqlhyeUJcpP03v0GZKhFxjPZl4PSsEBXXDJOTBovScSOTyK0EjOY
 POr+i5/0mTqgJIaI37LQEgsqQKxqstUhOGULsq6ZCW1KDNgnDcAcCzK1YsrJaCBR8z
 jXg789JOv0/hhRlrN6iRjX/FDe/QDRTg9ImqKEUWJ8cM3vhCZiLtrY/9yaPMR1Ipw8
 x65DOJzrarGiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ISlp1PwR
Subject: Re: [Buildroot] [PATCH v2 1/4] package/wlroots: bump to version
 0.19.0
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

On 26/09/2025 13:11, Raphael Pavlidis wrote:
> Changelog:
> https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.0
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
