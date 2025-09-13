Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F5DCAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 15:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6472E6169C;
	Sat, 13 Sep 2025 15:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_dqTrnM7OZt; Sat, 13 Sep 2025 15:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 970FA615AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 970FA615AE;
	Sat, 13 Sep 2025 15:02:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBD5025B
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 15:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDF2C615EC
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 15:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkg6-UgkhD8D for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 15:02:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7DF961465
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7DF961465
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7DF961465
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 15:02:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 734C0B00583;
 Sat, 13 Sep 2025 17:02:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Sep 2025 17:02:06 +0200
MIME-Version: 1.0
Date: Sat, 13 Sep 2025 17:02:06 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250909161259.34807-1-angelo.compagnucci@gmail.com>
References: <20250909161259.34807-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <52bbcaf64366fa6a608ba8c3d945915c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757775727;
 bh=GSMxKWNociBglTvlWgBzKKi36ehGMjjFZPvgg300/Wg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PSjJGtY6EMaKoZDcUBb+30beZhdX+domYD1JAzd2TAbuOKRQKVFIR/xxQNlt9Zhqz
 WSVEyvyHtQrPc8xe9P7Azk6D5NsHlj/f/25H9XqHQ0M4e58RMy+F/EuL4eqfumiRut
 CII1pRBV5CO7MszQquoe0LrJiJkFiv1n4tptoEoerARX5WKfm3H5AsUjOxGv8b4HJB
 gKPMaJm1Q8SqxOc4UvsLcUr/CUFbru3zGa8cDobVmerKue5ZxE8vfCfp5JnsSXkcw3
 cXBlyh0i/Ft2jpQ9LFLYvQoQRNCnnZLKayDmNw+DaVk1Pq8AkcmQo9gYpkdbd2QQ5G
 voFla5fw2ahRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PSjJGtY6
Subject: Re: [Buildroot] [PATCH 1/2] package/htpdate: bump to version 2.0.1
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

On 09/09/2025 18:12, Angelo Compagnucci wrote:
> Changelog:
> https://github.com/twekkel/htpdate/releases/tag/v2.0.1
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Series applied to master, thanks.

For info, I did a minor fixup in patch 2/2, see:
https://gitlab.com/buildroot.org/buildroot/-/commit/1f2b459b56b117e97164feb397ad14435717d524

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
