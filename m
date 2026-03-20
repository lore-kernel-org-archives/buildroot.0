Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1497910987A1
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0FD841E66;
	Fri, 20 Mar 2026 15:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ilp4XgFyFgQh; Fri, 20 Mar 2026 15:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01AD141E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022131;
	bh=c6+lMyyhqeJ1QBtL03GPTSlI4NDwimSMG2ouiKyUHLU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rrZ8R6A0ATtCxTiNfjXZzuD7sKthaYKYJ0Tm6bPU5+SApA97XWoJhl3CvaxoEWkSF
	 PXIubgT+6x784eLiq+QGU63ffTXIu9AWLyGFkSlINKBPg/krRAivH3stN8O31GkUdG
	 719E2YVE7d7ZJyvCi/EW/CiN4kBUZu1eG1D25pgPqb8zVBhPKC6gDSvAyZVJLRwn/Q
	 zvsqeD8DrMbY7D1T/Hz5OR3ZwJ0gUtKon6f7g5MwazYmHl/EFfE6X0+PN2GJEjPVS2
	 uFcQfGfvjKPQP/OBt9SZb3zrns7r/pnMPNGF9OGbO93NtFdRlZVxWJNeW/ROsYA0c/
	 UBvKEO+58SAWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01AD141E68;
	Fri, 20 Mar 2026 15:55:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1705C1B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3F76403A1
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snbpSmc9KBiP for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDAD540336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDAD540336
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDAD540336
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:16 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-486fe2024a9so4567605e9.0
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022115; x=1774626915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MxlYXu97EoOubshg0AN6LOgMhPWanc/wBZyAL7gASWk=;
 b=EWwYZL6xhfwwVWP5aMHY7kaLhrprk2jrj207X/9aWMv3Wl2Iu8Mj22e0Zbi8w+u61l
 Hc8vhPzytDKfuZeJbYQBe00NMIsRVsRRz8L8ENzJWsPzhNpysIPuJ9yDfn6NDoirq4qa
 XYmLSGrCs1EMVUy8rwI2hfhl/HRhVbzupA1tCKe2Y7LdEwBdvLMFaYW+WyNhMJCH+3Xx
 0ZTHmH5yWl4fVF7vbd2OPEdvjKeTLSPWWOWblk+5klN1HGCY80NU/kSG5rgu8N4H/O75
 tbotowNCuK9Ciq3u2Y1FLXpB3085CMJvtWup3WD2V8AaihHOr1aqBx0oC1SHDY5qv3wJ
 QDEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU30wjcu43KFObxAl96/ERxSiWhDRvlEJqAyp7IfoOtAJIodoAxb3mGH8EAoFapmmWEctS5oJIlJsU=@buildroot.org
X-Gm-Message-State: AOJu0Yw0GWrYirmQ6fUN6w54CGeXRryNa97L14q9sVbUGbq0kHP8fEXa
 BMZUQLaV9kwdKyYl0HAjzIkvSUExRXkcoyWD+NIAxg1aWpNwQE3qPmYf/DO8bUo0Mso=
X-Gm-Gg: ATEYQzzkMvfucZUGZxUdtlgPzJ+tWXP7ZzYGwVJh5J7CgiqOBMsWEl6TzxfJjuNFdaC
 Ucg6IiH307DbRUDOxD0GG6LCc+ROzxzNxPo05X14dE2tBZNsVtSI+pVsf64WfUIOvGvgS3Zxe6r
 9cINx+FcMBAn5ZLxoHjzKP+2w8CyFHfsd835klsXBowVW92z2vqFonlRsF/+u0C1a1k3tGjujYl
 qdgUn/vUWzDSNh744ymyYfiOwIn+ybTuR1caCcBGrbV0FT+Kq3kO6aJAlXkhUlKQHO0AzyFx0hR
 s5mADyq0GGgXF0d7pwcD7Afz3SyClPZkg11aUGEnDB2ckGX6t4ESDEkz3mCzM47QNW9rHNiSp3t
 cIvXp/iWZsMxOZalV0uzPMlzwQQU33n/ZPRJLxOk7BwGSIBfSOe8B56oB2E6mO7bRd/aDxT/zqV
 WFq/a0dmnmip1rr7em/4v8MeUyGmA=
X-Received: by 2002:a05:600c:1da8:b0:485:3b5b:eb8 with SMTP id
 5b1f17b1804b1-486fee20129mr50600125e9.26.1774022114873; 
 Fri, 20 Mar 2026 08:55:14 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b647036e0sm7640197f8f.21.2026.03.20.08.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:14 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:14 +0100
Message-ID: <20260320155514.177059-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314140633.2967249-18-bernd@kuhls.net>
References: <20260314140633.2967249-18-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022115; x=1774626915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxlYXu97EoOubshg0AN6LOgMhPWanc/wBZyAL7gASWk=;
 b=OBt5/D6Wvf1fBuAFTJVG1oPmdRsLgugM2biIvZWSecVcjZxDqlk0CI0iesnuwB8Kya
 7fOVglUpFuIhTa4YmG0aVQZx1TOb5kJn1uC1ZVGPGVmiF4TM6GFTlMogyQK+9JpEBEjd
 qa2u6XRjJwOv7buOjiXItzSjezdSwoCnTxQJUXN/GpbuBHjdaLgIwmQUdAB8Hh36cXVa
 uB6etdCNKv5/AjeBsESzvhDB/0pB+Z1KhBdeD0gUY8ZPJjFYM87D2uRNYRZKtD0aOt0w
 LJD8mha2exD8pBdg2Fuw+8JlVGodiMuK5W9WIPGhXCYb/BIUFWfbX25Gj1EcNrkgADN6
 UjyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OBt5/D6W
Subject: Re: [Buildroot] [PATCH 18/96] package/python-flask: security bump
 version to 3.1.3
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
> https://github.com/pallets/flask/blob/3.1.3/CHANGES.rst
> 
> Fixes CVE-2026-27205: https://nvd.nist.gov/vuln/detail/CVE-2026-27205
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/python-flask/python-flask.hash | 4 ++--
>  package/python-flask/python-flask.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
> index ec2e5d39f9..a670bf2e58 100644
> --- a/package/python-flask/python-flask.hash
> +++ b/package/python-flask/python-flask.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/flask/json
> -md5  62ae81cf2e91a376af909a2bc8939e15  flask-3.1.2.tar.gz
> -sha256  bf656c15c80190ed628ad08cdfd3aaa35beb087855e2f494910aa3774cc4fd87  flask-3.1.2.tar.gz
> +md5  4dd9abd8b17b66338a02ac45fafa710b  flask-3.1.3.tar.gz
> +sha256  0ef0e52b8a9cd932855379197dd8f94047b359ca0a78695144304cb45f87c9eb  flask-3.1.3.tar.gz
>  # Locally computed sha256 checksums
>  sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
>  sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
> diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
> index 8000489366..70994189c5 100644
> --- a/package/python-flask/python-flask.mk
> +++ b/package/python-flask/python-flask.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_FLASK_VERSION = 3.1.2
> +PYTHON_FLASK_VERSION = 3.1.3
>  PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
> -PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/dc/6d/cfe3c0fcc5e477df242b98bfe186a4c34357b4847e87ecaef04507332dab
> +PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/26/00/35d85dcce6c57fdc871f3867d465d780f302a175ea360f62533f12b27e2b
>  PYTHON_FLASK_SETUP_TYPE = flit
>  PYTHON_FLASK_LICENSE = BSD-3-Clause
>  PYTHON_FLASK_LICENSE_FILES = LICENSE.txt docs/license.rst
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
