Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C44CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A133181E7B;
	Sun,  7 Apr 2024 11:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lpsdQ9_NewD; Sun,  7 Apr 2024 11:19:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9620D81ECF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9620D81ECF;
	Sun,  7 Apr 2024 11:19:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCAA71BF340
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B91AC4075A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6N4T0csR8iDh for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:19:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F4FB40759
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F4FB40759
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F4FB40759
 for <buildroot@uclibc.org>; Sun,  7 Apr 2024 11:19:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BAEEE13F879;
 Sun,  7 Apr 2024 13:19:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 13:19:10 +0200
Date: Sun, 7 Apr 2024 13:19:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZhKBLm4pLR24rFq4@landeda>
References: <20240406073216.1054073-1-bernd@kuhls.net>
 <20240406073216.1054073-6-bernd@kuhls.net>
 <ZhJuDnF5x2UviN68__14164.349895303$1712483892$gmane$org@landeda>
 <pan$bdb59$3181f1e9$1c1e22ce$1d1fb283@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$bdb59$3181f1e9$1c1e22ce$1d1fb283@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712488753;
 bh=VYgljlFwBGRjd2aeSdRmWRD2+wsmV1xACj8TzeI79do=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RCE3liViKaxtOcJzINxOAAJQDWFGX05cinis33njVVki/fyRBO+vnT/QBhg0/50Fa
 ZfdzzsmI97HwLmNipVAV7le9rhWJO9cIqOijSb3B1byHkPOc/7KXmrkGR/4UkldCR3
 LJYze9caNEi+WiiXKS+hTlMG3ScRJR7SfJdCkADRRBhKclFEJVjrXPb3vrLX/8ocmq
 MLPrrnmdy6OeoGwekL0W5nwabGEK3I9DDjhS3bfWEn+8TJSTVpAHRhUV7qsx/rJrTO
 hludomvHNCpXo5GTka9bkz94o4QaoNuP6z0FzxPao3Iq9wILgaNkOWeS1MiYgMHd1r
 zJ5w+ls+boJSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RCE3liVi
Subject: Re: [Buildroot] [PATCH 06/18] package/kodi-audiodecoder-*: mass
 version bump to Omega
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

On 2024-04-07 12:40 +0200, Bernd Kuhls spake thusly:
> Am Sun, 7 Apr 2024 11:57:34 +0200 schrieb Yann E. MORIN:
> > Any reason the audioencoders bumps were split in two patches rather than
> > one?
> there is no split, one patch is for audio_de_coders, the other for 
> audio_en_coders ;)

Woops... Thanks! :-)

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
