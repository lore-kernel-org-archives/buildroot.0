Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8A1CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFB476F4FD;
	Thu, 11 Sep 2025 19:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9tjmuy6Grc2; Thu, 11 Sep 2025 19:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6DC86F512
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6DC86F512;
	Thu, 11 Sep 2025 19:27:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FA8C443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36B4042459
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSBiZoVa2pRU for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 20AE042443
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20AE042443
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20AE042443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:27:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-62ed68313b6so458187a12.3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618838; x=1758223638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LgkcMv0mS2e1ycY6LfC06BLzvcQJ43JDvXUN6E0EOUs=;
 b=QfreSSnDi3dQs30xyN235RSY/71/9TVYy+fn+kflDHtqWZvkbnuvb6/Eze+0tdu7v4
 i9VdYOhsVQPEgL/eAusUB5rr2vAIbWFNSbvjxxD54+l3WMv6+0Waw/zoh9E720VUar+K
 tMi69jZ36ylLtz1ntpRB1q1omnYWTiptBx7411mITxcumv3hR1YvTFuFmqgme+3jz3DN
 8ElF6mDjCB9hcXQpNDDUR0LIl+EaN79MbrMaR+sdkEmBIrJb4GiOEWrc3WTpHOUVSSen
 D7u+9ZtqiqpkD2N/jZERHf5odsG3lA8/VW9uqcfcIyYJWM4ApYkd1LD9RLnwQRrSUw0a
 IC7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlcQdXIJmKQqNZBG+urQ1M5eGVX6FOTaXI1hiaiYpm6S1ITXSA+PRyQeqw6xciHhCDJnBlgJs4HJQ=@buildroot.org
X-Gm-Message-State: AOJu0YzRBfRXm9GoeWYIPsbd2ESPcyJEnzAaL7v2NS2w2PFKrUIzwg+Q
 Rb+GZEwOed+UDFa2IBjMKuoLTUP5eaqOlvvUord5IOoNI3axg/9F/2q6Y4/uUQ0PKpQ=
X-Gm-Gg: ASbGncs5b0ZVZsWEdu3DgqqiOs8h6fJlYqBRsAy6T0bvze0iihkwHjxQJWtJwFr1pHG
 tZOIW238+bjlEeRA1jK9j/PqyhxImgHjP4H00ABo/PyV5tZmpyBypEyLS3P2D+4KEuvHdEGQZ2d
 AW/7QKyzvPVJblO7Be0OOPA8qJ137SB+tXaRLN8qu2tD1iafh7nLMrvUBuVI0bNkkrAZBEQkG1V
 K1SkE4pDfieV0iqpkOALW1PmhRQJ33OIghah6X1/D/fAMwfOoxLd+VkOKzzgVs2hrnVOSwTBcE+
 O+pyfOmGZhg9yMWlhVFXTcZYFhEaPbJPH1soppz/F/N7talSp/83b2n6Glo/8qTR+XKiNHSOy/p
 +vNmsVQBxuqx9eFPSJ6H15mNaNlbDT37k3gB7LRw4Dfhh/Zg=
X-Google-Smtp-Source: AGHT+IFSW1pNMRSlZUrBKyF9XB2EF14dhOf6xCSf035DnaKkY2A7fwhu07ZxfD2f9w+38SSKuKEYnw==
X-Received: by 2002:a05:6402:5047:b0:627:603b:612b with SMTP id
 4fb4d7f45d1cf-62ed80fd676mr595040a12.6.1757618838078; 
 Thu, 11 Sep 2025 12:27:18 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33ad242sm1738519a12.17.2025.09.11.12.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:27:17 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:26:53 +0200
Message-Id: <20250911192653.2672748-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250906211900.648495-1-romain.naour@smile.fr>
References: <20250906211900.648495-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618838; x=1758223638; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LgkcMv0mS2e1ycY6LfC06BLzvcQJ43JDvXUN6E0EOUs=;
 b=UQ8k9+ZWLqv2xLcS3Np68X0diUCX9lY5KR5sMqpD3g7KjWrbZaefEbpbNqXfWbHfWf
 f+0XoasnNlo4O+trYg+UlaE9n5EPLL3hZpiEGXhkQGQK6XktOJgDcvnuEy+WUuafjrl5
 Zs0JXHnozWkl/4SMtCRbhaSuoXcTVezubTR4QHWRbP+3isv1d/QJlYP5pMqq6SsWbtsR
 7aBH39uha9bhd4ZMCclwEZRM5yMkdVe2YioYkQS5hHywWNilQFuttd5ceGgcozG5iHu5
 ehVq/roF/vbEZrYpYJNCp4EgxkuyKM/vz5SOdclbEAvZ5GS7K0WXdEvBK6Z4ExAevaQp
 +89w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UQ8k9+ZW
Subject: Re: [Buildroot] [PATCH] support/testing: test_hardening: update
 toolchain to aarch64 for checksec tests
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
> TestRelroPartial is broken since the last checksec update to 2.7.1 [1]
> (Buildroot 2024.08) due to a relro check fix [2] that doesn't work for
> powerpc architecture where .got.plt doesn't exist for some reasons
> (that's why the expected result "full" is replaced by "Partial").
> 
> From [3]:
> 
>   if ${readelf} -d "${1}/exe" 2> /dev/null | grep -q 'BIND_NOW' || ! ${readelf} -l "${1}/exe" 2> /dev/null | grep -q '\.got\.plt'; then
>     echo_message '\033[32mFull RELRO   \033[m   ' 'Full RELRO,' ' relro="full"' '"relro":"full",'
>   else
>     echo_message '\033[33mPartial RELRO\033[m   ' 'Partial RELRO,' ' relro="partial"' '"relro":"partial",'
> 
> checksec tool is problably tested upstream on more common architectures
> like x86_64 or aarch64 than powerpc64 e5500. This may explain why
> checksec broke on powerpc64 e5500 target.
> 
> Also, the Booltin powerpc64-e5500--glibc--stable-2018.02-2 toolchain
> used by test_hardening tests was not updated since the hardening tests
> were introduced back in 2018.11 release.
> 
> So, switch to the current Bootling aarch64 stable toolchain
> (currently Bootlin aarch64 glibc stable 2025.08-1).
> 
> Checked that all 6 hardening tests pass with this new toolchain:
> 
>   tests.core.test_hardening.TestFortifyConserv
>   tests.core.test_hardening.TestFortifyNone
>   tests.core.test_hardening.TestRelro
>   tests.core.test_hardening.TestRelroPartial
>   tests.core.test_hardening.TestSspNone
>   tests.core.test_hardening.TestSspStrong
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11176773995 (TestRelroPartial)
> 
> [1] 61505649746cb4d0dd57e35ff6139b7925bab72d
> [2] https://github.com/slimm609/checksec/commit/1c80e39c4956f902ed15c4baa8d9c17851096900
> [3] https://github.com/slimm609/checksec/commit/1c80e39c4956f902ed15c4baa8d9c17851096900#diff-9e8d1b28dfaf1c704560ac51a5613b70d70de2dcd84e87b9fa20f28811e6484aL1491
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  support/testing/tests/core/test_hardening.py | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
> index e9d30f3a38..2daafbd883 100644
> --- a/support/testing/tests/core/test_hardening.py
> +++ b/support/testing/tests/core/test_hardening.py
> @@ -7,16 +7,10 @@ import infra.basetest
>  class TestHardeningBase(infra.basetest.BRTest):
>      config = \
>          """
> -        BR2_powerpc64=y
> -        BR2_powerpc_e5500=y
> +        BR2_aarch64=y
>          BR2_TOOLCHAIN_EXTERNAL=y
> -        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> -        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -        BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2018.02-2.tar.bz2"
> -        BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> -        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> -        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> -        BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>          BR2_PACKAGE_LIGHTTPD=y
>          BR2_PACKAGE_HOST_CHECKSEC=y
>          # BR2_TARGET_ROOTFS_TAR is not set
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
