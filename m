Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F08BC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 19:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16B4C41076;
	Wed,  1 Jul 2026 19:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdPKdOmnc-zu; Wed,  1 Jul 2026 19:59:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49C1840F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782935968;
	bh=47DFFEIwhIPtYtjw0FWU7qCPfOQ+pMkeyCnGt2PgtYM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QDGsy1vwrF9P6vhEA5cKCDDShKvmN9QJqFlojcZtzQ/uJ7zJ/pxjcn3QRp/UotKgX
	 4mPkVxthMdT+BmRDmQ4CdacH4YOymg23OFXSFN4Cw7MThlTrldvp8wBYV3IvPRhkL/
	 kaIMAD0KPjUOC/lMhYMsnWXbIfhl8Y04VBiJX3s/ag0XFf50yZD3IEXPgThVDdTWDw
	 FFXaQb/V6r28HEz4AY6RbRJSXcGFhI/uj44TwsQwsu+FUgpM2rfxl2mi/PuniScb+S
	 A0HWt9wed1az8JRVKxrsZxM5GQnjF0Be9rTRMc2mlOxMIM8lG4SohPlcULG4UJtl61
	 B3wkm9F8IvTbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49C1840F94;
	Wed,  1 Jul 2026 19:59:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8085B127
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 717D560DC1
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a313KuDfTfkQ for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 19:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6786B60B9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6786B60B9D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6786B60B9D
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:59:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -135821605; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Jul 2026 19:59:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wf15e-0000000321s-2hnr;
 Wed, 01 Jul 2026 21:59:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad via buildroot <buildroot@buildroot.org>
Cc: buildroot@busybox.net,  Francois Perrad <francois.perrad@gadz.org>
In-Reply-To: <20260629074243.301420-1-francois.perrad@gadz.org> (Francois
 Perrad via buildroot's message of "Mon, 29 Jun 2026 09:42:42 +0200")
References: <20260629074243.301420-1-francois.perrad@gadz.org>
Date: Wed, 01 Jul 2026 21:59:22 +0200
Message-ID: <87v7ayqy5h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AX9mkrbivEISmGtu48lgbkonw3FdTu8P8S49wbkrljwvAlwgz0aNL8uOfuAwDT8Gy5J/CbrRbRBMacmJ0ieuaKkmgGQc0vlRZRB9GobmPyFSxeHtU/ssqmEXkhyHsRnMBANygbv6kIKhSvLEjR6Qi8m+Q8pngnLWVRCXkExZusnoPLmImtKqLdb5Jy4cuC5hrT0/Dzf5VVCftyi3/DtPK4o89AGUpMDwGD4yDEv/qyMC31VS4N/uNeWjEJ4O+3+rncugB7iq/XamJnUw4jVHokmeutmg5sTitmwyelWQ1KqlEU34+yHGFhklOaTh0kmo6Xc8no6b9cYWqn524BqPDA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=cCTbHHMTk6pG0CpImV6mtwBE0sGhSpYykLGmHBqixdk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=AX9mkrbi
Subject: Re: [Buildroot] [PATCH] package/lynis: bump to version 3.1.7
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

>>>>> "Francois" == Francois Perrad via buildroot <buildroot@buildroot.org> writes:

 > For release notes, see:
 > https://github.com/CISOfy/lynis/releases/tag/3.1.7

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
