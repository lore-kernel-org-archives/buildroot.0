Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585B7C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CB12610AA;
	Fri, 26 Jun 2026 14:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58MzJUZ7laJr; Fri, 26 Jun 2026 14:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A790F610CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485790;
	bh=SO84OKz5Xm1OaT9iHIf/wvMXBc+T2yv8FoWQcu4AkGQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dmCpsnJo9MpZrg2yfBkPnlvf4ZgkY9D75nr8Ytdvxq9n4SVic5f6O/GIGrAiQ2FY7
	 J7uQGjcvK2T5K045+j1P5Ly17zpVMuuC4gq08fMhyOAnO41WmYl04lhLh7Hb6SqAJ2
	 EE2VoSaqkt00cecKPfpsB1D2F4PV7MH8nEwgtTKFy24KM5F/Q7DhUAQ9ZuZ4TdNLMq
	 poZzjHUx/N3zazuctf//W6pG46DgFsdG/dhqim3d5nF1iHCSr/5l3+MZ6Sf8RHO9N+
	 Sx1okwk71N1RtH7YSLJIA7CywQ/Mafq0jHjVtlab8nGR+hGjGgSb5KBVBu62H70hp9
	 bbMMBMS6Sa5kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A790F610CC;
	Fri, 26 Jun 2026 14:56:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B56FC3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A754D82438
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVGW9-lBhHCW for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBC618242D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBC618242D
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBC618242D
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:15 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-46cbe01d4b6so589441f8f.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485774; x=1783090574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u+sr3pviItOjjqVyIpeZyycSyFXPveU8JKrfzYFg+8o=;
 b=Ag3hOgEz4tleu1z1a1GSAspCIaHaeJ7Qiexjrp8Azgry1DfpvpQvU8MvghhtTK0MBm
 8j+Ky8AuOHlxq5yTMFn5vzgjYFP80eqDUmOYj0IdNgu4ciWZJAQaqD761ia8ZlbnD3x8
 f336Gd6Vk0Wj5G9+xyV409Bhc47dbDdw1e8JDgFQFsi1L2hIA99QxmXnsuto0U2Ftwq9
 104nkQeWxgHAXFyOWvcAMTIoq+GeWS+QAky70DE5607UukYpJs7N1TCizQAxesF4rfDO
 m+I2HoWyr9LCEkr1hXJTzo0JY4BcRcP4CTs4YHoqIM2qI308q29Ar35LLMNYanj/Uh6s
 1eYg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq8ep1H1acvmb2HF1SzFUGcUdq0nALdgWh3HNKx8bDpyFnSoDxjKj5z+zk8o66yZFy8Brzt1lLraJo=@buildroot.org
X-Gm-Message-State: AOJu0YzKJuJYFt71NV+hBnCnNPSn+fmJSteE0MnzfH9gv8b/viN9aAAg
 aRZpm37ZKG6nyDPidm9idf63NQABrKyvz9Pxv+Z+NPyhp2ic67z2ly2hfMgqwlb3pKQ=
X-Gm-Gg: AfdE7cl/lOWvXHYpXnQd+IeXmx/D0t7AJS4+LzI6MAuI4L2XGjLswq6A/wuwy4WVTn9
 SqsPAuLD6c/x5Yiy2EbgpaYlmmLy6lLFFlzQHd1jgve0KOgIXunFvBNNBiXtAWLAUMGks62qky3
 PC/hN/aIYOtZ4FYXu2olOoLIzHRQ3oy5nQ6QDW1yHTRDvGr5w/6Ap/VaLRSX1Z22RrIbRvdP12b
 pvu+U57+C461QxMOoE0jBPq34VdtAAoMSskSJDC3CtjCBPWFU+eMIbS3401MV8hCZgMt4QvE1uy
 vl7GZ4qwmhYrsRd9hCd82MSId/tiXa+wxlAqc4Wf/0seP2vNIESxiTeQSEnjuf/o/YgxCDMzsUR
 qeuCCWMZMVW94m+IQaM5qnIj30R1LQa2VpiGS9NcrOHqHlp+NiEq+lPXE0ZnfdcLUbGHoeUFD3d
 akTexW
X-Received: by 2002:a05:6000:4a16:b0:46e:3f0:9009 with SMTP id
 ffacd0b85a97d-46e03f09094mr10488151f8f.2.1782485773843; 
 Fri, 26 Jun 2026 07:56:13 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46f978dc0a9sm2731720f8f.15.2026.06.26.07.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:13 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:13 +0200
Message-ID: <20260626145613.344314-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-11-peter@korsgaard.com>
References: <20260618124835.2935850-11-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485774; x=1783090574; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+sr3pviItOjjqVyIpeZyycSyFXPveU8JKrfzYFg+8o=;
 b=G99U1wMERHuYtpEZxYdoiS7Xf3MQKpLOp2zaUDyzCv87Cfuw2sH4MtcPfx4WFzSEue
 npqFZARMd1qjs9tW/AY7yP+F3IiYBggN63YqatKQCCHCm/Td87KGUiL9Pt8/nRpFdDuD
 COsQ/xxTHyTynJndVK3FX1HYtLXAt4Hkuw56+Bqe24Q3sVUP6lbpXPUZWebCAZfUeJLf
 TpW5xa9yCXKzimuaYqDAfO6jCRIt9SQdNeh8WeyWh3HQTmW1Q1Z+RhFwOH4C1VzGuU9m
 pcNHdePCTsHwowWcRpbPR76jtVJPtQWY1CPku201g4Q/NSkn42FIizqnieOzuZlkZ6FL
 rSZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G99U1wME
Subject: Re: [Buildroot] [PATCH 11/29] support/testing: test_gnupg2.py: use
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
>  support/testing/tests/package/test_gnupg2.py | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_gnupg2.py b/support/testing/tests/package/test_gnupg2.py
> index 2b18f54fa3..6f862c31ce 100644
> --- a/support/testing/tests/package/test_gnupg2.py
> +++ b/support/testing/tests/package/test_gnupg2.py
> @@ -49,8 +49,7 @@ class TestGnupg2(infra.basetest.BRTest):
>          # Test a failed decrypt with a bad password
>          cmd = "gpg --batch --decrypt"
>          cmd += " --passphrase 'A-Bad-Password' {}".format(gpg_file)
> -        _, exit_code = self.emulator.run(cmd)
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(cmd)
>  
>          # Test the generation of an asymmetric key
>          cmd = "gpg --batch --passphrase ''"
> @@ -106,9 +105,7 @@ class TestGnupg2(infra.basetest.BRTest):
>          self.assertRunOk(cmd)
>  
>          cmd = "gpg --verify {}".format(sig_file)
> -        _, exit_code = self.emulator.run(cmd)
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(cmd)
>  
>          cmd = "gpg --armor --verify {}".format(asc_file)
> -        _, exit_code = self.emulator.run(cmd)
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOK(cmd)
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
