Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1E2107BCF8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E9C760FF1;
	Sat, 14 Mar 2026 07:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q31apqyb82ma; Sat, 14 Mar 2026 07:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE22460FDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474861;
	bh=pykIyi6CbsuXzoRWEuZcMiEZIBKp9zniCxeiNeOTV3w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AuYtNcLIiE6EpyxI1qZO2gGRmqDZSzqaCXCxr0mXLWvobYHYlfKvwIUojmDbQW97o
	 lGniR8uwkC9Ad8MrWgJkQG3tMqYj/F+hLe1hA1aVxSpYpvjlFIb66YUEAVD2x7HJyQ
	 MSdp+arHvIW+35LCAlkqvm40LD/UUJcHi5pK4DOPurYuTeXWv+SopMChnqXyYBtDLy
	 XvIKD+Qf77duDSg9riNcuTaUVo4alLZXjXvJ9b468+FfTn04XxTSARNuYGUclEVeZO
	 7wHRHzB0DJu5R+21SW0M1iK0dTaN93PzorZ41hdx3pOXq1+RxKMCRGcaGm8g4bgdrQ
	 IZ9wHiKecHM3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE22460FDB;
	Sat, 14 Mar 2026 07:54:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE1E41B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D028D4100F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SWqld7T3kWDV for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B76FD40F75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B76FD40F75
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B76FD40F75
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so2301981f8f.3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474856; x=1774079656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jWGgYxs7ugSsTqsBU81KzmLGfchEK5y0ZUqx6Wh+IJ4=;
 b=aLOnHG78Oje6sBmsxiBFEt90CcDLa2txVU909/9CRoo6FO1Bi73bMCccmWOlcz20wW
 RdIYFc/aXjRq/CI6BUFVbGIlceh/5OHjWLzcm7KJjRW0z++Wgh+KgrFG+57j2M3fRUtk
 Ni3U8kRYPHi1P0clWOxQmooak40FxK0HgEs1BNq4KnQeAiA97jqKCoMx8320VJEmTpyK
 krLAX5VXuIupwxBgK7yL/XuaWnsQk1paoP/bTGqqWlpB/Bh8RSAZnrTE8BKomkHjFnJK
 OFzmUcr11jlOCKX1+WdqUYbJLkztcUm9NjLojYDldjfXJj0lEUbwFnFjS/5l8ivtlmnd
 sRtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcgGkSANoMjo7nAzP1j1JK87gxpxM9zdTLi/ONvp1bQjbbI8/79//uH/YRBwOgWPt/5HDKAWbZ8Ic=@buildroot.org
X-Gm-Message-State: AOJu0YyYJGcIO7xz3MgvXiuK1fWptdZGj92UkugdXExRqoUPUKrpIPpe
 wvxytMJCrW14GIvpAYiO2k9YPaN6GbinfTnY16639aqncqS/Ypeoys/dhCAa2X9GQpfrCcsheTL
 EPn/K
X-Gm-Gg: ATEYQzz9yaS4taxRxASdZbXnmS8aG4+924VIhTDXKVdjK7W1HLI/kP+VpMPryWrJBMM
 iGgedoUXSAEpnW8EV4c3rDU/UQlvCc3yh14+upJuyK0hVNv/mdtvUSz68d+R6or+zzf8tPlDM2p
 ND+TC7/TdIvAT7u/4qxNSp9AGrEe/qYSadeRRTv7rfWxMGrQr6LhHx9bJ5Qvek7dffK79hgY+Nv
 V2IvU5DTUpB+GLlFblOY1KVLImVLCNs21MBJgHzgUg5NXERn9zAqIN3YD6x97xd5Ij34OJeMyEv
 YrIa+UIV8WAcgLfBggZ0+mxCDBFKWFfnrsWqU+HTHwsaJK9I7tSG4PJZDEuzSihOU2LXwcRw2V2
 nezceGb7BIVXgsZJC9ZDalwBierfpmuIpLHMmNm0qw6AxIyQZ+VfzUjIdmmwOppcJ1F1EkHGTNM
 3b0D8XufNjl8vCSyM=
X-Received: by 2002:a05:6000:2584:b0:439:abcd:b317 with SMTP id
 ffacd0b85a97d-43a04d89241mr10586004f8f.14.1773474856414; 
 Sat, 14 Mar 2026 00:54:16 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe19ad9asm24773957f8f.7.2026.03.14.00.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:54:16 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:54:15 +0100
Message-ID: <20260314075415.15538-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308160344.2593517-1-bernd@kuhls.net>
References: <20260308160344.2593517-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474856; x=1774079656; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWGgYxs7ugSsTqsBU81KzmLGfchEK5y0ZUqx6Wh+IJ4=;
 b=Z6q/sc4LbOkA/FjrgiNWwpwk1os7BYrmxoo64kbnwBOfqbezYLJqOAn0vV3kMOTpx2
 i5d7fAowpkhF7JOuMaVbl81VEBcoi93PmWLRlTlHf0IgLJ8SjH+s9E9cHZ9xkmWxHR8B
 48/aIJgs+lzm594mD9ebOgrv6GTXm4KEE7OtjPTloRsEH06olCTGoo112nKdeD5Vku1a
 VwgLmiqk08LDm+mSWDq0gGqKNnXF22RiKrSp7iSwzbLj7tDrblpoVNx9FVDcHbeyFema
 5MfF8euxb8nDuoThNJCpyX10Y2hNoHoTpHiToxj9fSLS31IluxE8e8cbcWjTunVbpGwT
 ekFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z6q/sc4L
Subject: Re: [Buildroot] [PATCH 1/2] package/jasper: fix build without
 threads
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
> Buildroot commit 03a1732dea67e088ec85f92853ca14f5a3c0f7b7 bumped the
> package from 2.0.33 to 4.2.8. This bump includes upstream commit
> https://github.com/jasper-software/jasper/commit/91fca092098396938830fe458f57109f0dd58a54
> which was added to version 3.0.0 and causes build errors when threads
> are not available:
> 
>     message(FATAL_ERROR "Threading support is not available.")
> 
> because JAS_ENABLE_MULTITHREADING_SUPPORT defaults to ON:
> https://github.com/jasper-software/jasper/blob/version-4.2.8/CMakeLists.txt#L124
> 
> Add configure options to disable thread support when needed.
> 
> Fixes:
> https://autobuild.buildroot.net/results/870/870d6adbac166b22cce217628d477b1bce538320/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/jasper/jasper.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
> index 88633c9661..9ed54989e2 100644
> --- a/package/jasper/jasper.mk
> +++ b/package/jasper/jasper.mk
> @@ -32,6 +32,12 @@ ifeq ($(BR2_STATIC_LIBS),y)
>  JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +JASPER_CONF_OPTS += -DJAS_ENABLE_MULTITHREADING_SUPPORT=ON
> +else
> +JASPER_CONF_OPTS += -DJAS_ENABLE_MULTITHREADING_SUPPORT=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_JPEG),y)
>  JASPER_CONF_OPTS += -DJAS_ENABLE_LIBJPEG=ON
>  JASPER_DEPENDENCIES += jpeg
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
