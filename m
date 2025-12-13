Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A92D5AE45
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E30A60BCF;
	Sat, 13 Dec 2025 11:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTkjwdjhTcfr; Sat, 13 Dec 2025 11:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E8E460D53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765623971;
	bh=g3ItrnFRrPgsiIXHyzyaQUlQzHJbvcH9D2Gu7mPrtYM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qleTiwtvPnGgsas/0eZwQT52bh0HmW030LnxQGdVJssQ1R4CCpvTZOj1rCa33E5di
	 5kp6TwlXIOsEaFFPbu8uv72Cu7LxPmlZJlIWErHG8Y5HmFhP8u0fXrWCy/EJO+PGDt
	 qVZIouLOlOPTEqTaw8Ig9TfAKlISonLie0DqD8lo3xo34f6BzmWmwKHmtp+OXAt9Wq
	 8tOIymCyjvjJtG60tK7lqr7U3A+8yVwpLVteGHJ+Uz3MFQh5MoIliPrAkTE7v2/y54
	 8OLFA4JR1f3h5NKE0WCrnN7uZFnuKSxQdXaCRHPzGA8atddmCZ4cLr6URYBxySo0Sm
	 J28w9nqZkdumw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E8E460D53;
	Sat, 13 Dec 2025 11:06:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 652FC13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BD6340411
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jt5Nyuceh6pw for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:06:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0430403C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0430403C8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0430403C8
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:06:08 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1791762532; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 13 Dec 2025 11:05:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vUNRd-00000002ROQ-23kH;
 Sat, 13 Dec 2025 12:05:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Bernd Kuhls <bernd@kuhls.net>,  buildroot@buildroot.org,  =?utf-8?Q?Ra?=
 =?utf-8?Q?pha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>,  Martin
 =?utf-8?Q?Hundeb=C3=B8ll?= <martin@geanix.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,  Guillaume William Brs
 <guillaume.bressaix@gmail.com>,  James Hilliard
 <james.hilliard1@gmail.com>,  Marcin Niestroj
 <m.niestroj@grinn-global.com>,  Mauro Condarelli <mc5686@mclink.it>,
 Titouan Christophe <titouan.christophe@mind.be>
In-Reply-To: <5a35f447-eafd-40a5-9012-3448dac96845@bubu1.eu> (Marcus
 Hoffmann's message of "Fri, 12 Dec 2025 10:55:23 +0100")
References: <20251209193951.1000100-1-bernd@kuhls.net>
 <20251209193951.1000100-24-bernd@kuhls.net>
 <5a35f447-eafd-40a5-9012-3448dac96845@bubu1.eu>
Date: Sat, 13 Dec 2025 12:05:49 +0100
Message-ID: <87345e1w1e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=YOmAVuPtNnDa1YYoB6Q4B85t8HHChNAuIrXfgTc03Co9k+nl9nmX9h+tRHZ0tPxqhIjODyw4jd1fwqx7sfIGRr0Axw78ylyxuWbUjRdD03zlP7z+UCKL9Curx/PrIetDxMs/vnAgKdRgVk2G9KhBemXO7KREvsNYWNKkPs1wTRhF5KVlalZhtzN3OEepI0gwbR0AndtdPs1nOh5vgoeo4Bj/Wb0wbIMUQjScHbTQ49l0eKdQbauHaoNQseKL1Xm2g8gKxwnmYI1a9iliA9sVJUKxYuAsHJlAj372uWEtKYQv7nK/2H94jNXw90cAobnuZoAKW4RrXtu2UoUK1E9Fsg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=p57vZr12y4VZBwrYX7WHR2LjI1iJwk0fBHURil89qjU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=YOmAVuPt
Subject: Re: [Buildroot] [PATCH/next 24/31] package/python-brotli: bump
 version to 1.2.0
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

>>>>> "Marcus" == Marcus Hoffmann <buildroot@bubu1.eu> writes:

 > Hi Bernd, Peter
 > On 12/9/25 20:39, Bernd Kuhls wrote:
 >> https://github.com/google/brotli/blob/v1.2.0/CHANGELOG.md

 > This should be marked as security bump:
 > https://github.com/google/brotli/blob/v1.2.0/CHANGELOG.md#security

 > @Peter, there's your bump :)

Thanks. Committed after rewording the commit message to mark it as a
security bump and to mention the relation with urllib3.

 >> Added dependency to host-python-pkgconfig to fix build error which
 >> would
 >> be introduced by this bump.

That is a bit silly as pkgconfig is only used when built with a system
brotli, which we currently do not do - Maybe we should, we typically do
not want bundled dependencies.

But OK, host-python-pkgconfig is tiny.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
