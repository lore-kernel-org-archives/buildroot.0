Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD15BEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81CC141FE9;
	Fri, 13 Feb 2026 19:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CPswVwoNqr9g; Fri, 13 Feb 2026 19:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0FD441FF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011489;
	bh=ZEjA05JXTe23wM0WWlq1h2CTufsa/jkfoKSR5pKYt5k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Lf42ddsRRdHre0iMQ3y6W0Ka89fCcoSR4NG1+91Dzsu61JnWAoDB9FUfyirVQ+Tuh
	 YLbv1CA/nQCWwBAMoV8hdaAc9QGw8zKcI0AgYIMAguXcAOYme6RMbI4YktfYFhiaVd
	 T/2cBD39qFIrys0NUMl51BGMU4USZlZ9ExjSPvbMzoIfSSibA+fVFPDOehNNYlIRoa
	 kt3QcgLm2YUJb2SFvwGBdPIWtxw7/wQWydqVQqWHp1U7x7x2QSqHhkkXd2xO19NR5h
	 ojJ8BYBRDnTqPL9QEBYcRDi9tv4dWYXIn8nVbkAc3ebBqfbbuf0S6cTXd2zg1woO7k
	 g08u8u9Ol18/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0FD441FF4;
	Fri, 13 Feb 2026 19:38:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AD6FEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 110B741F67
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-nfgwMopeZC for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 214C841F15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 214C841F15
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 214C841F15
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:23 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso7403925e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011442; x=1771616242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=08wCcizU1eOg+ZJcmbSNZhVvvcdWEfwlh5hejlB8D9U=;
 b=BQWKzEdNPSKC7RyMH1FUh0xyBaMKiIR0gz+6v+OqEBrclCakM/BSY2CylwqtXvROGd
 aEfos7dScCAemGXjluoza3VB9c4j0U++BBWLBAqwrcdDOh+HvcdKXfBCkIqZ/mnRZ70J
 w9EU0LtHkkaMugX8YUoFf7Zkzrk5ejrCB/69DW6rE0WMhIwjFWt3vGWsDfzqBXBk5yAn
 UVPdnaFY5iEFM72pvu/q3Fpn8TFebnUbteGqt5YV3Kcm3sep2Mry6FH6uZMzxyDqamnL
 NUrR94/TgNYJsfE+09NpEbwNyct7h+CfuEOtMWwBKQR41g4T+KHMq1wtCN0bQcg3gI3T
 CBtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd0dNvWB2LtqYvSdTJ4QZp65xdu7A3T8zpWvYmB9BdANi4QH9ymzldL1BcqA8I2S3i7gJc3SJp4F4=@buildroot.org
X-Gm-Message-State: AOJu0YydRJpoBe0BeNdNUkfx8BsQiPWSmJJFgkEDpt+/WvW6F3LSoCTF
 is/E8GkNTfkUG29s/+N0F28hYedJUD9HVUWhBO5cgFjk5tj5kKux5SgG1HvyotO6pWE=
X-Gm-Gg: AZuq6aLozw8i2CZ1+2GD9d2KHGb40P3w1rGZ20QgkDTPreud/umkI4WJ0/O+bDW9w96
 ax18m1pH4MVtZufYupW4n2BpLUhUaeA0X+NnrOfbyI3JIMCKdc9dIToauu27F36fZAtQzBbsCkW
 w19HWPOF49OrLTZVtLmezMjm5bM+tNLX37ApP+QAuKqMkMyAWt10yz6dikAdEfsGH3zwbnyALpk
 B8OsyPeDENfQeeRl7Z5XFFYZ148+jAtmvkses7et5ik7csxzfU5eLP/Yw0dc71+SG5lukuMjcMU
 vZLkKqzF/ikYcvOhKCYBeypvzS6OJQT0q8Q5irKBd1gHHI9RNcPYKjU98rcnRyj2JS/klDCp0VX
 pClTjvEohdu8lq/xwhAv8nuanDrAiEWVxloGqLg7OTlpQT9dU6xB4+c4OXT8/7fgHLN5j/IRNgr
 ARUKPx0fQqqoWaSEA=
X-Received: by 2002:a05:600c:870b:b0:483:71f7:2767 with SMTP id
 5b1f17b1804b1-48373a13679mr44803825e9.11.1771011442096; 
 Fri, 13 Feb 2026 11:37:22 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8075sm7553111f8f.29.2026.02.13.11.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:21 -0800 (PST)
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:21 +0100
Message-ID: <20260213193721.39076-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250808133112.3212687-2-elmehdi.younes@smile.fr>
References: <20250808133112.3212687-2-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011442; x=1771616242; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=08wCcizU1eOg+ZJcmbSNZhVvvcdWEfwlh5hejlB8D9U=;
 b=hXehM/TayTUma+mEnXmoOBHsLanyiFriVLQUewk6R7GwGMGza8BLjRMZWi+wJUcHfc
 aZzb5cYLGkNwP70+pMh4RHxdFuVpEuB9X7aZGetGgFbIFIP/c3ktSAh6TTgs+RhoiPbb
 OyVjXBsoQ9S2gGl3A4V017lF/XzLr0YWTz+yJgdizUKEe0wie9PudCm3BGpWxYmdU/bd
 qBt0/xJYNUpUyWKx0BARaTX9wJYo68v6HaOttJxn3tJgnu53BFF6IHYSxcgHfDggNfyq
 PHSi6HrCyFfNvLzgmD55gMiJSj/YghGF59oni8Zf0Fs/fn2uk2yFUiCjKryrs+f5XTzJ
 fWPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hXehM/Ta
Subject: Re: [Buildroot] [RFC PATCH 1/5] package/rust-bindgen: add
 host-clang dependency
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
> According to the official requirements, bindgen needs libclang to
> parse C/C++ headers. Until now the tool was used mainly by Mesa and
> worked, but Rust-for-Linux explicitly relies on bindgen + libclang,
> otherwise we can't activate Rust for linux.
> 
> See
> https://rust-lang.github.io/rust-bindgen/requirements.html
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/rust-bindgen/rust-bindgen.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
> index 349d4c3670..0ec620002a 100644
> --- a/package/rust-bindgen/rust-bindgen.mk
> +++ b/package/rust-bindgen/rust-bindgen.mk
> @@ -9,6 +9,8 @@ RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION
>  RUST_BINDGEN_LICENSE = BSD-3-clause
>  RUST_BINDGEN_LICENSE_FILES = LICENSE
>  
> +HOST_RUST_BINDGEN_DEPENDENCIES = host-clang
> +
>  # The Cargo.toml at the root directory is a "virtual manifest".
>  # Since we only want to build and install bindgen use the Cargo.toml
>  # from the bindgen-cli subdirectory.
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
