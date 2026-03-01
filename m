Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C24BFD0079
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 21:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1357082243;
	Sun,  1 Mar 2026 21:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 06WusqRhf0UI; Sun,  1 Mar 2026 21:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 946D98222A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772400504;
	bh=R8tTMZDfJJFbzjPBMYXXWrX8KkjhU/IxwK3d99hrlrE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U43g71xSnwKR95kjJQdZB+7kVPYWdyQwxEaN46uPuELXBrwdM/EKXcUtglozwxZKm
	 hs7+fBp2obIZHr3gkF6hmEcdVcFBL5Bzbux2i6EPtv+0c+wrFBH1igpWH0vThvWRpn
	 XYBYlae9zLvD015ShzMfvvNAw4dbknjbZENjlQgtXxLtQ8VeBoDmdOYRd6u2A/wZpd
	 DZMfQbhdBnXvW8/Y/xetl//47Y4/tWPcWCDzR6r1BvbOYnXJJ+fVsQQ8eJx0m0gtKw
	 WJW+E9TqDGFv6XLRu1DHA5GE0AZI5vy6vQ8ij1YiGwUDDoclfMe6GAu6rqe43G6C3J
	 QMOyY3vOsThvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 946D98222A;
	Sun,  1 Mar 2026 21:28:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2F9624E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 21:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D491740894
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 21:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNLBTthPEw7Y for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 21:28:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8F7640515
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8F7640515
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8F7640515
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 21:28:22 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 832249783; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Mar 2026 21:28:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vwoKl-0000000D2ZV-24Hz;
 Sun, 01 Mar 2026 22:28:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260224215738.818318-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 24 Feb 2026 22:57:38 +0100")
References: <20260224215738.818318-1-bernd@kuhls.net>
Date: Sun, 01 Mar 2026 22:28:15 +0100
Message-ID: <87ikbfme8g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mySEjr5pR0VvPECuoGDHOAz2alT2FX8PFhdjO154Bj5ctMx4zuIMmj0EOHSf9BGUnqW9AyehWqZZTqmwoWjWk9khjQlh9G30hgtIAVzhKEkCP7VOlz7DsZnrO2SaEV9znkO0wj8obQtmKPJzUPOccDfg1IxHMDfh4FS/ZInuVFdToZQxI4EkObbEuzGbcw+JDXJXhOuBPi9sRCPtybg34ciRIHY+VnetZ2f0y2JwKIEQ9G/4W4m5rzhwv/zR/b0dJOJ5WeLfu2r6g0q6xgyuEGA20QEdNvqlHTxKybOVBSuhL888PjYEfdkqiX/rGOspLyfr9pe0dm1UYLFVaxTbNQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=oKY0zBZI9kNBN823NOj0JMQy9h31eL54Qc1nnwHl+N4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=mySEjr5p
Subject: Re: [Buildroot] [PATCH 1/1] package/safeclib: fix build error with
 gcc 15.x
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

 > This defconfig can be built without problems:
 > BR2_x86_64=y
 > BR2_GCC_VERSION_15_X=y
 > BR2_PACKAGE_SAFECLIB=y

 > However adding rocketlake as architecture variant

 > BR2_x86_64=y
 > BR2_x86_rocketlake=y
 > BR2_GCC_VERSION_15_X=y
 > BR2_PACKAGE_SAFECLIB=y

 > causes a build error:

 > str/vsnprintf_s.c: In function 'safec_ftoa.isra':
 > str/vsnprintf_s.c:523:24: error: writing 32 bytes into a region of size
 >  31 [-Werror=stringop-overflow=]
 >   523 |             buf[len++] = '0';

 > with gcc 15.x only, gcc =< 14.x is not affected, reason unknown.

 > This commit adds two upstream commits which fix the problem.

 > No autobuilder error was recorded.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
