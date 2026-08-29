Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92307C61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 17:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B35A40743;
	Sat, 29 Aug 2026 17:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3aWmlX_0jgz; Sat, 29 Aug 2026 17:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788025796;
	bh=4i4GlswM1MbjJU+vFc+UgM5nM1iVhuj/2DaDYXI1vZg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=erPcCCZ/DIe0VCpJK9iV1U+WDA/8DeW2iRF9PWZenbL47rZpWGlc4Snj6yuFkGh6+
	 XiSp7W2Hdqk5SW67+xPBBL8E37C6thJkbIP69us77+fX2bfacOLcTxH4xwtsBNbRzp
	 gyuyJTHIpYVxf0AzkVhwJU0LHAx1pUAXjI9rKiBBacm8LPbcEfUBIN7tCP06AKXxWL
	 GNovBMzge/Vf92p6RffzI5GK83Zz11ganTs29nbGDQo6ufnD06CfsRQgvSYHFSMMHO
	 SrvtppsxmT2380oIhVxTz9taiHtx8kOTdetUFZeRSstCPQFkkPheKhAxPMH17gAWUE
	 UNHCi7h9oiPZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 273E94070F;
	Sat, 29 Aug 2026 17:49:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7108223E
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 17:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 577C960607
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 17:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zS3nFP-KnSs5 for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 17:49:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=lbjQoM01
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ED7B605E5
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 17:49:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=lbjQoM0168x5Ge8oxN+nX4sOKfBkRDRx7TafnT+66eAdV9Nf4zAcnhfhJoaRAQQdyhNuTrzYANZIdo5LlgRZ0C/Ld0EbjW4fTXa5pXbYyAK/qfkmqtZ8IRfTqyn2AZWbGChCAbJUG3LMfDv9L2ivWrtl/wgpy5KYJ0PN7wtOCR7Vqr+mz5x4aZTq2TEOlxqgU/Es1wnn3LrcOWfa0oveCMJOwfrL0gwMXulGIJjQT3NiNFxsUm2lvo1ozPnTK3NaqnkddPVKFRKvFSdk5KQInLi5Scnz5yc8vtQmd+0tMLaToXCREySm7jyr6jiVShROUTcGmXxIOCmJFfYjN7c7eA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=g840W4vcz4bbcb2OrypqcnKeBbymEBdOZ3Pj9Nd8tTc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -65458811; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 29 Aug 2026 17:49:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x0NBa-0000000018f-0hTa;
 Sat, 29 Aug 2026 19:49:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <ea3adbc598ea273edba25e595fad4969@free.fr> (Julien Olivain's
 message of "Sat, 29 Aug 2026 18:52:08 +0200")
References: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
 <20260827095520.1049186-3-thomas.petazzoni@bootlin.com>
 <8733vxypoh.fsf@dell.be.48ers.dk>
 <ea3adbc598ea273edba25e595fad4969@free.fr>
Date: Sat, 29 Aug 2026 19:49:46 +0200
Message-ID: <877bl8vmth.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: add bpftrace test
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

Hi,

 > I initially had the same question. Then, I assumed this new runtime test
 > has been simply copied from the existing test_bcc:
 > https://gitlab.com/buildroot.org/buildroot/-/blob/master/support/testing/tests/package/test_bcc.py
 > which was written with kernel 6.6.32, which was the latest LTS at that
 > time.

 > Once the next 2026.08 release will be complete, I think we will do a
 > cleanup in runtime tests, to add a Aarch64 builtin kernel at the
 > latest LTS. So all those runtime tests will be updated.

Ok, good.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
