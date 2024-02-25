Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCF0C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 11:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2FA381F7B;
	Sun, 25 Feb 2024 11:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BPaKZsauOT_F; Sun, 25 Feb 2024 11:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C689B81A33
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C689B81A33;
	Sun, 25 Feb 2024 11:21:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1E71BF4E6
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 11:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08D85405CC
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 11:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0ulUMvQXsWS for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 11:21:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7BAE404AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7BAE404AE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7BAE404AE
 for <buildroot@uclibc.org>; Sun, 25 Feb 2024 11:21:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CF21613F8C0;
 Sun, 25 Feb 2024 12:21:45 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Feb 2024 12:21:45 +0100
Date: Sun, 25 Feb 2024 12:21:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZdsiyRbOWUfnRNDz@landeda>
References: <20231218220457.1705749-1-adam.duskett@amarulasolutions.com>
 <20231218220457.1705749-3-adam.duskett@amarulasolutions.com>
 <20240206233318.593730bd@windsurf>
 <87wmqut14w.fsf__36507.8827760712$1708783134$gmane$org@48ers.dk>
 <pan$d961b$888d7a82$9cf22659$dea826e7@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$d961b$888d7a82$9cf22659$dea826e7@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708860108;
 bh=y1wUWwu0qmvk5lqARcnYPrWcqQprt79zp+mj8xSn8sM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OnQ9Cj248fT+1wivl4ieb+vuW8hlYzWF/5ItjsbZYAcmR2i+YLKyQ3SrMfX36gbMX
 TYxVq+/OIO15TY6BVmYYI/Ok0tulOx5WdP6biE6jvpNveSfABP5cuzFSjlTFb9AbuT
 MCpSfv3iye48y+z6RKxGQ0Rp+poz0q1iqDKRRI9zKuxeln9oloUIpTXWU0qDKrr5Ml
 y+Nj5PhjPT1FzwoLv6uSF5HcYybtVu9rxELkqq+ZAzVg/9lUZSWzk1OIfX4/llWG7n
 1JyJF5Xzr3CCVOXc1mTLwk98QYMb0xnQCPQqV1XOG2QMteQxyS+iJo6nl6O9W0XqA8
 1CZ1oYzjVoKdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OnQ9Cj24
Subject: Re: [Buildroot] [PATCH v4 3/3] package/python3: bump version to
 3.12.1
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2024-02-24 20:01 +0100, Bernd Kuhls spake thusly:
> Am Sat, 24 Feb 2024 14:58:23 +0100 schrieb Peter Korsgaard:
> 
> > We unfortunately are still having a number of build failures because of
> > this, E.G. for target == host
> 
> Hi,
> 
> ftr, the host == target problem is solved by using a patch from here:
> https://github.com/python/cpython/issues/115382#issuecomment-1952936367

The issue with that, is that none of the upstream maintainers have
chimed in to express their view on whether this is the correct approach,
or to suggest something else.

If we go and carry that patch without upstream feedback, we risk
carrying forever without the issue ever being fixed upstream.

What happens in other buildsystems, like OE or openWRT?

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
