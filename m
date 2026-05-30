Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364ABCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF42F853CB;
	Sat, 30 May 2026 21:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9ptYda2RNRn; Sat, 30 May 2026 21:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1439C853C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780175523;
	bh=2PvNOHzpEqJdIyb0G68LbCBk6qrPARBq96VumhJvVwM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d2+YtjxGE2XeO3jGDlq8SlmD+TKVmdtJFmdnFNL3mFbac58BStKvXoWNMl2nahhz9
	 QYANmNjOKkEQuvTauf1ftjKQdz9eigXbiCrnOmtH/I0OQdEmucfqumVbrVGshhavIu
	 H137z92BjDMfXgpkVljFe8JVlGLQqDU52XKVQmesW6YRMSZ3l+4xG5nelK1fX/wIwS
	 v5GJyGLYxMA84MMO36wbOQtM3YQarx4+4kBuEqtj8Y2PPJeA2OjlTEJpLjx680exGH
	 Y9RqC5vchmcPUJolxluvQaw8EXMJCR0EnqKj60qrGiyl9uYrYra7Z9AcuIpesUI3xB
	 OYZpZR1P6p3ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1439C853C7;
	Sat, 30 May 2026 21:12:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9585EF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92AEA401E3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXVVTxN75RyW for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:12:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EDBD4010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EDBD4010F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EDBD4010F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:11:59 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1051110784; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 21:11:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTQyH-00000005YwF-2dHj;
 Sat, 30 May 2026 23:11:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
In-Reply-To: <20260530095958.604071-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 30 May 2026 11:59:57 +0200")
References: <20260530095958.604071-1-bernd@kuhls.net>
Date: Sat, 30 May 2026 23:11:53 +0200
Message-ID: <87zf1giova.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ulGj1PXixD4vXCbE45b+szvSR5NuXgvN+kn7ENaUCpcHrI6t4pvvr/vECLiMoE7yZ4qKeEyQdQRMiwEsqgULoIF2ts7RtdublUNWyNOp7sG0IDxJ2ixsGTKz+pHfsFh2sLqh0SyVbwpLjO9Tq0Z+REMonx58EIusz7S1kVGyg44G0wV0ASQxlyZDqf9Qr//Wlc0Bi/eHEU8Xx20PCEkBeMcCFlQWiXjhfg9UdJSfBOlcdJLExdZSQnkJ1bKkrChKM4B7m6dB3TD2so4yiGAi8iDjsZwPB6jM98nAgNn4EaZNP1VrpYdBEAlRiAV2y28d4d2hS7885bcKWzS3ZjroFw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=5SqEfwoRwqPq58dIajjW9S9lv84jB4OgEGnx1yj9W5E=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ulGj1PXi
Subject: Re: [Buildroot] [PATCH/next 1/1] package/fio: bump version to 3.42
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

 > https://github.com/axboe/fio/releases/tag/fio-3.42
 > Removed patch which is included in this release.

 > Added upstream commit to fix build error with musl introduced by
 > upstream commit
 > https://github.com/axboe/fio/commit/0b554ec1705ce71f366ac3fe2156b05b0c301623
 > which was first included in this bump.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
