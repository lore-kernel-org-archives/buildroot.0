Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37447C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D08F82E22;
	Fri,  3 Jul 2026 14:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jkqh1hwuskis; Fri,  3 Jul 2026 14:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C16482CCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089218;
	bh=9EhG+irZ1raMoJph1D3GAa28Wx9HFTnmcaama/ZjhO0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YUV+5+GyGNnKfqAZnrsbA0pX7nMD9rGaSatD8ai2l/vahfa+gfm/CwPVB/t8l7rct
	 H49D9mkldaMYMMe1X8bo04GLbrTCocXD0/HgeJoZjqs2K64QWv5UHNNONFcsC9pRpF
	 FrLVhgSDM1JM8eEscxpe6AMW9lXowNQskwuZniBXYzP/ct37AltNYrl/thqAN8T7wa
	 Y4lw47UBQSk73v9lDq4pYSv/tGRB1QZo7Vy0xvBP11PhMtQPTnTeKPhUctwssAhIOZ
	 wB9igOBTjQPiiBy46E4MujEa+t8cH11VvdIF6PDyfK2YopcoN0Lz1iwGWJCbmOIx5L
	 Sw0Aov/UHdpjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C16482CCA;
	Fri,  3 Jul 2026 14:33:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A75FD14F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DC96413A9
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXDXQ9Xo5yj7 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38BBB41396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38BBB41396
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38BBB41396
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-493bf73ec2aso3767645e9.2
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089213; x=1783694013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=svflYAgKxJD/A6fKoXLhNkzb4eNbnA8k6hwMa1oMCn4=;
 b=PutGW+okUebHKlO5vRJYPvG77FtVq5jz5colcUSGFa+lavqD9vesK+KPA7M9SQbBoB
 sHZfzKy+Vr2/V4upFWUYc9kKjOB3+JEHZfFe70RDDHDwLWPlB510qvTPqvK7ECFbaDur
 xJFCPiOvlQXnhN6iPUYJRfIKx2XghZr4fJY4y1NmCtowYlYeCD0MsajnFCRkd1dz7824
 Kv1EIQdqDWolALSM+cBrumryPFP0eU1MuNGTvDLPUiyqeuMhkyWc9tmExQLYDopssvNg
 ypXqKHXnljJRFroBf9dpYzdVXy0knunaJfkTxGJkMRkzry08QJAV7KZBuisEH+RXSouu
 j6vw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9yu82C55sgi61FryvzR8Zj8Aw3U9k++L/XTrCT7Zizi7421tQDRSmdIfdXKvSbgQdA+k7ULlxY+gg=@buildroot.org
X-Gm-Message-State: AOJu0YxIQZkHJ496X+KIxvkwen/QSLXM07HY8HA0pSgyQGULj3J8NYwO
 QPQiL7kXkUFcajYIZecv+vkGJEM1q5YtgeexyIfPnh+K532M9Xdl4DFNy9cel8HFoWR/UtkHm2E
 SfppF
X-Gm-Gg: AfdE7ckKMEwxhsPyoFxR/u/sI8BmCWBBQtXuXeHFm+zQh+yYsfhSe3pSqk4pKQnV9/+
 8CWlKYAyqPEox3m1COVlSOOIf4bhfoxoQxjATSVLpYaofYd0FvU2VILU33cB2/wtqCgkQYyaQRV
 nEhqWK56mubdF8KFE4mPU7kSrE7Qdfw3deLASLeR7as5sOKZZuF+5aYm8orWKPTSPLMEMnJWSAA
 +82cOleYsb1hLjpuNRxJSX3c4dRvoK7gK7JPHmAFNRl98U6ZJlSfZ5AE566XpgN7Vnzn0OmzZRr
 ZPsJWpvn22xU20hSC4eRarBSL+pK7jTOiOEIxvuyb7Coii7txaComaVUDZEzSVxJ3UhbLkhtt5P
 /yHwap8ix44cTIoiwMzLxNRrQDvcoaMV+FWiMt/cMzxzGLakzas+k2LJ6rMzp1foUt3qgBZHt8Q
 a+ZSb9
X-Received: by 2002:a05:600c:5295:b0:493:bc4a:c6b7 with SMTP id
 5b1f17b1804b1-493d0f4657emr1072325e9.39.1783089213095; 
 Fri, 03 Jul 2026 07:33:33 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccdb566csm52009415e9.7.2026.07.03.07.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:33:31 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:33:31 +0200
Message-ID: <20260703143331.276003-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260624125154.1869177-3-romain.naour@smile.fr>
References: <20260624125154.1869177-3-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089213; x=1783694013; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=svflYAgKxJD/A6fKoXLhNkzb4eNbnA8k6hwMa1oMCn4=;
 b=RAutKP0vaGbxvOU9kT9CUQHWq3a68/7wEn0zBj+STTfHJikFBUYo8YszAzs1kcTD8x
 3vmYfL9VZdPPaEFiiTZHisR004ezVQ0UOwbZXxePnCOxnTprWgO9w/vdwN13wEoPmUZX
 8tU+xxxl9YZjE/C9pi1zGefQKlgn2wulHVkIzdkE8Z697TXjTCWmkjsXGMCskY83fuP+
 ftDR83aq5rS+OkMTtU5fCiyOIQMUjdtmiXQIXpDkndm2QZd4Gby+t0TUGXc+wPLKJ/2k
 EUbaDer2o5vRPb/2ARGVje9t4I9kYCUo9d8cb5Jdiu4RsyHd3pXCKEIsZbiBM26tlL5s
 mrgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RAutKP0v
Subject: Re: [Buildroot] [PATCHv2 3/3] support/testing: TestIptables: bump
 kernel to 6.18 LTS
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
> Tested-by: Fiona Klute <fiona.klute@gmx.de>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2026.05.x. Thanks

> ---
> v2: update to the latest LTS 6.18.36 (from 6.18.21)
> ---
>  support/testing/tests/package/test_iptables.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
> index eeb4ccb5dd..918fa4fb29 100644
> --- a/support/testing/tests/package/test_iptables.py
> +++ b/support/testing/tests/package/test_iptables.py
> @@ -15,7 +15,7 @@ class TestIptables(infra.basetest.BRTest):
>          BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>          BR2_LINUX_KERNEL=y
>          BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.82"
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.36"
>          BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>          BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>          BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
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
