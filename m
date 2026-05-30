Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED09CCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 18:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC1EB42F63;
	Sat, 30 May 2026 18:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNRkaANnzLiy; Sat, 30 May 2026 18:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A28242F5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780166148;
	bh=ZiZt1i6qfC9nSnYhYFyPtxhGp8/hrRkGEKxqqW3dFS4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GGSt0MMbAeLW45dttnLZ8TGsqTwSuOJnwmD9tBhfX4hh0zeelPUz7+BNYkyVeAi9v
	 2KNWE24DC0/nlh3Wi7MQaAv50UYLVIQ0kb8vd8rOWKU9bIl3jtxzCQamdyBPqTQyIb
	 ZzepwZbPLNEWaJkzbAlveg6THUhjYMuHGDeX/02BntN7Jbo4sTO9q+oxYnVBFdtwI/
	 SQd/ir5q9x7vSDt/1krWrmzSpk2umfnaJk/6Yx4wFkaJQHZuS87wn6OtGLKPtTa4we
	 KP9aSywaMmZM4hnz3JDjSudTOtFblS7kn2RM1Luz6d7Uymkn4kZJeZUE7zgjjSmuRO
	 2C1MzDCboEwcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A28242F5B;
	Sat, 30 May 2026 18:35:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C813E12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 18:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADB18853B6
 for <buildroot@buildroot.org>; Sat, 30 May 2026 18:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jSGc0zFjpF8 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 18:35:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60A76853B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60A76853B4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60A76853B4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 18:35:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1150294576; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 18:35:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTOX7-00000005T1q-1p86;
 Sat, 30 May 2026 20:35:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz via buildroot <buildroot@buildroot.org>
Cc: Quentin Schulz <foss+buildroot@0leil.net>,  Thomas Perale
 <thomas.perale@mind.be>,  Martin Bark <martin@barkynet.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Quentin Schulz
 <quentin.schulz@cherry.de>
In-Reply-To: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
 (Quentin Schulz via buildroot's message of "Tue, 07 Apr 2026 19:37:06
 +0200")
References: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
Date: Sat, 30 May 2026 20:35:41 +0200
Message-ID: <87y0h0kao2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=QHGk5EPwiHk2duI5ERrlpdsnlqWMNuIvWPoGUQqK9XnU/3xazxBWJSPRHCI5D8SlM1/GDl7O0aC/erO2/vE+cCT8L3GnjPHMw3Pia80NZYD91/3AbtOiXK8nr2+9WnhUJa3Uk1jmg1R5Re0Ih1hkdN4K+bkCjhkITMt/e03nRisvs7QwPspDv+Kptgeea5co+C2MrewiglWWL3bWFODvsykTie5qZn1hZLRSNUjx/9NhA3djFc2iE8SmmhCjZ3nuoE0+RfGpa8hY750bkEK8rqj8h9eVB/Gk4nVdkinNoQyCymmF9AraqhFJ/LYJC5wLYXX8VBRcuJaZPocJPMfmpA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=KFyThEhktrT8wmXMSPxpLBejxOvw+b1ozgEa/TuBSMU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=QHGk5EPw
Subject: Re: [Buildroot] [PATCH 0/4] make utils/generate-cyclonedx runnable
 with Buildroot host packages
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

>>>>> "Quentin" == Quentin Schulz via buildroot <buildroot@buildroot.org> writes:

 > It may be beneficial to be able to run the script from Buildroot host
 > packages to avoid external dependencies. I for example build Buildroot
 > within some ancient container where I don't have a recent-enough Python
 > to run generate-cyclonedx with.

Out of interest, why is that / what version of python does
generate-cyclonedx need?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
