Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F72ECD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD5FA4098C;
	Fri,  5 Jun 2026 12:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WM4GEeUnRer; Fri,  5 Jun 2026 12:51:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 164E6409AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663872;
	bh=l8wDI5jmJIy9ER7hJweZPUaJ8rTQ+0zJrQ8CEUpFXWA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZJGv6j+4mjm+TFy+bSRLVfkKRy27RpPAj976PSU+vv2HEURMUHyMkJcPizgkE3hON
	 3lc5u0DNb5XmGqWbHvB6LjIlr5xVH3XU1F1wQnYOSYE+UlIi8Bxi3o5ix4oraLxPoA
	 UGg/g/Gty234IwoimCCIsS6rOPUik+O5RN04O8zrylVX9W3AkhYUSnEAHELKnDI12D
	 fP7QoeOwlhTanESEiFy4aKEdHt15Kd1ZcKlJzb26nrNw0Em3by9x/AFyeNzhvKPH/b
	 PA7v9zzcwKXKWj2loqNHXwfE5SWTKiwChN7ssIBrqnjew5s0mfw62CpG8zoxQkuK3p
	 6X5MYxnKk3vbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 164E6409AC;
	Fri,  5 Jun 2026 12:51:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 609E1F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46CF461306
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ab6ytnpRjKIv for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:51:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E76CE612DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E76CE612DD
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E76CE612DD
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:06 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso20515565e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663865; x=1781268665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sPkGTP5wyKD1oQaUmEQ9YxUAIHwKZmn3bAqjlvqnW14=;
 b=Q/OXIXVrR/+SmMIoe/JAKXEs0Pu/3YGgH9ZTmjXGUdS6L5nOxM/Am7n1og7FkD0V8V
 I5Xhn2N/7NuaHA73/4f78Z4faEqvVibZyEKCS0+xcbXqB7sSJW3gyf0ClVM537BDRM6U
 GZ23hDHKtPP8Vnmb4zPUeZueGzzAvXj/zGnQnYvqh5EmHoMlIvyDdBFo5A63MO+eajOv
 NmPmNRZc7dcmOwnw9UgZR8Z6FdZB5ZUAZx2W2gys3px6q1G71L7Yxdnr2KcfpZWvKkwy
 qnMmFNL8/wyijHgoqwtT11SY/D7RyL1oL7lc9EqTTroTEAMr5FpuD1RYfQi24rcGJE33
 pK3w==
X-Gm-Message-State: AOJu0YytU6E3RLzUu+R71Q0tYsuNSA4HexgZ2YhSiDqb1ydiB8bdUqec
 5GDg/4wPT50yNhIrZnTz6C+RNhzaJGP2IB5Y+cggwKcTTT3olE3V40YxVAFET7hefhq14OAjtJH
 kAFZh
X-Gm-Gg: Acq92OFV7bfFlOh82nzBHZQYaYm1Gw84apsp1gFdh20Kx5dyeCPPURp7AkwVBl/0ulU
 E3YHJQrPm47h20Zx9n4300PF5MsOsg6kZJF1EtKknIq4NY6VzJiDGfbXNJoMlZhQOQDlKwYjyGv
 aANcTbkHD4jvKu42FvhfdxubtIHUUUqptzGSAwpaYavBKZfnwTvJrSTkpykZibHC58mrBYEDcq+
 tmCp7keUjwE6o178mBCaW4oU0/aJ6UODsxKf5hfEHA/nvjVdBYbgbynxekp44Je8nX+LlIk9/H1
 ReIzhxl72oMCqpU15V0KsaeU1DgKYSIB6mVlIQ/K/B6Zp4OmYPrcT/bzqinE9WVVDG+HifFz1Tq
 BznmMez24GA/9uPphwnDki6uljzu6q/LNAfPQYcXgGNz/4qwYrug5lZ06FGQPwUvKVt7BqmyU7G
 m4sd5/vJgRZe5vrzUHkphkI1UTOw==
X-Received: by 2002:a05:600c:a011:b0:490:58ef:cea7 with SMTP id
 5b1f17b1804b1-490c25ee058mr55687625e9.22.1780663865021; 
 Fri, 05 Jun 2026 05:51:05 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3e59f5sm157434485e9.14.2026.06.05.05.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:51:04 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:51:04 +0200
Message-ID: <20260605125104.275202-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529150631.447940-5-thomas.perale@mind.be>
References: <20260529150631.447940-5-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663865; x=1781268665; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sPkGTP5wyKD1oQaUmEQ9YxUAIHwKZmn3bAqjlvqnW14=;
 b=V+IClazGUfL2dyeS+XHaEl/5b3uE5J268LCCj4G9SpUYAxvuCDynEc2vAm0v3wHSX9
 c+10ZgDYjkqIolmvV5W34wpKlugiA2YpICPR1PTQwNu2M0sIDgBrz/u2nqZpIQYX9Ynm
 3XZ64NqDGwHSRL/hmoaNtY0+9+99RXnQj+YO3hVYNVQYtR0xiXgRyOjFgdjLlyipgOwZ
 5PId9A+epyJ8DfyrEnMNoUUiLEyFYjssG5BM8+UV8A7DKn1H5vdTa8gacA3BNhtXXcJC
 LAcEEfriUrrTRZAzJt0QKLC0e38c9DBPx7bWrhdvzmGOzFXs9uVKPvExZtD2HcyCQ2u4
 kmrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=V+IClazG
Subject: Re: [Buildroot] [PATCH v2 5/5] package/pkg-generic.mk: replicate
 IGNORE_CVES to host packages
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
> For host packages, this commit adds the same `ignore_cves` list as their
> target counterpart and make it available from the `show-info` output.
> 
> When generating a CycloneDX SBOM with `make show-info-all |
> utils/generate-cyclonedx` and running an analysis over it with
> `support/script/cve-check`, multiple vulnerabilities
> entries would be created with different analysis for packages that have
> both a host and target variant that include IGNORE_CVES entries.
> 
> This is the case for the grub2 package that include ignored
> vulnerabilities that patch both the target and host package but aren't
> declared as ignored for the host package. This resulted in
> vulnerabilities marked as 'exploitable' for the host variant while it
> is patched.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/pkg-generic.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index dd440e4062..e5e0d49a16 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -745,6 +745,13 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
>   $(2)_CPE_ID = $$($(2)_CPE_ID_PREFIX):$$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_PRODUCT):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_UPDATE):*:*:*:*:*:*
>  endif # ifeq ($$($(2)_CPE_ID_VALID),YES)
>  
> +# replicate the target '_IGNORE_CVES' to the host variant
> +ifndef $(2)_IGNORE_CVES
> + ifdef $(3)_IGNORE_CVES
> +  $(2)_IGNORE_CVES = $$($(3)_IGNORE_CVES)
> + endif
> +endif
> +
>  # When a target package is a toolchain dependency set this variable to
>  # 'NO' so the 'toolchain' dependency is not added to prevent a circular
>  # dependency.
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
