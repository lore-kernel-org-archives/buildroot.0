Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B308BCD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 893EA41BED;
	Mon,  4 May 2026 14:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBbUQ6ZT68Ra; Mon,  4 May 2026 14:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F406341BDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906067;
	bh=BQt8+K1gBUfn9aBjcEwltJLZcqbYSNfZIc5+gNsOGGI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pkhjfDNgDJb8oTfAJrG33xMSHjdcXeCWxxpR9BtJdtiW/pLfi6Eb5HZnHVIViQ+j1
	 Z2k4XbC/5sxtAorQ7COZnU+qcJGFRCbRIWfR/uGgsHBTyotV0xLBC3g3/4lKdbjItd
	 OubXM4YaXRemhKonbsYjmKUAjbXDr7YXAq3xpqKm2WtinIdRkpJGeNyPKBwtT6gHHr
	 EbH9MhS3veumKsfyZkRA2lCXqILhRN8KiSQDtO1gR5wx+49WcHGiDovVXU7/raMgYQ
	 42vFTFwBWcBQgt1zBhAqixqqtN+vvTf15zHO9A0Ofrekaxeiol22QYn+dXtqCdhXk0
	 wQ/aKBgYBgwug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F406341BDF;
	Mon,  4 May 2026 14:47:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B591190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5E7F41BDD
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrmC5V5QxRsW for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27BC941BD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27BC941BD7
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27BC941BD7
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-44e1860558fso761787f8f.0
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906062; x=1778510862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4YWtV2hR8kmhXejSfroewsCe6zfRBgDidZJGCelmhic=;
 b=qoQQ9KbBxvBzXpgK5qFSQYwaD/57hSPuSOxL+a19LSzwgfJeiuCkqZZwTLwiYsIiWn
 x9u/LQdyfEdOd/NIB0Rf6QgR8TOZNo8XW1dl3TBJiEPHHVbW6gyVvLCqCX5Ze2D1dmqe
 YbQmWBqos8tWJVv/SsA+BOCwKGLpl1R3Npz5MjOEh1IzFga0iU8RL5yM7Y0p+1vtSJ2Y
 D9LUKjC2JFL0CDUOtQ1XAefy40o4fAgtKNwTiJZ4XOiMeweNVAhUxuVOpj78lzBh9Sxx
 WIo7B04LqeiZKEtmoomJYYiZmeHUC9PyQjOUf7ZK2CQwU1BUadTsdKM9yIG2IVxT/h1N
 KzVg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+cwquN24hAG04OKTu/RQmdvcPWTY0hXVnLrKLJDA0iRmr/u1g/Zxeht6fKDHl9UJXEHzGl9xqoxu8=@buildroot.org
X-Gm-Message-State: AOJu0Yzz9AYuE/56SPX2WP0hu7k4pILLEdxMgbLKDx4FfY/uTdbgQvmw
 FxcRuae8Uq+jc4CXGm/trpVRjLLRO6c6/Y4ouurqr+bV1SbPrjTh6ioaCVRYT7HbhGI=
X-Gm-Gg: AeBDievY0cqEnbyHsqefb25yrGD2eJ4RfQ3BuQrWBO7yKjw0RgkLStHT6c24Yx1I4zf
 MbcP1XhKSIiDfWFHLDT9xleyEbFxMnUgeatJb31OUeQOPhVhXs1iMykYDr1PGL3kmCQMSPE2BZb
 iN90Yyann2Qh/bL82o22oBlwqR43aR7EheP+GixjG/PRztz7fwlWquc3O6PI+t5VlpZy3iYo1pg
 m/9alvEQEnGJ65iPsm0YJ2JuzNvrLVcXQML1DlG7eFfvd6E+2IqztiBBasF2CUpEkKKhk35REaL
 3lsU9VQfp/0+3FeAG5ZRjaWBic+TJ/Y3n1acauwN83d/oRspnRfumtbbUGTMjFPpqucq4Mgjw2C
 1E1YCQ7yY3qSHqrVbr/7sSW68OOAdL7ZrQZHqQl33H7GsGqVu8M80QE6lrWxWs2045haLVATUMq
 ltaNabWcH1kQN+y+2LKnxf6uHS3P85EpZue4l3
X-Received: by 2002:a05:600c:154b:b0:488:936a:6220 with SMTP id
 5b1f17b1804b1-48a988a705dmr180157205e9.21.1777906062134; 
 Mon, 04 May 2026 07:47:42 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a986aa3a5sm30511292f8f.26.2026.05.04.07.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:41 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:41 +0200
Message-ID: <20260504144741.10108-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260421183845.2456995-2-bernd@kuhls.net>
References: <20260421183845.2456995-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906062; x=1778510862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4YWtV2hR8kmhXejSfroewsCe6zfRBgDidZJGCelmhic=;
 b=LTm+YQKUS2TZTu7Aa+JMGLDdPPEZ3D6uuN5xhbnnkzNyj7ixlyDIHMrbCVlRlucMbN
 Qcavbi8MVtHCfgckYeEGLxWg6Ijw0GLl2Ul56xcmrGtIxhrwBcid8YLf0lZTMv/7+d3D
 V4NXHC/0HZF0rTUZmyVvJEla5zb4mz40dr3OsTDpD0hW89KVQjcBpaVHllBof2wtzKYA
 hY9D58A9gMAv71lQvwhSyf0Od752O5RhT8XKdkFOGKyHAnv1hGzKIwWXC5qBgj64eFlK
 FydtLR8xwVkEyGJgmbWiKbgjEW7jQh6n4op0A/jVoSxIbEXXg1zFXZrm2i2u9B7ZVfgp
 +5SQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LTm+YQKU
Subject: Re: [Buildroot] [PATCH 2/3] package/neon: fix build with zlib
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
> Building this defconfig
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_NEON=y
> BR2_PACKAGE_NEON_ZLIB=y
> 
> does not build libneon with zlib support, quoting configure log:
> 
>   configure: zlib not enabled
> 
> although the configure parameter
> 
>   --with-zlib=/home/bernd/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot
> 
> was used.
> 
> The reason is the addition of "=$(STAGING_DIR)" to --with-zlib which was
> added to buildroot in 2008 with commit
> cc6562ff839502a65a3b202ffe7fa3c67bae0856.
> 
> The upstream code, which expects only "yes", all other values lead to
> the else-condition, is unchanged since 2004:
> https://github.com/notroj/neon/blame/0.37.1/macros/neon.m4#L478
> so a backport of this patch to LTS branches should be considered.
> 
> With this patch the configure log shows:
> 
>   checking for zlib.h... yes
>   checking for inflate in -lz... yes
>   configure: zlib support enabled, using -lz
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/neon/neon.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/neon/neon.mk b/package/neon/neon.mk
> index e7872df3c9..39abbaef48 100644
> --- a/package/neon/neon.mk
> +++ b/package/neon/neon.mk
> @@ -16,7 +16,7 @@ NEON_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
>  NEON_CONF_ENV = ne_cv_libsfor_bindtextdomain=$(TARGET_NLS_LIBS)
>  
>  ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
> -NEON_CONF_OPTS += --with-zlib=$(STAGING_DIR)
> +NEON_CONF_OPTS += --with-zlib
>  NEON_DEPENDENCIES += zlib
>  else
>  NEON_CONF_OPTS += --without-zlib
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
