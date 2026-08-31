Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7D0C61DD3
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 19:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6833E40523;
	Mon, 31 Aug 2026 19:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MY56p9BmfqCQ; Mon, 31 Aug 2026 19:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788203374;
	bh=sE2a7LQkgmpE10Hqt68z9lK9XCpBk7J7ODH0TgJxtoc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WMSxA67460jsth0TUvQOZriMoPSfGbvbjTGfZQuOCPKYDxD6GfvK7LBzEhpYEcAvX
	 xBCttyV7x0DPMVb2RqGpGD66Cl8X+t5o8GCk0PyuNCD6O2AYwUnZMQyQfgm9IVWRNl
	 YKpjAZ3qiMP1L0IZP6tXm6RJ4u/ZDYrgchU5213Vj7u6HxG2VRcoYbsYNu0l+IdSW1
	 hNlFimyD63zll4Vg07JCHauwpAGkhMm2YFIJFX1GW5DYY88zittEs14cKqQJDbTag9
	 Qzo4D68j71RD3OQLkqg1G2VE6H6h5lwyqfvMUJeNKBj61C0JP9XRpIiqG0GLD91jFz
	 uihEJuM139oCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F8BF4051F;
	Mon, 31 Aug 2026 19:09:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC612265
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89F5780ABB
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EiVxFGt4wuRV for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 19:09:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=FAnrrN3a
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA2EC80AA9
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:09:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=FAnrrN3av6eAXcv60vQEpMYvgyXuQ7n+iDQHkwwEIqW10m0HZ/YYLBC6nPvM1/dZbHfQ/b9c/axm/YJl0rNKZOSLLT7eVT+o4oJNZDRKxlQQaKQ2FDMLp5xpWRUa0CysxvcTVoEfi1UJ/s7mHleYiSvB7A21b7nwAdtrJcvdFsCcKELoFcboNpIzMXL8/gANwYTc+fjPBzzbPMaAp1tfkH0/iWZtQ7EESxy164op8puZICQ+4UgHn8dwJIJ7fpRx58NYg+EkvbxuH4HndnFYRrJsi3vNddEvZF+bCsVuZhKLuT8CQ8SdP5/a/CMbIidX8bTwnxUYULK9vHf6JBPHGw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=VU01TPQVrqUo1tEY+u6jPDFBydDSP35RaVjbMSPTSAA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 893407999; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 19:09:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x17Ng-00000002NTh-3rr8;
 Mon, 31 Aug 2026 21:09:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260831183047.2010441-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 31 Aug 2026 20:30:47 +0200")
References: <20260831183047.2010441-1-bernd@kuhls.net>
Date: Mon, 31 Aug 2026 21:09:20 +0200
Message-ID: <87v78qjee7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.4
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

 > https://github.com/libexpat/libexpat/blob/R_2_8_4/expat/Changes
 > https://blog.hartwork.org/posts/expat-2-8-4-released/

 > Fixes CVE-2026-66046, CVE-2026-76641, CVE-2026-76956 & CVE-2026-76957.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
