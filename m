Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE114CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9959684148;
	Thu, 21 Aug 2025 19:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQ01rcAJydT2; Thu, 21 Aug 2025 19:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE9908470B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE9908470B;
	Thu, 21 Aug 2025 19:21:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EAFF1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57EA8846A7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id teD-DlpXd0kg for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 570F884746
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 570F884746
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 570F884746
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b9e411c820so885862f8f.1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804081; x=1756408881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/rAnq9+SwiFYWcSb2k3a/Z5FijGtY+neL+Bvp573YPA=;
 b=AY0LIbiF4+8+a5on581YiqgUWMsLVPjqT6rBgt7eEwuJaD7dFHtvwTDkP84x4RdhEC
 313+b1yqN64CF3PxcfF0G5FUCizqZvvJxRpCuFq91wJKwwW4CeRZENrdxr3KH6SvwFAc
 SF4aHs653GxcSq2Xw5cZVa2g1qO13xjmIHWAop4UUXjTgcoQiEIpIj6clTjQ6ewzBb0V
 xWCX4+uqMWlOXiJb8F6nyxzJCjmL3Gxx4e6IXhbPVuoRbHeD19/P4/FkOYcL1p4rVemg
 sUkU3Qv1sU0pyoj73QKOYrywAflASRumO1KxK6oQAen+bKUqRiJ5IrSLDXt+vH8ONcGW
 ewog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHNntf4c43xHa2ktkgk79KyOaigVHfEK2KKUoDHR3xu2y95mBL9sTi9VQnkooBvxcOtnOQ4RpGTO4=@buildroot.org
X-Gm-Message-State: AOJu0YzhsOCRM29QNCwIv9kboz/l0/au2vTIAN6VuBDuOOo5uSwvL/i8
 0nTGckZNYvB5rbVMuWGN8pv95eCVx5mNnuPV9H3sTL+QdJo16dTAMvshKYazXSNZPWo=
X-Gm-Gg: ASbGnctvLQhY0+iK+tSAsrzFmUCk2Z4zu00AkjbsjdrRY15slTNI3DLSEMkooppN+6w
 mr1CLTKvAXCDtyvpQRJp09H9ee9F883EPzzn7ZKGnaCpPXRWe4/DVZCQr62Vkc+7jIHV4di3hYE
 eaOksaVzk9HvRqvZcObuBs24+yWHyIzmZred7eeiPdFZ8V567KIEUzeaA8WGrfBQaUNKc4OGyDC
 TiLQ5yHBBtFoR0bxO0fdLelIyWFhf4wH552mVTHYNuhzCLE/p7yBfzqRjPdMKeuXS2zWla8B63h
 Hmb1ahIgxPZZZCuIIIIVviDMnFZIDC/vy+Po6dS/1YekevyOBVOoXDB0wyddlwTGuUbE0+fz3sD
 7jz8BqTfYep2XTQ==
X-Google-Smtp-Source: AGHT+IGZgv2revMtlLQv7M1bTMiBs+CkCzR2YayKNDHM6O9zPT+gniaMiXG0qGTzX51W5BdOQoRMPw==
X-Received: by 2002:a5d:5f92:0:b0:3a5:8cdd:c174 with SMTP id
 ffacd0b85a97d-3c5dc4487e7mr97772f8f.26.1755804081379; 
 Thu, 21 Aug 2025 12:21:21 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b4e8ae6aasm16702395e9.5.2025.08.21.12.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:21 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:20 +0200
Message-ID: <20250821192120.24461-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815155927.1141296-1-ju.o@free.fr>
References: <20250815155927.1141296-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804081; x=1756408881; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rAnq9+SwiFYWcSb2k3a/Z5FijGtY+neL+Bvp573YPA=;
 b=Z/j2dXu4DH1H5/VJ/vKFuBkHuROa+Oe/UtP0oDV6DeNQ5+dN8avdrTKAp3g+SHdBOp
 bQ8uHrFK+tCMdITfsx2izbmrNFOVtR0bT1nf3e5I+lTwKcGGfdJ1pr4r9m0TMa71Gmn0
 hbVDa5C2KE+54+7zmK0a1TY/TFXVWdmLHCgWZcbglDokiaU7FRk/wE95fA0MLnKjk6Ns
 4kmzlvP4JAiZyT7KtuX6m4YUy14fNDcbWswDbpqm+Di0+4LC8+HjcamS2QIvklGXbPxy
 5/UnatM+Ug/KQWaMfaBsOPE21PhOk7iGySOvn3y/2JVTpPSuo1HCwqw8hFsLtD3Kt7k1
 g5bQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z/j2dXu4
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_numactl: fix test
 after bootlin toolchains update
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
> Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
> the tests.package.test_numactl fails to build its Kernel 6.1.75 with
> gcc 15.1.0.
> 
> This commit fixes the issue by updating the test Kernel version to
> the latest 6.1.y version (6.1.148 at the time of this commit) which
> includes the fix for gcc-15.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/10984686336
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  support/testing/tests/package/test_numactl.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_numactl.py b/support/testing/tests/package/test_numactl.py
> index 2ef9eb3635..218f53c262 100644
> --- a/support/testing/tests/package/test_numactl.py
> +++ b/support/testing/tests/package/test_numactl.py
> @@ -17,7 +17,7 @@ class TestNumaCtl(infra.basetest.BRTest):
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_LINUX_KERNEL=y
>          BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.75"
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.148"
>          BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>          BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
>          BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
