Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34062C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 19:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04903841EB;
	Sat,  1 Jun 2024 19:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBI6ldo0gQ_c; Sat,  1 Jun 2024 19:37:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A5118471B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A5118471B;
	Sat,  1 Jun 2024 19:37:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16CD41BF2C2
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81A4A8471B
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6sm_qLUj7Z8 for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 19:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5C0384610
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5C0384610
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5C0384610
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 19:37:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B018D13F8B3;
 Sat,  1 Jun 2024 21:37:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 21:37:41 +0200
Date: Sat, 1 Jun 2024 21:37:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <Zlt4hSOvnChPkgHL@landeda>
References: <20240529202425.469185-1-brandon.maier@collins.com>
 <20240529202425.469185-4-brandon.maier@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240529202425.469185-4-brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717270663;
 bh=sNfQFr7qYkQvuZOQvoaiM/39rO1KveHo6flw9VsPsI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p2hApttrFlguQGD6y6b/w+1ErYHyv38vdDx+tPrRwUyRRVFwRoL7WaF4HaRUxZdVb
 GwFLiZtKg3t8qbbc11LgEd1S4DNSntYcY8oKKjHnDi5YJa9WX1/Pr39EG89fe4iOa4
 lhBt/WqRC32rVhZSHdFkPEuyXBEFivRrX7LXJzbn40ZGXychMzj8yFLN45IRseCe2m
 8mDJ0tXWKBrhOJTMozZBf07ImPZeg6oY6ZvRS9XqqZxEcYU4FGM1M7TGI9TzrAMQIg
 YbQ8oIxD1nHiBG5rH/77nljDMdF/ZTdpDNb+UP1qpOl6C1KBMQ+KIFOvTfgHg2fs8b
 49jGx+Njn0LTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p2hApttr
Subject: Re: [Buildroot] [PATCH 4/4] DEVELOPERS: add myself for package/mtd
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

Brandon, All,

On 2024-05-29 20:24 +0000, Brandon Maier via buildroot spake thusly:
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 52c9b84a9d..cc9f3b7165 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -544,6 +544,7 @@ F:	configs/ls1046a-frwy_defconfig
>  F:	package/bats-assert/
>  F:	package/bats-file/
>  F:	package/bats-support/
> +F:	package/mtd/
>  F:	package/python-pysensors/
>  F:	package/qoriq-fm-ucode/
>  F:	package/unifdef/
> -- 
> 2.45.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
