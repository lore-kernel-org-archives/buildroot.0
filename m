Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1952C43602
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B59A141222;
	Fri, 26 Jun 2026 14:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcQLwxmwwI2t; Fri, 26 Jun 2026 14:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B881041215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485791;
	bh=ssDy9N5yzFGBoJe1yfiswT6jZdvPNiL4UV2YB4V3Ly0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eITuYg8hjNMVP5rZ5emjLgxkdsJ28aD/CTzoHCQ9hzWTTz20DHwfowJEe8Yzz6YFL
	 0zUJ1ide1xenhkyEbjEpIf2jSgiFyAIBHUKVONXZhD+HKjv7iOac6Qqc7Cuv7mU6e5
	 CZCmKJYe9+5uSuC3QLYhYx47Tj77FNfY/DBCmpQ4h1CGYRggUnIXismnojlh6COF9L
	 /wlql8DSJTlrrytBwOolX3On9xvhHoEAvjDHinSy5zsmtVVXX0S4P7now28cevx9iQ
	 1LxA+T2FvvkuClTgtHP7lolmtSGkBBD1F0UqJL5uy4A/BdkRMh5Of9nVn/+6aa3G01
	 didBXTq0mZ8WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B881041215;
	Fri, 26 Jun 2026 14:56:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E71363A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD724411E5
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8Wxd929hBLs for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3E2A411DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3E2A411DA
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3E2A411DA
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:16 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4626fdc829aso668744f8f.3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485775; x=1783090575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1kPFDGj8J8DM7Ocb7b9jZh4bQvGE/kll0DQpr6c2ufA=;
 b=GXnN4ktm0HEGgbThBfk3vZc2xCJBeeYayAuLU/7JHpL4wlL2yZGVjhPS7fuMF5MdK3
 VJvpZ6Ar/mGtbMpyXO1OYT7OWvUTDyhfZZTqNFVCXQEPqFSRpwJUTdiYJEdVU114jP4b
 9+xx5AwCgYIbrfS17HodyjQlGyvsmjMY5b99Ew2QNiKEs3233p/MpW62rv8ivJNmJYX9
 u25tKXltRgOaDhWQQKAvz7QPlqmPQ/qqjtnPKKr3y6aImyKiNjQpTjsdZFnR9HZmKvot
 N2bsQrHV5zuuk5T113cAKpwq/xjHyecKsrLq0Uyu3bIU5oVF73BrdeQgIarb9CK2aH0M
 mysg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoL7+d7LzDjlsr3PiK7fe7V8xZIFypQBjrK1c5NqrL6YuxXo9JOd8tIyEQTEs3ikiL/4DT+m5d2wKU=@buildroot.org
X-Gm-Message-State: AOJu0YzQdPRm5NMwYkfkxPTnhhtZSlccXpHHI5lthYmzsXuzPa6oQG8O
 IKkhGyYns2K0K6lcO4kXh86atE1WoPalyyKuZemuLQGZPMshvu52kbUEhgcR7LpFgk8=
X-Gm-Gg: AfdE7ckI3/57BL7i1OODuq6rj8NZ/fpWQeilQMz675EDRwFPtwhif2wQ78jGwpdJWcv
 JaKaXgkYbCQP+//h6RRY/IaRiiBMbdvzIJB6s+eliMmj1z4YWaK8DM0vWj2urwUQJErRKnenOuO
 EqCc1zXLO8LnkCUwyJ0RjlWlWA2vaE86OYBCKxKJ+9fbByXuRKPMgeTaBTz1/VRx/1dP0B1rOsU
 Mofke435PvlYriNYzB6XeKGgRcFdUnFoVk3GVQiGZCknf0GRlZiyQQEdUCB44MEUyZOdBsdS00R
 P0+miCSbjkmsBdezX7qAYaN+oYKXuC0Tn2a/8hzJWJ7/hBRkhRmmP2rqT67y5rH+HOkHb0pfVzD
 7xZLLmIt84P6HfXloP2s8vRRG3EIH262rmCo3Zw/LmTPWpK9JmOwmSfcHc1KPkJqjmxsRbdaLO+
 VCWCT5o7KdZoWglNQ=
X-Received: by 2002:a05:6000:29d2:b0:46d:d5da:f0aa with SMTP id
 ffacd0b85a97d-46dd5daf1ffmr8742990f8f.45.1782485774719; 
 Fri, 26 Jun 2026 07:56:14 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46dd5f9da4fsm16870344f8f.23.2026.06.26.07.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:14 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:14 +0200
Message-ID: <20260626145614.344368-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-12-peter@korsgaard.com>
References: <20260618124835.2935850-12-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485775; x=1783090575; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1kPFDGj8J8DM7Ocb7b9jZh4bQvGE/kll0DQpr6c2ufA=;
 b=I8BZoavbdWxHeET7Q27drI4YUNkDgyx7kZJaDkZpOLQtRUQ8netF6Ob+BCGBuC/TMk
 xhfIUS9yCcxEmmebxqG/h9vhRN1HDJA92q8186RV3esd1/T57ylWj6fYRD5HNjWXIsui
 flGxsatc38JEBdBSAXwiFlecbh0K04tETrsHgybiPCD/SMlDULVl43vwP7L4Q16bV9ax
 MZBw8k2VYZEMfDOL8UlneMbrT97tjcoA5/T6vsNAolz4fGcW/mVn9Tx01YLj45JX/edQ
 44HgWiYOeDTaNB0TCnkfegOn5imgQxll6BJfBzsqWp4Oh/d1z/obVbJK7AdnpCLNbK6/
 EIdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I8BZoavb
Subject: Re: [Buildroot] [PATCH 12/29] support/testing: test_iproute2.py:
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
>  support/testing/tests/package/test_iproute2.py | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_iproute2.py b/support/testing/tests/package/test_iproute2.py
> index 91d9006e23..78f8dc291e 100644
> --- a/support/testing/tests/package/test_iproute2.py
> +++ b/support/testing/tests/package/test_iproute2.py
> @@ -46,8 +46,7 @@ class TestIpRoute2(infra.basetest.BRTest):
>          for addr in addrs:
>              self.assertRunOk(f"{ping_cmd} {addr}")
>          # ...but the IP outside is supposed to fail.
> -        _, ret = self.emulator.run(f"{ping_cmd} 127.1.2.3")
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk(f"{ping_cmd} 127.1.2.3")
>  
>          # We add a prohibited route.
>          self.assertRunOk("ip route add prohibit 127.0.1.0/24")
> @@ -57,8 +56,7 @@ class TestIpRoute2(infra.basetest.BRTest):
>          # ...while the other IPs expected to fail.
>          addrs = ["127.0.1.2", "127.1.2.3"]
>          for addr in addrs:
> -            _, ret = self.emulator.run(f"{ping_cmd} {addr}")
> -            self.assertNotEqual(ret, 0)
> +            self.assertRunNotOk(f"{ping_cmd} {addr}")
>  
>          # We should be able to see our prohibited route.
>          out, ret = self.emulator.run("ip route list")
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
