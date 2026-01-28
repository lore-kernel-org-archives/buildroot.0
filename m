Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2BAD3F082
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 15:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C4460751;
	Wed, 28 Jan 2026 15:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVj6z83Ei26R; Wed, 28 Jan 2026 15:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E900F60748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769614901;
	bh=Yw9JrVkTYu/SIxyRtAqKkLThjieGX8aTmfpq51X0s6E=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sZLB7k+aWLjWIHj70mD/8kZ9D0CKDpy38EK9C/TPKF+s3jNO3XgYRv5pyZfz2FPWY
	 gBo4cVB6jIMkYRXuU+ZPn3SDNpsAbFU2gO6/GmtXdo7daliog1SaY5KmxA/bJLEAhb
	 ScFn8De3977xCiWZ8lRQpYJdQpRyWOv9A7V0kgU8ETJ5KiDYC4Ig/3AnQCpozUt/rd
	 WfzgeL95Ja/g/XvGqZqDYPbH2616zTYcycwKcBsTHbp0e77BSQYLrwHTD48FIhcwEU
	 0egw5COnVbOcfReKmYyoLEdTVRIhB45i2kklwytpGBzI2LCj+SsHMsqtXSJZuaBBnP
	 YyO0A5BEjKdfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E900F60748;
	Wed, 28 Jan 2026 15:41:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25735118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 15:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12B7740794
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 15:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLQvGpqHGdXZ for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 15:41:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F7BC4078F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F7BC4078F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F7BC4078F
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 15:41:36 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 944619001; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Jan 2026 15:41:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vl7ff-00000004RQs-2Su1;
 Wed, 28 Jan 2026 16:41:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260128113749.455310-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Wed, 28 Jan 2026 12:37:49 +0100")
References: <20260128113749.455310-1-ju.o@free.fr>
Date: Wed, 28 Jan 2026 16:41:31 +0100
Message-ID: <87v7glzqvo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=BeEC9BHJPqRpWdFbilBbECnO+lCR/4/NJWm9hnt1fLd7eFUlztXdRonY6JGzq1HD24zbe/lvCot+5ZfztrT6bjBMSvGsCeJkZCWpORYiRkWiRFRQPyrL/Gn01xqHoPHqj6dZW5IKH1i6xFhBmZUMj8gfmQ5ESinlzUmSsNqi5877SJDV4uGSYp+0EGER9E2epbjZd0QXj7mE6VJMoQDRBqK1LcrDJvenO0EV6p7AP+2fYQC7sBq61icJUZGHspaYj5AEPNgSrZZUcsLDOcKvgvp+JnsK4bL4HU3f2H61c1mliw48BYcEXBEfAr4rffTYR/aZTzcKTdzSqQXplD9AXQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=UCO3WYreRnCx8hYT+8rLUK+a9JW7qcWQ4OvDtXiPVl0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=BeEC9BHJ
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: security bump to
 version 2.5.17
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > For release announce, see:
 > https://lists.gnupg.org/pipermail/gnupg-announce/2026q1/000501.html

 > gnupg2 version from 2.5.13 to 2.5.16 (inclusive) are affected by
 > the following issue:

 > A crafted CMS (S/MIME) EnvelopedData message carrying an oversized
 > wrapped session key can cause a stack buffer overflow in gpg-agent
 > during the PKDECRYPT--kem=CMS handling.  This can easily be used for a
 > DoS but, worse, the memory corruption can very likley also be used to

s/likley/likely/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
