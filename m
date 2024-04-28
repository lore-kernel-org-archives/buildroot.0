Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4D7C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 17:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C8B681F9A;
	Sun, 28 Apr 2024 17:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWVs5tjI5D89; Sun, 28 Apr 2024 17:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 414B381FE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 414B381FE4;
	Sun, 28 Apr 2024 17:18:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AC791BF5A3
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 17:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 333D881FE4
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 17:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ch3ZkOdDXaVh for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 17:18:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C61C081F9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C61C081F9A
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C61C081F9A
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 17:18:15 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-34b029296f5so3893651f8f.2
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 10:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714324693; x=1714929493;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oZyvFlxt22aFl+v4TFikwWiE/Ri9aYLcwxJGwWE8Wkk=;
 b=pxCyvEG/3gDJTAbBTG2akASO01GjPCTACQw4895joGt8AY5z98CaaARbQ0s9Ps0UFo
 TvtLjHBcar+2evFhkfurpK529+v6tPyoJKSh3yPx4CYFtp1+03yeAQ6qnGHRP8zbli0w
 qzq+beZwwxCwFh+UFYc7VN1SdE/FM3X9Knnxs9muwwZwmuwHmpdhSJgMKW0+U9rsgY8l
 YgbXYyXlCKumf/F2E5u3issAjMxeOQLV/IaVT/aHmX4eraF8L61Je2Z50NuYxv3rF8i2
 tF/sVuFAVz6bNg2ySV3ksgYYOUZczsdz1I0+JmIQDvsHCiYc7mkNc6PI/mG6QDOoHoyv
 t9og==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9udMrdRZ0+d4SImyMAML3r5i4glKg7kaFZ7GDUkjK7vLRsRrLXHsuqCW8F8Yh7l1bks7l0IwtnrTQaJZs2sWn4fTScDGJ/Q==
X-Gm-Message-State: AOJu0Yw/vulr6N5VhApAo4WA4GLYtVQITXhvpioloZdtoZ8x4+LXKy5d
 KY3RwRuYVTkW5SCs8oJbLe+gb2etxHN7nskt8q410w1iFqm1e8a4YjhavNjuYLOj47gbhXP7AmC
 n
X-Google-Smtp-Source: AGHT+IH7y6Kp2OA+L7eMI5ohT9Fkx4Wbs293pGW+Vqm/d0SJIOdor0vagjpbEQ2Bq2nyr4QBlf5IDg==
X-Received: by 2002:adf:f992:0:b0:343:8551:8d90 with SMTP id
 f18-20020adff992000000b0034385518d90mr5806148wrr.34.1714324693085; 
 Sun, 28 Apr 2024 10:18:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a05600c4e4800b0041bf7da4200sm4558053wmq.33.2024.04.28.10.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 10:18:12 -0700 (PDT)
Message-ID: <6446e4c0-3501-4875-8a89-4db3fb369911@mind.be>
Date: Sun, 28 Apr 2024 19:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240413074923.1082313-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
In-Reply-To: <20240413074923.1082313-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714324693; x=1714929493; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oZyvFlxt22aFl+v4TFikwWiE/Ri9aYLcwxJGwWE8Wkk=;
 b=AQjgIgjbkky4pCzccw73r3wjQZ/eVlBOsFg7Jgq+AakKqnjxmaAguBUJw+vj3bWQJK
 mxSlgxBlFxqveFRzIk3j5JBsnZOsWQRbmltg5f4x/gPDOwoc77La/Rrzp3zRNQbVGBVi
 iFoSmXRd9NHPcnrdgxAiR+alyWplwJDJ4axBjX1+9bw8ajO2Y1PjOUKUojWLiuyUPtzp
 pbkU869jTU9pGGj21aFmHxJgkqjvXd4N3jnFFoQChImKoJJg965CEmx5lfHvE49hAUQN
 Chd0efgnMlPJE32IXiNO0Vt8OH9tg2CprllDHVeGpQ7mptIzSmVf3VLok5cjYtgdXZp+
 za4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AQjgIgjb
Subject: Re: [Buildroot] [PATCH] toolchain: remove gcc bug 90620
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/04/2024 09:49, Giulio Benetti wrote:
> While building packages affected by gcc bug 90620 with Microblaze
> and gcc versions 11, 12, 13 built with Buildroot and external Bootlin
> toolchains without -O0 work-around it turns out that the bug has been
> fixed. So let's remove gcc bug 90620.

  But a custom external toolchain that uses GCC <10 would still be affected, no? 
So you can't actually remove it? You can just remove the
|| BR2_TOOLCHAIN_GCC_AT_LEAST_11 part.

  Regards,
  Arnout

> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/haproxy/haproxy.mk                   | 8 +-------
>   package/qt5/qt5base/qt5base.mk               | 5 -----
>   package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk | 4 ----
>   toolchain/Config.in                          | 9 ---------
>   4 files changed, 1 insertion(+), 25 deletions(-)
> 
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index 61a9ebebe4..697dbdf4bf 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -74,15 +74,9 @@ endif
>   
>   HAPROXY_MAKE_OPTS += ADDLIB="$(HAPROXY_LIBS)"
>   
> -HAPROXY_CFLAGS = $(TARGET_CFLAGS)
> -
> -ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
> -HAPROXY_CFLAGS += -O0
> -endif
> -
>   define HAPROXY_BUILD_CMDS
>   	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -		$(HAPROXY_MAKE_OPTS) DEFINE="$(HAPROXY_CFLAGS)" -C $(@D)
> +		$(HAPROXY_MAKE_OPTS) DEFINE="$(TARGET_CFLAGS)" -C $(@D)
>   endef
>   
>   define HAPROXY_INSTALL_TARGET_CMDS
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index e173639cca..d6445be9b2 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -50,11 +50,6 @@ QT5BASE_CONFIGURE_OPTS += -no-optimize-debug
>   QT5BASE_CFLAGS = $(TARGET_CFLAGS)
>   QT5BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
>   
> -ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
> -QT5BASE_CFLAGS += -O0
> -QT5BASE_CXXFLAGS += -O0
> -endif
> -
>   ifeq ($(BR2_X86_CPU_HAS_SSE2),)
>   QT5BASE_CONFIGURE_OPTS += -no-sse2
>   else ifeq ($(BR2_X86_CPU_HAS_SSE3),)
> diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> index 2126d3c915..f99baa1be7 100644
> --- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> +++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> @@ -20,8 +20,4 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
>   QT5XMLPATTERNS_LICENSE += , BSD-3-Clause (examples)
>   endif
>   
> -ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
> -QT5XMLPATTERNS_CONF_OPTS += "QMAKE_CXXFLAGS+=-O0"
> -endif
> -
>   $(eval $(qmake-package))
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 944e573f82..de5ef7a08f 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -170,15 +170,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
>   	default y if BR2_microblaze
>   	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
>   
> -# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
> -# ICE: in do_output_reload, at reload1.c:7978 on microblaze.
> -# This bug no longer exists in gcc 10.x but reappeared in gcc 11.x
> -config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
> -	bool
> -	default y if BR2_microblaze
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
> -		|| BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -
>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
>   # ICE: compiler error: Segmentation fault on Nios II. This bug
>   # no longer exists in gcc 9.x.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
