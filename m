Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D58C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E31841241;
	Fri, 26 Jun 2026 14:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QffkQ3aS539s; Fri, 26 Jun 2026 14:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9119241247
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485806;
	bh=Ziau157aL6b/NcqtgfWAplRflZKNzFvTKL+lN+JKm0k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JLKxzit3LR1ujSOT92n2ajcUWPxQT8tsEFt+lMFTG+MbVEqedPwrJ3H+xAu8PGfBZ
	 7Hnb2snSeWSzILKvGeX/o5S+cAfHldCUuzEcod9IbHAlequtuvHLYGck1tk7unAuYx
	 s2ydrAW/vWB4jWYJ186RXA/eyaSC5WOswbqYW5bS2Z6lvHBaWJi/KyV5/iCrcbmlr3
	 kKV3rFqikpGIT3MsshnyKDTO+E1Wb/POlZ4LQG9mPyK+RAGsZmvpNLbwpm+gXwxuzQ
	 c8UGzFWwHHBAvhFczcDtnPRJXFdU7mnOJxfLBlShQE02P/gbHKshyqV82QkN+6/6i4
	 zyGGHqvnTc03Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9119241247;
	Fri, 26 Jun 2026 14:56:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C3DD231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F06BE41209
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-j857qv67Ml for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 75A3E4094C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75A3E4094C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75A3E4094C
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49258ac7294so7322235e9.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485787; x=1783090587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Crl0vWIpsT17Y2vS2lKG2wNLqWSE3NyeKUE2QNe9spE=;
 b=PsrvylZwjCOC93KVVsisf0mh9DwTLvPSTnkORUClctTKKX2wrDkc+l4Y+GlFV2PO1z
 x614xM5JIRSSqgQiOYPHo4TNoICy2wWtkfB8M9TXN9LX2hY1Wk2Daal6U198TzbxR8ez
 p1k3XuDUKLjnKd+GB4qLpklbgtEHNgQ/J38sJj+LGbv+T+9kS564VqO4EmkvepFyF2im
 COKSICC1MLmq2MnWkREp+Zs0et7xQNqTXXS0H/Zgql3YgWHyp5O3HtzkXN4DMdM38e3e
 TcXaVroDa+FOKLLp08JTCNXuWxhLFPCdc9KqbrU+XXLqurD+69GdG5AGJX6Y2UjmS3EB
 AJcw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+lqpN49RGo+AQYdvTXXxHUjcH/cMf8T4o9Y5Sx8lM07COzQEG0NuszlGmChguyLZ6IGw/48aK3SdI=@buildroot.org
X-Gm-Message-State: AOJu0Yz5v1BKroVsoZgEEiJtl7rZ4Xk/am0OngMb20EwblajFXolJOle
 WndqjpjliM4vkidnvonWf37QFZrHuM5Tlz0WHrTdCfG4ps8ygQKk8Cu3k34e6Ofk8dDgpBVfLX8
 bi37W
X-Gm-Gg: AfdE7cnyPtwAViBEqsC4OFdBvcHfw5qK2R8/Fh/rifWgmPK9ZncgvSo/O+odaWh2eB7
 fKmTi56LWyfT0kSy6vSueN8WxQmTvxwCS1R+7vJLJdtmnyK7/uCOp4XNc73kjhrLa+wo5UcHY6w
 nYRBMoMBwqIyjY74sL9sqchvPzuXdEnWqNVD1LfyaScOV77ExNuLJ3uWHcFL1uQuWYZubadc52R
 xHDK2biPhXja+2H1ys4YH8ff0g7tDQgGOlt0cD6+528X55UEYVAUNmAreN6g2Zhdj0Hkctrh7Ms
 9EdzpFVxIuDfkrhaIWJ18ntR8iwRb/r5qQYHc1jM+LTNF/61IlQdvo3DUkC4Ujfx/e1eociZqGa
 aTgFR3t4PIsEZf96cfEPATnIVQx4RUOBjWwITCVyet5wopHTlYUulzfhwgX2+SUDBqO+RwD50vj
 QEc2hJ
X-Received: by 2002:a05:600c:1f91:b0:490:abef:dae6 with SMTP id
 5b1f17b1804b1-492668857d3mr99766505e9.19.1782485787377; 
 Fri, 26 Jun 2026 07:56:27 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268fce5a8sm82596405e9.3.2026.06.26.07.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:27 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:26 +0200
Message-ID: <20260626145626.345172-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-29-peter@korsgaard.com>
References: <20260618124835.2935850-29-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485787; x=1783090587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Crl0vWIpsT17Y2vS2lKG2wNLqWSE3NyeKUE2QNe9spE=;
 b=b9W8VLPFNZHAnFwyD4V12MTURibdI10Tr2qROxrGXWjSIIJNK06gr2trd5/RBmWzIG
 T7XjbsiaeKnTv/xI4XhIi/SjzcrgWsP/jOvDaNKjFM8BT7vyzecMYjUQ7Zo7ttw7rgcy
 bk1Lb0tm+GGq9l6HtZSTeRNZ/BIuyOiraDd8anYDp5/nA8mUk4xo45obIjJfTuUP7rQe
 pnhdjHkcGbqdKsQVar7val4R2mPcCMZseRcnGBWV6QJ5Ki83ZfJbS56BAH4S8mCz3ntu
 xTniln43l+fvjRmzTmjBNhTXB3eelfDeWG6I7QvHWuaSI4zhpyz37/8rrJAUjnAWEZlJ
 gmgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b9W8VLPF
Subject: Re: [Buildroot] [PATCH 29/29] support/testing: test_which.py: use
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
>  support/testing/tests/package/test_which.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_which.py b/support/testing/tests/package/test_which.py
> index 38f528aa7f..05ed56ccb4 100644
> --- a/support/testing/tests/package/test_which.py
> +++ b/support/testing/tests/package/test_which.py
> @@ -33,8 +33,7 @@ class TestWhich(infra.basetest.BRTest):
>  
>          # We check "which" returns an error when the program is not
>          # found.
> -        _, ret = self.emulator.run(f"which {alias_name}")
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk(f"which {alias_name}")
>  
>          # We define a shell alias.
>          alias_cmd = "/bin/true"
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
