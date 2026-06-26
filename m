Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A662AC43638
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D6A841240;
	Fri, 26 Jun 2026 14:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QfTPcr3kEJX; Fri, 26 Jun 2026 14:56:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E889E41214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485800;
	bh=Rlz4Z/t7TH+KhSe+KxXNzPqP7kbuOTf2h24XZzYwgbw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ED1oqchFN0JrNDfVu2QCHz1xUfdxXqkRoVl/cvLMk1apk2uZvKS8wcgkcEwwa7s6N
	 jJA/tNdgp0lasfGcleMorso+bOS7H7i6pmY21DIfKfqeF8EACLyxyXk+VYI8KTe+lH
	 OpEzaJ8l0AfoYRXsLymWjao3vCXe/n8uagJNrkMcnMAde0wtxhcXGNBo/3Rx2ontaD
	 TyBpmYoMn4HhqJ/2KxSEr5XsG3TjRZ8lJmtMEgxTtk779+CSvUapuvDmGkupP2zfMD
	 TXSE+dFQnGrUik3zvaYWZWW7vWwAe95HjbZgAYIVSFzCV7tuAoXy6OPaTI27YsD3WQ
	 WF0grB+A6ly7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E889E41214;
	Fri, 26 Jun 2026 14:56:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15C283A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1398F4071A
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNpSSgYLdaE4 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3E9940702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3E9940702
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3E9940702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:22 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4631679f204so1223414f8f.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485781; x=1783090581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Sv30KWcBzHeJ/AcUNYMueYh6g+8EYhnvRzl4LXDuiOs=;
 b=tN0PFb2T3DyQ8Gd4nYpZL1zS/IF25N+NrxcnlDo5514PYiCDwK5spR5jizZggZTBua
 sMSwp30Qn1g3A7bhFC5Q/05fTJnHOb/DNVyxaM8NBTYvknq5MofY8OSRxOegf0GTumBy
 rdqB2dqL69FWWKGiSppi5sMHsCVMLa1mvI5oNvh9CRRKgB7TgxJZdYLBhPbYHj1SZqDS
 d1TOsO42LdPYLG7kcIj+5bWluw0jdSmqGmpX4J2jp4VffSu7rY1sFv3Pj6qJ0u8Q1W10
 K0HhipkcRLjLtnZWXoqY0Nl0l0E/gG63onwt00Zn5Afqvvv+on4dppgPS6y9VpmG0QDX
 nhWQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpySfy7Ec62emWYOSXYy9rJ7UyeTs0qZZOboWJV4Yp4mCGm3bpt7Skke+KuIkrCn71RYQXNRBnj2EA=@buildroot.org
X-Gm-Message-State: AOJu0YzkHE1UH4hIlI6cTVHPVyLxea/meCygmi+64Ru4FExQM5BGS6BO
 LWkn93dyuArnA0doOEsELGIxzgvGqOtqXtxliU0YV9sDjYfF/2ZpjqnCrGQsIFVp4dA=
X-Gm-Gg: AfdE7cnvFmBBWVpylnj/kpro27V3AcGaqtG8rp/dUQB8lUMom0/TxkahKloPfBeyEBJ
 3o1ql5lLJKpnmUDek0ImdsKiscq3KOZb4YK/yvqL8NMYpnxVf58icaHzVkroOlmG0cEmqzgw782
 UKdeb99Hj5RTsBly0DhR0zH6F1q/hgW9BQ9rOd1nIXWoJNb1zgoCjdlFfx2/JEHnEej2rOsM1De
 5+XOMizDsbHgJuNPKugwlzKRzJrjU5U7H65gTHtbSHQJJr96SxjCrgUWIeOREK1wvgTGxz8hZtz
 BqYDQTuTbhAc7RdA1c/BILsj7xvP4I+y744cTwmo6Awg9Swc1zcjn07UjrUl2jyE4QfYoMsyWkn
 FIzdXGl34f946WBUVv8G2/d6YTvQ9QprymVH8t1VLFHr4N+gpNUewhkoiZGNeSiYTbJXbnSFHc+
 M+kqgj
X-Received: by 2002:a05:6000:2386:b0:45e:9304:a4c3 with SMTP id
 ffacd0b85a97d-46da98e08f5mr12900721f8f.19.1782485781057; 
 Fri, 26 Jun 2026 07:56:21 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46e95f3d71fsm9174613f8f.12.2026.06.26.07.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:20 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:20 +0200
Message-ID: <20260626145620.344771-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-22-peter@korsgaard.com>
References: <20260618124835.2935850-22-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485781; x=1783090581; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sv30KWcBzHeJ/AcUNYMueYh6g+8EYhnvRzl4LXDuiOs=;
 b=Y7RLllxiIGq9rej4uEFIyCRcgcskihYo16XXCJwRF5ud2tJpsz4GrVxCf8WmU5JMGl
 DsR1uDmM1c5QWzNTEKrXOSiGHUnBVrN6bkbpwWLDMaiip2jGTlXrxVeWPRZu7LV7wjya
 VdZE/kSVK4+o63zcK7El1I0yiNH6SGeAz4yxIZyeu7IGg8wXXLq3kAR4j9seE+NNf84t
 nTfrgPWiJGpNgq+rTSlFJsbOe/ZIYQpAqhykYnJU3yJ0dzwa+cqf0UTLVIwmK3oQQIf3
 n0O4C6RmpBXHxNI5RJUC0kP/p0gO1f33pUqCrvdGVuVFHVNXlu58/Wahysmd0v0/DTEC
 Nflg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y7RLllxi
Subject: Re: [Buildroot] [PATCH 22/29] support/testing: test_polkit.py: use
 assertRun{, Not}Ok()
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
> Use the helpers to simplify the test.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  support/testing/tests/package/test_polkit.py | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
> index 3414fd5159..8ff02d91df 100644
> --- a/support/testing/tests/package/test_polkit.py
> +++ b/support/testing/tests/package/test_polkit.py
> @@ -43,20 +43,16 @@ class TestPolkitSystemd(TestPolkitInfra):
>          rule_file = "systemd-timesyncd-restart.rules"
>          for rule_path in TestPolkitInfra.rule_paths:
>              cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
> -            _, exit_code = self.emulator.run(cmd, 10)
> -            self.assertNotEqual(exit_code, 0)
> +            self.assertRunNotOk(cmd, 10)
>  
>              cmd = "cp /root/{file} {path}".format(file=rule_file, path=rule_path)
> -            _, exit_code = self.emulator.run(cmd, 10)
> -            self.assertEqual(exit_code, 0)
> +            self.assertRunOk(cmd, 10)
>  
>              cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
> -            _, exit_code = self.emulator.run(cmd, 10)
> -            self.assertEqual(exit_code, 0)
> +            self.assertRunOk(cmd, 10)
>  
>              cmd = "rm {path}/{file}".format(file=rule_file, path=rule_path)
> -            _, exit_code = self.emulator.run(cmd, 10)
> -            self.assertEqual(exit_code, 0)
> +            self.assertRunOk(cmd, 10)
>  
>  
>  class TestPolkitInitd(TestPolkitInfra):
> @@ -73,8 +69,7 @@ class TestPolkitInitd(TestPolkitInfra):
>              self.assertEqual(output[0], "Error executing command as another user: Not authorized")
>  
>              cmd = "cp /root/{file} {path}/{file}".format(file=rule_file, path=rule_path)
> -            _, exit_code = self.emulator.run(cmd, 10)
> -            self.assertEqual(exit_code, 0)
> +            self.assertRunOk(cmd, 10)
>  
>              cmd = "su brtest -c 'pkexec hello-polkit'"
>              output, exit_code = self.emulator.run(cmd, 10)
> @@ -82,5 +77,4 @@ class TestPolkitInitd(TestPolkitInfra):
>              self.assertEqual(output[0], "Hello polkit!")
>  
>              cmd = "rm {path}/{file}".format(file=rule_file, path=rule_path)
> -            _, exit_code = self.emulator.run(cmd, 10)
> -            self.assertEqual(exit_code, 0)
> +            self.assertRunOk(cmd, 10)
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
