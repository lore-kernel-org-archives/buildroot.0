Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DEECD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF9E541C2A;
	Fri, 15 May 2026 13:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyhbU4dOak7o; Fri, 15 May 2026 13:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D326041C2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852075;
	bh=DLQ+Wny5+Ld4dThO9tqTylhvZCcUk6iA3sh2hEzoJss=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TvtJhsewjfgAblE+1+nZHG+ikBIA/a6oY2jeGRAWYJveYtiaXuRA5gXWdMmBX4tyh
	 VhQ3G8TLlhtecwZR+3f5VE5BxIgQAWdcPjjP3ZOzO7vWwwpha2TgC2GlhLFZkh9zol
	 730sHomqeFLUtkJeQhvFM5RwVpalNbtrXG1si9ZOCdYH25VJp7zdWqTl4v0ZBod/EL
	 hGQIQryXv2leIHaQf3Idt34He6MkdBP8/FiaCrZ+/z/DN9gHn/h6nyFA9AEskXwhHz
	 ZsAtBlIoEf/52yA2pjOce5MCjP6R+H2pqvax9ALtqudlsfx/554dfaTK7Ti2zZCx4H
	 iqTq6eCG4ninQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D326041C2C;
	Fri, 15 May 2026 13:34:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43AB836E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35B0661664
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bb5IdtnVA1-G for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1240F6157C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1240F6157C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1240F6157C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:25 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so5936625e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852064; x=1779456864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6Vmua4+Kue4xG3Z9BZ8MDB7IrVZHHBjDLTvjDOw4/yI=;
 b=RpKZknPk/wb2dI+HA3IhVV48V96zP7Olyk8Mc2mKddZkN9jwPwx4AptWUj73V5B1xb
 il0FVQHhzwgkGXcm6iouECItu15Tghl8gvb55ektiT3Y7oPzrYCMLa4KQPMNqzAEwQk4
 1rVar+DR4ffoj33i76TreHthtXbx02etcPPKB/+EfzlNnLDsVXxVaEQGE2pYf6qAqTps
 5F04L1DP9Cr3QcUeX9Nu4nuONgIhIKMlxa8wE3wcdoYE4bSNtxUSnEwQn8ckwUYlaT9U
 jm1pHDGpWhLAKmrP+6+wMDVHc4Cts+63Vruh+xP3z7GADwNWM2zR9KMpwuPlkXrhNqiy
 33aw==
X-Forwarded-Encrypted: i=1;
 AFNElJ95iN/PXRykPMQzgrdzEMrCLQ/3bXZbgUdWgYL1X7uZv5Cj2FQ70tMYmWr0S6YNvmx3mWf96sGTABE=@buildroot.org
X-Gm-Message-State: AOJu0YyounNwCbkOkbkKAIQNu/mIRshKSYfQzbmMhasMZLFJq0gxW4wj
 7UBDCMVEPrgOUQ3w7yYdxExUDrAcM6E+RMudqVw/e5B4C4O+XkV3mbd0b1h7RedSy0LzsY074du
 56noF
X-Gm-Gg: Acq92OFzLSnqF3f+LPLPEMQIDjUeUxgIEpZ26jVDuTV9zdvY05C3gb/0rEZUuLwz2K1
 eH5USLyitK+RqnY+3mFy3mCj3S04V9a8YI4EVdi7Yug6YQVuHv/CnhGyhXIEsI655Gk3o8cz0jc
 tZOBSbSqe75tQvvvn7PWy/kRStWqc8adFFWY7iyJR6hDKcSXMX3lbOnm+eJUsOLAu61ewQ1bf85
 Q/h0UI7rd5hpuo9SGwz+MvqL+iZTqEuwhtkIHjQUZ6WwfX3wc2Dk6DGn+AofeElkP71PJjNBDbk
 74Kg2yaQZBpj1Vyd2JGRE9Big9dvuPPuPu6EZBQxgTPA4lLscEhLIsitK5PuC4dNPdcf4CrYeJ2
 +AMAh2hJiahW2A337KHXwbbp7xc4BlxtojioC8XHLOfO9o+il+8pWbu03Be0JW/hDXYRL3zXIfg
 sTO1LbKWlKRZVKgZzx5f9n0wm66LRbU5NhgIDC22vY/gOm
X-Received: by 2002:a05:600c:46d0:b0:489:1abb:5559 with SMTP id
 5b1f17b1804b1-48fe4dad784mr52333205e9.5.1778852063830; 
 Fri, 15 May 2026 06:34:23 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53767ecsm58159955e9.10.2026.05.15.06.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:23 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:23 +0200
Message-ID: <20260515133423.317151-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502170253.2852221-1-bernd@kuhls.net>
References: <20260502170253.2852221-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852064; x=1779456864; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Vmua4+Kue4xG3Z9BZ8MDB7IrVZHHBjDLTvjDOw4/yI=;
 b=CbjhcKCll6Dvsf5yK8lVcZFb071y8EXc/ry1rFttG1/4LI9o7PP+deKNJrybaCXRSA
 4827aqd9X8Pi8L6TfRFW8JoNgFT9iv+riThAVnbXlHq4OX6J30MB1TBfIiNUxFR8lVjI
 BrOGgmVaeHJIRc3sSIJ+PssEW92ZqQI8plErf/nBlFvUFmKxZVMFdjkpTFOweo0Bpj/B
 8kPPa/UFemqwjR3DC8+Jr4V4W4E/fr+JRJ4gKnlCYXI6nKaVJuV5g4/9UBhsVYDI9Ev0
 Yg1sAvEN4W4+rR+2rE18cPnxyN96RbZ24172GrYjm6TALSWEBbKN44tt2uvJpOdhD3C7
 bhwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CbjhcKCl
Subject: Re: [Buildroot] [PATCH 1/1] package/netsnmp: enable parallel build
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
> Buildroot commit 7643670052a7adc1c2a5f275664774c6d50e6a3d disabled
> parallel builds in 2012.
> 
> Upstream fixed the problem in 2021:
> https://github.com/net-snmp/net-snmp/commit/855e1c28dad53d6263c6c0c302438d2dc3128cc5
> https://github.com/net-snmp/net-snmp/commit/9ea3d8b93c9bb7da7fea13ee6c92356a6b82a5fb
> with version 5.9.1 which was added to buildroot with commit
> 83b4337354014a5425a0ee081b94d4d0991f8d47.
> 
> Tested with -j100.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/netsnmp/netsnmp.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
> index 4d3367e12c..0ec4cfaa76 100644
> --- a/package/netsnmp/netsnmp.mk
> +++ b/package/netsnmp/netsnmp.mk
> @@ -38,7 +38,6 @@ NETSNMP_CONF_OPTS = \
>  	--disable-manuals
>  NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true install
>  NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
> -NETSNMP_MAKE = $(MAKE1)
>  NETSNMP_CONFIG_SCRIPTS = net-snmp-config
>  
>  define NETSNMP_USERS
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
