Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06E5E95360
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93A1B605B0;
	Wed,  4 Feb 2026 09:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJNyz1NrcmqF; Wed,  4 Feb 2026 09:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E94607DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770198423;
	bh=+ynnzTX0EjVb1cOcTXbOLRR87mcrKspPTyac+VmrSLg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aGrICIJ+lYgrZc6niVf/1ttiXgn1jwECCbzrHNqq0WIpmt6iwHyNpbd5pk/bqGjh8
	 bdp9pk62qpc/HViTJz6XDaNGF3p2yZXv2MSRdI2GU8craJy2Yl8jmtVkIK1ve+lZhq
	 8ukpjiZl+Irec0Ow4XV42Ad6k2Q9aR4Iu8Rgc0AFMAIrgswWHpGiaYEFJy+GiRjDn2
	 7m/nhghRDkvGAjHEDDbv/LUout2kDrimC3bfG8Ymnh3e913UUGMKC2A1GhpX4KYOfL
	 BvA4qrAyq4VI2lHbzpRQAiCDMB3YY4l/6SLeIvYPzdI0gKs6v8fPvTgOH7NBdOO8hK
	 Fa2ANPu19ExnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6E94607DF;
	Wed,  4 Feb 2026 09:47:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE44DF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C0904016B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wq4rIHxqmOoN for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:47:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2A824005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2A824005C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2A824005C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:47:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 525830229; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Feb 2026 09:46:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnZTL-00000009W1F-1lZU;
 Wed, 04 Feb 2026 10:46:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <eec3c48e-3ac5-482a-a85f-074ccf485fe6@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 4 Feb 2026 10:15:28 +0100")
References: <20260203110659.2127935-1-giulio.benetti@benettiengineering.com>
 <87ldhahxqv.fsf@dell.be.48ers.dk>
 <eec3c48e-3ac5-482a-a85f-074ccf485fe6@benettiengineering.com>
Date: Wed, 04 Feb 2026 10:46:55 +0100
Message-ID: <87v7gc7sds.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=iN71OTJzy2WLx9YvmpYT+VI3b1rsSeOmnOUkIKmBujYfu/gf6DtAWPVBc7BBlO59mZ4gV7BYxMM2JlFEtcyY76rywb/DaK6j19DYjUMiMrq2j4lrA2Ykv31NkR9cvWc36DT7W1jXVyvMibyVClxtaJFLk9lDRy7G8UF/e8G9jdLVKyHryOKX6f/4ZxAUYfTYsVjjmjd1/K9e2U50ZaizvqEDkPWQIZbZ1Wp4SMgNFHM7LByN448TNjXEpHLRHmdl6pMlQLVSJYaVi/MrqxfFRXLOQ2g6JgxczZUBfcVfQfQ78EEndLis5EkoQG851ddE+C0bNN+S64+oseQpRqZxYA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=bNZKFxaINst5s3BENdCUDwBj+j4RwfutBmgll7zN+mc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=iN71OTJz
Subject: Re: [Buildroot] [PATCH v2] package/bind: security bump version to
 9.20.17
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

Hi,

 >> https://ftp.isc.org/isc/bind9/9.18.44/doc/arm/html/notes.html#security-fixes

 > then I'm going to send a patch for this.

Great!

 > That's why I've pointed only those 2 CVEs. Was it correct?

No, they were fixes for issues only introduced in the 9.20.x series, so
we were never vulnerable to them.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
