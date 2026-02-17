Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D70E9A035
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 18:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ECC141DEA;
	Tue, 17 Feb 2026 18:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiYKGpkjMKwh; Tue, 17 Feb 2026 18:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F78C41C25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771353112;
	bh=otQNhnV+IGl7RJH4RCXKsSW/66GF+C7yno0riUKEKOU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gVNMTwI8yymk+S4us0ysvYS5CU5BIpmS847EuqD47S/DmjohFJzojkZID/bPJYJ/5
	 g7Hh1K+HrUHkRBY217Pj659oZsobMinbwa7cN1MKbqClC0cW0PTxY+VIm7DTj1JTNs
	 aDktqcAMcFZpOC/5cjVCymhIlIz/jMziolS7D7JRqpc05PyFGCTqEDwc6QNmnFIeND
	 9pjpLchtRBDwgkqShRmFHN4qihLL7u5oX6iugm/hC7vVJ8cf7Xi/KMiESTVl46rszB
	 RRooAeWlCza9p4md5Yj0XPvzLBrTFaRDAGgBMAIwM/CpHsEaXBQj/W7VvULuxTLpVR
	 MCTJHsjzc86SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F78C41C25;
	Tue, 17 Feb 2026 18:31:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB57C206
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 18:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C059941C25
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 18:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERZ6fFwSsukA for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 18:31:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 99BFC41C1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99BFC41C1E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99BFC41C1E
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 18:31:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8562719F574;
 Tue, 17 Feb 2026 19:31:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Feb 2026 19:31:45 +0100
MIME-Version: 1.0
Date: Tue, 17 Feb 2026 19:31:45 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260217164839.1209805-1-bernd@kuhls.net>
References: <20260217164839.1209805-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <61f7aec440042003ae0587939cc0b25b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771353106;
 bh=HVpPKNbYjb50JymRwt8flNTi1RXP0/rjJdbSVBUlZB0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TRPoaiibDpd9AFe0KDgVou7jtDj8oaulleeBc34BUdImvieCqDJdppNZ2Crq9Sh+D
 1dH/tvxStTQ8pmoMru86pauyFxE1Y3JY++wbK36UUoRsd2HV5eu9cRKq8Ql2DVsb+4
 sjr34BQRHW+DcZ/XT2g9vf8BXeueZ6Zo5cy67a9HhJiCvUnk0fAeBx69RMlu7LTmNV
 HBCqWnSB5fVjdSMRcLuOmwg3tWut8Ibt2bvfPR0OS6yrT7A6gY1omIzWJnbNS9oka1
 eH4DbhBlak8OX7jaMZZwvfcRu60ohIrWZ5e5TDSuzgNIBQSnQTOHEp+1WuAgzMSRX6
 gc0Dplx3Pa7ZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TRPoaiib
Subject: Re: [Buildroot] [PATCH v2 1/1] {linux, linux-headers}: bump 6.{6, 12,
 18, 19}.x series
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/02/2026 17:48, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
