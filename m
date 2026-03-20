Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF0810987A3
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB9EA60A3F;
	Fri, 20 Mar 2026 15:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veu4jUKW7FwW; Fri, 20 Mar 2026 15:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0716761B77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022096;
	bh=IQ7avQXG5Xk0Sqa2ZDromywxKCf5LQpWWQuwi3vAwSQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ng8V3zNWzGaOPcz9b43BkPwcgQ0Fw0AQaeY5S9xYEh1rmyftHDZLiCeyeiq+A3a6o
	 DqO+9/cTavKfg3GdwBxwoAE+WnKzYSYa54JI85eRFSbCwQi4H5q1kdgado5tOdOJHv
	 acrKKuxNvsVQmsD/ot1VaLHyE0HdBnBjMMTEip5TnrRJVx+OI4Ml7L/LBpJLs4YBy4
	 4QDt5mBAB5FqQbaJtvd2bAIFXcIewKQfYFPytttc+vUH/Er5jIK2vZ4zTTZlHdS/3Y
	 ZHv6YQm5RsC3dsUn5UC8bjiMVLAG6FzvBM12e6tIWpLKUI4XHWjtQa7k09z8DKxAyt
	 Xh1OfcQZo3ahg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0716761B77;
	Fri, 20 Mar 2026 15:54:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D8C91B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B186403A1
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9olwMaINGf6P for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:54:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 423CC40139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 423CC40139
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 423CC40139
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-486fc4725f0so15647055e9.1
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022089; x=1774626889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ocOKoUnm0hTGmLwF4QE1rrNZdAb2BQULObfQGcKCZ40=;
 b=l+dj1balsPnM0W0Zt/ZNB/ejz/BHgnEozoORI6x/AXw29iqyalzdFLYFIkWg8UIUJj
 Y3FFidy5LHDxVcmBLIpPFECW8iIQRNNstuz6W8QeD8DI6qo6+vhZs+g1+w7jScPXR2/U
 PZuzb1MPL/bj1jJld4/s/JANsjKoeuuPlkIh9wP1LS3dlY+F4F9eoqcrH8l5jhthrgUO
 pH+Ie7+YTy8lIKrdzScBM++6ctzZL3ERBD49C9xaGyLt1TSRBD5biweTUgenGxwO6cpB
 6lcTqA7tbFjMJ16/PxHDQ/OGWHf2bmJwuzm4hCaGyzuSDKsHBCle+lzd+LzRKmDFgT7e
 +TrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhcjcE/1zqRT/EMS5cmmxPtfax6SSzHEPpDF9zquuPoEUlZjZ+ttju6a3+Vo3iLs2iRLxoEB+alE0=@buildroot.org
X-Gm-Message-State: AOJu0YxI/mVVwp3WvC1EUyFqDeKAebLvh0k0VjZpcQgEXwKaEC6l9PJE
 SS/4ffTjbEUKLGXQNz9PLnnF2wbYkWaTLPeIE9dYY+kUQZmVm648U1gb3UPwHvB2u9Q=
X-Gm-Gg: ATEYQzx94LSjtVNzkp3UiXFUfDNwsRxYbCP1fuXUqhm18unzogsmFfovYTZhQq3yBXF
 smpf5dWDOgqpHt03tPZgBGtJBoIEUbu7s77TpALUP9O629nHwF3LDWXYZSbCKo3XYz21jS7zwQQ
 g6EEQ81EMhniXshiS26PdcRU/AsQDjMLosjC1V2MKDPFUIdlob8XPbJad4alb9G95iTPJ3RFR3X
 gbxDzq613XMf2b2qCuyTwDUSBSx2nmvrTjROMCQil3zwp2vTFOrytec5MnqP1UulpOdiBUjgz/5
 ZCinTqniQX5Xuco6oG3ibg0BTaJzAbY4AznjNnBn/sFzjKTEcqg2m87s0EL5FdXZWYnguLqvKnz
 00cmWzDof8t/vs0gkwL61EEd6cL1hr4S9Fbilui6JkwssHPb1pE3TYOYkkozsKbnYktmZuaG0vo
 OIJAA27c+YptJfoQZq
X-Received: by 2002:a05:600c:2d94:b0:47e:e59c:67c5 with SMTP id
 5b1f17b1804b1-486fe8c5883mr37296435e9.8.1774022089200; 
 Fri, 20 Mar 2026 08:54:49 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8b949a5sm136593715e9.11.2026.03.20.08.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:54:48 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:54:48 +0100
Message-ID: <20260320155448.176144-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313215044.2406044-1-ju.o@free.fr>
References: <20260313215044.2406044-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022089; x=1774626889; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ocOKoUnm0hTGmLwF4QE1rrNZdAb2BQULObfQGcKCZ40=;
 b=ewzcxSrZEZM2I5g1KeWY1z3Ff9OkuqDUHYSyHz6p1Z0dzTETf4ljaLzHnjQDAWhH0K
 BICSTx7IUxImlvkvNya+9FXjlmv0xb4Gbc8mx/q/+0TQHLgEAXI/0jDKEnBXsqEGDDT7
 6xoLuRoHBkA/aeH3YmSCBwTpnjWK+bPzPGZlmgb5N8kmcvTzkduLp11nDoB02CrGRp5S
 hZ/+aWp3SX/cdWqRD2iGaTh/z/vEBqQXYNG7FnRE5c1lQz+Mm+3WbQIud+m7b9ilgVuS
 WXzd6DAxvaWNuR6VLcYrE2C9LYE0TLtZMtlSiwMKjXou8KJTVae6xdSEzyDzuhM15Rck
 Lw1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ewzcxSrZ
Subject: Re: [Buildroot] [PATCH v2 1/7] support/testing: test_xfsprogs: use
 bootlin toolchain, update kernel
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
> This commit updates the test configuration to switch to a Bootlin
> external toolchain. This is needed to get newer toolchain kernel
> headers required by newer xfsprogs versions.
> 
> xfsprogs upstream commit [1] (included in v6.15) introduced a usage
> of the "capacity" field of zoned block devices, introduced in Kernel
> commit [2], first included in v5.9.
> 
> This commit also updates the runtime test Kernel version
> to the LTS 6.18.18. This is because the default filesystem options
> of mkfs.xfs were updated in upstream commit [3] to include new
> features supported in the new Kernel 6.18.y LTS series. The commit [3]
> is included in xfsprogs v6.18.
> 
> [1] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=48ccc2459039309cfbaf358febea53a86f07827c
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=82394db7383d33641f3f565bd79792fb41b1741f
> [3] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=54aad16b4b9b923442b4042afaba4438ca1aa868
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2026.02.x. Thanks

> ---
> Changes:
> v1-> v2:
> - new patch, separated from the xfsprogs bump in v1
> - kernel updated from 6.18.9 to 6.18.18
> ---
>  support/testing/tests/package/test_xfsprogs.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_xfsprogs.py b/support/testing/tests/package/test_xfsprogs.py
> index a3a4bd27d8..03191aa22b 100644
> --- a/support/testing/tests/package/test_xfsprogs.py
> +++ b/support/testing/tests/package/test_xfsprogs.py
> @@ -12,10 +12,11 @@ class TestXfsProgs(infra.basetest.BRTest):
>          f"""
>          BR2_aarch64=y
>          BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>          BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>          BR2_LINUX_KERNEL=y
>          BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.37"
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
>          BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>          BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>          BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
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
