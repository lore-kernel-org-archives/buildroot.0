Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8D8C43602
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F023141235;
	Fri, 26 Jun 2026 14:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4W9G790VdG3Z; Fri, 26 Jun 2026 14:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1BD241228
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485796;
	bh=JlAlG6FzMXX9Z8tAibXXgUGmIiBTcnOg7f5wKxpdXk4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VGqn4SyYYwusaQ6KokelgcgOS3mkohZLKRb1Hlt7pEqz41MKCVgYMC9eEFuIAC20q
	 zYWD06PVmxacMjt/b4jYSscVoe5F9cgtKaRbNt1k/MBRm6leRP0jZPLSpPJ5ZkLKom
	 XFteT+/nj5MW5yCib8UXDflHQOQ+Cqm2N5keXXQ6n7jFmZtaJLkD+teHQIgW7GjpFC
	 9oi7O2AG5zP7eI/Qj4GMbce15982a30xE6cklEAlzUSrIT24XeC9wGxqEgOhuC8n6A
	 bamRIVjP1gK0xnMq7ZpHu/6L6VmqvS4+inhgVdKmnpbjHn/zwBy3JvQOMah61aTEwW
	 pWjLkkZKFTWnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1BD241228;
	Fri, 26 Jun 2026 14:56:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAED7231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EFB0411F9
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9kY16slAEF1 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91942411E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91942411E2
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91942411E2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490b7866869so9140185e9.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485778; x=1783090578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/XfWHKeEzCACik0ndc9Ef3ZXfMJ1nHzG+BnOMmSZ7AA=;
 b=go/7L7PRgfMP6BNAzvsT79YcDfJ6spk/iQ9tT2myJPeMwrkT1klgyjRUDWDriaOgnP
 GVccehdyQy2AtS7Y+VFaO2/aL32h2bIe9PPWIttwHNTXeiKEx1cw+kngiWlrANx8d4/D
 CgvHmWRCAGzKmqfEsQ6gJL6y4U1DtHldEv47UOe2iZsIBG4bJW9dczIQUPS++rxn1FAS
 YK+cY/Nd1a9mHG2BJ4Q5qP6SjXdAIL51QW9qBAD7y8rrm/2ZWAFsY02i8XLlTIvC9gA1
 gUjlj/dy08udY4JmPhlB3KKp2Jo37sSsbCf5LraAWeGyxpt5FyK5mheMnMebZNnqo2br
 iNRQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/fiUTMJ8YOKkfxKdDjEEPZdQcIjFkCgctJvwFPwRQXG6niuGoKLcrDBRGF5/V8goYYwlWvVmrNIvI=@buildroot.org
X-Gm-Message-State: AOJu0YwsHbBxHLWeylia2qs0fG3zi/p85iS1k7fcZVYJ7geU/RjOuwOX
 Q8kziVoGj8LxUky+qGTrUUb1nfezDN26C5sPC4V1IVjGv8S57cbbHwjzEVBBulzQ3CM=
X-Gm-Gg: AfdE7cmcpjCnwSIMTzF628svCHOTbiA7/QR3+bHcGdmikGeTqUVuDGmFDE5o016PP97
 naNTtyDXJDcDsrIgiX5QXYrHIoyEcl0jjykZeCyoKNGtfUFNshDo96btIsg6YKwY2mr7LlM7Ybw
 sOirplbBpFFaRrFYYLJ+h98TgCYh7/Vmy/pR96MqxL8uVdeJZSAOvH3gj+AMYhyy6mvpPqR4sZe
 26ZyXc9sOZXFlybkKJfmJ5kczL5wB10Swxn4iLpD93N3QMO0VYMGOOTFBkC12VG/GI3f7xC7g+e
 aO6Ur7CpqZm/KxlqkKiFvRA7XAIs9W2pa18jpAs9HYtMB7Oq9zIoNCV3nHZbv/uQPJKJrag1Awg
 cUwVyd/FULArgRalIJOW7MZY+ssygpaGg9XdV3ARS+4CuDeQ0Ps2VgOxFtPvxFTLdfe2MYseAgH
 dRerKZ
X-Received: by 2002:a05:600c:c0c3:10b0:492:69f9:1314 with SMTP id
 5b1f17b1804b1-4926a713d2amr42032765e9.23.1782485778336; 
 Fri, 26 Jun 2026 07:56:18 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49269002511sm83000195e9.8.2026.06.26.07.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:17 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:17 +0200
Message-ID: <20260626145617.344586-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-17-peter@korsgaard.com>
References: <20260618124835.2935850-17-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485778; x=1783090578; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/XfWHKeEzCACik0ndc9Ef3ZXfMJ1nHzG+BnOMmSZ7AA=;
 b=Kz8Xa5vpUDb+TBc4R5UyYUxn/6NHyNz01ZV0EBZTFpuEEbnWNJpisRcmaE0Ya0qiNG
 aK6tV7FHQ5CNi+wT9dKJTcfo5iheSMwmYBAG4vUwBpSgSbrMMh6IpKr0iy/IYs91tqcU
 +wXS3TTEpBNu4if8EX6CxvhMtXDxYAfTwQvZvHtZFjZ6Of/2F+J5UdYs5ElyqitHxnhP
 E19QHDTxbHTksT3q9sTgQJHzy21CvJsp8wrQkPPPQL30x3Q3H32oWCnk+vNybw48Sm70
 8pVvEYpBUC35Wal5pLxPip0xz2SQ/pI6FrFBC/iJyW+YA5Q6ovo8C5iv1ZT2QUymzYod
 vrEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Kz8Xa5vp
Subject: Re: [Buildroot] [PATCH 17/29] support/testing: test_lsof.py: use
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
>  support/testing/tests/package/test_lsof.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_lsof.py b/support/testing/tests/package/test_lsof.py
> index b0478dfbb7..336a951549 100644
> --- a/support/testing/tests/package/test_lsof.py
> +++ b/support/testing/tests/package/test_lsof.py
> @@ -28,8 +28,7 @@ class TestLsof(infra.basetest.BRTest):
>          self.assertRunOk("lsof")
>  
>          # Check lsof fails if requested file is not opened
> -        _, exit_code = self.emulator.run("lsof {}".format(test_file))
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk("lsof {}".format(test_file))
>  
>          # Open the test file from the shell on descriptor 10
>          self.assertRunOk("exec 10> {}".format(test_file))
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
