Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A994D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61CDD406AA;
	Sun,  7 Dec 2025 16:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bTrYmMbtcv1; Sun,  7 Dec 2025 16:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E33B4063B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765126388;
	bh=ZmwZgbjdMZBMQmUOdtUidbBd3YxMydej95IKTo7BlUI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s/N4Qy1ty5Iz7okYMl0Yu5dSM+Hm6OvUTpgafFe+9hKFYG8pohyPsa5QI8KSsMr8y
	 B6CILmDQPfMcilxq93IeR5/r+w30jUjgZ9C1e3Mm6OecPqASpouBZBlrKkwSqktNx2
	 fOTGC3FNqXW6zrQXeS194jytibvRHaJNZZ4fvV/DiSaktPnHDmMvb2lLyxW7Njvg6Z
	 QB6cqTW3p94lA8f3M9tOUQMrgAMI3JYwSA35YF/AzuS0EGS1ks4OLHdbs8BxMX3HGw
	 3q6N53bNGJOICL1HrrD8jeAbOo7hITnxvRv/A6MR0Rqv7Zc/yUBLxQjBWqhCWR6lb+
	 NRMB19/gqOueA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E33B4063B;
	Sun,  7 Dec 2025 16:53:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8F822CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AB3A6063C
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VuBL2-Bzz5e for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:53:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92916605D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92916605D1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92916605D1
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:53:05 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -881161469; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 07 Dec 2025 16:53:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vSI0K-00000004XgN-120d;
 Sun, 07 Dec 2025 17:53:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251207122324.3523992-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 7 Dec 2025 13:23:24 +0100")
References: <20251207122324.3523992-1-bernd@kuhls.net>
Date: Sun, 07 Dec 2025 17:53:00 +0100
Message-ID: <87tsy29qtv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=c2GnuJAoiMvWG75bbMxbGJ7gGnG/qc2I3YtDmfQ2thjRV8LThnZO2mxEsFe3nZ4KKBKDIX/IGkWYh+EgJcxgJ+cBbWpXRMzpOaaq6FyinRqf90AXoC69DaSDPFryvLPE/UzR9lmy395xP7JVy1BvwVumhOASo1DAX1wBJBr9z/3HWUrAlmlfp6NoWJBkW6TqfTuWnqj6F8YEbxSgD8BDbYlJygSqebY07dhD5DfmWGIkg7kaum4JeMFOkep/BOmDklL8Jzs058O+070v9n+71NGtd0BgntWbzoG4gB1Yrke0Pg2UudQJgkpqV89Gi+xIkjqKKqPhV4Y5EaZGAuaouQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=eWFV1anN1FUGPXV77bQeLaq4d7SsMhmba/9880lrFfo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=c2GnuJAo
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-intel:
 update SITE
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

 > Updated URL of git server, tarball hash is unchanged.
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

I see we also have an openchrome driver using anongit.freedesktop.org
(but over https). I don't right away find it on gitlab, but given that
it is only for ancient VIA GPUs, perhaps we should just drop it?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
