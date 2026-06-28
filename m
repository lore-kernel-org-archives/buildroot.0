Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25858C43458
	for <buildroot@archiver.kernel.org>; Sun, 28 Jun 2026 13:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A4C040C9C;
	Sun, 28 Jun 2026 13:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpT82alaVayN; Sun, 28 Jun 2026 13:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE88E40C6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782653609;
	bh=b3uYE0V5EmrSZGHh7UxV2sGmrcMX3hI8ZbD9yeaysTc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=efGHS1GCewlxQmr3ItqJ/FvJ24wkYcDtvE/EFPTSt4+3Gq0BDxeYQb7d/ypg6/Bie
	 cG/QaWBkAVWJ2DeYwbPNRtJMeNfkYAx8IMRGuxaBb0BTcbuLlMIY1N2n8Axt/xnxWh
	 uuik/dJZRa1Ljwg28PxVBO7eWOfOpF+uI59u9pZwTZPdP1diRsheir4HJIwtvv3a+H
	 9aGK64zcKev8aA0uC2xHGR+Hl6IDBGSmOb0h3krCSRT5Of+eieLpyGdl51iDzjr8HW
	 r3EA4pOw3HAephGsYxgYLd/cWS5IicwvAZDAzMMIqOK/mv7GIxVOTaRlp+gUwmyJ2e
	 RamkyySmP+ycw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE88E40C6B;
	Sun, 28 Jun 2026 13:33:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5505BC
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 13:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B4E0607FF
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 13:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSw1UOZtoFkw for <buildroot@buildroot.org>;
 Sun, 28 Jun 2026 13:33:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C443607CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C443607CE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C443607CE
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 13:33:26 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1546479046; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 28 Jun 2026 13:33:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wdpdL-0000000151T-02fx;
 Sun, 28 Jun 2026 15:33:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260628113941.8068-1-bernd@kuhls.net> (Bernd Kuhls's message of
 "Sun, 28 Jun 2026 13:39:40 +0200")
References: <20260628113941.8068-1-bernd@kuhls.net>
Date: Sun, 28 Jun 2026 15:33:14 +0200
Message-ID: <877bnix011.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=3Na3y+flOdgffQbWm8t3odnp3wpzkpyL3js1hd2lGeNLla1jRsjXDpL8O5c0CIdzmAa/eor2NaCoKAvlK0f7IzsHzMrbMSx+nJyNr1hmTfkokWoZNHvlG2SQiaY2WgS9rcb9yj72IP3pcF7DSqZXyfkhJ9ncQXylJh3af5R1OXXulIvTPZk5EAPBGM45JVjhoTDjhem8Dy0RO3NO3SPLxNPckeCdMIXME7AVrhcZ7AM7RL8ws/pzbGZ6qTCV5TpbKocxulTfdeUkYNIsQsmAAQ338SJGpb0bulRzuAoerWKfKt6k0ZSu+sV+kjhPO892Kby3Vp+B26sRze+9SJJ9LQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=mxTc62Z+a1vLj6dhub/9+dPMYKyth295ouL5V/biksY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=3Na3y+fl
Subject: Re: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 7.1.x,
 7.0.x, 6.18.x series
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

 > Update the latest kernel releases to:
 > - 7.1.1 -> 7.1.2
 > - 7.0.13 -> 7.0.14
 > - 6.18.36 -> 6.18.37

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipeline passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/a6494fab01df4bfdfe2c911326a8f3f04c42a6ee

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
