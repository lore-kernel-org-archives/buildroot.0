Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F365EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E3926148E;
	Fri, 13 Feb 2026 19:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xryLQ-eshUy7; Fri, 13 Feb 2026 19:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B338F61767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011620;
	bh=17tKjoqJZghbyPv33+GzGfHD0LyQhFq1mFLH3jwGQjk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EXztzc98sB9qzNNPtFOSvI21849Z11cAYxgIEOP5oIhif8cykENZCEE7Kt0ywJ5p/
	 HCemChuWOf65kTauHL8pXxcZ4BRTLTzDIsR34Uxvc/cup9iIIV3m0QVuz5LW22p1La
	 4L5CXcn5tKBBTjPbivmtBRwew244AslkMGKBTGKYTQHbSuu0yhV0iYxIDf6mXPmuLZ
	 vgyrACmyjYXn1ek0jRg9SppF1JUUesGVkfAwteL3a3id4UCYuDhRCOskvvsPGyjeJ9
	 22sbeVZwa2OnIw5NPwz+fHxp+X8CpdasPI3q+wTDbRakI8BIu6VEAkT50JuPzhevwR
	 HlvEvMSWCONdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B338F61767;
	Fri, 13 Feb 2026 19:40:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AF0E69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6471E4129A
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQ3VOswi9TyJ for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59BAA40407
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59BAA40407
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59BAA40407
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so14408025e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011464; x=1771616264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P3MbU5ugSQvtoEd3lyF4SfDmweu/mjeYyF9E7GhneOQ=;
 b=dQhtNR6bwCduDE1wsW1b2RENCgSvHEnFrbie0r2oXrisNbB9DuD0cXpRAimdxNpBJW
 tpBF3Rsv6ziDywka3+CxwkfKNPe4bvv/S3u19xaH0FcV1VU6B9yJZ8drcHsr7TC/tkPQ
 1dKEAB0esOjH5P8j95/B9Db/PvmYMesyzygPDtGWFmGWd2Us8thwIiDgmVHoy48FRz0m
 3H7cIMTMGGr1eqLfYpU8iN2P0nhO7SiewOkLubRJqpB3TgtG9YEMTYKGtbBnSXWf04KK
 iUc2rtJdEohtw2SqDbRRYx8PyI03ESTXtIrKGSytnKJ+4btgkhiOv4H4/Bo6QaHKl/13
 50dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh6/6RuHCYF+BNuHtSNTTJTWJIsGK+NmWg07b078Z0zvMbcMUs0WBUAsTOCmJCtwmgjX7qbUN6NM0=@buildroot.org
X-Gm-Message-State: AOJu0Yz6l+7C42ErGwfe+3H+lw8Wx4/yqQx7PMVmxm5L3aysLqoAeka/
 5GrAGfnubS/ccW4FOqmPOW8zQWpyiCJ1StQH9GKQQEdh4jhpty3s6HhreVzl9uzw42g=
X-Gm-Gg: AZuq6aJAeRcqJe9YvogEkyvTZAdQLh8dlbqashJC0XA8MLT3JUSCB/zuecJRvPW1yKo
 zaKCIcx5oDJkFfNdpSnZPcLmtdkaREUdUXwkHHv2L13cmgSqIJliDIpwRJoeS2eBewpI/dZ3WuN
 6LBHDzlDHHY9WONvYcE/3XcxdVqO4PpFdj586t4sZJ95Q2bDK2aR7uIhbWDU2nZn+H8izJ8w1y0
 kNILDTSPBAYNy6ElDWbzLl4HJ81I4tSadIFksLyLGP49wLH1msm79wkD61ShiiJVb7hVD+p36nn
 A8WZbKcLuREOTJHb4cwkbCIyuxiK6fxL8HC115yQf5hp8C4rXbEsapzrhBOuwOnUamRz6A7JfI+
 Z6GNPcI2GPuRe2zB78IDgJ88F1YKEi4Pf9F9BG0DXUI7JBXN+LydkBmDV8b92znHrQR4WACDElJ
 iantxBny9P0YxIx6uPSwf4HHfxpg==
X-Received: by 2002:a05:600c:1f91:b0:47d:4047:f377 with SMTP id
 5b1f17b1804b1-48373a69e47mr46787495e9.36.1771011464355; 
 Fri, 13 Feb 2026 11:37:44 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5b2d1sm8703530f8f.4.2026.02.13.11.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:43 -0800 (PST)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:43 +0100
Message-ID: <20260213193743.40461-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117104516.87829-1-ju.o@free.fr>
References: <20260117104516.87829-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011464; x=1771616264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3MbU5ugSQvtoEd3lyF4SfDmweu/mjeYyF9E7GhneOQ=;
 b=Yc6bze/fYgwl2p/y3lt9loD3yN060gEbgQuACXnu4wNX9Qse4IZ/c4nCpzLsoW1nGG
 KHMfcItkUl2zNC4cmEsAuzGSnJU/y25XLBS04BiYAu2bqlYwScMxceYxs5mxWTISYaIK
 88qpqv4rOXL1pTLdxNJKniH4Zet7PHzOPOXbKCUuLQqNyVIjYusVnYI5rCG/iwyPDPLf
 gKI0nvP/DUJVt1cLUk7Yf0TB8YedtxyNr3WtUODXe0ORoqtenXdfd/gBXf4o32K2huKf
 OE5bCFug689/xkwB6uS2p9jXsKucPe6vzB/raWKYEJ9BwaC2TpvPOcrBmlE60hAacc2G
 abCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Yc6bze/f
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: always disable man
 pages and translations
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
> When the host system has asciidoctor and po4a/poman installed,
> util-linux detect them and automatically enable manual pages and
> their translations. This can significantly increase the package
> build time (in my case, from 20s to 1m50s). See upstream
> commit [1] and [2].
> 
> Since manual pages are not needed in Buildroot, this commit adds in
> _CONF_OPTS for host host and target variants the options to always
> disable the detection of those programs (--disable-asciidoc
> --disable-poman). This will always disable the generation of manual
> pages.
> 
> Note: Buildroot attempts to globally disable documentation for
> autotools packages by passing various --disable-docs configure
> options (see [3]), but those are not recognized by util-linux.
> 
> This commit also reorder the options for UTIL_LINUX_CONF_OPTS.
> 
> [1] https://github.com/util-linux/util-linux/commit/9acfc349e0ea68a92baf818cc659121f40ab9c04
> [2] https://github.com/util-linux/util-linux/commit/236421a49103ea510bcba1e7ef90b57d24aeab76
> [3] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/package/pkg-autotools.mk#L184-186
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/util-linux/util-linux.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index d0a03be404..af6044af32 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -47,8 +47,10 @@ UTIL_LINUX_DEPENDENCIES = \
>  # system is not Y2038 compliant. util-linux will support year2038 if
>  # the system is compliant even with this option passed
>  UTIL_LINUX_CONF_OPTS += \
> -	--disable-rpath \
> +	--disable-asciidoc \
>  	--disable-makeinstall-chown \
> +	--disable-poman \
> +	--disable-rpath \
>  	--disable-year2038
>  
>  UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
> @@ -57,6 +59,8 @@ HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
>  
>  # We also don't want the host-python dependency
>  HOST_UTIL_LINUX_CONF_OPTS = \
> +	--disable-asciidoc \
> +	--disable-poman \
>  	--without-systemd \
>  	--with-systemdsystemunitdir=no \
>  	--without-python
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
