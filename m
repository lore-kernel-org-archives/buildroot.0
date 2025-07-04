Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACCFC83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE1683DF6;
	Fri,  4 Jul 2025 06:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZO0Xh_6MZWG; Fri,  4 Jul 2025 06:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FFC580DFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FFC580DFB;
	Fri,  4 Jul 2025 06:48:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E60C1EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84CB483D79
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWFXBbxf4w7N for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:48:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29E9E832A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29E9E832A9
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29E9E832A9
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:19 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so406502f8f.0
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611697; x=1752216497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5pO+8P/Qvz6aYjCaDnaPnDOaZswX7B77IJ4GjUn2MpY=;
 b=egA+j0oHSRBO1yf3LUk7WW6DIz9ZlJW5ZDsVcl0GB323iv57sqDyh5CgrGqG7gPh1a
 9jCaXbzM0Jhrm3NIwVY/h4b/2A+KNrJOrPnffvGD2kc4dii8Q90N9802t+Gqxc9UikJv
 SWAj9uy/mESUkRe35pr90X/pduuT0XXztKFlp4BpAdMQokfqU7mPkOBfz8aVbFVz2gqR
 zd6BpT2fwmLXPfBaXGrV6UhHt1VhTskqq61uly8RZn2LTuBQOzGtGFSITAMR/iSIHTyf
 2K1KywJ6LbFCoUX/Q9AHN9TXDGGz7MyBVrTshIifDAqv2axRqq8b6GzBqHpcTX0asFw5
 U8LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj/uPs6eoPuvzQLtcc2HHqYHW/pBpAyxfLmNslCv/gxAMsoT4aXuX+ykHByUaLF8NVM1DgXoWYW68=@buildroot.org
X-Gm-Message-State: AOJu0YzA7mH6RmP+kmrGFezgJ9rcFUyJ2tb30GkzReJyvEBQhzmbVrKF
 A6rs1F0cqHZ9K3nrNtMwX7EQh+kt0H3oGQWF6LigBRDyZAYl53L4R7hyg/4ve50Ov/k=
X-Gm-Gg: ASbGnctc8c/MDLi3BauuNiIamOdW/YT3OMvMRjLQDNHL5MqRzZhkN6dtv/aYDDMWyZe
 0OPkhDYan/hxdVhRyA2rywRBJGrQkvX4XvjrtB2mU7hItPOAXilueuZUL70MUzvA08xv9wR17J+
 yUOhHiwDdfxXGEZk6+o10sXhdzklxelMaLJiSdCWdJxoG5f1MMENG+DfhPlJOO2SUn0s0jJvyW4
 QYqYxx9fEY4Xt3EVQVc3qtABUD0CiM+3AuxvYwBAy0S1DXax6SpYy3XVNkVgDVHbtCVBglOuaN7
 WO+xj2nK4XZ7AR+rloYnB6XS9XruiWYMmAnSDbrgJAUgkQ9EVUAmOzdYb7u6F2Lh5MzsbG39FoA
 xKoQxv8i8Ew==
X-Google-Smtp-Source: AGHT+IEqDMTQXidoN+l0WcdpnvG7k4Rpxh5eCkSOveLnD5tr+UQHMdh4G2glMiaO6Djhyn10ktLE3Q==
X-Received: by 2002:a5d:6f02:0:b0:3a5:1241:afde with SMTP id
 ffacd0b85a97d-3b495b9446amr1588490f8f.9.1751611697193; 
 Thu, 03 Jul 2025 23:48:17 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d085asm1637494f8f.25.2025.07.03.23.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:48:16 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:48:15 +0200
Message-ID: <20250704064815.4065692-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625163106.207083-1-buildroot@bubu1.eu>
References: <20250625163106.207083-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611697; x=1752216497; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5pO+8P/Qvz6aYjCaDnaPnDOaZswX7B77IJ4GjUn2MpY=;
 b=W99Y5E7Z4jdRQiBaSPmH37+btTBgbSEhyDumdeEEjXYRR97FzSV9IekJg1qU68ZRa8
 J+IB2fu3DHhsUz/Qz+KTMN98uKPWmTe7PUxgzmbWXzboeNBVJCSXeljuDP2REAvhWBby
 T9gJ/Em2yZc6jWhnDdimou3Olo7ic0v2x4LeACQADfhwL7AVShicE751msTmc+rQwY9h
 Y5YWMuVePXMqPgApGNa6BDYHRxd6LKrjkwXjlYT3yGNOilWOEMyRm2mVpQIynz9Fh0Mw
 i8Zr9vmnOt3E5S2gmR8Orm5Q0CbkRD7SuqEJvuQzJezERXduDS3l5Rap2wZJrN8yXgRw
 Re9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W99Y5E7Z
Subject: Re: [Buildroot] [PATCH 2025.05.x] package/systemd: bump to 256.16
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
> Systemd stable versions don't really have release notes, so best we can
> do is link to the diff between the two tags:
> 
> https://github.com/systemd/systemd/compare/v256.7...v256.16
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.05.x. Thanks

> ---
>  package/systemd/systemd.hash | 2 +-
>  package/systemd/systemd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 976d88c1f5..e16823ca78 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  896d76ff65c88f5fd9e42f90d152b0579049158a163431dd77cdc57748b1d7b0  systemd-256.7.tar.gz
> +sha256  2600db41d9ebd717ca786d754d17699038147b8fddaf15fc935f775a06c0df92  systemd-256.16.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>  sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 71fe0de550..bf0f2c1e90 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>  # - Diff sysusers.d with the previous version
>  # - Diff factory/etc/nsswitch.conf with the previous version
>  #   (details are often sprinkled around in README and manpages)
> -SYSTEMD_VERSION = 256.7
> +SYSTEMD_VERSION = 256.16
>  SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = \
>  	LGPL-2.1+, \
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
