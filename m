Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99D6CAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E85741520;
	Thu, 25 Sep 2025 20:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQLVUvBBiCq2; Thu, 25 Sep 2025 20:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3AD141481
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3AD141481;
	Thu, 25 Sep 2025 20:16:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41FFE177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F78C84384
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wAUCxHhJPzdp for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B5A184398
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B5A184398
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B5A184398
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:44 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso1729085e9.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831402; x=1759436202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozfwmGAV3UaVAczk2oRzB5Oi6wAASqR0smZ0Ml0WEOE=;
 b=WCqfgJ9a2J2xCqGQALTFtwXOyD08+iPOPAMXeG65YinS7Ha2XOoKZhA97KC0M2Nl3o
 OYwRYoHbQ1pDaBMp+0pY2sfzEbmuORWdI8PmYwUrADTLbtoL31LuhWhpD895CZnte998
 50jMvy4dEbvbirwii3kRbXH12VvQfWZnjQC+rXboCQc7dDcBjsMP/f+WZ7cQD0MALH7v
 f3jmAv7mAZ9c2Oa91R4dzfdCwhguHLX9jsICDmAAbxbGHqFdCN6zctzD9lEjhCy6m7Yj
 8JMnS+P3QB9qw+ZJoA4T4kK+bptsMihC/AH17tJZo7ULUTT06d/VF1WZXTReZm/QSumd
 SpQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV+6RwGkDorMeVvrm7izfcwD6GRNHE0LuEJfsNjAT3qUG35faB44EtlFj6ul6KRgcNe7vPPDmlYbk=@buildroot.org
X-Gm-Message-State: AOJu0Yw56djuHe2ICVktIicDRK9YAmUXgUlmrvVsQTp6UL3GI54sU4hR
 xPMo0GQXjySLdWR4ashG6mqqus4aFjD91pAd6EZiz0pjL78jx1cRgF/6A3TlT2heR+M=
X-Gm-Gg: ASbGncuWBkY+Fv0kENKgQIt3B6TzHgMuBCGEvKRkJB+x6YJ8mqMNqnRT7zKgGJGT572
 arwvB85AjZXWhPBhtTdmRfewUQWh52WOHkKGu8dsse/xhEcZ+35f0WxmHr8wiJEYqahLPahaBDt
 MujWsIFgprPdm/j0BwAAfemwBG7xWAyiRGpGwaN3pVW8jLzgX+0Wix9QR63OrS+Rv5IkpwDz5NU
 DbTQxZTDFsYSicwYe8LOy17/k7vUSrNJ1TAt0mEl70vnUIAEsj8qHdBb2unqnSborjK+SbdRzK0
 KT4NU9Ov8qDq9ZO6sNTjPxhQiaLkuMFO8eO7gPi90UpkdhYdpBFvCI4s+YjwXWyRf3JWJ1gcZPM
 ORU08+Hm/I1G8AVfXKQO4HsU9zQ==
X-Google-Smtp-Source: AGHT+IH3Qv7H9n693BHY/cdNLHS8SAD1gC7xx+bh3bIjHqb/Qu6nAj4lbN7CpbSygOYmg6fe8ecblQ==
X-Received: by 2002:a05:6000:2410:b0:405:ed47:b22b with SMTP id
 ffacd0b85a97d-40e42502e37mr5077658f8f.10.1758831402233; 
 Thu, 25 Sep 2025 13:16:42 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc7e2c6b3sm4485303f8f.54.2025.09.25.13.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:41 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:41 +0200
Message-ID: <20250925201641.43274-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915132556.47191-1-titouan.christophe@mind.be>
References: <20250915132556.47191-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831402; x=1759436202; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozfwmGAV3UaVAczk2oRzB5Oi6wAASqR0smZ0Ml0WEOE=;
 b=ge4WL/wB/zetA0cG+tQF0CItChsT8CbeCvh0CucLopHUSMyijh1UY1N8ZJYj7qhn7E
 obm/YFTccPsZ0D1WROzGsLlvFJQAq7l5Hx5q14a+Zkj6uyKV/+G1p+Ryv7DAbcoUouzu
 rTzX65ANYtuwpcNbd2mDKsk+EJ2jIpLxY3cjQNBM0EQa5Iig5K14qNjJTx9mUVErgbdN
 MnSFj98EvSn35Lq0wUU04OxtKvJm5Lw8xqIJK6O55TfBdiEqHFdpA4r9nF09X8b0kvlW
 wAOV+vxS++MdeiYjGuJN6jXanPWTB9Z7WPC8q/G7Xdtwc18TKP/LzMk6HJaolTx0wxn6
 cYVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ge4WL/wB
Subject: Re: [Buildroot] [PATCH] package/python-flask-cors: fix PKG_SITE
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
> python-flask-cors was security bumped in commit 04cd135b26 [1], however this
> commit did not update the _SITE url; which changes with each new release on
> pypi. Therefore, downloading python-flask-cors would always fail.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/04cd135b26406dcc31cb66af1480d53fffe81e59
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/python-flask-cors/python-flask-cors.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
> index d0923d665b..26198e6fb4 100644
> --- a/package/python-flask-cors/python-flask-cors.mk
> +++ b/package/python-flask-cors/python-flask-cors.mk
> @@ -6,7 +6,7 @@
>  
>  PYTHON_FLASK_CORS_VERSION = 6.0.1
>  PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
> -PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/4f/d0/d9e52b154e603b0faccc0b7c2ad36a764d8755ef4036acbf1582a67fb86b
> +PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/76/37/bcfa6c7d5eec777c4c7cf45ce6b27631cebe5230caf88d85eadd63edd37a
>  PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
>  PYTHON_FLASK_CORS_LICENSE = MIT
>  PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
