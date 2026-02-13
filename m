Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68650EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 386D48469F;
	Fri, 13 Feb 2026 19:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66N7fNjKhBlO; Fri, 13 Feb 2026 19:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A46A846EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011446;
	bh=X44UYQxn/IhYQCNpoCvhwfFx54S4Gbbo1OHRMu6Nly0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a/vdzhXrVa0o6FmmA9fC3u9QYKAYe+aTJrfEfBgi8adVlAgVhO9NVyHP7euCFqSwt
	 8eVF81xjBlacY9EGNOtcQPmT2hJLJIhz/4D4oTlFYjVS0m0ImjVlqhwdHGVVd9EYqI
	 HRQBiHCy6f/cO6S2OkQLsDTtyFnybvLbl1C3mrckqAVq3snpC1oVNrafSzifkX41fE
	 fYeBq2od+qYDaPtfe5mV2L0paE+u/OQsLliJ9MYeMr/sK///xOq2GHkRHLzopPG3PP
	 JaLO5pidAZQrgIGlk/omk6x5Y+v7rCaQnt4AWCZHi9oimofBIas/i2QDYH0bP4wnDU
	 CsEL4P1+sSujA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A46A846EF;
	Fri, 13 Feb 2026 19:37:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1406B69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AA0741F04
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtBbE-JqTCuI for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C78841EB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C78841EB8
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C78841EB8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:51 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so12260985e9.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011410; x=1771616210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pT2erzWFeBsC3/zysPR1VfymkwXwUMqQ4kKNJAWizbc=;
 b=D/FCykesRS88x9+lVNPNauaWZ0D5neiceHRK6SIOuzkUAOYpCcUYH9lt2a4US1Mbo2
 tP8ibIfMKPNTmni1OAOslbQbQLQui46FYP8pdQ0d65ycACxUxFy8GDRkBsHXMcSeaJqD
 1x25mKwwGnGhvOf7lFwv0h3KotaNVJ5Ox2AJHZ4Uh3mj9umnYbaHi9UtqgKONln0imT4
 KbKhSP5Xqdc6g62uJZ6G0RPY/wRCkout8z9/7d5jEhYArUqdj6g85VBNkQqJFICHxjAQ
 IzZitWpDdetc1W0H4L0LrXBXEqjc1Nsy1OmCL+6tbXHEPu7iYYUdg1gMXQs8M4+iBowh
 TpdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl4cEoCVwMicXK6j8upibn8tM4nQ3gwIwcoU53JZE4cIyZLzfBMZHA7lkmIKNwugXAnCQZZYA7ea4=@buildroot.org
X-Gm-Message-State: AOJu0YwKI2jbtx1PsQ5QFw1nFykIHm/WkfeJVqVl8WFtE4U+TTuXMUBi
 UmK5c9XA6iw18enJGXYPKZhzra2QBAuldJLNSLIfLL4aKv/dLjL7vZidB6VZ46bPpWQ=
X-Gm-Gg: AZuq6aKuJxRbskd7NuHkPifAOPvfcMfG6A/kQ4Rn0/k0Xdck+zhOvLxu3YD0qNqdNGI
 65qPNUwOX+b4GlxMxqhCuQzeCdBLWu4UJW6CzXfl42vJ2ynSwpiN5DoGmhK9YjaDOTM6IsF5IYq
 NSNi984DxX0+4Kudc23slQTZi/HLMPtOa093aI34sA1VEpqS38d52MIIFgoR1HzZYUHwSuNFwfA
 w5ce7UeNQhO6P1NLMAdquLM2Et5XpKOzVch5mrt4JnnTX3m10YWa9+VCdmeyXydggzSpq7KKdct
 DLP80Bs9sI5DMSETQEunoM69uXB7wOUy2TIlQYW9RFwk94RKNEzcZ9mstt0Lm/jlq0ZaWWfQfN8
 wO1bPT9WJbhc58eFYOBsb/HqVa5VsqH1LW2LCYqJpm/eBGWQVZPLqeXjP/1/Wr2s/xIm5hPjBHT
 UhQqzO4aQuVTzu65U=
X-Received: by 2002:a05:600c:1e1d:b0:477:9814:6882 with SMTP id
 5b1f17b1804b1-48373a15f3cmr46446015e9.5.1771011410004; 
 Fri, 13 Feb 2026 11:36:50 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4836aa0847asm163717235e9.3.2026.02.13.11.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:49 -0800 (PST)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:49 +0100
Message-ID: <20260213193649.38288-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104172853.3441726-1-giulio.benetti@benettiengineering.com>
References: <20260104172853.3441726-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011410; x=1771616210; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pT2erzWFeBsC3/zysPR1VfymkwXwUMqQ4kKNJAWizbc=;
 b=OWKGcI8yUW9/Bow5NsCorm1B9HfxMNKyDkKiYdxkT8ernAQRaruWtVNU1dwjGDI/jl
 oJrqOexw6BJEIaL0iLQcXRs6EB5yrQsh3FdLPsmmdN6RbqgDvBZksiCc93Yh+cOqPmrI
 bhJ2QeSlvwe82NdX3D2M2LZw51w1Oy3p9LBBnK6dyEKqVTFaowZboSJAVwjaC57kVXkv
 8517ZqN2BiYzVdoyck602Dvd0+SH4hItQ1tPb8gkukPrlNMcLHgKY5tIqRPQGAyMmFOc
 lnBrxMQz+OUzX2BO1lhhRSVDRNUmXURC81LXnUNvbZLHcR6jqEwe0waFKKhwSq378aS+
 S0Gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OWKGcI8y
Subject: Re: [Buildroot] [PATCH] package/efl: update Upstream: field in 0001
 patch
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
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.11.x. Thanks

> ---
>  package/efl/0001-ecore_fb-fix-build-with-tslib.patch | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/efl/0001-ecore_fb-fix-build-with-tslib.patch b/package/efl/0001-ecore_fb-fix-build-with-tslib.patch
> index 2756e0932d..4b12183de4 100644
> --- a/package/efl/0001-ecore_fb-fix-build-with-tslib.patch
> +++ b/package/efl/0001-ecore_fb-fix-build-with-tslib.patch
> @@ -12,6 +12,7 @@ ecore_fb_ts.c:(.text+0x4c): undefined reference to `ts_read_raw'
>  Fixes:
>   - http://autobuild.buildroot.org/results/fa111306b95316eed54771550474dae804fa261e
>  
> +Upstream: https://git.enlightenment.org/enlightenment/efl/commit/f28462ee1082a26e4c394ff5fc6e2994d02bfb0f
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  ---
>   src/lib/ecore_fb/meson.build | 2 +-
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
