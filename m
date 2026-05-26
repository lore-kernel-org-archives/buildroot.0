Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE212CD5BB4
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 05:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 738A7826C1;
	Tue, 26 May 2026 05:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QoBMk1gb3jE3; Tue, 26 May 2026 05:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE668826AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779774737;
	bh=DCHWwvaYoRKKMZyNpdeh21nNnKce631mnE0bJzK88SA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UOZhMQnczwVbfDP6K0/21wiy6hnKp8KMfmIZWRHSfv15yehj0AsVXk9HfnC+AXoKf
	 Nij2l6y1CUyxKP+9qd8E8RSq28s6H/SL6amqk8p5WxO/6IhVxlSZhFDFruKlOi1CyK
	 z+TqMjqlRIyhppHUXOrnJavHLB4/drlqpkib/rK8fll6C+20Yl5jf57e1k7tHHSMDP
	 mX0z3nMgwv9b3JPw8q9B2qxBLINW44sZht6jX/xwImg+Do9LQJFO2H8jqCLwjB1MV0
	 JJUV4M54r6Vi9ntwjRHJI5R55UToT2gRL1Ip68nyMkoO2z5lBq20eP9BZxRbY4r4/k
	 ahl10hGy3y9+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE668826AA;
	Tue, 26 May 2026 05:52:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D636D265
 for <buildroot@buildroot.org>; Tue, 26 May 2026 05:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D08D360B4B
 for <buildroot@buildroot.org>; Tue, 26 May 2026 05:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYrjNLQBW-tF for <buildroot@buildroot.org>;
 Tue, 26 May 2026 05:52:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2567560B45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2567560B45
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2567560B45
 for <buildroot@buildroot.org>; Tue, 26 May 2026 05:52:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -388039291; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 26 May 2026 05:52:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wRkhz-0000000Eepv-0jYO;
 Tue, 26 May 2026 07:52:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Stefan Ott <stefan@ott.net>
In-Reply-To: <20260524174645.3772462-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 24 May 2026 19:46:45 +0200")
References: <20260524174645.3772462-1-bernd@kuhls.net>
Date: Tue, 26 May 2026 07:52:07 +0200
Message-ID: <87o6i2n2ew.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=OpZ7WY78hv+kl81oZLAF7Ul32DDzq2I8UfqbwILBhdH3U8OwCMkbWx6+gdfuAJxWCmSo2P8vreU9SyhApiJmxacXbAL/tinIHHQ8wP5OqdX0PV+OMku7oiKsU+Tngy9VGBHSmtkHnM5f/EJHgexkCCIT38u5TSolmTzhEpXhYPnTsrBmeAkavoZrZQuCJ6asfgMVJuDwiQ6rXKCIRfbymBEYkTDuqs5gzAU8SDNg9UvEBIF6HRueE3KiMdZI97OgtEQn6mT/UepzM7d584iZCdWxKds5ud6OyqX7FDLyLwrr+xs20duqB4BJ5x82KkL4iOiOhLkQeXfuE0Bur4J0OQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=XKxMyT8ENtJQ6VvMzLcaho19BmW1jMwReJ/KdN1uROQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=OpZ7WY78
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: security bump version
 to 1.25.1
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

 > https://nlnetlabs.nl/projects/unbound/download/
 > Used new signing key to verify the source tarball:
 > https://nlnetlabs.nl/signing-keys/

 > Fixes CVE-2026-33278, CVE-2026-42944, CVE-2026-42959, CVE-2026-32792,
 > CVE-2026-40622, CVE-2026-41292, CVE-2026-42534, CVE-2026-42923,
 > CVE-2026-42960, CVE-2026-44390 and CVE-2026-44608.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
