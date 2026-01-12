Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69614CF45C0
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 18:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BCF860C01;
	Mon, 12 Jan 2026 18:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3C8-RKA-Rx0k; Mon, 12 Jan 2026 18:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6969960C09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768241016;
	bh=qwFEG/Zd/IAg3V1PJusak/dpar1soH38hLQqkpmCrrU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rmXS/4y6eNnebS+q903QAUDsLUoxGRB6ewKGRhrUaMMZ6olEeaF/MqE4dy6daH1KN
	 hSE5IvOpp0ZZvp9ynBGc11s8CUrlPA9KSRVdYF8p8MuC5s0lhi4g8I74e/o+sytt4a
	 V5ZyHiGIDWYLgglzBVfoeJiqewEgyIvRoFUHyIf6KgMnqEq46qmK/fsfjyAlGJ5JaY
	 03S/N+9FMz86Op1cUyZ6GH9jWKdNefZxgDWHxtMwaqIT2CzySN2ExXmNDXVWbreaxN
	 /rf9Op0avUaR1BoQDmMZ3PJ19rwF+/ISOiW0S0ZmyrpCrtHWjH32bP+hLGj0tsOwVP
	 cfBuNcDN6O91A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6969960C09;
	Mon, 12 Jan 2026 18:03:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71DEB1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63E6683F4C
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOJH-2QJfpai for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 18:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACCAE83F4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACCAE83F4E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACCAE83F4E
 for <buildroot@busybox.net>; Mon, 12 Jan 2026 18:03:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E36C5B00576;
 Mon, 12 Jan 2026 19:03:29 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 Jan 2026 19:03:29 +0100
MIME-Version: 1.0
Date: Mon, 12 Jan 2026 19:03:29 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260112075816.710903-1-francois.perrad@gadz.org>
References: <20260112075816.710903-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.12
Message-ID: <a273bbbe281c09be5bdbcdd0f9321aaf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768241011;
 bh=HmjgmYqMoj48J7iDfQ98UuK1JedHHwjAOdFk8u/9cKY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ayEdMv2GltGQw1tnwS+AgWJqibOYpIyrtm281t2HGQr/JV7zq7WC8djaWFYMbGeNB
 wHTa9kAaN2inTzxFzoF+q9cGdNhLNAtupdn66eJ9Ry2GVRvj9HJAcXuDuhBoMCneAP
 WI25iWlMyuGxwjg66auiYewK/yN9A0Vdrw8Jw+NmbwCZ8a8l1UmO4iwkRrL5sboASt
 yoXVRGe2UDGy+kK5NwEpm5a1iImYI9ZCEhkiKuN8xlgJBYB1xm7ieabsMjq6/XGtA2
 f0DarJ5zzVHtM03YWc6ihcgD0m2QWr06Lz3d2bHp/hizKV+Rh4dkK8Q+6XxzK2Nd/+
 ApM47jkQDVlnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ayEdMv2G
Subject: Re: [Buildroot] [PATCH 1/2] package/perl-net-ssh2: bump to version
 0.74
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

On 12/01/2026 08:58, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
