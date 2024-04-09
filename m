Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0C7C67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 21:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CE7D812C1;
	Tue,  9 Apr 2024 21:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ge3piuDm6wpH; Tue,  9 Apr 2024 21:58:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 415D381586
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 415D381586;
	Tue,  9 Apr 2024 21:58:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59EAC1BF969
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44E334061F
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sY0gEUvjbAtE for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 21:58:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E99C240611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E99C240611
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E99C240611
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 21:58:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0F72613F81D;
 Tue,  9 Apr 2024 23:57:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 Apr 2024 23:57:58 +0200
Date: Tue, 9 Apr 2024 23:57:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <ZhW55ig0-Gg-KFyj@landeda>
References: <20240403211805.3100506-1-vfazio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403211805.3100506-1-vfazio@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712699884;
 bh=FV1Nf+4/gtYd6BsmeAjyb4RutHjDVOmWYkKynD6cRuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JBgP837ek2BzwQc1THfP7Q5231FdMCT6y+m8Po/MU8FjAS1cVMQy9inGmen1CaWR/
 RzTFGgn1JWgGP6Iki9KZgyLNPUVjY8VRFTSaFLZA+fKGDD4I96DEdav/wPhT4Uueyp
 0KU8rLNIlCQZOxQb/ZFLNaT9kqMMklDq87xiovdbup0GPWrgzt0EmZkIvQyhZcqaVz
 KOtSYabKOvazAg0nRId4qxVCgLFPCj4Kdgt6jUf+8+59EdzCyGk6oSv68iayw1CGHz
 gcteS9WIbX8a9vLWHpMCclxiJTW8MI3gD73/0JvSv9rMqeC6mhMyZCER+RiHmlJRWu
 jm5/vaxs7enoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JBgP837e
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: fix cross builds when
 host and target use the same SOABI
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

On 2024-04-03 16:18 -0500, Vincent Fazio spake thusly:
> When python performs a cross compile, it uses a host interpreter to run
> steps on behalf of the foreign architecture to finalize the build.
> 
> When performing these steps, foreign modules may be loaded if the SOABI
> matches that of the host. This can lead to issues if the modules are
> linked against a libc not available on the host or if the binaries
> include instructions unsupported by the host.
> 
> For now, patch the foreign libraries out of PYTHONPATH and explicitly
> define the path to sysconfigdata so builds can complete without error.
> 
> This method currently passes all upstream CI pipelines [0] and should
> also work (with some modifications) for the migration to 3.12 [1].
> 
> Fixes: http://autobuild.buildroot.net/results/c854080e003e9a7d525325073190b472a8f982aa/
> [0]: https://github.com/python/cpython/pull/116294
> [1]: https://lists.buildroot.org/pipermail/buildroot/2024-February/685369.html
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

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
