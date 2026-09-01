Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C284DC61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 19:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA18607E9;
	Tue,  1 Sep 2026 19:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbCgvBNr951O; Tue,  1 Sep 2026 19:08:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788289703;
	bh=S1aKAQG++H6zg7ghXfc81NCAtujnqg9wwgi4HZfel8Y=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iwwYT21BCqcpOeVlTImhQOKCouIlQNbW7m+ixbPiMIpbA5OYYOXQKOQcwB3wsLsOv
	 VeO5jmPwraP9F6bJf76tj8D7zCXmAwc1w7iMqkfVB3EiCE4bY3UD9CyAAP+sRPS3Nk
	 uahTcLmmcZIlXRCMLWQ+vwawnTwYFrhWAgjxHsZQmwQeqFeNfruu49DquH5C4SumdP
	 7qrvDWqfHRJLkapeq4VYjdHH1uDnkHzrwsSWFWsPLda0FOvju0X9miCur8/VbGSckT
	 oDymWmXtQkndet8Pt2kvjY+yQ/ktI/vLnIGW0NYteiHQvc5yeMzSXfQhQKj3UhM4Pd
	 5ZoalSYoyYjyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 897B4607DA;
	Tue,  1 Sep 2026 19:08:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AD9D363
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3074740274
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wG7pDqLewpn for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 19:08:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ixzGwNEQ
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE50940249
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:08:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ixzGwNEQYRpmMyKR1w4+E1VIlUq9dySoX6iHt79q8oHJ/raCqIFoKPuTKWvgtuzB/VuYAn5K+oI3RMHfvha+oHUGOzdtpvJztt6hJ9n+NYPQX204lHFcbTA3uL3zJpe9E6bpN4GvhY1GQkvO0KKBiVCjU/BIFCFt7NRwEKEame3MMHsN5O4wIityCHbCRQ3le6Zoyx/EbzLHGdmHQhIxfF/nsVxIkNR2c1gd0a3qcpIAY4qTtlvLRNLl7rJG/dVSStuJ3RsAhGhr5u/YcC5Iq2jNRfoY6lc5EiyAwFOmnPYv9H/kwdl79bvz4RVJKFxFLQeSVN+z0E429OqRXOPL6g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=KCLcSpzNg+Th2fcZSXKxq7ouBXUXRX1QORSblDHpdeg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -266461200; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Sep 2026 19:08:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x1Tq7-00000003l5N-0T77;
 Tue, 01 Sep 2026 21:08:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260901162337.168580-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 1 Sep 2026 18:23:37 +0200")
References: <20260901162337.168580-1-bernd@kuhls.net>
Date: Tue, 01 Sep 2026 21:08:10 +0200
Message-ID: <878q5kzt5x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ncmpc: fix build with fmt >=
 12.2.0
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

 > Buildroot commit cc5c36afffd71e6e01a9371f1a7316fc10a8e3f9 bumped fmt to
 > version 12.2.0 causing build errors with ncmpc which are fixed by adding
 > an upstream patch.

 > Fixes:
 > https://autobuild.buildroot.net/results/b97/b97146ba1b4996b644c564898f5633dd8c0d4b83/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
