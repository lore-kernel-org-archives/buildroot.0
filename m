Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9DBC83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B9726120C;
	Fri, 11 Jul 2025 10:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5Jdaxvpz_Qs; Fri, 11 Jul 2025 10:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A33F760ED7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A33F760ED7;
	Fri, 11 Jul 2025 10:45:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A0B31E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BE0583C51
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyJfxQ4zKwdN for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49AE283C5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49AE283C5E
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49AE283C5E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so1957717f8f.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230702; x=1752835502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XRmN7R/CGmWgvSR87sxF+kj7eLnz2MgTtXbDp0V1qcc=;
 b=BOE8g7PytXKkdKTSnsboFaiSQWEL8m62hoQm/KkfurpdSJ0T2NrVh9F8byybKKDUYF
 nlZ23n5YXDNwV4PgRi3oWMzxhvTT31iRp0CH6auk2E6j7s47Ot5tcUxi1PVFUBWfM9h4
 CAsWSymn8Gci0f/448BJKQ9wOT3MpdhLRUhJ71b8yEnkjR3+VGF2VW6dH+th6lMUqx0F
 9R8qHPUK13j8XrhcDQ8cohVBEGBIOQWvaTry+kd81sp4mbgTyp+QrC7oaCgw0Tj0awQe
 +mN856b72bB5xOA31zyIL04OIS9mIIT8bl+QU4CnNGvHgUNPDplN6f/2tEhfH/6xXWr0
 sEFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0igyTjLCyGVYmaDiMk2XWX9uq8nEdRCGZFEs3zaAA9VsPkwsiHzllT11DpBRmKptMupd8LHxfH/A=@buildroot.org
X-Gm-Message-State: AOJu0Yyyvs1RZyUJC9R/8L+0suTpVMvlCPoRnZ9TZIYFTrMpmJxb/VYf
 xM+ymTJB+y5ErHPVes+gG2jImSOZaNsXSABZLO30Gvma80HpGOYLiRfV4p1gjT3zLpk=
X-Gm-Gg: ASbGncvjzDg8KG0Yr2ZLhqBHZydgJFmLWjFJZPIyLyea5rNk4HfS3x8D4hrhKszAhbf
 YBLcJYqN07JwNfUqhVMzTxEwwV/T1O5tKaVAUCcJLmZ6Vxz5+sr69OaTePpqyUgQoe0OtyMNzYf
 +BfVAlW48if1hZ8TzY5ZFKPD+l/RW7dHfnVPvhvYZ+2M6OCpuHSVMsb0V5fjVvtfXgig75PiVYO
 YSqqUYtmD+V4IdBKOkHrfMcR+iRKjXeVrwXgRBVKz3TXnkQYEScYnNi8GwnQ3ng+fDc2g+2Vecd
 RwCXMyQaxoWrOWD0sTciiVMQ4WHBn4pu6aWYXlIKZubfKQZwh0bNdTlAPpGdonHSDMRC5xhpwM3
 6YFVjkdEHeY6t7CS9FAnqynPU
X-Google-Smtp-Source: AGHT+IEQY+SmZl5XmBR3OYcxylqH+j2uciqr/zDm5YMhcN/sc/4rRHhsFc0rW8sZ+Y9f7jqVEaBj1A==
X-Received: by 2002:a05:6000:2209:b0:3b4:a001:38fc with SMTP id
 ffacd0b85a97d-3b5e7f0ef98mr5601639f8f.9.1752230702307; 
 Fri, 11 Jul 2025 03:45:02 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5f16a6016sm2129855f8f.69.2025.07.11.03.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:45:01 -0700 (PDT)
To: Tim Soubry <tim.soubry@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:45:01 +0200
Message-ID: <20250711104501.824414-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703083918.30310-1-tim.soubry@mind.be>
References: <20250703083918.30310-1-tim.soubry@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230702; x=1752835502; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRmN7R/CGmWgvSR87sxF+kj7eLnz2MgTtXbDp0V1qcc=;
 b=BBYL2p5wRtTdTjGl18yYriDf4OCs+M8lpXoZY1lIOEfxQ7G8NPYaeNEVwhVyC1hhqp
 ELTBBZsqm61FSaKsxkdpGPjX+ctjGpDkanwvLh4Ex93z+8m8mJ4d9phpDy8G5ihhfbSZ
 k9N8ZJTfs5z3iYL69J3zjRCQymT7dzOuXg6uTMM+4dX9sPlgslKRmL5BPOq7fSllxlIE
 zhqlemgQs0eIO7nDfAPcYSr3lgPh25UivXg3cfafAJSe2Bu2g1HTgYKde5a67/OmYvgo
 T1ZixiZnUsiu1AUdRFJq52HJlKoSHt09YcfjS9GG4DP9guzkyICnLGi5jSe8FPSdJ5/w
 JwZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BBYL2p5w
Subject: Re: [Buildroot] [PATCH 1/1] package/sox: ignore CVE-2023-34432
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
> Commit [1] introduced a patch addressing CVE-2021-23159. Since then,
> CVE-2023-34432 ([2]) remained the only unresolved CVE reported
> against the sox package in pkg-stat.  This patch adds CVE-2023-34432
> to the list of ignored CVEs for sox, based on the report from the
> Debian Security Tracker ([3]) and the sox issue tracker ([4]), both
> indicate that the patch introduced in [1] also resolves this CVE.
> 
> [1] e2f856d18d package/sox: add fix for CVE-2021-23159, CVE-2021-23172, CVE-2023-34318
> [2] https://nvd.nist.gov/vuln/detail/CVE-2023-34432)
> [3] https://security-tracker.debian.org/tracker/CVE-2023-34432
> [4] https://sourceforge.net/p/sox/bugs/367/
> 
> Signed-off-by: Tim Soubry <tim.soubry@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/sox/sox.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sox/sox.mk b/package/sox/sox.mk
> index 3c9c939e8c..9fd3f2151c 100644
> --- a/package/sox/sox.mk
> +++ b/package/sox/sox.mk
> @@ -67,7 +67,7 @@ SOX_IGNORE_CVES += CVE-2021-3643 CVE-2021-23210
>  # 0007-hcom-validate-dictsize.patch
>  # This entry is NOT stale, those CVEs are not reported by pkg-stats
>  # due to the change of CPE ID to sox_project:sox in the NVD database
> -SOX_IGNORE_CVES += CVE-2021-23159 CVE-2021-23172 CVE-2023-34318
> +SOX_IGNORE_CVES += CVE-2021-23159 CVE-2021-23172 CVE-2023-34318 CVE-2023-34432
>  
>  # 0008-phere-avoid-integer-underflow.patch
>  # This entry is NOT stale, those CVEs are not reported by pkg-stats
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
