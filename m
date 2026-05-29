Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9EFCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A2BD8459F;
	Fri, 29 May 2026 18:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sN_hfdqbv83; Fri, 29 May 2026 18:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77FF48459B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780079102;
	bh=cOGBi+hkH+MAql9XnKEpQ5J0mgN2UxXIufLr9IuQW7Q=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ps/DkEkeyK6qpSMIpSHUs/r9uVoQx5LQ+HWW0gtI9ibTTCPSM1oXSrPUTO7eWEoKd
	 dfjcL5oltllLfUsmvAHoVQ8p+hEeRztyl/jIzEhBMiikvtYeB7fIWky9ymjqc2EObc
	 YZ65dDLD6ORnbRLN17FsZWxF4HZEUOSTUdwLiyDclqLhvn74GMuLlCAOSDTZZsTZJh
	 5SQv8Kc403gVCIF7CPuP5nRz0H9g/N08gr6jwyChYZCXOAt7ipPDs5u4WOrvZyE+Ab
	 uE/n5iWlDMmdZ9YgNSvD6cy54zFi+5VhT0QWjGGHkIZ7ZGHdSB8KVDBJfEhru5TAUy
	 Y25duu5bQomIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77FF48459B;
	Fri, 29 May 2026 18:25:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6310ED3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51F036164E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3ise2OoJnGp for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 55FF26164C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55FF26164C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55FF26164C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:25:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 311290168; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 18:24:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wT1t6-00000003AnO-408X;
 Fri, 29 May 2026 20:24:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20260529164801.1299592-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 29 May 2026 18:48:01 +0200")
References: <20260529164801.1299592-1-bernd@kuhls.net>
Date: Fri, 29 May 2026 20:24:52 +0200
Message-ID: <878q92axaj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mufQr8aaEmwKlkRBNbO1s7+IQPnehIuRBXCdwJelsvMRXX8gOIjfIXFRicHo5KKgq4p0Awe9aowVW+G67pLnLP19lzOJFX1lUNch8ZPtq5EnEkbn8hzt3bwUinDq0a9nJE4PodR2NFKkpdKUFVPyFZY94Loal5gABOrPlBFuwcMxFYOuD88XJIbSDyt4pXtjKsU57CN3bHAb3xIomh0m/ojyKEWVk+6CXTK7ikhofmyZFFlDJmMKI4YYFlYmOQy12sqj56cNtQvHU67Nr3w4Q/cePNo137zTX6f2HrTLt42+Tnn3xC8ukZhmFbtHkLpxgF19q7CPFy5lFva/pPVZ2g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=7neDGutvzx+OZIirUZWVvBWHJyHdajyh9n461I4jViY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=mufQr8aa
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.4
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

 > https://lists.exim.org/lurker/message/20260529.143857.4c75d7df.en.html
 > https://www.exim.org/static/doc/security/EXIM-Security-2026-05-19.1/EXIM-Security-2026-05-19.1.txt

 > Fixes CVE-2026-48840.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/3861000877a0a8330b7c6b66a5c9d7aeb4bdcb89

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
