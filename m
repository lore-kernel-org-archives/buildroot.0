Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21FDC7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE59419B4;
	Thu, 26 Jun 2025 19:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uBQ4BGl963h; Thu, 26 Jun 2025 19:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8CC0419A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8CC0419A2;
	Thu, 26 Jun 2025 19:52:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D45C154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33944419A6
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75LmUX4z4ZF5 for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:52:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE0CC419A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE0CC419A0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE0CC419A0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:52:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so1092717f8f.1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967542; x=1751572342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J7tD6vLqn6AXIkKYiIZt4rmPV3WALwUOVng2uAcVz1A=;
 b=HJvtPKyCkZkf7+TvU3vhreq+gZTTqJ7Ne4DKar80ivwtAcxzhuPonuusDHXtHii6sn
 4TSWJRgCXWxyfh9zhrQwixW5hA7IgU9McaNha/8TIQBMPRTuWRaF681kUbtIIL4F6p3S
 bnqMHvBH0K91pPne+QCYOBtLCZWfi+FKct5XkdpjIPApxsQB/XGPt+T33VYnK/uW9tQF
 cF19xdIBJ92XNkppWPPr3cASyzDmH0ljGhz1c/wjXtZQFGsQuAhxNd4ktUA7i/APeUZD
 GST+zQ3iaG0nVMWCXDTleuBZg8qDYE+S7MpdJddZCY57qqwlCSVpzMDNkjPKRflQv+to
 eFjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtybiEmTmiaQ4Ugv8Vr88KEdEseEW2RhsoP0gKkN7MnKJnZj8zmw+X5L+9KDY/eCNz1YfQTf95I/E=@buildroot.org
X-Gm-Message-State: AOJu0YyVkNwSzD3doX6qqpPJMA1Vu9pfOKaZ0RwW1nvn2qAsDA6nJiG6
 KLSxxBs4w3FZe5lLjeuyJ6WKREQP+UzvrxCOcVRALCusZkGtgdcB70h1YcNEH6zcTNLFDqsupjU
 1rZcO
X-Gm-Gg: ASbGncsWEzXD7i0RLQ5Hi2gGWru84VIUx90w8Q4VRFvuBJWbcy+q7JOCoJyWJcSPGLB
 20ZIeTmJs9pwRjGlYbtbl2H80goU7QEGntivFmeR7vvatsHjDjxdrIiFaDPgea3Lfxo1w9X3GoW
 bUzMaSLsmD4id/48R2HC/TtBrDQfY8uoI9b4qzNZhCOIbsm/YHzJ7xHu68Ps/pcwTMZpSLh923S
 FuK646QYCP6KHDUupPvX1+CFNqMdDq6u09TU6/63f5xSpyZMUHCguvZvHjSfulwF1pcVDQUtT2n
 14twsmsZjtUgDQrMbzwJ+vQ2NWvFO0ypsL6R6cIU7uQv/lmvMYawC57B29yfM6h/jlUV7FLbyhp
 7X+oIN7UMw8iLFSvHPAMpKyNclOwF2KpO
X-Google-Smtp-Source: AGHT+IHRNk99foQG2oa5SxxZMt2N9oqPi4fT+BjnTtyy02RmbzQ6B+4pym5eoGJyQ0ecbYMQqKMKjw==
X-Received: by 2002:adf:f6d1:0:b0:3a5:52cc:5e29 with SMTP id
 ffacd0b85a97d-3a90d0d7317mr597422f8f.7.1750967541917; 
 Thu, 26 Jun 2025 12:52:21 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e71dfsm721949f8f.7.2025.06.26.12.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:52:21 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:52:12 +0200
Message-ID: <20250626195212.14599-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610144753.92545-1-buildroot@bubu1.eu>
References: <20250610144753.92545-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967542; x=1751572342; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J7tD6vLqn6AXIkKYiIZt4rmPV3WALwUOVng2uAcVz1A=;
 b=SqIRYevsRbVnhe7zX6psnAG+dayKb2RmpriqAga+1+ErMlVbUYmD01+Re1/aHYMP/F
 5TAfCrXgkaWMzWWj9R54VCx3+H6TXGSlfDno/B1/v2Ril7BXx8M7GELAl4E5N/YfkIrf
 pvjlN0McYD8CbyvWd+xxSfcPoPg5eJjC2adXUmiLicZaRIHJoULWckOV2SDEJfJmTdMf
 +aKsWzuMaod4CtnbT7XbrEtu3S0xzR/KY+wM0hVz5rDw9RPVitFnnD/CBdIrxBJAld4c
 +z6UlcIQexECPRRSa+PHv6egZg5ZXLXXvW9OS7WB7WJrKz/dkBiA0vwEApc98hfUZhUf
 S4Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SqIRYevs
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 5.2.3
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
> Followup release to 5.2.2 that completes the mitigations for
> CVE-2025-48432[1].
> 
> Full changelog: https://docs.djangoproject.com/en/5.2/releases/5.2.3/
> 
> [1] https://www.djangoproject.com/weblog/2025/jun/10/bugfix-releases/
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.05.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 14ed13fd6c..0dd687164e 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  782577f532efab32f8119a7071f55d04  django-5.2.2.tar.gz
> -sha256  85852e517f84435e9b13421379cd6c43ef5b48a9c8b391d29a26f7900967e952  django-5.2.2.tar.gz
> +md5  0b2266b4a1aaed942e0a94ce8a18913d  django-5.2.3.tar.gz
> +sha256  335213277666ab2c5cac44a792a6d2f3d58eb79a80c14b6b160cd4afc3b75684  django-5.2.3.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index e36ab5385d..77e9a11839 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.2.2
> +PYTHON_DJANGO_VERSION = 5.2.3
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/39/17/4567ee12bb84114c544d5c4a792e7226db517ac78f552111e9dc62d1de14
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/c6/af/77b403926025dc6f7fd7b31256394d643469418965eb528eab45d0505358
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
>  PYTHON_DJANGO_LICENSE_FILES = LICENSE \
>  	django/contrib/gis/measure.py \
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
