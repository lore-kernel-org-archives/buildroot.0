Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EBF1098797
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27B784897;
	Fri, 20 Mar 2026 15:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMsycKThmqvL; Fri, 20 Mar 2026 15:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A76708486F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022120;
	bh=f/rBRLcT3mKEnMkiDVskZHwMn8H24XVYfzDTeLqN900=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EchR/J1bglU9054TRp+PsPmu8Uplkqcg6XGSkvdusN6ZDK3QNL2b1COH/FdIwd2yb
	 L/adEzV3tMygISaUiOJINXHmhQY2gP/M2G17gLeo/UsdoeFx344+jGIDY701R/dXhP
	 yMsFGWMUxjYjG2BLYmH0UJQX881IV8opkCShOr1VHb9qRAJ0PaOmNn5Wz6T9+gCamu
	 yYXOuSSJdkMPJDKsng3Ljh+3+LxtH3wkWlj3oLjXHPiUn614w91WyoBk7sm/kYzXG6
	 sNzrMnrXzFfx0FcpjBAGTRpWBIteYyJQnsF7xgvbpVeJy1rXY4YlwBt0CafrHKoNrW
	 WrNnVF7g1S7UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A76708486F;
	Fri, 20 Mar 2026 15:55:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 444371B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A35C84896
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZe98DycnvOd for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 195E784894
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 195E784894
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 195E784894
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:13 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-486fb439299so16095745e9.0
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022111; x=1774626911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZWBnKQ3gaMEAT+z1S1mQXGK6MLfIpd5P01mB4yaZiZI=;
 b=msZsPwzInQiB+eKeDNdtCATiEWMaF1dI9FSntrogTqo8tR4mbLNIJZF18DKFSGZjES
 lj2Nui/M0t5eDIrg8L6Swgj5FqoVfJW1op5UvCJkL0NZ/Wf5Ino1y1c6F6EZkjIRRWgq
 OB8q11QJzjhMURIYbfB7TK5G7lWk2fwzmdEnF2geFe8G9u1ui4bXYsbqTWqr/JQH7e9d
 RZ1gD/tzl91Kc9GzCL+nJ61kW5YnO6B8emWmM7ujAQfwO4lHRoNq+R+VuVRuJG/jw7bz
 8tTE++FzYeNgzhO5OTx1/04FH7HHeMYq1wDCJuAEvZnlAEgrZ3k/Mdg2CMdEvvQCp13J
 Y4mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0zBBDEfoVRn3yPpLJfUHtWdFZ8do4x5PVO7+BRtfV0uJgm2sO56uqGPyjBgS9EuPu+O/awOzjaII=@buildroot.org
X-Gm-Message-State: AOJu0Yxr+XtKuF5Eeu1VPq87tVkTrO6l960GzOw2MKSs86eHHE90fPXz
 nePm/7TOJWa/Yn/vcSFX1reG+uZXPvDEt0mw1KpjtQc7ueXb3gbsbU85KyQQ7UHsIkg=
X-Gm-Gg: ATEYQzwJZA+gLSXXVR+urm1raFrX6eH0Z60kHR6+XPFF1FrSltncaonnrDzu06Mb8MY
 u97wr5PivjY6HU/bq9dcjeZJNqVxTizk7lUAI0AmvKrVdN1FhkNuWHcR9lDBa/Y3ZCLwjYyDE7R
 mm0XAaNh+ymyltqjmmHEuBETg//m9B7RogIR8PDa/LuRPoKJ0pPfIhnxCU7K4TMHO4HCnPqjCLF
 W07PcGAku4TcDDJH75yXc6oQ9rKTW59FCqwiADZ1maNxAI2RhwiQrpdw3Zdv1q+UfJAZwdjk/on
 vUdwFLJMhUpcdQrdMj0T/8HtKaQRL78BpuDOVp1Wq4XIPtjVITAtySLnY3l3mKxhMvMZjpYo8fx
 WMeejP2z3d8WE/moKwVvCAqXCBSTyXSptdRpkI5VjTcVBlg6ejZeit9lgPUHlEkIKLb8OExlXtG
 lp+MoSjiidVk33gdhm
X-Received: by 2002:a05:600c:12d6:b0:487:1c2:6a4f with SMTP id
 5b1f17b1804b1-48701c26bdamr19738015e9.31.1774022110962; 
 Fri, 20 Mar 2026 08:55:10 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48700512087sm23315045e9.4.2026.03.20.08.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:10 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:10 +0100
Message-ID: <20260320155510.176842-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310101037.470940-1-buildroot@bubu1.eu>
References: <20260310101037.470940-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022111; x=1774626911; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWBnKQ3gaMEAT+z1S1mQXGK6MLfIpd5P01mB4yaZiZI=;
 b=MMPQ+ro2mLw1gP6mVKAaVn8RxL6yNgRqjVIN23vgGuaeS9cRO7k/nsV/cy+7T2I0Pr
 NFAcRpxFEYviFrxyB8WvKZ7byODUgNsA4h87FuyE8hcuJziftK/V+hwInKii0lYmFHRG
 lA0s3OBzIICIMfaiK07wBnD1XNFa0LrJWpHbPPDjGN0eRr9XEce9Fdz5uFnqwe7hOI1v
 2FWbdbxVoJj8t0CbDAB1FFnJfXF7uaRCPGJJ7ec0RHJFlsn9hHxvojFrm2ilQH7wJY3N
 eOIe7yIpbGxfnD+cmS40CFixmlsI6HuXeHpbx50NppuuiZiZA8geTdxfCPHskiAr7W/F
 ABAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MMPQ+ro2
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Marcus Hoffmann from no
 longer used packages
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
> Remove myself from packages that I'm no longer personally interested in.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  DEVELOPERS | 35 -----------------------------------
>  1 file changed, 35 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 106510ea84..b7d19bc299 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2266,55 +2266,20 @@ F:	utils/diffconfig
>  
>  N:	Marcus Hoffmann <bubu@bubu1.eu>
>  F:	package/nethogs/
> -F:	package/pico-sdk/
> -F:	package/picotool/
> -F:	package/python-annotated-doc/
> -F:	package/python-apscheduler/
> -F:	package/python-crc/
> -F:	package/python-diskcache/
>  F:	package/python-django/
>  F:	package/python-gpiod/
> -F:	package/python-immutabledict/
>  F:	package/python-jc/
> -F:	package/python-log-rate-limit/
> -F:	package/python-pydantic/
> -F:	package/python-pydantic-core/
> -F:	package/python-pydantic-settings/
> -F:	package/python-ruamel-yaml-clib/
> -F:	package/python-typing-inspection/
> -F:	package/python-tzlocal/
> -F:	package/python-sdbus-modemmanager/
> -F:	package/python-sdbus-systemd/
>  F:	package/python-varlink/
>  F:	package/python-waitress/
>  F:	package/python-whitenoise/
> -F:	support/testing/tests/package/test_python_apscheduler.py
> -F:	support/testing/tests/package/test_python_crc.py
> -F:	support/testing/tests/package/test_python_diskcache.py
>  F:	support/testing/tests/package/test_python_django.py
> -F:	support/testing/tests/package/test_python_fastapi.py
> -F:	support/testing/tests/package/test_python_pydantic.py
> -F:	support/testing/tests/package/test_python_pydantic_settings.py
>  F:	support/testing/tests/package/test_python_requests.py
> -F:	support/testing/tests/package/test_python_ruamel_yaml.py
> -F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
> -F:	support/testing/tests/package/test_python_sdbus_systemd.py
> -F:	support/testing/tests/package/test_python_tzlocal.py
>  F:	support/testing/tests/package/test_python_varlink.py
>  F:	support/testing/tests/package/test_python_varlink/
>  F:	support/testing/tests/package/test_python_waitress.py
>  F:	support/testing/tests/package/test_python_whitenoise.py
> -F:	support/testing/tests/package/sample_python_apscheduler.py
> -F:	support/testing/tests/package/sample_python_crc.py
> -F:	support/testing/tests/package/sample_python_diskcache.py
>  F:	support/testing/tests/package/sample_python_django.py
> -F:	support/testing/tests/package/sample_python_fastapi.py
> -F:	support/testing/tests/package/sample_python_pydantic.py
> -F:	support/testing/tests/package/sample_python_pydantic_settings.py
>  F:	support/testing/tests/package/sample_python_requests.py
> -F:	support/testing/tests/package/sample_python_ruamel_yaml.py
> -F:	support/testing/tests/package/sample_python_sdbus_modemmanager.py
> -F:	support/testing/tests/package/sample_python_sdbus_systemd.py
>  
>  N:	Marek Belisko <marek.belisko@open-nandra.com>
>  F:	package/libatasmart/
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
