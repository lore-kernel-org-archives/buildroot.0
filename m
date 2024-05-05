Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72AFC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 18:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D4B2405BA;
	Sun,  5 May 2024 18:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwYrzVjVQ8G3; Sun,  5 May 2024 18:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25187405BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25187405BF;
	Sun,  5 May 2024 18:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EF441BF373
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 18:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A54A405BF
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 18:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YW4sHG3AoxST for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 18:45:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8A8D405BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8A8D405BA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8A8D405BA
 for <buildroot@buildroot.org>; Sun,  5 May 2024 18:45:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5CF4113F89C;
 Sun,  5 May 2024 20:45:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 20:45:08 +0200
Date: Sun, 5 May 2024 20:45:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZjfTtH0pArzsV4fN@landeda>
References: <20240502141809.2292787-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240502141809.2292787-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714934710;
 bh=k0uVTEX+B8C5DsO8gLJBvBiPOhL82m3Pa5mZ3lpwXpA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qcVZMvI1WEPBJHh/pQdk2d+tEEcv3spSw/YTym/QBNaR5EgpYvbNex1h/sOeFp6+8
 V6vey3+UTu946zYvIsvCkwM2uJffHcGMJDlSNTSZJPz/OIxMZH5c8QCttm6Nt/pyLi
 921tgWdbNwLBBHUGvXwbV7w4RLjRK/kHnUWqAtd3YkDecpXR+mICsZ4xdKxVx555qs
 5lew+2Wy/4kXwqMGvm1gZ/ozaJwL6c+3H0BK+96UPn47l42qvuDUikSsYHl+kJXTSG
 i08aGKoNuSTemT3pUJeh1W7YgxQf2qEtL5TqdbNnsvof+pku3f9e57ZEmDpZGSrlO5
 0D7x+uSENdsyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qcVZMvI1
Subject: Re: [Buildroot] [PATCH] configs/beagleboneai64_defconfig: new
 defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2024-05-02 16:18 +0200, Romain Naour spake thusly:
> Adds support for BeagleBone AI-64 board by introducing the
> beagleboneai64_defconfig file and related support files.
[--SNIP--]
>  .../beagleboard/beagleboneai64/post-build.sh  | 15 ++++++

    $ ./utild/docker-run make check-package
    board/beagleboard/beagleboneai64/post-build.sh:0: run 'shellcheck' and fix the warnings

    $ ./utild/docker-run shellcheck board/beagleboard/beagleboneai64/post-build.sh
    In board/beagleboard/beagleboneai64/post-build.sh line 2:
    BOARD_DIR="$(dirname $0)"
                         ^-- SC2086: Double quote to prevent globbing and word splitting.

    Did you mean:
    BOARD_DIR="$(dirname "$0")"


    In board/beagleboard/beagleboneai64/post-build.sh line 4:
    cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt
       ^--------^ SC2086: Double quote to prevent globbing and word splitting.
                           ^-----------^ SC2086: Double quote to prevent globbing and word splitting.

    Did you mean:
    cp "$BOARD_DIR"/uEnv.txt "$BINARIES_DIR"/uEnv.txt


    In board/beagleboard/beagleboneai64/post-build.sh line 15:
    ln -sfn . ${TARGET_DIR}/boot/dtb
              ^-----------^ SC2086: Double quote to prevent globbing and word splitting.

    Did you mean:
    ln -sfn . "${TARGET_DIR}"/boot/dtb

Care to fix and respin, please?

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
