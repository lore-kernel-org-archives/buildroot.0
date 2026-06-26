Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE489C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9AC9812E6;
	Fri, 26 Jun 2026 14:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PkxGnhBsX0Fl; Fri, 26 Jun 2026 14:56:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C70B78124F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485797;
	bh=YRzP6sGbArjMcuL37WFz7sYKm2TzYBTJbu5fdouZJAU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LYbbw09rg/NOHHQIZh378nuoHD2O4/Zcw8OWYk09m2Ds9g7zfn/+5Z8YkF6Y2zOkr
	 RL8YGrs+O90eXEBLL14tYk3S0hBm0dBUfYKvY2XAKAHCQdxiWb4dp+GmYxvU1hD+Hp
	 ZE5rFC7MlerIc/6r4y99QjD4krcEDziYgy5Yp70vlPP81jthR0xu2ctNS4EC3LAPkB
	 /lzeG0xR+0Z2yuA7rzv+ASFxwc8dT1OL4NyXCTzJN0JQrc7DDS2alD4q/dXXWNDvKl
	 2jPSUJ0hWzUQrHH+gXHrxsCDS6K0dhPBvb9nHXyHC9+GW99lWooysBUzfCMDjb8olp
	 UKkuv82rTLCAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C70B78124F;
	Fri, 26 Jun 2026 14:56:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 683653A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A2884070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id megkgiCFnwtL for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 498174071A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 498174071A
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 498174071A
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so7797695e9.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485779; x=1783090579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BKhmpCToqoqcg29eW6P5uovY5SPiGqBHIq4xI+rPgKU=;
 b=FfeFvHwL1XiuCG8CW2hz+rljW3woyyvF6FTuutYQpbSaIDaR8m9Unf5E2K27iEZjcy
 LXiv/K3zc8LNrqE84WvgVk79rOxbJdq6Om3AxXG2NavpVOB5etmokg0Di4RcwTalNeCw
 wqGDjO45k2+sadPOBXOxcSNpaN3eHYxD0ZiS1FIv9vY+8CAJBzdUXVTS2UMKntYFHAA3
 HvSdTs7M7vINp9+Tq19H5MZiJNS5mOVALoaRJbCwDYjJpIEVtCVL67CSpuBykcXdAkr8
 yWXSwJfFPYc1NyHTkpb6gvI+lrWCLIk2UmCxaPTQrNG/e4D6rga/G8YBj0YykSJSuTj4
 vSnw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8EF3oCE6l7HTCSlWlbPhKuBn0Am7I5jl05+kp+xclT3zeRzI5+Bak/nUkcirPHy2YY0bd6koyy4iw=@buildroot.org
X-Gm-Message-State: AOJu0YyBlnF4JcwWEV0X5In7TBUoGT0qs2JM6l7X25MRLptkXPMNdgo2
 EO/g2gPa1lTeKjfOi9Ur6SGDcJ7mXABZF9UUq04AWm3VFrCOuJ1rjE5fc5VHzM5Vh72rdbQFbXd
 K21T5
X-Gm-Gg: AfdE7cka+2TIGe03G5yIlXL1vNcUWRawGtM3y9HG4At2IDuA04TgB9JoBEx3RBlWk1E
 fWtLudFR1AWWbW8fzvG170Gvt2lyQijuqp2c89Z5/8qp3zaRmBswFQQF5jb67lGZjS0jjHGcr2s
 Y1GvSdiFQDDOfc7daK07+D6AVPoxEcVt0RVmIOdQzrYl+FzWzu9rpmC4vIHJpVQoRrOEBiY+RS1
 UiJLdsdyZW4umADHW/+shr+dQmmo/qSEXNXqPamK8MYNxphzIjV6170R/++3V3lsLuheUhDtbiD
 BDtW72g4VOw+Xguofn8j+/MtdJoOkCnxXVW19ptfRHi7wdwsWrT0l0MP3ITXVBtGojt6YMwv4J6
 u8mkL/HK3rGn7qLVagYzeychYC7TlpVfXReLK9gsXWuBUKHRe0tTZpZjW2M8iUXpS2tOzRF42ZD
 rvApwC
X-Received: by 2002:a05:600c:c059:20b0:490:bb3e:30c2 with SMTP id
 5b1f17b1804b1-49266885955mr89712205e9.18.1782485779155; 
 Fri, 26 Jun 2026 07:56:19 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492690168d5sm115039415e9.14.2026.06.26.07.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:18 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:18 +0200
Message-ID: <20260626145618.344649-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-18-peter@korsgaard.com>
References: <20260618124835.2935850-18-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485779; x=1783090579; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BKhmpCToqoqcg29eW6P5uovY5SPiGqBHIq4xI+rPgKU=;
 b=aokrl2WLKQcM8UkUgEaKDJsugfrpv9FSsG3s9yQ53zfI3lTSzOISsRbD8UvbkEnCzT
 ujAqw3c49BOkkuQGDolCRtCvXf1OW+sTUf/8CoSncKe72vdESnZnLEFG3blPzm2/5izm
 8Os72SztGHk/cbuydmuFwWU4dKNg7+A0tgWur/c3xPBcLMpP3MSOgWY1C8H7MWNeEhUg
 NZFtZwCOm/eNsL/LflFViCsAMZwEYphsCSwohMMMnQpxDPEf+QprKrLmI23mCJydhU5m
 wG/ZKiGObeKJzVtRR+4fa9yHbC8GOH2aDLzeXRVt41nXcEZxnHqTnuj/2bf3oh5CQB0B
 4YzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aokrl2WL
Subject: Re: [Buildroot] [PATCH 18/29] support/testing: test_mariadb.py: use
 assertRunNotOk()
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Use the helper to simplify the test.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  support/testing/tests/package/test_mariadb.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_mariadb.py b/support/testing/tests/package/test_mariadb.py
> index 67ae61c3e1..9ffe6aa3b3 100644
> --- a/support/testing/tests/package/test_mariadb.py
> +++ b/support/testing/tests/package/test_mariadb.py
> @@ -179,8 +179,7 @@ class TestMariaDB(infra.basetest.BRTest):
>          self.assertRunOk("/etc/init.d/S97mysqld stop")
>  
>          # Check the server is stopped.
> -        _, exit_code = self.emulator.run("mariadb-admin ping")
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk("mariadb-admin ping")
>  
>          # Restart the server.
>          self.assertRunOk("/etc/init.d/S97mysqld start")
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
