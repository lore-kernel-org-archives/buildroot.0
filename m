Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64542C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A80980A49;
	Fri, 26 Jun 2026 14:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DTCy1ywxqJRs; Fri, 26 Jun 2026 14:56:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B0E380A54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485794;
	bh=vQOmfEzuS83dffIFr3zEfO+Q7Sh7RySSqwlCEQDxTlI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mi1bHa2jbCfc4tf3xI1fq8w5zZcl3ABs1+d4uATFEvT4WqvMLAGxakFYjvUydrhQG
	 gumrgPn0/X+lD4myJno0HMp924+zh+XfVKojao2r45ni8EueRESvVu6kjEuw7peD6I
	 uEGTIAc/bLlICml3QbE/fHLkWiXEkMvvUjKfV/O/jZvzXla9fZaMbunOqorM53YvqO
	 kamsJSRj3ej/yM5w4vkgO9HiPCFQLtnD0zFIQya9dzlfnFT4Pfy+edcOZRk3yrZspe
	 O4LFFcJVicndO34UCx9kjcRbsTsrb8r2swMKz+J0rM7z74O/8HsnSi2TKF5q50hYgc
	 LYWKxXbdaMACw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B0E380A54;
	Fri, 26 Jun 2026 14:56:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B6B83A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D9C240702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbs1fv3jlGnB for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80C694070B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80C694070B
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80C694070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:18 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-49270caa5c0so232095e9.3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485776; x=1783090576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VY2Oh2bpiPJK+xYkYLXpv+QiHRk/A+kvskljpNmIkDY=;
 b=FSLc3wMk8OYdcxeWddVR3vtgT7TgvvXPny4soE/fnPfTQoUE/vxGFkbKcZ/Yeg6Tp3
 qsrI3GFMPdNcU4ISF7n9B9vDfQszgDbBrc//oTH7PV7TVeHfF1pIPrVWJxx6U+VfnWnr
 PslIc5BtTq1P0z1j+SPgXyOOHAfTw2huZpzy6FjxR8ctz7UbWm/yj6H8gc7/F7RJOhyE
 dD1w1yD9pvpa2obUufzDxVEnL/4KdIzHxNCMz+OyfJtjoN6YY9wqSTpdMTvkh89MvVkk
 o25CTUcqKTQj0T4RLWvSCKKqX+Az2EghWgpRU1TaVFG8kNzm40KvZv111w6X7mQxQgvo
 WYsQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/fr78hCba4aIfZT/xUNjStASJzzc6Xal8RE0ilsU3eF2jAHiLOTqrtIOHmSxo6vyIKj19Qr72nUgM=@buildroot.org
X-Gm-Message-State: AOJu0YwAfr1hHi98jd0tRxR3C990uLKh6j7a/NC6EarfMtMhHARk0BE9
 lGMnSf8Edq6vG9T23l7ov+ULsqlWJeppzJUrf/1HqxIRywtg0COZWYvevvjnDMKQ8lJnvW0avei
 JBsPX
X-Gm-Gg: AfdE7ckH+JuGH79QVPDMfS4xBY2dwZ7qKwtNuUJcydF3Ali5kBMkjKgCvd8NdhE1ZdP
 nbAQE8Lebue/mKnnfTVPUnwAEzknS0TPk8IjItqjTg6QPDQs5+sBOVFURQqQGdvQnMJJQwQPs7V
 lNSKirc3qRXKyPBQfe9Ch/eeuPKGT/0umP99P69AWfFQPIMvsjLMpWa7XEMRs/4T68MYX7Y81pt
 VGl21/1PswtFgbhlywJCYadWjHGJxfRo8RTtN5bl7XoX4xHfkIurn6ayQCn3WY37sLUsv/T1qCW
 4/itIbtWXWAbFvg9NRy/+bn2+y4nt8z1ik64cyEKgawbM8dSBOchDpKpA4KjD7ywsRiA4exMQOY
 yI5WfMMt2WDuk/ddck40XeQKnr4H3itVXh+7JqfU7xsiQI8D2Ov2JAF2Gh5rJVb48bMXZC6Rs5H
 wdeLQT
X-Received: by 2002:a05:600c:a49:b0:492:5bb6:6d4b with SMTP id
 5b1f17b1804b1-4926689abd5mr100613795e9.34.1782485776432; 
 Fri, 26 Jun 2026 07:56:16 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4926c01de4fsm70030095e9.0.2026.06.26.07.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:16 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:15 +0200
Message-ID: <20260626145615.344476-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-15-peter@korsgaard.com>
References: <20260618124835.2935850-15-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485776; x=1783090576; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VY2Oh2bpiPJK+xYkYLXpv+QiHRk/A+kvskljpNmIkDY=;
 b=aIGdToPQB9+1lO+ulW9OmJDdy+w2v6OmwzHbX3tblrH1lGm9iJHdeNrhC2bJqhzs9Q
 zwGW2n0NqFzKQfA1g12XOoUc8Zz4mMg1VgO59D/FfmBokOCue0nq7Fk424VKAeEcHNYc
 xYH/10sUC0KYXGxELB7EXXg/Ym9BP883gTeIC8GdHdbBVzgiZMPUfsKAcmC6JngRPLaQ
 RYdp6GN+KQEcNi7i7r3/9+fjeyyVW+YDAJG9ew5pNez62uTQcNDpYRkNGE9NOvPERwwd
 3D8u/clvzD4O65vP1UJdL15j2HdQSZJUJNby4PJbNwiWBiBpqV2btUGoaRQjA2H2HAs4
 dYCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aIGdToPQ
Subject: Re: [Buildroot] [PATCH 15/29] support/testing: test_kmod.py: use
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
>  support/testing/tests/package/test_kmod.py | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_kmod.py b/support/testing/tests/package/test_kmod.py
> index 3c06589b2b..a88257ef57 100644
> --- a/support/testing/tests/package/test_kmod.py
> +++ b/support/testing/tests/package/test_kmod.py
> @@ -73,8 +73,7 @@ class TestKmod(infra.basetest.BRTest):
>          # With this test configuration, we are not supposed to have an
>          # eth0 Ethernet interface yet. Attempting to show info on this
>          # interface is expected to fail .
> -        _, ret = self.emulator.run("ip link show dev eth0")
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk("ip link show dev eth0")
>  
>          # We try to load the module.
>          self.assertRunOk("modprobe virtio-net")
> @@ -101,5 +100,4 @@ class TestKmod(infra.basetest.BRTest):
>  
>          # Now the driver is unloaded, we should no longer be able to
>          # ping the emulator.
> -        _, ret = self.emulator.run(ping_cmd)
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk(ping_cmd)
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
