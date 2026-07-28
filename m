Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7467C54F4C
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 13:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A5240942;
	Tue, 28 Jul 2026 13:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxrIfOpT_ha4; Tue, 28 Jul 2026 13:56:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7EC240831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785246989;
	bh=yAYZg3acgHVlD4wPoqcs/+cMfBKjHVcGkOcFall8bhM=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kMNgKzfUoppxBkflas5iHSALLv2PUgmoXVwn4jY5CaxDDoOx9Vr8W1GFrIOPFdR05
	 s2eilt1iQu0PInC7FNqtu1yucD/rjTWCMG+0Z5m7U3jB5l2jljsuskYNZiby0kJNqM
	 yHMrg/DOa6bKYWahSEWxP8F1tDJXyeK8FUZ2IDiVxgCpMMVMZOFMt6xxw7J45TErj0
	 SupJkNFOlQUlIITtk3rl3NVIBeBlSu/TvsjBJ+pjuscKu2nmXxG2oIdwM2ixjfcDRR
	 vbt0QeSFd4DO7zFdk57r2YtiQsKL8+ma8cCzm4bcuDjTP7V1yyliWYmzI6/wWfau2s
	 8WXyM5rof6urw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7EC240831;
	Tue, 28 Jul 2026 13:56:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 257AA2E5
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 118D360899
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHzQHO8YmouR for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 13:56:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D57A560888
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D57A560888
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D57A560888
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:56:26 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -186591151; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Jul 2026 13:56:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1woiIB-00000000Evg-3wbq;
 Tue, 28 Jul 2026 15:56:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: yegorslists--- via buildroot <buildroot@buildroot.org>
In-Reply-To: <20260728094808.2438837-1-yegorslists@googlemail.com>
 (yegorslists's message of "Tue, 28 Jul 2026 11:48:08 +0200")
References: <20260728094808.2438837-1-yegorslists@googlemail.com>
Date: Tue, 28 Jul 2026 15:56:23 +0200
Message-ID: <87wlufqku0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=nCy5ANe/FUtmz2uZTSQYFrVSDim4wnGZPtoUjtv7D7ay5YGbtcuYbdIup0rGuJaDr2RGvv90kcajQzgnpT65ThbEOd7kRaEy2lOplaxXB6hrmwbabZnrXJ8kRlJbG/o+GMdKMx48LYFXp5n3Aixovm2f2qcP48Y0E42Ic7glyRa7tTv59QrAkXo9OBIX9CTuE4SUJYwJCkYj4hVUndUGWh1w8sX4soKpPo+jdY1oV+BnC+FxMKSPKZEPFhpr7iQyvJu2bBflIoS5rKcu56YPEQlpQFAIT/NgXIc9zo0jzz113+vvaQzL8w/en27L0Q0EHMboN8OmIfPogtMEjRUSCw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=98+svuNDm6fco8d0WyTSsQL2uVJw6U27dziIpmhC29g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=nCy5ANe/
Subject: Re: [Buildroot] [PATCH] package/libmicrohttpd: bump to version 1.0.7
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "yegorslists---" == yegorslists--- via buildroot <buildroot@buildroot.org> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Changelog since 1.0.6:

 > This is a bugfix release, fixing modest security vulnerabilities
 > discovered by A. Ramos.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
