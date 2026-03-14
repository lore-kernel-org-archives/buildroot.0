Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38314107BCF8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E92460FBF;
	Sat, 14 Mar 2026 07:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8uSGq7Kf881; Sat, 14 Mar 2026 07:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DBCB60F5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474849;
	bh=4MEP8fDbmaHrwdv7vfdnucQQHEYEFMBmSe8dk939REE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OkA+c+lN+aD3nBsHhCGXW/WCGXdiM/za3zmOK+xC3fPhtN9FSpXBNqZrHp06CxyXd
	 pxpFv1JRTCJdjyKWbzByM3uH3+ydWCvInkeU8Br5NdgT3UAx/hcs7JpGPdw4nblxaQ
	 +K4jHzDGZwRi1SdRhIGWMBkVwtZzAnx/rKrhB2E0I2sMrr+/ET9A1GbxWb2r71xQwP
	 2oL3UnNxdAxc4z+nqTtGghcGrkZTsesDD8Des1xAZDRa6n4kfYEuFP+AusVBinIE6F
	 wNAwFB+CaWRT3ekOUUqBB9TL6woSDVzX7v/uldUNLMVHJJIU+eVYVs5s/henUkP/SB
	 mGrwRDWtdik5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DBCB60F5C;
	Sat, 14 Mar 2026 07:54:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B660201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4180E822C7
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEB7Clzy7B-s for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:54:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3DA4C822C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DA4C822C4
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DA4C822C4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso22724535e9.2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474841; x=1774079641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5E295tfTY7ffUH0M7la9g5gQJXNRCxUEFiBdg/v5x7s=;
 b=VDMbr9SSKv1z3xa9BNp0Ldva5vKa6UhG2Eg7VBOmNVOjXCSzd4q1n5tTFn2CS9hlEj
 BtQn8lRR6s4lYH5ViF0lQ0fz1/O2SogjzqQVrHVPBfgEz1J82Rw6iOkp9sUw7z6mL2Q/
 Ue4gsmtP7/j1+HNyomunPJFgIUQ2Z4ecbhanb1m/Fa/4rZ6gpqC6AA77SUFZEdoec8ty
 RIhfinNjEl8Gg7KToeN2zW0nTcXTU48J9VkKAeOBRlCoNPSm+Sc05EuKHekxSy9donIk
 dBnl24f+DE4JTXZEsq0YrsRek11IA/BAJMndbS23Oqwvkpobmm4JGzHbzxSzys1FPJIh
 lE9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx7dGuljTXdkHISn+wQPIqAcWwyBcLACldxyJaGHfPx/R7nsgAYNLxluYw6t9bZalbRpEJEfaXkgg=@buildroot.org
X-Gm-Message-State: AOJu0Ywm4l2zQE2Mhi+LRKP1FgTuftcVbWyc1ju2rdYXwTDp7BrsvGl1
 z3i6dDsB4GBwon4fvj2Sn574ogBW57ljBcMVYIkEOr5BXE0GjeegPmxl4mkNUQoPGzg=
X-Gm-Gg: ATEYQzya84w+GRZsh+quOYbk+qQ4j1tafUFdpe7BLewjulQknIMAFTNY+cYpJgrfplD
 9igM+Y6uyvwZLsg+gTte7Ueut1T1TOUZZUUofcIWjhV1R7NatkhuQxbZVSCzsHFkyp1ilCrAeUG
 nIBw81As9I+tU10t0n2JHmtACxWPBxxBfAWBeotnOWhLuLgyUdlCXIgoZGdTLPi8C5rZqT4A8ZD
 yN9W+YXD346PzjoVVTIAd99M70531s91nr+HDFjFPwOvxqz5h5zTtcCcPxepB8Wnoz86H0LcAbF
 vFOMY5b/02uNAQ6+ZoqrR3W3CEXqzDP1zyXsO4HEplSGgAiBKg3mobdePf5b4uM8+Q85EZrRhWj
 AGID+syJV3zwPZ1XLbdfIAKUXI45JdRSFvFhYwR/W04HplH78ibNIpeRYRvLEQqa9nI9ssS5R0B
 023+CpO+bTe1FwTRDuiFf7CGjzNQ==
X-Received: by 2002:a05:600c:4592:b0:483:7980:4687 with SMTP id
 5b1f17b1804b1-48556714c04mr99942515e9.17.1773474841034; 
 Sat, 14 Mar 2026 00:54:01 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541aba60esm415769885e9.5.2026.03.14.00.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:54:00 -0700 (PDT)
To: Dowan Gullient <dowan.gullient@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:54:00 +0100
Message-ID: <20260314075400.15217-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306142329.1010724-1-dowan.gullient@smile.fr>
References: <20260306142329.1010724-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474841; x=1774079641; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5E295tfTY7ffUH0M7la9g5gQJXNRCxUEFiBdg/v5x7s=;
 b=TGJAaxNAJJOqX1lR9/wt+khB3nm4WPp/Hbt4P1Z3MwnS9yVvj+sLN4RW6uzmtbE2E2
 XJJPDoMbJ86i7P5DwyjJfz6EFAERhTIv+eOOmn1loY51CcSRESmY1blz+HCSG0Jwjfj9
 sXYWj1AOSf0TuXEHfaDqWI9YWLRKLbpMEpw1AFN5RjB3OBythlBG+ETw2vOSXud9UR6t
 UXBHkRC/T7QSWvP3BJshOPPkhXx5fBXA+/DNabOGX1fFgQRtAIj/VbcNeeOSOtWsXeUF
 qK1f0Td08EXqIsxP/pJEXYM0BWinqY+T88ZdpGHxElwaCQKKpFcNw4ozEk/VfFym0jrW
 ntpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TGJAaxNA
Subject: Re: [Buildroot] [PATCH v1 1/1] support/testing/infra: update
 artifacts URL to https and .org domain
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
> The artifacts URL has been moved to https and domain to .org to
> improve security and avoid redirection issues. This ensures that
> downloads of kernels and rootfs images during runtime tests are
> encrypted and verified.
> 
> The change has been tested by running a runtime test, confirming the
> correct download and renaming of artifacts from the new URL:
> 
>     Downloading to .../tmpyotq8uor
>     Renaming from .../tmpyotq8uor to .../kernel-versatile-5.10.202
> 
> Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>

Applied to 2025.02.x, 2025.11.x & 2026.02.x. Thanks

> ---
>  support/testing/infra/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
> index be61d8cc4f..98215e02ab 100644
> --- a/support/testing/infra/__init__.py
> +++ b/support/testing/infra/__init__.py
> @@ -6,7 +6,7 @@ import subprocess
>  from urllib.request import urlopen
>  from urllib.error import HTTPError, URLError
>  
> -ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"
> +ARTIFACTS_URL = "https://autobuild.buildroot.org/artefacts/"
>  BASE_DIR = os.path.realpath(os.path.join(os.path.dirname(__file__), "../../.."))
>  
>  
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
