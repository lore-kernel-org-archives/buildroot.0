Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D58CD5BAC
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 20:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE8E261C66;
	Thu, 21 May 2026 20:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWuP8X8Msg2f; Thu, 21 May 2026 20:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D068361C5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779393761;
	bh=RuBpxnUNVww2yUMhu02cYouz0RuU3TejopliuwRGd4w=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bFSy7i4/FlAZYfXdLjWRO9pMqmAH/j63auEsJT9vm2JmMwqerN+3L5ula/49C4S36
	 aPJID6SXgF+RtCSVEEmZuIS4T68qyu5KPBzZaIZClr9b8Y/BqqXwiVh6hEgPEfgRJ5
	 Gqlynla7pkeuQmDkxI0Ey9NbfcVJAIy4z9yANKpkhCjzNiZ+QCso03iNqad+p9NKjl
	 W84M2m8zj0VCqGmporD4PCchfOQkTPjc+juShMz8BvB1X/NA80w2aiYIAZwnp3jWeT
	 jXiDmppnJIIdSN/MKNYb7xUYPovwpIG6Vwbvuy5fgsEF1jsRml2IeH5kj6iNkU/c6L
	 eYuAJs0V+//8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D068361C5A;
	Thu, 21 May 2026 20:02:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF5123B9
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF61861C5A
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jxl_LD5ncjN for <buildroot@buildroot.org>;
 Thu, 21 May 2026 20:02:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CD8961C58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD8961C58
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CD8961C58
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:02:37 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -891497433; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 21 May 2026 20:02:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wQ9bA-0000000CKjC-2HbA;
 Thu, 21 May 2026 22:02:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260519182130.890979-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 19 May 2026 20:21:30 +0200")
References: <20260519182130.890979-1-bernd@kuhls.net>
Date: Thu, 21 May 2026 22:02:28 +0200
Message-ID: <87a4tso7jf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Y+n2Q94YYTQyEa86keorErUA0l6REpIhPfBUxiXc6RVrdPtS12X/WXobA0FXLI3hdakAav9fyJvEEJnPi8jlI7ILf4KCJdp3PpkvE6i7u9+hmhIzrxa7jQBF78BJUNTAsKBOkdzXOhiwZ3B8RhJcUzmWLhWIwMvV8zoZhwvWsDRRXkgd/2Dj9a+g5qlcElPotOYYc7SjrcvIdrZHn+L32B697oXR4k/iixoF70TM/kCXotNrAJhBWXjBtKLenP5yoAY/o2TRCAaazFzeDPV7FsywJYmUsQH6tus0jDHSakEeAI8gMuewXp4K5CDo62tLNxMIh0WtAMjZEcjYfdwhig==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Sq9eUlMGSyd5tVRQ7Bh2LedLyxDGrFZJ4x4A4dqhFgk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Y+n2Q94Y
Subject: Re: [Buildroot] [PATCH 1/1] package/haveged: security bump version
 to 1.9.21
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/jirka-h/haveged/blob/v1.9.21/ChangeLog
 > Fixes CVE-2026-41054: https://seclists.org/oss-sec/2026/q2/575
 > "The bug was added in 1.9.3."

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
