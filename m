Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40061E6E811
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 11:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFB1883C19;
	Tue,  3 Feb 2026 11:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dvKCfON9SAb; Tue,  3 Feb 2026 11:28:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EEAB83C1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770118132;
	bh=WkL9VaK3tBIunSWvhJNmofGOnXRDiNR1/mRU+YTUMT4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RwB9R0C7NPXDt0TMzlZ0N+NPJ43MzqmzGYE79P4u024gj8FJe55q/5qP5TJxuZ/vp
	 kdizEask+Yei22c7YvWwSAzm1EWJq18tZJC72AsJMRQ4jLAtZtqEaoqpnevuKpsGC/
	 kYDRSPqyjJ/b6/vcEKClUer3kz5vAy5EoZ70m5q0rTDIUurjRKgfIE66epzgLLA/Ay
	 soiSTo1b5YcT/zr1+gjfcGl17r+9waoCr8bGWXs4ADaUeSp5f76GCN9HXwBNAeIba9
	 nfPytwOrI8q/bV72LiQBZ95bTsMQ9iR6KTr1kiv4x5hW3QTQbXwZAvjQ3gPCa6LF6W
	 /7J6/JioZh3oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EEAB83C1B;
	Tue,  3 Feb 2026 11:28:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33D48F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E69640C01
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CjE8TCEU91M for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 11:28:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E9FC40BB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E9FC40BB7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E9FC40BB7
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:28:47 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1328896487; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Feb 2026 11:28:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnEaG-00000008T4S-3MgT;
 Tue, 03 Feb 2026 12:28:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260203110659.2127935-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Tue, 3 Feb 2026 12:06:58 +0100")
References: <20260203110659.2127935-1-giulio.benetti@benettiengineering.com>
Date: Tue, 03 Feb 2026 12:28:40 +0100
Message-ID: <87ldhahxqv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=tgQSCKFdrLOu8CwuU1Bf1WwIzlS1HqZmRhXX07dVNId2RTfprvKIqh52ti0puHNxpgeK5IXzCQjv+NUkMZGG+ssFY0Xp8AG9nhGaQKg1m3/1gus/IkloO+yPOVAOL+CSwx4A11FJPJr3zwxrlAKkfIzmsFHAOauJSa07aeXRIxw/LuIv1ViypoLabqCwZfzOPoTaYXv2nni2eQP6AzOaWUraXQNmOC2y9IT192lRWrsXU0jCOXmhf+eIi4xj18+GRfabAryYOlMhWDlN7aWe5Z3hzuog+Cxsxv5Hrs8u8zzqJR/7P9Le/zybeSu0XjTJooQ/oqEckbJLdY2MKyVk0Q==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=84uZpBx1OiKHxsu31CGFFbz9wh3WpnsKSQeV+XuyNT8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=tgQSCKFd
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

 > Release notes:
 > https://ftp.isc.org/isc/bind9/9.20.17/doc/arm/html/notes.html

 > Changelog:
 > https://ftp.isc.org/isc/bind9/9.20.17/doc/arm/html/changelog.html

How about instead first bumping to 9.18.44, which also includes security
fixes and can be backported to 2025.02.x before moving to 9.20.x?

https://ftp.isc.org/isc/bind9/9.18.44/doc/arm/html/notes.html#security-fixes


 > Fixes CVE-2025-40775 & CVE-2025-40777.

Those are both 9.20.x-only issues:

https://kb.isc.org/docs/cve-2025-40775
https://kb.isc.org/docs/cve-2025-40777

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
