Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98272C43638
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C719407A3;
	Fri, 26 Jun 2026 14:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bv1AJ-dVzMII; Fri, 26 Jun 2026 14:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D6D0411DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485777;
	bh=9jLIcuRqp2jpBR5ohQsd5P4tIbl2Q0531HtD6vUv5fE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DTzYpcHDrcOCOhuYKXPF2ew7aw2OqZcInYnMOHkPXzVmqC2DT0rn4oHVHL0R4PulG
	 8Uc4GZ/gd/TQMw/alf2XBXzVbBm1yMO8Nw3YSipNnjAR3GksLeqKsa2ghDrLBiPkqu
	 0O6mdIt+Xay4HaSzt/H4GydCjUsO1e/Uu30ZizsBi62KOpho94yy8/m76pgAfLCMlA
	 kkLwSl79blGyY//zmheTGJn0cNPq5TqPfxNpBItGyaB8+QcnoJBsHItptONnZ+O4C9
	 q3OXkc2YSFUSAg65Arp3cxl2n0+XwpvTQ7VhuRiKxMb3En1++H4cBO31npa7SZ4kxp
	 VoNCwmUUGBGWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6D0411DB;
	Fri, 26 Jun 2026 14:56:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AF513A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3115D823AA
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXbGVtgNs9lE for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D40282361
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D40282361
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D40282361
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:08 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4629051c946so714044f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485766; x=1783090566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dI8Ka6vOOV0V97bulXm+B7YkTpfDeJ9uO1cj632EWPY=;
 b=TfQUKlMTakoxfHJb3OkZlfARcbGUNa0h9IwVS1tScxjfJ2mhu1bUpvPQySF9eTQ4T8
 eyXToyXJUNIGeNUf7oZoAkmP95w0DzTSN9TtXyAqb1OqnYNUSj884/p13DMv6PwdtZC4
 KW/tmUX4mi/mtau9CEiuhhbROKYdEpofBJHC7o4npSV7pFLi6QrtVGLWKz2IKgbXyP58
 XRr+FR/la47VGcna3kbyXLdUlwhRFmX69mH+74NQ3lieG9h9q5A7KJoF4rYLP8cOX98a
 wiPwR9Y9ihcYGqAYngyyRONqUhmjgJU/NVpYRFN/s12UJ1Y2B0r86YQmYh6g6BaQpNbp
 J9UA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpBtWDtT4HfbACuSmaaqlcgf/jny9/xvyeuzuzFqp/IOfz2828jkSsNqYhUZDK5IpDJhjl0ApFHlv8=@buildroot.org
X-Gm-Message-State: AOJu0Ywn7baluvIJmh9ycMiUfduPjLIXNsoP70Uu97uSJHzw2CXjexFB
 llt1Ubkv/RCoMhBd6yO3lHs9OSwi5n0afBptaxf1q20ma7CKsLiLAC4b1lS3cdb9skA=
X-Gm-Gg: AfdE7clht0knrptYTXPcsBfKqudfkm/o3kJJF+p6Kj9kStEnGv/3qb+YbhZObi+A6Tm
 6Ofm+4btqy+6ZrhZcl2jmvYRjduV3FHPkKKJ6Ce89V/LWmcPjBKmb82PNT9GIe6c6AtqWSb0cJY
 iEem3/NuyoSBtp2ibqnKzT2UkcOHQcMd1rAHaGV//SuaiVVBwo3574jNEZptk/QUAH65T8HfEdh
 EjmZwbeHnSF8BQ47prARdO2/zZwhlzZpbSai/9q6DtM7rOQhTrU6GP/h72hYvFWKnMEzfkBXSVr
 RsYdPN60qD54XHnm9quzT4f9qaHA9So72wxNSjAprhONaosEvC/wIU04jCtMj4GbY3oMbtRL8p5
 85zKkbBKKNE790Uw7f+89CmcL4MT8pd5EBsoP+0kDBbE6Mi67P4qA4zq1Uzu7wZdXvmV+z6vQXG
 +I9JzHz7ERBTU9gCM=
X-Received: by 2002:a05:6000:4284:b0:464:fff6:489a with SMTP id
 ffacd0b85a97d-46a7e9f3eacmr29214895f8f.6.1782485766056; 
 Fri, 26 Jun 2026 07:56:06 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46fccca2781sm1262651f8f.6.2026.06.26.07.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:05 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:05 +0200
Message-ID: <20260626145605.343812-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485766; x=1783090566; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dI8Ka6vOOV0V97bulXm+B7YkTpfDeJ9uO1cj632EWPY=;
 b=bCsQmcubN190SQQShBGraz3yR3IcAHkI/ldYYRjbKF2aNgz+Y6mVfQOMi0tF8Cz6JQ
 Bpo1ywhRv1aWAgtIR2wpwnDWX0IHGJBTbJ9fkPtmoVqtYU8rtMX+NcCfn+opDf43xLoU
 JyyvDqDJW663iL3Uh+ErBaEBTP2Q/PR5RYEpWsab+iMZDxPBW1+zoIPdG1aD2dJiKclv
 RJ8nbBhyt/ObYWLbp831wj2TIGeJwT5sPKZhEX4p5U3dZyFwb/XV0LE7Y33wfQmQWUGD
 J12/dyj70I+1OaIjnS+Is2YmfngxjZ7kABdjXPHTphGbyyFcU69DWf2NTzoiU5CquZDA
 rGtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bCsQmcub
Subject: Re: [Buildroot] [PATCH 01/29] support/testing: infra: add
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
> There are a number of runtime tests that checks that a command fails as
> expected, so add an assertRunNotOk() similar to the existing assertRunOk()
> to handle that instead of open coding it everywhere.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  support/testing/infra/basetest.py | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> index 5fa902a77f..9b3eef6fa8 100644
> --- a/support/testing/infra/basetest.py
> +++ b/support/testing/infra/basetest.py
> @@ -150,3 +150,14 @@ class BRTest(BRConfigTest):
>              0,
>              "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
>          )
> +
> +    # Run the given 'cmd' with a 'timeout' on the target and
> +    # assert that the command fails; on success, print the
> +    # faulty command and its output
> +    def assertRunNotOk(self, cmd, timeout=-1):
> +        out, exit_code = self.emulator.run(cmd, timeout)
> +        self.assertNotEqual(
> +            exit_code,
> +            0,
> +            "\nUnexpected success: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
> +        )
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
