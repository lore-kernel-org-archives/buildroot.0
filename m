Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85006CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E0A084309;
	Fri, 15 May 2026 13:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puVY7WTXx5Vj; Fri, 15 May 2026 13:33:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08014842B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852030;
	bh=e5LCC7ktbwNW67dI1D9qZpXLk6xeOUFRjTPAEG7Q86o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eZAFyHq91YMmZAezxkIL35aWnyrGoKRC757v6IaTuLT8TxK0WpZLQISIOfB1dIq7j
	 N4AhauXH8/X+2yf1BgqbY/FhRiUeCraxWQ4wQF4S/sCHnwIN/w8LABjP3DDGmvdCmg
	 MIQZy952LBA1Sdd1qXvuFdrTYtdkReqrk4+lagZu3DhfMtmbpx7lYMZsQ1yVGbV337
	 EjVFiI9uklXKGF1vvHKzepbq6cl+ViZ5FJ3kASg/vsWEfpKzHiGM1Bh8V0rWiU0lsP
	 r7rkO3RwHNYJm/Umptl1R1/QaqYjhjGKKzDLjsEh2QgcH7/sCmM+2dvIGglAKnO3OH
	 fQqx8f9cVvGKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08014842B2;
	Fri, 15 May 2026 13:33:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC19D36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAA5941BB9
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HlMMBj-Ol57 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B26D541BB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B26D541BB4
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B26D541BB4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:47 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso62845325e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852026; x=1779456826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GjeP9suR/G2E43tVq8OjJk3eWIwoepXUza3kWiFhNic=;
 b=olzReIyY4tbyLx0WfAjRxJkO3tEm515YWHzjinUxrQUZ1goz+7d/AdEuwyKpJEtOl1
 OoMf7JvorpPZtIKdaW6wNZ93/yNmj5/fVKFFwJ76NG2xJT+gs9+s1sQDP1XzTmB3CrcB
 Ip7nv5AuYhWF+KArZueORFdC2JymZLuUrXgmE2n6tZFfpK6rI6WHYpYK172ZtWcyd88t
 bB5O/jP+0YHbOBqijZPl9P1OZmZhvOxYTnNGmpG7YNiuwIHNjHLaoh1Wfc3Z2P7hkt9O
 Q0htN291xp9vOZE0wdiA5lXn+eszqReyjnzm1s9/dX1nQoG28Po+XDB+P+cGmeaT0iXL
 KB7Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8NE4LdkvNUpOVt2fuG4OR/RtVQfN7ZUKpx8rqDrsF0kP8ECOsn22Pmafae+Qa6Dcn/GI71JfbH1Og=@buildroot.org
X-Gm-Message-State: AOJu0YyRXJcyM/7KxemymZb7kqTxoHANCnvr0+aVe+UB7mS01lbv/PlC
 IMXuxB9aalAqgoBW34scgqSCQbLTqf7Fwd3Nk/YRUgbxM5jPUlU617AjJOtln6d2iq1jC7cg9l0
 Sof3c
X-Gm-Gg: Acq92OE7ZYBJXtv6xP4wd2tDvbHBTWewac5s3ttIxU82J6pwPtAYQxY8HQakLpXAi0Q
 jbH2GPM0BMv9+HE1vaZAg6AoWD6oJUZvAbSnjVwqOIQrSndwT7PA7W48mObpRfCaMSGmwJDLfL/
 zWjrwXReEOSoFwlkKT0k7sMp7ZmVu0d5vtgj48Q1zOpZCIYY3yt37Pwek+uwUXpSGphJyngB/8u
 OhK51xrgpOwmC79+9Z8CLDkI9x0XCqwYxNWllo9zXjo1blvI3XbSZpboTvSmt6ggZOTa0jr8aor
 uhrGrD8GBn7kC0QEoabek8xdSCSSpHjJorzA8haW/NpdnOG4gBFJCi5liu0AE1Pr4Gl5dZIsDF1
 FVXUC8OosQTVwa33FxBxewJPNwEl/4VtplZ0hQV7Qk3nWExryuYglo9xfw9BDqTpuBXtmbi7Viw
 5aUZIt/onUEjOyBOlOf3hNb/pkLD9dKOY2uOY1RkY/WN5S
X-Received: by 2002:a05:600c:4e4e:b0:483:8062:b2f with SMTP id
 5b1f17b1804b1-48fe5fd4747mr60240995e9.6.1778852025786; 
 Fri, 15 May 2026 06:33:45 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c833fcsm59619355e9.2.2026.05.15.06.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:45 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:44 +0200
Message-ID: <20260515133344.315628-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501123100.1918951-9-bernd@kuhls.net>
References: <20260501123100.1918951-9-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852026; x=1779456826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GjeP9suR/G2E43tVq8OjJk3eWIwoepXUza3kWiFhNic=;
 b=VKKqPwovDYNy+6XktSEdngYB2uPNqp5ZfM+QY0pvWkqDkP0+oRWP1ctU67TY9FmXTb
 YzgIv135P35c8X3KJAhc2Qn3NMFdy4E2tIYnFcPm1k611hIkRAebE3haoEqAQkDWz/GX
 s1X+6sscMXSXbhzruXEIOMhNRs8WSnyIh9EH+wXZqNUQJBD85rnl6NkdvI2CmNgMUZbZ
 8rrK35GzGtF1PXCAQaMgvc/UISYvCmsUAEwA/3QPQrU/yq4bam/HxUl5vAK3qzY/av7H
 F+qiObpcfTg438v7npxC+zg1WVhuFr4QjoK4VxrXinYwgoQ8Z0il11hv3OV14EHLKZwu
 ExxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VKKqPwov
Subject: Re: [Buildroot] [PATCH 09/75] package/python-cbor2: security bump
 version to 5.9.0
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
> https://github.com/agronholm/cbor2/blob/5.9.0/docs/versionhistory.rst
> 
> Fixes CVE-2026-26209.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/python-cbor2/python-cbor2.hash | 4 ++--
>  package/python-cbor2/python-cbor2.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
> index 2c72626637..b4d3025889 100644
> --- a/package/python-cbor2/python-cbor2.hash
> +++ b/package/python-cbor2/python-cbor2.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/cbor2/json
> -md5  43d53d2eedc711252f5f66b1e05389a5  cbor2-5.8.0.tar.gz
> -sha256  b19c35fcae9688ac01ef75bad5db27300c2537eb4ee00ed07e05d8456a0d4931  cbor2-5.8.0.tar.gz
> +md5  21a7e1096c25ef19a81730e2c0ce05a6  cbor2-5.9.0.tar.gz
> +sha256  85c7a46279ac8f226e1059275221e6b3d0e370d2bb6bd0500f9780781615bcea  cbor2-5.9.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
> diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
> index 6f8bc31996..859ee4a1b5 100644
> --- a/package/python-cbor2/python-cbor2.mk
> +++ b/package/python-cbor2/python-cbor2.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CBOR2_VERSION = 5.8.0
> +PYTHON_CBOR2_VERSION = 5.9.0
>  PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
> -PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d9/8e/8b4fdde28e42ffcd741a37f4ffa9fb59cd4fe01625b544dfcfd9ccb54f01
> +PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/bd/cb/09939728be094d155b5d4ac262e39877875f5f7e36eea66beb359f647bd0
>  PYTHON_CBOR2_SETUP_TYPE = setuptools
>  PYTHON_CBOR2_LICENSE = MIT
>  PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
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
