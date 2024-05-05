Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B111DC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 15:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 771B540178;
	Sun,  5 May 2024 15:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_FZv0uET67V; Sun,  5 May 2024 15:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AAFA405D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AAFA405D1;
	Sun,  5 May 2024 15:40:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A83CB1BF82D
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9522D820BC
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byJuJp-dQKvZ for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 15:40:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D405820B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D405820B6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D405820B6
 for <buildroot@buildroot.org>; Sun,  5 May 2024 15:40:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E7B8113F8AD;
 Sun,  5 May 2024 17:40:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 17:40:30 +0200
Date: Sun, 5 May 2024 17:40:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZjeobnFN7zuHcVfo@landeda>
References: <20240503192840.1240802-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240503192840.1240802-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714923634;
 bh=+dVLCue4NHwWK1+PnGjgC7KgKWxiCXayC5/AAU/qZEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A3asRA9BQZ3oE7Ox/flfICzmTyH5cLGEbpCxxd3pv5ewrLZCmzyHyxOoEBc6czPnb
 7IaCSyjsPYqzcN1Uok8S/5/am2Ux+UB2mY7RP7ZrvHBy16QChEYHBXFV6nxrxdDcuu
 tGKURVk4FDL3XpcB9E1J5+xNMF4WpcTvfqQLa1cTbTRwEXcttSjlOj/Hnb1XSYPlZv
 YuX47ppqccSz9oUhZZEw0KwqJGSN5W/3zY48L+lWknuFOt+OnDJNbuqL7EZQBnbhNZ
 IUSTXzDu4VGNXjOQh3pvFktqm59fYSR99mGQoam1PnoLgS6OHnCTLGD3va2bG1mGeu
 KNdJfwUfaNRCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A3asRA9B
Subject: Re: [Buildroot] [PATCH 1/1] package/ledmon: bump to version 1.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Maksim Kiselev <bigunclemax@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-05-03 21:28 +0200, Fabrice Fontaine spake thusly:
> - Add host-autoconf-archive mandatory dependency
> - Drop patches (already in version)
> 
> https://github.com/intel/ledmon/releases/tag/v1.0.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
