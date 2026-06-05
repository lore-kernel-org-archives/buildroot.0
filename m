Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF36ACD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4ABD82013;
	Fri,  5 Jun 2026 12:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjJ3V_U2mseV; Fri,  5 Jun 2026 12:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBA7D81FD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663747;
	bh=mPKKdMzj8CKKSJX3NRwda/IeOkkuKPBQ3afVAbSEc9c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CoH4U7ZFfDrE4XKnS/+h/fOCnPa9RGWAkmgdGiAEwrADq+j9r+tYvv/AinMboFW5n
	 cL1P+ojJed4E5a1pn/EY238l9TCEIOygPFMKTc+cNiZMveas3ZlPGfwl//aubJFm8v
	 h+zaMErvuMM3IMMxNZgtCABiFhEQpX/lOg4oKwsoqjxGis33p34ZCzS4mvMMBpUnd7
	 6O9pF4wFU8lrSFI1ZUZsXpKnNprymM8IJh1enPXdUPgHIpuGxn0ZwMfP6tJvcyZHns
	 ytl8i2HzUbe3PhCm2en8DNzdxpJYHDs3rygL7ZQ54kP9pCuBFyyApmRNfakSiUJOet
	 JnhbY8BaUZ3QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA7D81FD2;
	Fri,  5 Jun 2026 12:49:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87F68F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 796894037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCSGltqMxlbG for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E2694037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E2694037E
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E2694037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45ef1629ff4so1304748f8f.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663743; x=1781268543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5RJEzFMEhjNFiTHeh2/P5MHhsT/36IQBaq8vkddK1+w=;
 b=OFMoR/9Az4LGidPecDnPKU9G4SslQSKpLMha+FgHVLkiC0Wdmo1bH6VICOsnpMANp3
 NVFiVYNigxmPBgXhKi7Ukd5rPz84WoJh/3eRi/n8jazgWaYi/7VeuFmKm8QOphtvSj/B
 Yf8Yxh2lcHlS2rkf6lJLHmN3nuCCY4uv+i0RzGWEnj6JlTaVx+/1WN96Q8lveIviT72q
 xojN+N9Z0FChpI+zhev0eoouWLlKNUxgux5IQwbQs1U9KjBkkdLtAdrr+fiMNNJCzScM
 b2bDnzfJT/c27uohBhDkKt3A47CH4Auws2tfCS9QVlJTlWtJmPHfREQukDHLGVV63q5O
 zLaA==
X-Gm-Message-State: AOJu0Yx00jdYbwdncqdPtjB0lw9LEpusuUJNU/7wxy3/a/yim1HKcyv+
 hQ1bpM6KH4udKmNJNRHElRTLMbuSQhipdTkHyLkiyUqXdcbqXyvwRi/53Sk6t8pYYh0=
X-Gm-Gg: Acq92OHuoUs6Ls6i4x/BKp9xfN/hC80TVxiT2zkR+u1mn/LNtVuKDeSQM8x6gbPHt0P
 2/2TSineeFktCtjpWC1zS5IHsnODSl9C8QFOGV+BAGzML31/nqcO2T6Yx8V8k0zu7E9BEDc5ehB
 0V+ZEHpoW58jAGZ3aQ9ffJBqiLE/cPFafq/Jtoj9p38Vik1BUcDFezz6U/aCg5nQyGRUc+d6G2E
 ibDmCuFkm8kp1RsXxaiCztVl+dwuiTRDKiuH/DuvWOjMA37RBLWUp+uoFl+Gxvz3XtT1DpdHs97
 AS7f/aSe90NTTzI4AyK6F9amBsIGt2E9HLtutLwiBreLNTDIG7d0Ug6rLjAKhXu/P2ntWSG0r32
 l1wwDvGq/3E7qArG8pHFZOgyKi+QwGz4irKjQuA0hutxe9ppaWMYbHvemgH5pVrZIeSFzV7Jl1v
 XiRMPPLoD/ymDfrtG1GokIyjrpXA==
X-Received: by 2002:a5d:688c:0:b0:460:3234:77d5 with SMTP id
 ffacd0b85a97d-460323478c0mr3322470f8f.43.1780663742587; 
 Fri, 05 Jun 2026 05:49:02 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcad5sm28020860f8f.5.2026.06.05.05.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:01 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:01 +0200
Message-ID: <20260605124901.270230-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529143111.400662-1-thomas.perale@mind.be>
References: <20260529143111.400662-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663743; x=1781268543; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5RJEzFMEhjNFiTHeh2/P5MHhsT/36IQBaq8vkddK1+w=;
 b=GV5HDLLV/p2HbIqgQX5s9wAxLaAfky0FcfrBL2Wq/1J5OCQEdUi9zxVkvwmOzy+OWa
 4+bYnpd5stqHXwe3MqpVjs1cdv2JLxkcmmTNMzSpp8szfpcpSDItzmtHDYhZ0IR+fZUx
 cIlmLKik2G9oy3iF38HIMVA5qxRNZMdITIsJ0FeV/Oe/RMajGznrsqsGZUHoQdkgWYo4
 o7iST/stszs0BXcGUhza2/wPt9und5qIxWV0DFHXpeydsvlNMX0HhaQc8K8IKq73fsSz
 4/fzduoSecCYSwCPH9T0qIlHRCcEG5HP9EthddMlCxw1kSnXh146FhPFyI46A/DtYtBj
 CNWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GV5HDLLV
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/openssh: add patch trailer
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
> Commit [1] introduced a patch to fix CVE-2025-32728.
> Since [2] the security patches neeed to reference the vulnerability with
> the `CVE: ` trailer in the patch header.
> 
> This patch is no longer present on master branch with openssh bump [3]
> but hasn't been cherry picked to 2025.02.x branch.
> 
> The 2025.02.x version still had this patch present and thus need to add
> the trailer to it.
> 
> [1] 211e822d43 package/openssh: apply security patch for CVE-2025-32728 (sshd)
> [2] 1167d0ff3d docs/manual: mention CVE trailer
> [3] a127b7e999 package/openssh: bump to version 10.0p1
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  .../0001-fix-logic-error-in-disableforwarding-option.patch       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch b/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
> index 2c64ec1910..d068002638 100644
> --- a/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
> +++ b/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
> @@ -9,6 +9,7 @@ Spotted by Tim Rice.
>  OpenBSD-Commit-ID: fffc89195968f7eedd2fc57f0b1f1ef3193f5ed1
>  
>  Upstream: https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367
> +CVE: CVE-2025-32728
>  
>  Fixes the following CVE:
>    - CVE-2025-32728: In sshd in OpenSSH before 10.0, the DisableForwarding
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
