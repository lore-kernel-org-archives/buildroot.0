Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535FFC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2493082EA5;
	Fri,  3 Jul 2026 14:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRyRfatbjdNs; Fri,  3 Jul 2026 14:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52ADA82D57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089224;
	bh=RJHCpBbuRk2tgp2HV9Izg/7JloGwSJw4aOliY+zbr5k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=frsv3Zr5uCZ8n6YOez4rzbBvTX3a1VNOCRzpaqzKtbSOobyg2UBWHCAx/p9y7rT8n
	 kh2xMwJ4W/00Z6rdhuGgOBVWVFYIcgZOOFS8lNkWdCSn/Etwi+tNo/8x1hXP5IkPpy
	 hyafnt8FF7c/19Pl6ZEZFQp5NhnYlUj0G9WTOMeIYCtch4/+P5cmNh1bOKdLID0Jsz
	 1fzhuwCBQx7g9aM6zi+GXb2o7XVaIaUN1oUWiNZ7mScmRXGKHJSJPqF5yNy/NkBhYn
	 X8+/iTlxG2+6Zmcgsk2yrh6t1alIWx8jfDcgpVEfBtkpZQish+65GN3Uh49UR7Pxbg
	 Q9sFSJgewfStQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52ADA82D57;
	Fri,  3 Jul 2026 14:33:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CD3014F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F06040420
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYVvpXpAviTF for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5985C4008F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5985C4008F
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5985C4008F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-493c54e205aso4484705e9.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089219; x=1783694019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=avIIu02pP1WTitA49p1uMHxuB40tc4B0/m6zTQJ1Imw=;
 b=MsNdZmJbKy+PuowSs3rbiLznSDH8IwEuzHOAbNzQZOHJCvXWMd2kbh3ZSY5AHNXvDW
 fSd31Hz86zxo/SGbAZqDYDmqmoYn/wlwWMa3k5Sbaikdrs2j3bnMwUz2W/n3dXc5D9xf
 wIZxkwqTJM8YiI4gjc3UogPMJcB19RMWDoeaTN8RkjHlNH1tuBug6VJiRi6i6qejMF0D
 EY7Z3Z4yb5BApfyxcR8zJNecRvVefNVzDuzcAtiM6drcNpTvx1Yl4XNOmys7Kb3yM5W3
 79ACpjgyIQmEtkFme+FpB7wgtZph/JKXL+kN6cQm9JxC3IiDI/+AUDJxpjXrbLw+0Z67
 MCSQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+W803RgPONNgqNs/mTKemQOpWa/+ugCipehVso1aBTLk4MKgbYYZPuQxhtKjTA/C6dA5lUHMEI1G0=@buildroot.org
X-Gm-Message-State: AOJu0YzIjN44T8mRMQUANM+UQPu2oHmKBmbvgGni/RKHizDyP1/6lbky
 g+VzXkjoJMetrtYYcFdGnHHFNjXhzwgN3M/1Kz3qVLtnSHU285P1EKkr4757qYgwa6E=
X-Gm-Gg: AfdE7cl1qge7lDmAdYg5uOXTcbkZgHvt4mVy1SJNVAiLkQOgp60+tDCELU6Vi26S5vW
 xolQhI483rXy9ViBpl0czJSYoNUMbVQS1UYZRIW1LVuqCyTe1RiL9BfPAiDaMnogCGKN9c8RTo6
 CMifW6rjrdJWi4YZQtFz6uzRs/f1FJTW/6xaNhfs/N/DJAe2P5wDHs5IypXiYMBe3UEDlitWDxk
 ox6cnBwAgkJjrk3cr9k9Mk606F1HBvfVFpSICKR4IKfM1puXgpNRsIOLUVAG4l6bHmUQEP4dQoM
 IYjvEKBJACnap52FUaOhm4FYOrhrqxY7+yE7eI72WrEQWBcMdhvPG6+4F3R3DMCPIiTcmK0PT4B
 t/8oHDZQdwYIxeRg8zkzg0ARCKgG9pe62BvA5Z/L4i8FgjSBMpE2SZd9vKzkAPk+OinhqF7FgYA
 7MWeO/
X-Received: by 2002:a05:600c:620f:b0:493:c453:6002 with SMTP id
 5b1f17b1804b1-493d0f493d0mr1106055e9.35.1783089219148; 
 Fri, 03 Jul 2026 07:33:39 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63b6f8csm124278055e9.11.2026.07.03.07.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:33:37 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:33:37 +0200
Message-ID: <20260703143337.276224-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260625171106.827713-1-fiona.klute@gmx.de>
References: <20260625171106.827713-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089219; x=1783694019; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=avIIu02pP1WTitA49p1uMHxuB40tc4B0/m6zTQJ1Imw=;
 b=cGIY6Qnw3Inl0l4fmmni3fOV6YNmMxQqP8lN80M3lzSJ75iswC/jC3Izgey7E476Ql
 CVBWjq4kuYhDwVK1nJ41K6h3MOIYtc4nYsJJAdU0upuRYkhML/t0Hpvsiyizyu0W19pe
 p6XjMSGRxhaoHla1J5M/+EhXHJnemumZpDegeEZ6W90+kH49m1Vykb2GOubLdDIbPduT
 psC/2xj1Qk3odR9OmTnjDcPqubEf41BavOtZ7RfB1uYC8Y5pVCd8aoly4AtMsIhV5Az2
 GXtZDIKPbmiUWECsuFMAFSVYZNjShcjheFo+lR5E72k662bIHpmTKit4XvfYkza7tm/z
 7OSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cGIY6Qnw
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: add missing
 UTIL_LINUX_IGNORE_CVES entry for CVE-2026-27456
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
> Patch was added in 9998130badb6101cdf6f6da0bbd1228d79825b63, but no
> ignore entry.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2026.05.x. Thanks

> ---
>  package/util-linux/util-linux.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 20bdcc5c3f..cfcd738bb5 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -37,6 +37,9 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
>  
>  UTIL_LINUX_CPE_ID_VENDOR = kernel
>  
> +# package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
> +UTIL_LINUX_IGNORE_CVES += CVE-2026-27456
> +
>  # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
>  UTIL_LINUX_AUTORECONF = YES
>  
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
