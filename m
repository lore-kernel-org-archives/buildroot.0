Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281A2CD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 19:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB081615BD;
	Thu, 18 Jun 2026 19:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m66D-G87cDEy; Thu, 18 Jun 2026 19:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4F17615C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781811956;
	bh=e6o7jTMBokh6Bd7sdLXbTIFtIaxWUKRs73EYNbNVRtM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mVjK+J6NAHt7EPmevAWJh64VoNegXRs3t9aQunPVjtNIVoYNAcOeaf4OldvlJl6Qa
	 yV3eCAyRL5cqrVP56ghUyKDVUS2xVea2dA+PyRs+ypthrYAeMwVvUAQAVwxPMl1SPF
	 T47HhreAOvk10/Sdhnyz5TJfaIG4ghicJZ0ehSsm1q8y+Q9pJsnKGOrtcDm9OQwAjP
	 HIOkpxjFv9q+1by3uwBRQYEXJ1tMsJC3y5+uK7sByEZDIRsctwMegazRh0qOCrrlN+
	 t+P87bdmdAmsBPiX/jWrTrehghOZSjpc3P8T5Wvnsz5fAjjRjq7eLG73r6TEKK5w/w
	 QXqMpurV1Dwiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F17615C1;
	Thu, 18 Jun 2026 19:45:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A60D358
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CD14615AF
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIFEPiir3dkk for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 19:45:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40255615B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40255615B2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40255615B2
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:45:53 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1669424493; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 19:45:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1waIgO-0000000CpB1-3A52;
 Thu, 18 Jun 2026 21:45:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260618075958.1072765-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Thu, 18 Jun 2026 09:59:58 +0200")
References: <20260618075958.1072765-1-giulio.benetti@benettiengineering.com>
Date: Thu, 18 Jun 2026 21:45:48 +0200
Message-ID: <87v7bfd443.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TdH5ut5xVsXxJ325wkXpD8l8+3+OOsRIP+YCZI5kAeBEls2fC7rvLDin11DJuPRHdifmhJB5WhESNeYv2lTu7F8OMkC7VtfuKVLBXjqC15RmoSiXTTV15sfJqViCnKz4GKJ1LEuH1Uj0J0//FadGOSzQT/scIltl13NTTJzzCa/8WUClofLWbi8YLEt0sCCS6UesYXmq8pG6VAknOaHydGJ9jmmftj+NpxHcttkB9AjTtA1Fsc98nPY8zT6P4ib2z62DAwlBpnU9zXpJu/Vl8bNbS3rEjZIyBGuo4ABqjC2zPToOPICZ9imOSrEu4x1JTLFYyKOS5X/1/+DTDUNn+A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=w1CGh0HktSp+8TN0ImbCd1MSIUYQ4Sl6VSVoCJ6moSI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=TdH5ut5x
Subject: Re: [Buildroot] [PATCH] package/bind: security bump to version
 9.18.50
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Release notes:
 > https://ftp.isc.org/isc/bind9/9.18.50/doc/arm/html/notes.html

 > Changelog:
 > https://ftp.isc.org/isc/bind9/9.18.50/doc/arm/html/changelog.html

 > Security fix:
 > GL #5934
 > https://gitlab.isc.org/isc-projects/bind9/-/issues/5934

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

If you use bind then please consider migrating to 9.20.x now that 9.18.x
is EOL:

https://www.isc.org/blogs/2026-06-10-bind9-18-eol/

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
