Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CCE107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 280C860FB5;
	Sat, 14 Mar 2026 07:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwyiXN59KTZY; Sat, 14 Mar 2026 07:59:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D7B960EFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475182;
	bh=88DcGUU7AD37F0lFekGIPF+nhxRgZ+EVLuw91NyMPeI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lD4Wk0DlsvlA1aJ+jeUzSwMYwsSy0NpsKLm7hBBGV0k2hpRvAVu8AlUsga4G4rmNo
	 Ds2AvZ+MsDqbVcwcoNoS4/fIqHjuS5FIRqo45b1Xs3wgm4LUsH4+du1Bki94HcQP50
	 AUj0QiAGk1C3wsAT45WN+5gBm74A27Gb4LO5XMrDpLKJX6/t3PUO/RHItOgZcK/a3f
	 FtAM//XGScRHQQEC4OUUtyilfODxIyigdhiaVXSHX8kKlGc9E1+cV9D1PloTD8iLdC
	 VZ4I1pDM/nE5WlsDD88qld6uzEnVXiFKVCL4me4aGD4gGLNGR40k22akEldvIXOyX6
	 OypatmodDWoCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D7B960EFB;
	Sat, 14 Mar 2026 07:59:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82593201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6789440135
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzc_c5eEIDPK for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:59:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3852400A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3852400A2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3852400A2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:59:38 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -348104203; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 14 Mar 2026 07:59:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1w1JuH-00000002LTa-0AIh;
 Sat, 14 Mar 2026 08:59:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
Cc: Julien Olivain <ju.o@free.fr>,  Julien Olivain via buildroot
 <buildroot@buildroot.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  James Hilliard
 <james.hilliard1@gmail.com>,  Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <CA+h8R2pDgzU6i3P1aLR_uPdd3baK0Kc=hV1oRbnbrHoBFbU7uA@mail.gmail.com>
 (Christian Stewart's message of "Fri, 13 Mar 2026 16:02:00 -0700")
References: <20260312075722.86111-1-christian@aperture.us>
 <4529c7b6d321750cc0d99e8e02c4758f@free.fr>
 <875x6zirde.fsf@dell.be.48ers.dk>
 <11d74c7acb42b8608bae709315dd7468@free.fr>
 <CA+h8R2pDgzU6i3P1aLR_uPdd3baK0Kc=hV1oRbnbrHoBFbU7uA@mail.gmail.com>
Date: Sat, 14 Mar 2026 08:59:32 +0100
Message-ID: <87wlzehme3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=SsdFrv/o/lUlsho7tmwOBBq9rVJayjPobd46L5xa9By2fcnrP7K1/hRN0/1I3z7vwH9PxeUS1gVnytP931vhdczSLLvWv2k37xMy+UdIDNKLi6bjp6+LweeG+eve9P9X5tFlNrNMibSnWYQkvmEwzsEKKu6cfeTYHFFg/7FopqXCtEu7Yxgdm/loswEEcSOLYhUuiWugYeG/z2pL3BduH35zTQVyD1vhA9u0NqWTWVoAydYlUDyHhmLgwYRrD6Yg84EWXbvohSeVTr/v4hjuV/4W790/M8WevNTInezLPjhSuX4NUptg0s2OW5Z0x6jbZPSok8GaVTZq1XVklaD4mA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=BIxGLFCXbb9j1GeVcXGYIm4EhzIL7mRJlUiZBdGvOcw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=SsdFrv/o
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: security bump to version
 1.26.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Stewart <christian@aperture.us> writes:

Hi,

 >> > NIT: It would have been better to first bump to 1.25.8 (which includes
 >> > the same security fixes) and then afterwards add the feature bump from
 >> > 1.25.x to 1.26.x so the security fix could be backported.

 > I understand, will do in future.

Great!

 > So, right now go1.26 is the latest, go1.25 is supported, and go1.24 is
 > the oldest supported.

 > Go1.23 isn't getting even security fixes anymore, so we should at
 > least update the LTS branch to go1.24.

Yes, agreed.
-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
