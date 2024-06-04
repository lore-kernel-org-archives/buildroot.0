Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7511C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 21:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5444240246;
	Tue,  4 Jun 2024 21:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VF_O0HeGJ5mx; Tue,  4 Jun 2024 21:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13861408E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13861408E4;
	Tue,  4 Jun 2024 21:21:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F5761BF82F
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 21:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77AC060785
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 21:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTVVFrnNTysQ for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 21:21:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 599FB60704
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 599FB60704
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 599FB60704
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 21:21:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E698113F88D;
 Tue,  4 Jun 2024 23:20:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jun 2024 23:20:54 +0200
Date: Tue, 4 Jun 2024 23:20:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <Zl-FNqrziuOC-0mk@landeda>
References: <20240511235609.88305-1-christian@aperture.us>
 <Zlw0x-GMNwen_N31@landeda> <87a5k3ljy8.fsf@dell.be.48ers.dk>
 <874ja8g88f.fsf@dell.be.48ers.dk>
 <CA+h8R2qZ8dVMUH94QN85v5Vms1RtNXM5k4VR+5AqBHEOJzzwDg@mail.gmail.com>
 <Zl8-TDOdLCh5dq42@landeda>
 <CA+h8R2qWatxGjtUnkNpETBBn6OUASgNXrK=vkOBWDbSzFCXPDw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2qWatxGjtUnkNpETBBn6OUASgNXrK=vkOBWDbSzFCXPDw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717536058;
 bh=OOn4eVGAFQMOQnOI3G6OgPeJQ8BPoMWoNMxlSyVwfFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EVAZJDejrFM97yBMx3EmKvJDtXUw2skwf+NomhaS/rFK7Zu0ZVgDzwVPUzxWfQTaZ
 EoQ7qOWOJZbB4Euuy1kvkVbt4M6B2EJVAIXCl+8OxXyABqKCOiQ/ZEk3QPs1XuRvfm
 4esZnTawna8LsduflZ2wMrZ27Cq5x+h46PWXuHAqJKos4Aegs7uuyDzbRNQ3YcsO4J
 Q/vIHJguFKJhOUeotOUy5ZRlJEwIEy6oX/xPcqpQWKHHTiGk7RHwtVvQF96pSgSENO
 +mFyQTEyqDiJlEzKT+iD3U7lB6jheQ4YXTfF8Mx0vxJ15tpImJmeqNWI7d2vIF4IJG
 seSQXYgGjpGVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EVAZJDej
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version
 to v2.27.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2024-06-04 11:01 -0700, Christian Stewart via buildroot spake thusly:
> I'm using "make foo-extract" and then hashing the file in dl/
> 
> Why is the buildroot host tar not used for this?

Long story short: it should, but if you export TAR in the environment,
then it does not. That's a known issue, I'm working on it...

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
