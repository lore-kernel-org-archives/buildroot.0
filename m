Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5596ACD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 18:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 092434070A;
	Mon,  1 Apr 2024 18:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvqhMyYvXdAb; Mon,  1 Apr 2024 18:49:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8DD44070F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8DD44070F;
	Mon,  1 Apr 2024 18:49:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1CA81BF28E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BA8A8137C
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZKc-7DbI96D for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 18:49:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B49681373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B49681373
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B49681373
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 18:49:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E13AE13F8B8;
 Mon,  1 Apr 2024 20:49:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 20:49:21 +0200
Date: Mon, 1 Apr 2024 20:49:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZgsBsa4_sf_RMyfu@landeda>
References: <cover.1710027863.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1710027863.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711997366;
 bh=SDdAUpC7AagEK5qyFXiWaq62cEZNeEzyAJJDsTGzy2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eem0mrLsHN+U648O4Clei6ZEKpZ0NxHoV4BbTgx5z6vVJEC/jomx2wvrwwggc+MF/
 N4Gw+aUHz4GiaW9lvSbSEBhku+SDKmIymG6zomwLqYpC0Fb8v8XoYvYw3LEKe6VQEc
 pZ88Rea43dy6d/gUwhTCAL+qCP2nwpGYcxo7iP6ZQeXhSNuav65s6xglbY0Rx143e6
 GIHfbhP1/9uqcHHVGHtEtsKtD6qmGRKxy9QegL+cYOPDhz1zqrj0xS2d8BOYHlKgyJ
 e+FU/7AAE0KtkBtCnO0tjUdt4j+AQ8iTABmXYJffmNU/t3ULFjIjzKf7pegD0mUxR6
 g7akg3NW7xCcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Eem0mrLs
Subject: Re: [Buildroot] [PATCH 0/5] support: accept text files with missing
 terminating \n (branch yem/newlines)
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
Cc: Norbert Lange <nolange79@gmail.com>, masonwardle@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-03-10 00:44 +0100, Yann E. MORIN spake thusly:
> This series fixes two of the affected scripts, and also fixes shellcheck
> errors in both. Fixing those also uncovered an actual issue in mkusers,
> so that too is fixed.
> 
> Yann E. MORIN (5):
>       support/scripts/mkusers: fix UID/GID confusion
>       support/scripts/mkusers: fix shellcheck errors
>       support/download/check-hash: fix shellcheck errors

Those three: applied to master.

>       support/scripts/mkusers: accept user tables without terminating \n
>       support/download/check-hash: accept hash files without terminating \n

Those two: hold for a little while yet...

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
