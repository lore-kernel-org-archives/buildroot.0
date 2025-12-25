Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F71E7AD71
	for <buildroot@archiver.kernel.org>; Thu, 25 Dec 2025 22:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5833406C8;
	Thu, 25 Dec 2025 22:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QRFy5e1HSpzz; Thu, 25 Dec 2025 22:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DA6840653
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766701724;
	bh=yXQSXOa78Rga+1H/Z1dApmpoCIKbZm9PhQaV9vShuCo=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=r4Ra7Dg5Up0ouEgbre9vefBltBPjGTzZJHnN0y9pH0DHBiMAbZSqZMcif7iGCbcqR
	 0wQoSTv8WmreJUVV6qmYBZaLu1QIgG8+DNyCcgCozoe2TWlKJJso71leQNNZmGiGAX
	 mMssqxN1qm4u4xQVEGQ4yhAbCiDQC1L2V5V+3+jXEfSVH1Xnl6PI7pXCMunqgeHYAG
	 tGugw526ye3pxjcJu8csFo1X44BdfCwTxzMvsT9jF7o8zwWRpQv9RMIB6O6WbL0tMU
	 JQSfLvIPAjT/CCRJQyj0cDSZpPtm1jDv3/8690Bza35yAm+jkHfI3e0G7OzBZeMRpK
	 SNhYsjpFSPWnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DA6840653;
	Thu, 25 Dec 2025 22:28:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1B14119
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 22:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88B5540162
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 22:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHkp5RviIYtG for <buildroot@buildroot.org>;
 Thu, 25 Dec 2025 22:28:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C453F40129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C453F40129
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C453F40129
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 22:28:40 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 172912575; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 25 Dec 2025 22:28:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vYtow-000000016fr-2hKA;
 Thu, 25 Dec 2025 23:28:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
In-Reply-To: <20251218163749.379769-1-arnout@rnout.be> (Arnout Vandecappelle
 via buildroot's message of "Thu, 18 Dec 2025 17:37:49 +0100")
References: <20251208203456.3656837-1-bernd@kuhls.net>
 <20251218163749.379769-1-arnout@rnout.be>
Date: Thu, 25 Dec 2025 23:28:34 +0100
Message-ID: <87h5teurfx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=kZdDgQbFZyAk8+4YTYJNislWjHizhLG0WWQJvBY+A+hSMu9s12cOjeL2vqAdfse8+I2WLkhHDm5MkFkPKJN1D6fBWqAh6WZO+Cnfybw3A/IE+0FuIGYRRVePb5PrwwlPN5Wa19/dqEEYMcEtyygGo8cnYOMBcPeBMm4UheRPYoYMZoHltBqnPv+z9p1kBhocCAyFVb6i1d5Z9cSCZna0HbCTHVbrbGZzdUvJcztwhlaICK6T3SmRzeAfYFpr/PPkkgXUdvzv5VI7cAVJknOIU23Ff6ykLbP4wlzJ3uk1v21DEW94chVGj8+a1mG3nABHwQ2DQxYPqj7mSXthIf/Zqg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Rb4nNXGkLhjUDIsJKRs32Q44VSdbGxWdHCgBfryiXAo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=kZdDgQbF
Subject: Re: [Buildroot] [PATCH 1/1] package/libxslt: security bump version
 to 1.1.45
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > In reply of:
 >> Release notes:
 >> https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.45.news
 >> 
 >> Fixes
 >> CVE-2025-7424, CVE-2025-9714 & CVE-2025-11731.
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

 > Applied to 2025.02.x. Thanks

This is broken as the configure script now looks for libxml2 >= 2.15.1:

https://autobuild.buildroot.net/results/6b8/6b8493f54996d9a6e8d98c42aa0dcf63988ff8b7/

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
