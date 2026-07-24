Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F905C531F9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 14:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C0A260BA2;
	Fri, 24 Jul 2026 14:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJteAhfzInEM; Fri, 24 Jul 2026 14:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A928260B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784902492;
	bh=9gmKQdJSZ3/2S+SYPCZy5nc8yZ4lSUq8UK3GNR8Ieng=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jmVzIlL45G2Od4IblktTygjRFtXUUDQ4vRs21s0fe2MD+WFaxiZD3X38CfuHt+K02
	 t1YYeUYNqhOidif4YPcDTd7TOJRunitx5vtOlELvOb0hLA1MsW4lS1LufEgvlvw7r7
	 ArEQlAw7l33fb2APscEG1IqMC4JkyzefiZPJwoBBd4TXZ8vst1nwkv3y01cTIVw8Sy
	 Gbh1IPlm293XCgvCcoWueMBLfZS3dtH98SyVDqnI4ltf29bYc4RgEtFyMtaqoEPvkX
	 w3yhb4T73azm1DzHIfLqzZw4plT51rYPmcGvT2xFYT1yxif2TmSaR7Yj18i5ElPXMg
	 ZvWT/TcVAqU5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A928260B7B;
	Fri, 24 Jul 2026 14:14:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 823443B1
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 747C7810E3
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8F7UwzyFmk3R for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 14:14:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 73DE4810E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73DE4810E2
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73DE4810E2
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:48 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09aaso319172f8f.3
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 07:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784902487; x=1785507287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PMbRtlxgwLiCK4XN8B0yI6xR4PPwPXujQggbL2cBRrM=;
 b=W3dhyFAYIjJI04sMNpMkRaMHDo7N2CyqyPNtyKuY5MyErkO5fho5gqBIyr6nbukMqy
 O0nWyBZVq2u9xkeR1hB27MVxUPQqROgCkPUp3QTJauKo4nGnibkKxTQQ2C1NRd6uJnCf
 /4ufvDvn8DOWk/A6IfQl0n0YHCJ28RRIB5KqoQh7Q2m6FaGnJw8brqWSZ4YOs3bn+F1v
 h+egolseJdZnDPK6XK7a1defBkdquV63XwKMH3DgZ54/AuVtf02YksADLVVx5FvBGRXJ
 vXHQ7NTRD5NGZtbxXjGSyBDIj9e2OvXZoTn3Pdvb4NU9JYX+igKr0D8Z1IUxSBYyqRRw
 GCsQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpq+9lm855UXZiklOGbUW/+ht4VyaomNPVE5js9V2wG2nprxHCDun90wQdjQcuHhiqbUoGpOc4M9KI=@buildroot.org
X-Gm-Message-State: AOJu0YyrjY5rgjBYmwYuyvnWd9p04I60E2x0NsAxZkMIbtZEVJUjtDCU
 T6BRPsGVqH+KNJlVBKORJRbMnjmkm5SMcJxfjlovMBpIH+iLoEAcISITRyJINh1Min8=
X-Gm-Gg: AR+sD13DcjrkK8xWrgXNb8vb9MpJoefybID+fGg0u6Kx8smX7nrbOjHr2J/8F8mpdh9
 jmS6Jb9ZbChVAmy3ewniTMsu74+MIkLwLVemhDyA1Q1ZU3zrCkJpTS06ZW2f/QJgCVxqgP7PnAk
 zfCsRnOaNdPFsCzgWvqFkK7ZR5VDNWb0db2nAoT5uRaLCiDdIhO7zkgKrvU7WeqAOge3oEQ5i4D
 ZbynRRpOoS6kN5YgxnNyl5r4mjgn43gYw7yR36XbY1IsGm3DYj3P2OJCijMi4MmHR1/W2f5i6rU
 HK/kEO5Jy3YVzbw+ylTNIuqY2H1yc3qz261weVBlqVVVVqMp3VICMUlKp+kaXrqpONRbgDQSn9V
 RfY024KQ0NtxPDi1DQmS6/tVhMHM+hx+EI6LjrIpo17nwEC70+FX9EgO+oaCY+hNQN4nOyri9j6
 eNTMHVHA==
X-Received: by 2002:a05:6000:2483:b0:47f:9447:62bf with SMTP id
 ffacd0b85a97d-47f9447630cmr5722994f8f.2.1784902486709; 
 Fri, 24 Jul 2026 07:14:46 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c52fc0sm24424268f8f.23.2026.07.24.07.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 07:14:46 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Jul 2026 16:14:45 +0200
Message-ID: <20260724141445.477852-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718065215.928877-1-bernd@kuhls.net>
References: <20260718065215.928877-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784902487; x=1785507287; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PMbRtlxgwLiCK4XN8B0yI6xR4PPwPXujQggbL2cBRrM=;
 b=Ax10NGSwHLuCvK8HYbOc2KqHYK7pCwJsCNh/j/EK7+5ysFVcNXOlypwOJ/4dzndzdc
 rFMJytxxbT3BZRB+HgXiTNxyiheNANysIumKpJCiqPEo1PNejxs9LjKCE2Dcz/C7/AhZ
 mLa6sGXw86r09SAO7iWpFm0gP5VfjsnwDmDQ9Fcp/Tuf9mLdKMqpGgB+eSHXIJhDdD/v
 fc0y6023q9pklPS24QW4tO6pI3y+9dNZYMrjGUZ+hHqz2qLoQNAwOs5Dg5OM2OAh2xAs
 pbg/cmCg16oxaw3hpkaoNIv1Txy6M/xKv8JLCjIYmVK208Ea/416tMCwUGHTajTXh78c
 VAYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ax10NGSw
Subject: Re: [Buildroot] [PATCH 1/3] package/bitcoin: Fix static link of
 libevent
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
> Buildroot commit fabcd7c8cc44e7e03c68bfcd2b4e2d10331a93f6 bumped the
> package from 28.0 to 30.0 which includes upstream commit
> https://github.com/bitcoin/bitcoin/commit/b619bdc3303217f4415342fe60e586e18fa48308
> that was first included in version 29.0 and changed the linking of
> libevent libraries.
> 
> This causes build errors when linked statically due to the wrong order
> of libraries. To fix the problem we add a patch to change the order of
> the libevent libraries.
> 
> The patch was not sent upstream because libevent support was removed
> from the master branch with upstream commit:
> https://github.com/bitcoin/bitcoin/commit/35d2d0679782581cbbf05babc59f0f28858a9b72
> 
> Fixes:
> https://autobuild.buildroot.org/results/80e05370b6542ba2f5d2908bad7f420f76dc6831/
> 
> The oldest build error of this kind dates back to Dec 2025:
> https://autobuild.buildroot.net/results/6bb/6bbd822d55dfcf3862e8b713323e0f34f65990ee/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/8d17d8107a074b94d628061a3c18917987141483
> 
>  .../0001-Fix-static-link-of-libevent.patch    | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/bitcoin/0001-Fix-static-link-of-libevent.patch
> 
> diff --git a/package/bitcoin/0001-Fix-static-link-of-libevent.patch b/package/bitcoin/0001-Fix-static-link-of-libevent.patch
> new file mode 100644
> index 0000000000..8c8e95bd0f
> --- /dev/null
> +++ b/package/bitcoin/0001-Fix-static-link-of-libevent.patch
> @@ -0,0 +1,36 @@
> +From 28c3533e5fb350fe1c27cf06dee6928825bc7bf2 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sat, 18 Jul 2026 07:46:09 +0200
> +Subject: [PATCH] Fix static link of libevent
> +
> +Change link order to fix build error
> +
> +/home/thomas/autobuild/instance-2/output-1/host/lib/gcc/i686-buildroot-linux-musl/14.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
> + /home/thomas/autobuild/instance-2/output-1/host/i686-buildroot-linux-musl/sysroot/usr/lib/libevent_extra.a(http.o):
> + in function `evhttp_connection_retry':
> +http.c:(.text+0x1f7b): undefined reference to `bufferevent_socket_get_conn_address_'
> +
> +Upstream: Not applicable (libevent support was removed in master branch)
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> +index ad18115bbc..8e2a7bfcce 100644
> +--- a/src/CMakeLists.txt
> ++++ b/src/CMakeLists.txt
> +@@ -355,8 +355,8 @@ if(BUILD_CLI)
> +     bitcoin_cli
> +     bitcoin_common
> +     bitcoin_util
> +-    libevent::core
> +     libevent::extra
> ++    libevent::core
> +   )
> +   install_binary_component(bitcoin-cli HAS_MANPAGE)
> + endif()
> +-- 
> +2.47.3
> +
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
