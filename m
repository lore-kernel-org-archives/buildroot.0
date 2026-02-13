Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC620EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A039F422B0;
	Fri, 13 Feb 2026 19:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCmLELw9SdNr; Fri, 13 Feb 2026 19:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A50BA422CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011629;
	bh=28CKozx/sbs8A/FBgzKE+gKpof7Ev3mNsifjn/E4OZA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HsTaqkSnb6g7HuY/JfVT6b2EaWZmVwTE+Q+9t8sjhBwNlxIX4gcziUqN86PlB27sf
	 idrMx4x0TTFu5JUVw6Z4Q0dd302cOkXbOjCOks9j98ly+ORMXasxbgM8XylU76aJQC
	 MfKrKvdhP0N2/XeBLC8vNJ/+OJYYGHWMfG+n2YBetqxjNXrRSchCiFgYy25o1TgbTH
	 SDrm1LSIPDoU2onq7r1wBmUP+YgtfDifCgznfVniZeaLH8SqymwpGMJkzfqPpAyw32
	 yhNjjhAblvcIcxd+rf3WwravQPoF2ShC5jkQZJo0DDPtPG4bupixiPMKKt7qEI7D23
	 3C+ZjkXRtnyKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A50BA422CD;
	Fri, 13 Feb 2026 19:40:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19A2869
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CAAE412C3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fdFWUwLd_Cf for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36B7040407
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36B7040407
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36B7040407
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:24 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso15279155e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011503; x=1771616303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=emSNbeFkfwAf/YSOq11hd0MdfUH4+EDRdWB5n3p05jc=;
 b=uLBwmcoqisvVQxHw94xzfYeIWjGGekFHtAP+guvbCbYovCfwqB77D8CEEuSRNukQD1
 PSwtVQkYvTFxNJh4xNXnZYjR8l1KF3V/wiRqwAGJK1O7t3jOJQraXgm0Ek8rQBVFptQn
 DKTKjBg1fmFhbvXf1uK8dMDoxOMiW3jJ95YKLYYuzIIwyjKLnroV4AfBxGq3NC3lJufK
 JnRp0TsEHYsR6g+tAnVBGnef57U6sNjrhoLrLrkOETNUTNV21jdXhZC39ri1vYTVeCYX
 jL2dkfWvRvPRWp9YzhjSzPCJu0NQlbhdlLMTFoRPdcVEG+3oRqIKiIoObwaBdZNhRNKU
 M0DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIcIPjrKf44SovpjyhW4EDx8Dj5ouHNxt/eLO+vTZVpuBEJVdeiw54AIDFBL3VpmYPcd4iOMWeNHE=@buildroot.org
X-Gm-Message-State: AOJu0YwhEYeOJ/7T85o/cAhZpMeirFM2L/grJLLZ2yGi9ljvKUWA8m3f
 l+EHvOpnWSAqqz9CYIS8FPiZWAUH9q5YCzzl3uu7Zy+n51ZJNN2XpsXC3QqAfx+WGHY=
X-Gm-Gg: AZuq6aLupTGCg6MDy6i+jS7IcidleivePh4IjVAQbO/Cmxktd0zKXPQAQkg6v03Frbu
 VadDRbmMSlqvWv/YjLHsQeMa9gf7qmaeqEEqLXxwG/MsQencWBuRPq0f3cp7znV11l2H7LXSR1i
 MZYFCFuEwGV95FfBTRBppZRG8BSWnC6hHhqSiQULFlDHw1X6tgAxv2uE79sGPIYjF2urUgE2hEg
 nuiJFE/MogRICyQZi7iqVtRIMoXgceQuSHOYnLAZilpuzm7nMWpnxlXvpvRvyN3Lz++IQbVqNsF
 rxt1UL7KvxfoFwb1CikVWuPFRRDSMmhm5OGYIA2AWlm3Nnz7UE5MRj1oc6GVBIAB7SLQWQm8HPl
 D+fptqfyuHUpUVOdy0DCh4UZfK0qu7CnjP6y1+25MFMUn/itETMmxiyy2I07vPwgGHP/X+j1vk0
 EDuGIyQwnhVKJFVYw=
X-Received: by 2002:a05:600c:5285:b0:477:9976:9e1a with SMTP id
 5b1f17b1804b1-48379b933a3mr5811145e9.6.1771011503050; 
 Fri, 13 Feb 2026 11:38:23 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dd0deeasm199063005e9.12.2026.02.13.11.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:22 -0800 (PST)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:38:21 +0100
Message-ID: <20260213193821.42218-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202150143.3996204-1-buildroot@bubu1.eu>
References: <20260202150143.3996204-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011503; x=1771616303; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=emSNbeFkfwAf/YSOq11hd0MdfUH4+EDRdWB5n3p05jc=;
 b=hDcJF9IoVGpFfW3XxNO7HWrDSyBM8Nyuz70lEC652++HnwuS7z6VJ/GU5QhdUe2l67
 L0ZZgb3OG0kGWxleN6ebYYxKVN3NMPHeaeaBPaHdZOEfc2oZI2ezRH/FOgngmuRnfr1g
 N3PQivZkMq2Vwg/NtmkEW8BTKQex9pZeo5Ndp+JgXXBmDGkafXrei0Tx+ouJDxMmpIe7
 0Fxxhl8/WYczQKkEzQXOx6V6Pi+oXuysq/HtD6PZtaoHfHm5N1NIstSm6KzqzS6IOLA7
 TWjkUtmcZ/no2+W0sOfkHo+JVh+IJEjUOUCuECnJHP0DOgHqXjDVJURawp0eBSZDHuTQ
 k76Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hDcJF9Io
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: python-requests: new
 runtime test
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
> Use an armv7 kernel because that comes with networking support.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  DEVELOPERS                                    |  2 ++
>  .../tests/package/sample_python_requests.py   |  4 ++++
>  .../tests/package/test_python_requests.py     | 21 +++++++++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_requests.py
>  create mode 100644 support/testing/tests/package/test_python_requests.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index aff26f8012..6dc83d3a38 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2284,6 +2284,7 @@ F:	support/testing/tests/package/test_python_django.py
>  F:	support/testing/tests/package/test_python_fastapi.py
>  F:	support/testing/tests/package/test_python_pydantic.py
>  F:	support/testing/tests/package/test_python_pydantic_settings.py
> +F:	support/testing/tests/package/test_python_requests.py
>  F:	support/testing/tests/package/test_python_ruamel_yaml.py
>  F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
>  F:	support/testing/tests/package/test_python_tzlocal.py
> @@ -2297,6 +2298,7 @@ F:	support/testing/tests/package/sample_python_django.py
>  F:	support/testing/tests/package/sample_python_fastapi.py
>  F:	support/testing/tests/package/sample_python_pydantic.py
>  F:	support/testing/tests/package/sample_python_pydantic_settings.py
> +F:	support/testing/tests/package/sample_python_requests.py
>  F:	support/testing/tests/package/sample_python_ruamel_yaml.py
>  F:	support/testing/tests/package/sample_python_sdbus_modemmanager.py
>  
> diff --git a/support/testing/tests/package/sample_python_requests.py b/support/testing/tests/package/sample_python_requests.py
> new file mode 100644
> index 0000000000..e8d2b64076
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_requests.py
> @@ -0,0 +1,4 @@
> +import requests
> +
> +r = requests.get("https://buildroot.org")
> +assert r.status_code == 200
> diff --git a/support/testing/tests/package/test_python_requests.py b/support/testing/tests/package/test_python_requests.py
> new file mode 100644
> index 0000000000..48f910139b
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_requests.py
> @@ -0,0 +1,21 @@
> +import os
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3Requests(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_SYSTEM_DHCP="eth0"
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_REQUESTS=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_requests.py"]
> +    timeout=15
> +
> +    def login(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
