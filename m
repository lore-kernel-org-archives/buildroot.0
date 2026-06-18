Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC203CD98F0
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 21:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60BF280F21;
	Thu, 18 Jun 2026 21:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2mUYx1NklgE; Thu, 18 Jun 2026 21:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 781CB84855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781817889;
	bh=gOevL23ZxihZFUYxnKGAkvDZ48csmUsQaO75PZ8OP+Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Sc2h0opO6RGo9r+EIopjGneOpEomWf527JiUw2ZMUxXqd8dE9ogGj5eCkIfpWVnJq
	 TNFEabKu67JudtZ63UPt+4lEQX5MdGWpUzpFrDM3TbK9IVIUdHZNGGfbsmLfRZ2cJf
	 JDSNK2Du/rFgoB3vhJU4TTZLxhBF5p4yiV1MHRgkYwT78NYkeoJbAe2wqkj1+mSASG
	 PjBiDk8uxZYxaOwegJ/kSL/kkd5m+aF62t9iYYwjusXeuh508sctZqyBI1eVZIeahW
	 6YnXHVFKLKpBQO9pr7v2oMXrC3z1zMkJmbdQ7ftTUrxUZygB/TUM7w1BarqzcvCSQ6
	 gZQJvbt3e1eBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 781CB84855;
	Thu, 18 Jun 2026 21:24:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E3C7367
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 21:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 744D741E79
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 21:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdNB7XnYMGMb for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 21:24:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B13F41CB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B13F41CB1
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B13F41CB1
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 21:24:45 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNJq-1wfBfN20Mk-00M91C; Thu, 18
 Jun 2026 23:24:43 +0200
Message-ID: <dd7aec5a-46ac-45d5-abdd-afa1e64b2698@gmx.de>
Date: Thu, 18 Jun 2026 23:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
References: <20260618124835.2935850-1-peter@korsgaard.com>
 <20260618124835.2935850-20-peter@korsgaard.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260618124835.2935850-20-peter@korsgaard.com>
X-Provags-ID: V03:K1:0i2NrSUhTteYbukem009F1hZnkVhXojCyVjg3K63fzEcNFRdoG2
 2LKawKIo/PTT8dsTXvOlINYzgk8RwYqp5h7QyhdGsrVVbsj3Kn2xAqtG/ezKWmoFPczdSbn
 UEpXl5wx2a3I9umpdhjY/u7q0/HES72ILVgA1Y9EgZlytzGkVFStzgB2TyugOVqxvbHH1qV
 nkNdAaiGZcn3gn5H2ZQXg==
UI-OutboundReport: notjunk:1;M01:P0:QBFGibvhjTo=;hBpatWnMn6Jg8o1WWyuTjDqI1G8
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781817883; x=1782422683; i=fiona.klute@gmx.de;
 bh=lSiZF882DheF5JcFxmuIFMrXlwt6re54ZLYNsCB3HjU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=JQKK7URDOlikt0Plfq7R7rtzD2zrGKqS0+35g2U1knn3kVAvgif2zlhxHpsH9TcW
 KiX30VH+uEx0AH5R2In9bk7P9fO9Ie8u5YwBn0SEIjX0Iqv3isAtc8C46Ckkq9vr+
 aze4uMiE497i5fC+Mgk2pEYWQSFoublyrxzABtSgWEdzz2JoHtrwJA1dbXsPSwhId
 WfgsyAJqQBKwoId9qDQrEn5QinCjuWwjBnsCE9GG3p6VGxWDo94CF4/zOTGm0iRx7
 cOWkxs4woLHmo/U3uxCZ77Lx4iuZHsz6u2hmG9o+vp3a2/Xxaw6lFGXfhLf8ms6AJ
 TE0Dtg2j3+6pKlvfxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=JQKK7URD
Subject: Re: [Buildroot] [PATCH 20/29] support/testing: test_nftables.py:
 use assertRunNotOk()
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 18.06.26 um 14:48 schrieb Peter Korsgaard:
> Use the helper to simplify the test.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: Fiona Klute <fiona.klute@gmx.de>

> ---
>   support/testing/tests/package/test_nftables.py | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_nftables.py b/support/testing/tests/package/test_nftables.py
> index 2622c7e822..62e14d5d35 100644
> --- a/support/testing/tests/package/test_nftables.py
> +++ b/support/testing/tests/package/test_nftables.py
> @@ -69,8 +69,7 @@ class TestNftables(infra.basetest.BRTest):
>           # A ping to 127.0.0.2 is expected to fail, because our rule is
>           # supposed to drop it.
>           ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
> -        _, exit_code = self.emulator.run(ping_test_cmd)
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(ping_test_cmd)
>   
>           # We completely delete the table. This should also delete the
>           # chain and the rule.
> @@ -128,8 +127,7 @@ class TestNftablesInit(TestNftables):
>           # should allow ping to 127.0.0.1, but not 127.0.0.2.
>           ping_cmd_prefix = "ping -c 3 -i 0.5 -W 2 "
>           self.assertRunOk(ping_cmd_prefix + "127.0.0.1")
> -        _, exit_code = self.emulator.run(ping_cmd_prefix + "127.0.0.2")
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(ping_cmd_prefix + "127.0.0.2")
>   
>           # Stop should flush the rules, ping to both addresses should
>           # work now.
> @@ -140,5 +138,4 @@ class TestNftablesInit(TestNftables):
>           # Start is essentially the same as reload, check that
>           # 127.0.0.2 gets blocked again.
>           self.assertRunOk("/etc/init.d/S35nftables start")
> -        _, exit_code = self.emulator.run(ping_cmd_prefix + "127.0.0.2")
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(ping_cmd_prefix + "127.0.0.2")

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
