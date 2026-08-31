Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836ACC61DE8
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 06:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E1554055A;
	Mon, 31 Aug 2026 06:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgKA5wfmgtQm; Mon, 31 Aug 2026 06:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788156068;
	bh=GT+aNpTGc4BKB8tD/c9iTyUy/VWEmLEEN8h4rE+qpJM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ehVYJIKTY19QYoNP79KVHHYTZfIRWlt2qjP5nYpqIZTJTl6CY8OvangXQwqPwpX1o
	 Jb/4DmBsww8VQD+7ntlYqoaX1k6tIk8cfKAUd975wHhwaDpmwsM2KrkMKUHJCbAm/n
	 a9GznC+tnt7hlR+LlM+jE4xU5EJtDluf4PbihSffwXBNjlB1ivHCS0dWzDwgONJPEr
	 J3g4MikxdzpoV37dpX7ewlt88swnsmbmrum/Gm37w4qj7DSnyaH18EcmaT6fiB1Yeh
	 m017QGFFARzaIcsxvt6LHmgiOgRR6+gSBzpIGmw+0O6FKIJ+Febh13yviG4gqqwiGx
	 qJeEqENUtvXgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54B5F40517;
	Mon, 31 Aug 2026 06:01:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11C0F355
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 06:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC58440517
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 06:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BZ0Gwdaem4L for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 06:01:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=RCh/H3gP
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E97F340503
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 06:01:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=RCh/H3gPCTha3g3uNlT9XzmdJkIhr7dn0KrYdeX5YcNB7wL/osgL0f2yckSK3ZZalFSIsZ0yNCK3nRjvAOwEzrVaCwhIVhn+RxOTWXjXNCTf141eu79z9c9SDwbZGl9PgtPi6mJjQruLNS9B/N9kSxxDniQTZv2B6bbd7uRV17sGZkynItRA9OADVDm5Y8l6bbFBF7yY3xlLBUnMMOisT983lFU/NrraWR++1+VJrcJLPeNeTRl/+w8YKLZDrvJyjiriia22KjX4r9WVG2a0AaNF5ylZ9+MxNdkEu/fteqttL0VAMOJ61MZE/YTFR1h1aAP7NNld/M9Nf+zoRfEARA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=eV1zKsZgtczSu5e8Pt4hWbjGI+64L36DCWiT6dcbIgA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 227678935; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 06:01:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x0v4n-00000001oiq-3msp;
 Mon, 31 Aug 2026 08:01:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260828172002.2364384-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 28 Aug 2026 19:20:00
 +0200")
References: <20260828172002.2364384-1-thomas.petazzoni@bootlin.com>
 <20260828172002.2364384-2-thomas.petazzoni@bootlin.com>
Date: Mon, 31 Aug 2026 08:01:01 +0200
Message-ID: <874igaomle.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] docs/website: patchwork is now at
 patchwork.buildroot.org
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > patchwork.buildroot.org used to be a redirect to patchwork.ozlabs.org,
 > but we are now running our own instance, so let's adjust the links in
 > the website accordingly.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
