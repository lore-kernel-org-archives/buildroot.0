Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5E8C61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 18:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5567A40742;
	Sat, 29 Aug 2026 18:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7PVmnbyY48KC; Sat, 29 Aug 2026 18:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788028218;
	bh=49/1nVT0w5WuD83osMCMNiuQWAw0yxGFlCZ61p3OfJA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SlwPMQGiLmou1EX5Sq/jN1Oq8zmzHwz6IDQobmYJF74OOURxtnx31GBi/bqK+j/+a
	 gPwQ8nB8gsn3+TDqayxna50IxOLDOdQ4nXBEYyB7etyPI30W/+VsK6DaYFLwxJGRek
	 e+DV9fclvecE9kMdwvGIXhalNk1xJjMZW94efifEmMmznKbzB5MlU3VWtKb8NNueo+
	 gh0i01TwlN1QHEqH7waoDGT8a9JB7+AQVZYT4Iu/SPYThWOqVCc2FfMMn6pT+wVIrj
	 YmpKc4vCrc/cSDgzzwea3GyDR2Ixd84HiQ+SdBG4nx7NrLOHKS3yEji+9jYrtk+Qos
	 uoAr0pncj7URg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E353D40730;
	Sat, 29 Aug 2026 18:30:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C4CC23E
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 829EB80E7B
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6L8wXTlUPJ4d for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 18:30:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=NeUmS94n
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 655E580E6B
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:30:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=NeUmS94nGVOJ0fZARisqjtbkqvBqDSaeqnp+8eIlyvx3p+CjqDu9kq8UjMr+ZsgXQGyhMqXN7s/b2qBhk5ppJGh+AO9uk/SA0BUxFk5CBkipyjgUZ/8vzRO41YEZnvjzx6jmvRut7cF/S44VaSnn2YoxY53PPpLn76qCPkwRv9szOqIR0AqHydKoB8EWbw6FnGw5FvgxDQ/grUN0ARKwEn+0No5TaSzM/cJcDIS5fJrrSc8rP+A5L3A9ZLKS1wQq18hNVCgmuF7dMSE42H4cZmvcQE4AaUqwFX4DZtIVG8NY+r9iuhL7eIRnO1Htl4VsiKYqxMcNxkHndq8ZixGvtA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=K6Zs4ejebRMj1jYVfdri/dABZgYWv9fhgdkd5RmVi8o=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1593292210; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 29 Aug 2026 18:30:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x0Nog-000000002zx-2ILT;
 Sat, 29 Aug 2026 20:30:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260829060259.4186-1-bernd@kuhls.net> (Bernd Kuhls's message of
 "Sat, 29 Aug 2026 08:02:59 +0200")
References: <20260829060259.4186-1-bernd@kuhls.net>
Date: Sat, 29 Aug 2026 20:30:10 +0200
Message-ID: <87tsocu6dp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x,
 6.6.x, 6.1.x, 5.15.x, 5.10.x, 7.1.x, 6.18.x series
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
 >  - 6.12.106 -> 6.12.107
 >  - 6.6.154 -> 6.6.155
 >  - 6.1.185 -> 6.1.186
 >  - 5.15.218 -> 5.15.219
 >  - 5.10.267 -> 5.10.268
 >  - 7.1.11 -> 7.1.12
 >  - 6.18.47 -> 6.18.48

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
