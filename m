Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58220CA5FF1
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 06:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3761D406A3;
	Wed,  7 Oct 2026 06:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrZ65VlDmmEj; Wed,  7 Oct 2026 06:05:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4C8FB40714
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791353120;
	b=GoCPaRmWrfjz3OODhpUzg1OM2P6KnNyj+uO2Gn9wjeGgxgzrZFn9BxstqMjoBgFs7Z3U
	 bAbi0H2NOq0TY5YdAr7/cue/0zEnq/7q3dSR5FiJkeNKABOoGhZ0HVBsqvLoQfXoFhzUZ
	 HKSS4uewbo+9dxRF09FcNj1XVOqC/nYkuaDmeOZVLXTHQ5UPKWxpLyGhCkkFZxM6fLTIE
	 hFDKLHOGCk1XVUWJLciS3DBD/fJPu9NbDtOdw5kqP5dyB73+phzTJ9iTdVG4NljdxNlNW
	 N8qFXuEIar8WCTwT0dzb4K8ncwZZS9LTUlMggW4pIWEn5KR8IdW4gun7N3MPvSkgyWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791353120;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uAjQivXnEiWwRCghdZ36ogxwvMxueZO2zVZGWSNRnE8=;
	b=De48fGk1WpNjhXppoOtdAnKDwcdo3fsEBgdgbiJtos6tKm46+/QjosMgmmik661LGAOt
	 G3n65FWyggS2PzesBpdUtJIJ995DDQtG2koADkq0YiBj14EZBMCu148/5MqWebqskfqL0
	 24BW/Fy5Pyk/RXyszfGRwSiRBXEgN3Rtu1S7iPc0TlaMTe8oCJcTg9F0wzsOO0wKJm1Sc
	 OtiWO0Taw7VxPyayHzcWOV3iS3uDOUZ6kK61/ISJmKUTVu8l17mQxTDGYs2J8HiB1HwCA
	 6C1D9qmgwOT6tmTKCMYD7eJx2H0AJfsaxriCVA79sq81QT+FNIuPehvIOECq9QNavtQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791353120;
	bh=uAjQivXnEiWwRCghdZ36ogxwvMxueZO2zVZGWSNRnE8=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GCrMZJYanB6l3gedRW2c9oxqKDSSTPW1n1YPGWCKw8L/H9VFJcVx/L1Fhlceu5IfM
	 6pJqjgeCPKv/EPE/XCsqnp/nAy/s0sbgN/JjR5D693yGxvsndsh5GIuLIgA0/WF1M8
	 YmPGVQlpA7xjJR+2q7DKYQmMCesc2M8YvjPAb9N/460TgcRBL7v5WLLvrg+peep/Di
	 EHnfeVzSWs4HjYXCeQQglk6fMAllPehT+gNAkh3N3TFgQkSuMuB1QcYaUP79QuqLoK
	 gTRXfas62ce2Sjat8XCoh0UHp/RXolDrqXL6tl9OQ+48gyex+ih8yUt6vLuLDzS3Dg
	 B1IffJclVJH4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8FB40714;
	Wed,  7 Oct 2026 06:05:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E131B32F
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 05:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38DEB40204
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 05:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73rTQVOCPxvJ for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 05:49:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D6F3A400D0
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791352189;
 b=fGguL7Xs2v0qAX1sVel77xsxqNBKJVZuxjT4Gd/dsdxOh20qBUAmRSoolKbJqvUlTB5r
 jIlMULd36AhQ1X0MsnpSVLtDmmKvo9ZS9/LgFUMSRDCmE9t9/8BYADxtw53N9aGRoGxFL
 f1NpUsh2lKZBgq29adXj9S5NT1kRlFZ3cGbEZKB2ouWavJpS83PgJNqkYZ7x6JfZw2Bbe
 Iyzj1pvs1iOnRZrxoPHtG3mFlkMnlXre7GryXarRwUBhbgsFNDavct7vl8+nwoG/Q2Fhw
 MXKgxa219HE/KvCKf1VZ5q5RSS+kTimG+DgGKZO/SCrzG8blZlUpRXAqGKu30MFQ8Pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791352189;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=5wvVUIpi7WWSggUynfPzltSLxAQ+/FyzH/iZopPcdJU=;
 b=n9fuqmwUkyGYTGlfnPj08uxSZOh1IRJdX4QShAukH85/b7qLbU5J4a0HKGcDge/zUIX+
 Myp9udiAwxWj7W64jySQJKCxrALpbMasnwyXuW4kRuMxCHbZzi5K+kw0ky7690ePiCdlO
 wAXNENKekZtH6sybQQHAXxK4H7OUOXMfoYZTdgBpvTcY714WkLBIFs2L1CK4HkSjxDK8q
 rEPhfswY27xqJFCSKQH7lqIB2qQeGz5Kk1xMhEFwm05MNLe1xhyCoGihnuDuh0d9qdKJS
 CteZfZSCMORWhYMhCmiz4Q8RL1HPMAGbIFHL352O075rxRTngHgsKYxVq3Maqud992A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=IrzQEpAg; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=IrzQEpAg
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6F3A400D0
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 05:49:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=IrzQEpAgLYx/7VEgramHibIkIgGu7fcebLni/5WeMSdwn0cSVXOsThlAp2R+huOMNsq5woRi0p1t3czDi5zpuXpkwlDZOSO1wsUXAB/BAQoj57y6Mau9+qKL+cJyzvpJ1bCl1vRaG1M4qM7z+uOkLpLtpmqeish93Hwi25j0vrbFY9LnMgURJOmD9mnbwDNXyLSxhtnM7zIyB9QX+V8MKLJ9dnjCqw1iXgyUibZKVLCdcpcejemWlCf5olDD+bW0sLHNFI/QzBIxs8bAh/x0GiT8fOR4lJ0BEUE6fQk5HPChcLI3fpHBgphZCedFzoOrDvfqESuQnCtWpSGSw0SKZQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=5XMuCC4BWVQ2JBw0Vn5RjVUElwmJM2h9ETteNpUjqpw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -144251473; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 05:49:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xEKX9-0000000F5uM-3Oa7;
 Wed, 07 Oct 2026 07:49:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov via buildroot <buildroot@buildroot.org>
In-Reply-To: <20261005132832.203227-1-yegorslists@gmail.com> (Yegor Yefremov
 via buildroot's message of "Mon, 5 Oct 2026 15:28:32 +0200")
References: <20261005132832.203227-1-yegorslists@gmail.com>
Date: Wed, 07 Oct 2026 07:49:43 +0200
Message-ID: <877bjut5zc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/inadyn: fix mbedtls support
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yegor" == Yegor Yefremov via buildroot <buildroot@buildroot.org> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Since commit 6bab22ca41 ("package/inadyn: bump to v2.10.0"), the
 > mbedtls condition is written as "$BR2_PACKAGE_MBEDTLS", which make
 > expands as the variable $B followed by "R2_PACKAGE_MBEDTLS", so the
 > condition is never true. Without OpenSSL and GnuTLS, inadyn was built
 > with --disable-ssl even when mbedtls was enabled.

 > In addition, inadyn uses GnuTLS by default and needs --enable-mbedtls
 > to use mbedtls, which was never passed.

 > Fix the condition and pass --enable-mbedtls.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > Assisted-by: Claude:claude-opus-5

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
