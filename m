Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6C6EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3EF161746;
	Fri, 13 Feb 2026 19:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCs32r7ml4pq; Fri, 13 Feb 2026 19:40:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 830BE61483
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011604;
	bh=YexuCrYRXC9w3pzsYmxBiFMSYOFQU3rCKuYFvBhA46Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OMom/4pumY7ZffBqzAfJrbeiGpjCP6Kk5BPfkRD+l3NYBf6uDlsM2U2z23k75pNml
	 +xZJjLAsiRuCcZtFNG22K8xrq0YfvzvPz3wkLHBfFmzwW3jNF6fK7zGiZ9DP6UE7DT
	 znh5bylPPsVCKv//ap0pAX0Dtz7BsGq8+MWRlc/veTv8K+0WpFdxAhYLzZZUqixV6K
	 c8+pFK0wEkqb4Fiv5+WhVXB3AfYiKRv/R+S8dxyaB9JResleEXi0r76THBlGa0sFIW
	 U241dom7lox0WvWFuR1NG7ZDv38yy7HaWbCAIrnn29UjcZbO3b8baP93YBaNY16n7H
	 NHLfyNiEPF6Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 830BE61483;
	Fri, 13 Feb 2026 19:40:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 538A1EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50CF66165B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PdXc5zTW1Nn for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5453961655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5453961655
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5453961655
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:30 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4376acce52eso906038f8f.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011508; x=1771616308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fq/PsJjwwYunSbFh6E3iHnDHzISp0dxB/ruuRdhskig=;
 b=iCY6+zfFEhRb2IcjiT9k+Czd2FwGLCeB4Kap1RceB04sJtTj+LUe/DWW9Vs5NwoemL
 HNwsyF1r3i2ssCz6i+aY/FWfqNqWxYH/yMlG8QDnWvRojUtDKPX780SgoVoAZTUZSdg0
 +0Pl6ScJ+QT1BmH+7RFA5shkhbNnf0FPo9nJe+yCTyOF4RAUYg8isZnJ1rfLOqKda17E
 vuQ7RW1a1HBKgiFG/baY2Cd2NnBpNYYU0CjLJ1HwNUD5smzQ9LSC4xh4V1uIN0wU+YaH
 F9oxpuvNJYbN0qMkh1BrTBIwH/TLYoB8/5DKNzRqoEZj6692dKusoFMmy2/7/n+q4242
 s3tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvcG4+J9sLw4yurdTbBM+8N0xAP7Hv749M+ZzSK3UjxoGrrdb9lGCeXKzvP6RHqIpYnOsmvG3bAQ8=@buildroot.org
X-Gm-Message-State: AOJu0Yy4zALbBo2Av9Uys7UJp7SJ/oGZQOPXv/EtngfCuCnmeil0vpYG
 QU1N35KsytOelcqmLDah2zWSOLpsNVi/e1FjLRekYowM+2GkScMYC9KqM14derWzokA=
X-Gm-Gg: AZuq6aI7fDTbjO19B0UOmA53x90DVHpLkeScQiLHcqbq5xNOyLRdllg92zcP2eGo7AG
 hTcJZntBmKKzdwW8eWF4t5JMTcSf6SvNDStsPribjOkIhTOtR1EhWE5dEoRHpUQH2uMFOgIu3Q8
 ohpUFVCrKiHOOYTYyumJMlwMLRysP0cffPPcS2PM6+c6iQHXMhBsFrquqlTYDtJ5bCM1FqonEP4
 Q47niq+miLAuYAOH82d6dc+5jU64sfq5hTmOBacPvYZ0SWKLBq2bo9Ui0Jren1cE4vHhbObYzso
 3drgsi5000KdCbDmbPQeEu5OwOOzJbES6PAqx9UDOv4mNJQP9tAJ2d8fneBLaOoof6qCV6n5r0N
 Cgpbus7EouT3RFQVjTBHfO27hg6VT/vPHEAkzWe8KXbSBCGub3G7rwjvdR+8mpoY0o7+AXLYUJm
 H+wWdi4r0Y1MCMIoI=
X-Received: by 2002:a05:6000:2311:b0:435:a258:76e with SMTP id
 ffacd0b85a97d-4379793dd5emr5710070f8f.60.1771011508353; 
 Fri, 13 Feb 2026 11:38:28 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abcda5sm8816849f8f.19.2026.02.13.11.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:27 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:38:27 +0100
Message-ID: <20260213193827.42475-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203075820.1945913-1-peter@korsgaard.com>
References: <20260203075820.1945913-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011508; x=1771616308; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fq/PsJjwwYunSbFh6E3iHnDHzISp0dxB/ruuRdhskig=;
 b=fqtHGDOdyTj8hY/WRa+qvXu/8zptccHmfcRXg/e/GgefdJFHz9WlD11uS1QMjXFS4a
 9szFKNYPR1CBqumNUg0Q+uTxtFT6Whu6LKsKb2oYmijtyLSiYw/O2YfbVsKZsQbVaLJD
 m2kNY0GXve0lVrDeAzUt2umMGWMJHfj2KUWrd2IxoLTMvJjMG8PeGwJR/ew8dShX4O4+
 rIRxn6QF0bjJa86T+hpvJAdJfKBPgR0WjWM/tP2aclwsOyk69NKmyXfUnRPFhTPBQQws
 N3M5bP9mu+v6HsqZV9wWdz5otIDzksVujO2ZBPE6kkJNdlahODuQkjZFmI8SLewCRE2q
 mTYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fqtHGDOd
Subject: Re: [Buildroot] [PATCH] package/mpg123: add sdl2 support
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
> mpg123 supports (and prefers) SDL2 as well for the sdl backends since 1.26.9
> with:
> 
> https://github.com/madebr/mpg123/commit/792615f6512a0908081b5a2e98ca61f8677ed452
> 
> So support that here as well.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/mpg123/mpg123.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
> index 2f04e0f979..23e061614d 100644
> --- a/package/mpg123/mpg123.mk
> +++ b/package/mpg123/mpg123.mk
> @@ -64,10 +64,10 @@ MPG123_DEPENDENCIES += portaudio
>  MPG123_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs portaudio-2.0`"
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SDL),y)
> +ifneq ($(BR2_PACKAGE_SDL)$(BR2_PACKAGE_SDL2),)
>  MPG123_AUDIO += sdl
>  MPG123_CONF_OPTS += --with-default-audio=sdl
> -MPG123_DEPENDENCIES += sdl
> +MPG123_DEPENDENCIES += $(if $(BR2_PACKAGE_SDL2),sdl2,sdl)
>  endif
>  
>  ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
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
