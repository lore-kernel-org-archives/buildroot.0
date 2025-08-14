Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46C1CA0EE8
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BD396082C;
	Thu, 14 Aug 2025 20:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfzXS1PykAIR; Thu, 14 Aug 2025 20:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9067760818
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9067760818;
	Thu, 14 Aug 2025 20:32:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 738CC228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5780F80EB4
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OaSz0Irbtnr for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41B6580DDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41B6580DDB
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41B6580DDB
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3bb2fb3a48aso52f8f.1
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203512; x=1755808312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=srChOiyUn1WC6I2ZMVPW3lMtGWqF2KUwXdKSAGjrL2A=;
 b=DyQ/UXqO5hA1NCCOjZtKYYDHL8PiVTqylDTOj/+XXaNzCxvbwGcCPCQsUFt/yk6GhG
 XjaD8OPwoREqrfM6a69uQ4N/WsUIbPOtfTvv6P8ZqVrl8CMuqoRSeW20KJ09vveImlJq
 xGwRZvoaj59OsUROszfYs859zlQ8iKToAaKGcIJXEWyrwfOBuNm+Sa4m1e9kSOFJMcV0
 ZucfQq77XGjtqLkaG6Ylv/4GBYnwvX+wxDTGckJN/p9ECeTEaw+TkVAsQIuSSNeZ52cq
 VIgumBwycsUgMie/foxn04tLJs0PdTswlMBH9/lbDqbvS6lgx4WKnlJ+kFPghKMpnGLa
 WWKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxyz0kUiYGvoZAqS3ZBspzn4RUM7heE9GYviKSMOxb5qVTRqqSqqRgZkhDZ9m7STPe2E3lprx6OyE=@buildroot.org
X-Gm-Message-State: AOJu0Ywg25P36kBO27WgGdTzf+SNHjHuPgfOArSABPC1MvIEJ5pjrfVR
 WtG2+/IWVpAyYU6ofwXLPutD1sY1ml7UzhXeM8Bs4DYYzcusxMCF+nRXpx0XVbsjn9jMIbJJVoG
 Nd86rbB0=
X-Gm-Gg: ASbGncug3OkVCepEPCpdkr9wsBZKuXbA/h9VtVPzgEXvFgHBStSQNBg57tFLdw0mfdX
 7s4krhbQ4T2rkwMD54DXPCCGXALxdK4crbBHUEIoi0zbab4DpUcVp6fqBbF4oxFZOmxed57fit8
 WMIwk9uIh6R35iEYuBIylZHvk8GPfYAJKo8CF1rWQz9oW63UiFbEkCOiVArJKs9wVNgAeZWn7H3
 cvrtaXbdeiFd3V3roV6wUbJpP9gFqm+4/nEftWqEPQlRKm/alzlQRFjMa8G6cZtQno+eeEPv/Hz
 Bg1pCXhWJJc3EfziNC71BsBK0aP2nWWfXYmQVuoC7MxUlo8bdTLqLP7Wb//A1K2ClYjioO9vTfF
 4aHEz93N95Xtezw==
X-Google-Smtp-Source: AGHT+IFFx3bmiQmVJdOoI435QXhnu85dZNC8kTb00ZmAeXIjPtCLuJtRI9sqiD0kmrlytIeUxQykQA==
X-Received: by 2002:a05:6000:200f:b0:3b7:90c7:3277 with SMTP id
 ffacd0b85a97d-3b9f22a9e9emr3387464f8f.17.1755203511692; 
 Thu, 14 Aug 2025 13:31:51 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b91330bf7dsm9604377f8f.28.2025.08.14.13.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:51 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:51 +0200
Message-ID: <20250814203151.2815711-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2384243185c70ed34e5c80dd44cc45dff2f11b43.1753982959.git.yann.morin.1998@free.fr>
References: <2384243185c70ed34e5c80dd44cc45dff2f11b43.1753982959.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203512; x=1755808312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=srChOiyUn1WC6I2ZMVPW3lMtGWqF2KUwXdKSAGjrL2A=;
 b=eHBMcNA9om9iSyToBK8JX+q4ph1P444ZigOoz8Uv+5cZceNN8PZN/dX3CWMfKKHpro
 lKHJc7e8VbEjMM0S3XmEv1K2NWv8qROKxFhBM0TZp0rJ+n7JDoR6fW4U1QwPU1CjYMQD
 hmcJaIClUd2a44+nbnIXwZ8n6kRteH5g7d/75wG17hhAuLfxOgV3dLFbUXOXZ1tT2YHC
 IhsR0hm4mHaf1DLeOio6AH1HnJQCH3Gz1urloM/GpBDeEqFYJ8GsZ1uShXoFOVRrGuri
 bgKo7iDmqOteUhdw4Nyz981w6QFtT7lz1RIgGlUEHBYEk0+WNIicPJe/JrzpOKxyEgMk
 n0PQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eHBMcNA9
Subject: Re: [Buildroot] [PATCH 1/2] Makefile: fix list-defconfigs for
 br2-external with weird descriptions
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
> When a br20-external tree description contains an odd number of single
> quotes, list-defconfigs will fail with a shell error message:
> 
>     /bin/sh: -c: line 1: unexpected EOF while looking for matching `"'
>     make[1]: *** [Makefile:1243: list-defconfigs] Error 2
> 
> Whoever wrote that code will have to write this sentence 100 times
> on the blackboard:
> 
>      Never, ever pass user-provided data in a printf format.
> 
> (see commit 49117c102803 (core: support description for br2-external
> trees); dang, I knew it... And I should have known better when I wrote
> that code, damit...)
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index c581067320..fa82afa49c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1223,7 +1223,7 @@ define list-defconfigs
>  		[ -f "$${defconfig}" ] || continue; \
>  		if $${first}; then \
>  			if [ "$(2)" ]; then \
> -				printf 'External configs in "$(call qstrip,$(2))":\n'; \
> +				printf 'External configs in "%s":\n' "$(call qstrip,$(2))"; \
>  			else \
>  				printf "Built-in configs:\n"; \
>  			fi; \
> -- 
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
