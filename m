Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5994FC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 250396142C;
	Fri, 11 Jul 2025 10:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Q2tjKdmUx9F; Fri, 11 Jul 2025 10:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9667D60ED7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9667D60ED7;
	Fri, 11 Jul 2025 10:45:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 714DE968
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5585D60E7B
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zi4cue8WUEn5 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EA856129E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EA856129E
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EA856129E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:03 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45526dec171so5957845e9.2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230701; x=1752835501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uj2LvYoRq30/FRIHXkKQsYvn/PesI2kCkhgcOjMj0U8=;
 b=pegbCElxO8XyZKLWltY0u3lAYk/xBnK9u/XuZyQ6R7RncYtkaMP263eUgNgoVxUpDe
 HvgtIaYvEinkaRONPJ3YJll6aNRgcaX+g2xLeDQDyGahnrUGr6g5m7I0VB+ODGFNZl9z
 ni0XS87cDqyvWvpQ5LO00ztt6L40MDcnfKRg1m0VbnV3BNzwFeTNvEU9RR9S4ggmgDOi
 Y8zLkHox1Z3jtd5QYfsdgDOK/goUKLy8TYhtYe3YO0jtCsfWGd/vkwvCdp0gJEE4q9xY
 SncvnoPWCwf9adwsTm3f8InK52A7++jtzBA8ResJKfmweXWmA6HX32tIoheTA7I5Djbj
 gwDA==
X-Gm-Message-State: AOJu0YzJhFXRKbJhO52UnFa+3vNTpF8Tf96XIr+idkffXkYebU0PhwmN
 AUdKOZz9DSQo9jbAA0nZ4BcZ/YCWx3SsPnDYb7H/uaFc349v5BcQVT7YGSTuDUpz+hHhPBz6FZF
 0ETJa
X-Gm-Gg: ASbGncv0fLUmubEITN+XbqFlaWA0oiHT+pVfq05fsBnfJ4pEE6s/qrwDfQoM7DyqkME
 gmoJNwwgannjZQHamNBxIqgGQyaHnB8CcGPkr4JhWHOXUvis59czzBCMb4m9RrhoQdCWNXnZqPQ
 SsR/0auq9Mf+jt/h/q3AuLEJOcRFUWdkotVuXI4OtaSIa7lddgTZYSHgWKXNml3K2dN4woQUBtX
 bMH9xmRp52Wdk4w7gp84wccZOkci5E1Qyobo8tw1LQCA3kqFHKO6I5+dchYR9MS0YSjx8resdaI
 aX3i5V82u7XTEHPdVn19RIDvYqfl0DeakF/nRg6pFmSLM7Gi/vA9GgNamKjqyIhS2Njd0MJPFgs
 neg8WqdbbDAvDDA==
X-Google-Smtp-Source: AGHT+IEMIEkY1xuotOY3p5hh/OiDW7husEESJZrVf924jFGLa1oESSgIeWjZR0tZrUXzdyzjd4uQOQ==
X-Received: by 2002:a05:6000:4211:b0:3a4:e7b7:3851 with SMTP id
 ffacd0b85a97d-3b5f2e3c04emr1693586f8f.58.1752230701111; 
 Fri, 11 Jul 2025 03:45:01 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1741sm4187442f8f.18.2025.07.11.03.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:45:00 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:45:00 +0200
Message-ID: <20250711104500.824351-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703200917.4054251-2-thomas.perale@mind.be>
References: <20250703200917.4054251-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230701; x=1752835501; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uj2LvYoRq30/FRIHXkKQsYvn/PesI2kCkhgcOjMj0U8=;
 b=X3GcO1DUJg+w3b2sOa1JhRoTMY221LwdIU0gqthIEBRVq0MoC1T8nFBnSEBcsthFgJ
 LetDMggocnAaJ881xXx/QpcXNc//dRC6hoT5e4g1wB2I9C1fBW8Sn9pRdmh2cKHdaLWX
 WdtnnVEUGv9CNIDrfeNHF9MhERRF6RaOy+FiuWblEGDfa/cP6vfJDMSU0H70BjCCHdA1
 bOnxfk7U9WZ0VaWZ06i42KkjdeGbhEzNGC+JeqGTehPv5kJZB6MJrwxwhwO/e73zTWPM
 6it4qBKmLBqKjQx56K/5wq3IK6eoSLWVQzPNhrs5jfjXB8Ts4rSSIHoHAiEROOXej07Q
 YmnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X3GcO1DU
Subject: Re: [Buildroot] [PATCH] package/python-multipart: add CPE identifier
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
> The cpe:2.3:a:fastapiexpert:python-multipart:0.0.20:*:*:*:*:*:*:* is
> valid for this package.
> 
> See https://nvd.nist.gov/products/cpe/detail/8C38E43A-00AD-4851-9AC9-80408FF89F52
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> See for instance https://nvd.nist.gov/vuln/detail/CVE-2024-24762
> ---
>  package/python-multipart/python-multipart.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
> index 8c49e2df9c..8e11f5f6cd 100644
> --- a/package/python-multipart/python-multipart.mk
> +++ b/package/python-multipart/python-multipart.mk
> @@ -10,5 +10,6 @@ PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/f3/87/f44d7c9f27
>  PYTHON_MULTIPART_SETUP_TYPE = hatch
>  PYTHON_MULTIPART_LICENSE = Apache-2.0
>  PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
> +PYTHON_MULTIPART_CPE_ID_VENDOR = fastapiexpert
>  
>  $(eval $(python-package))
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
