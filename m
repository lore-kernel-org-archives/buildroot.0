Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D936C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E10256129D;
	Fri, 11 Jul 2025 10:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28KhGLknoQRk; Fri, 11 Jul 2025 10:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D112060FD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D112060FD7;
	Fri, 11 Jul 2025 10:44:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F2B18199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D96A640DB1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHXz1YNiGoUu for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D4CBD40DB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4CBD40DB2
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4CBD40DB2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso1968325f8f.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230672; x=1752835472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vcZEDbqsM62E6hrOYT2Ff2chg+nduZ+FAlRKaX70HMQ=;
 b=c+L1UruGg/xZ2+bkZk7eJE9RGuU378sp1kZ06qV/FIlzj79w8/2y1a3e3GSyaH4ggd
 GS4Mv/OFjrxCc8jH9dHp5pgHlRy7he+DPcw5h8RX7GH4kdS6r7YU0TU7EcpjKOGxPdrk
 jFvfoU+wWOqNWIuFQUJ5Tb5UEyrz9DJAQ19w1sc5z1zhjI81po6kbw1hNcHYv8hJb6bK
 2ESYFxKNo0/P4+ylH0p14RU3jopkMiQhiJB12VH2HimIas8RkyMr1t6I2S0465tye0Bg
 HphW/sCE/nkApgQeh1RP3mfRA3J6R6lIjPKv/BscByOY9gQegREN6RAUKFqd8Grgv3C8
 VExg==
X-Gm-Message-State: AOJu0YwIwPQzOx9z0gdOWzdsWraPhvelP3UZcVtP67bfKCiHLGj5YRjc
 ga2ghd9r3JL+X1832a5GNWyRHlN5N9PH6ZhhVPbso5ZzK9nuVjt5Tuqlbgw8Lb+Yp/8=
X-Gm-Gg: ASbGnctFWJ9CEBMdCcWl4JvwtnRNMt8/y0A+EA7qiOwlfbmGigY+l5TGtZzA0PvSFbo
 keGIkBToHDFbgl6S3ihd2LANXlGbLk3FC6wmj3w1Tob3sWv+Z4G5eYDcHY8nAc10Cu7HCwH9WIg
 WAiQW0z6HZFET9RdsyHbUiX230d3D2mGmfXyelfmzcvoDM6FZ4kWkVrSU8PzR7AA+lZnaJus4um
 FXE4BjMnFgEntyq8ZMy0GhJEYauxydNwQRQhLmUL7JYeewqpFTWVlC9Pabo9VXVXQGgLvXPEHpo
 uqRXMW81JVBMuTq8hiNYRLAGnYJchpumXCNURJf/i1Ro0BBwW8PkqbHTWdtmo4QSIYknJgXcpZ0
 TTOhcN2GVYIpYQQ==
X-Google-Smtp-Source: AGHT+IFLx5LQg2/tsjlu3eMufGvD+Syy/5EPpNCs91pMwSTNFvszz0XyJzeuqim3O8/WKb4lv6WI+w==
X-Received: by 2002:a5d:5e8b:0:b0:3a4:f7af:db9c with SMTP id
 ffacd0b85a97d-3b5f18ae990mr2443121f8f.59.1752230671715; 
 Fri, 11 Jul 2025 03:44:31 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd17b7sm4147863f8f.11.2025.07.11.03.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:31 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:30 +0200
Message-ID: <20250711104430.823120-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250630072423.1126928-1-thomas.perale@mind.be>
References: <20250630072423.1126928-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230672; x=1752835472; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vcZEDbqsM62E6hrOYT2Ff2chg+nduZ+FAlRKaX70HMQ=;
 b=LmNalL7AU99BFVniK8O+Tuhg0ZKRo5s8YeC2YQ0Sd4w9JkD0Ngu9IqTHKcRNskqPWV
 WIgoshEfNtasv3yJUeO0bHHTFUSk3/zAJU9iY/JbpphuLB7a7aNw+RekcpEWNnRwsARW
 qtL7uQs5DxpzJj6AwOWGdVlIfKUyJQEsO0kccoNxECJczGOjIF1TdQfpG87qiBdWq3Oe
 pYqzwLC68toOAN95RwHTzh9oRQyUpDFcrsPZc7kpnApx5KctQ4PCzysd22VDiKlpa05j
 ntdemTnB0wu4STDs9irz7K8GgQ8SeBk/Gj8TJhY5j7dcY/8indylUZsAARf0Awu8iPxM
 oKJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LmNalL7A
Subject: Re: [Buildroot] [PATCH] package/modsecurity2: security bump to
 v2.9.10
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
> Fixes the following security issues:
> 
> - CVE 2025-47947: Versions up to and including 2.9.8 are vulnerable to
>   denial of service in one special case (in stable released versions):
>   when the payload's content type is application/json, and there is at
>   least one rule which does a sanitiseMatchedBytes action. A patch is
>   available at pull request 3389 and expected to be part of version
>   2.9.9. No known workarounds are available.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-47947
>   - https://github.com/owasp-modsecurity/ModSecurity/pull/3389
> 
> - CVE-2025-48866: Versions prior to 2.9.10 contain a denial of service
>   vulnerability similar to GHSA-859r-vvv8-rm8r/CVE-2025-47947. The
>   `sanitiseArg` (and `sanitizeArg` - this is the same action but an
>   alias) is vulnerable to adding an excessive number of arguments,
>   thereby leading to denial of service. Version 2.9.10 fixes the issue.
>   As a workaround, avoid using rules that contain the `sanitiseArg` (or
>   `sanitizeArg`) action.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-48866
>   - https://github.com/owasp-modsecurity/ModSecurity/commit/3a54ccea62d3f7151bb08cb78d60c5e90b53ca2e
> 
> For more details on the version bump, see:
>   - https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.8
>   - https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.9
>   - https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.10
> 
> Also this patch change the _SOURCE variable that now include a 'v'
> prefixing the version.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/modsecurity2/modsecurity2.hash | 2 +-
>  package/modsecurity2/modsecurity2.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/modsecurity2/modsecurity2.hash b/package/modsecurity2/modsecurity2.hash
> index fbb7fabb3a..cd8a96aa00 100644
> --- a/package/modsecurity2/modsecurity2.hash
> +++ b/package/modsecurity2/modsecurity2.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v2.9.7/modsecurity-2.9.7.tar.gz.sha256
> -sha256  2a28fcfccfef21581486f98d8d5fe0397499749b8380f60ec7bb1c08478e1839  modsecurity-2.9.7.tar.gz
> +sha256  081cda52975494139922fa4b54f474fed8a6db4b7f586cb0d3aeec635f7a4d53  modsecurity-v2.9.10.tar.gz
>  
>  # Locally computed
>  sha256  2c564f5a67e49e74c80e5a7dcacd1904e7408f1fd6a95218b38c04f012d94cb9  LICENSE
> diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
> index 36d6e1a847..b644fe7407 100644
> --- a/package/modsecurity2/modsecurity2.mk
> +++ b/package/modsecurity2/modsecurity2.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -MODSECURITY2_VERSION = 2.9.7
> -MODSECURITY2_SOURCE = modsecurity-$(MODSECURITY2_VERSION).tar.gz
> +MODSECURITY2_VERSION = 2.9.10
> +MODSECURITY2_SOURCE = modsecurity-v$(MODSECURITY2_VERSION).tar.gz
>  MODSECURITY2_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(MODSECURITY2_VERSION)
>  MODSECURITY2_LICENSE = Apache-2.0
>  MODSECURITY2_LICENSE_FILES = LICENSE
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
