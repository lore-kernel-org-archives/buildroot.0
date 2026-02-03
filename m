Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C1CE8783F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 929CF40B79;
	Tue,  3 Feb 2026 15:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3KiNibL_RRnh; Tue,  3 Feb 2026 15:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 156EF405FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770132999;
	bh=A6bY7C+PzvP7d9Nq7yZOMrmt9uq2jQNI8U2zSqcjQho=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hqfVm92fpKgUyeWEkoZMiRQl0Xa8Zbfc2C4PwT+Aa4y3h6wgJOXdQ/bm2saZT5O2d
	 fcj2B0IM2Tn1wiRbntgNl8F5jWW+G5pll6rHAmXUAusGenFfee8MRV+P+WghTbdQrD
	 HhZLieuR4JMYe3E/atFalET5Z4FnoCthzcZQsmSzMrzeLXj5RTvKIkanuz1sEGxm3Y
	 RTjqO7vz+6PyVWuOwmrFtJU+Swgdx+sb7TSnefhBW4A5SZWnp7niL23VOkAi57HI/p
	 YMRupk/jOSuLmXweDKaTZvU9b+iWyiKXgywEfTwZcOdXLQ3sQaDbmXdNm1Z/fQrYwd
	 eqmZxyVzIxG1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 156EF405FB;
	Tue,  3 Feb 2026 15:36:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79C2B13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6844940498
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faSgFCOKsduw for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:36:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB395404C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB395404C4
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB395404C4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:32 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4801ea9bafdso26159835e9.3
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 07:36:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770132990; x=1770737790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v8ZHd7C7weNPQtU3R71YGi0WOpuvtzTiiiRH67aK2zI=;
 b=Nnrpt2c1Byk4UGDIXQUyDpSplpbFMLoNPxx9ne17liO11QmdKxJ7Gz7xPOVRyVnPc/
 CgIMahfabzAQUWFcRthSBnm5TOu5mFM8RyQRlYu1XaR2rNJ0vmNUmAGvqFY5U6NR67Xh
 U9iWyywVAVG+1KKynafTnkh35Su/ecPPL5x0PC9FWKXdKEYxZABs4m7dGKNcZBbBhjI2
 iBK1UiQDL/NhtJEhoUvoSFUn9T4zTt64s8j9cCE9PrMzabmqr8DZHE89hhcP0qV6nyq9
 SesY2c4U6V/e2I30AbLZxnV52dPMCqmtBbFK+Wst8HgdV0dOO2jlPbuMtgDWcYbH7q9B
 saJQ==
X-Gm-Message-State: AOJu0YxByWhGP5q9z6rhM2v9OwIbeFnjF5aCl4MtaN8br8QVNG0F1kxK
 8QedGZWHzK54eBPOj71TaZI99AX2pBzP0ftvEewTkCw07WyCV+JwUrx3eLvZ1xbU
X-Gm-Gg: AZuq6aK7C05EV6Hp9xjNaJFMLSUkcoyfx4z1m6JgDG4JCvXFBaYXqP4e7kDH42yFSYd
 SrA+P8ZjSKEH001uOjoTZKpeZa0GDXmPFOFjfC7gEQP+BbVdJHXDotNAhD3SGiDyaIa0ubB6mMT
 0tuaM9ZJcuB8BjPcQM8jI5/esGg6K9jdoCP+hWUh0x5N59eBKZbj4tsXERZmR2ahN6dfICIODoU
 1rftz6CwwuuSONWhyDVXlHvDfUVBIW1HKzk9y1tuVRHwpleYU5ZCWUKDHMqt8tTs8FVn/ovo9ww
 ScWC+AThhYZ2N6PUt3v4dWE7u7V2kStZuDHMnbNKjbJh2z46FI1Do+g5SE6uXDVQUQZDnLbRyj/
 1mI4zPBnID9HbeVJQs8OsYUHBY0sVVReL9N+cRKtXR8CShdOkXP00/N99iY0gFCPk7WhxHP+9mC
 pni6C4IfrirmrhELdocglfois4eYUXi7eoS6gY/Q==
X-Received: by 2002:a05:600c:a088:b0:47e:e4ff:e2ac with SMTP id
 5b1f17b1804b1-4830e982935mr347285e9.33.1770132990173; 
 Tue, 03 Feb 2026 07:36:30 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305161534sm62812055e9.12.2026.02.03.07.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 07:36:29 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 07:36:08 -0800
Message-ID: <20260203153617.80012-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770132990; x=1770737790; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v8ZHd7C7weNPQtU3R71YGi0WOpuvtzTiiiRH67aK2zI=;
 b=h/6BrMw2qSyGUXBu1k4oPTfwG2hiZnKXxXdamEtPC5c/mYyuOqx5lamk1hm1JOXh8P
 JS46QGY5lWs7c3USWTG+QmJU2PXy26op8KWzCgfNfw+YJPB9GvqP+QFceEd7Gv+sllFq
 6/8KHfwDray+7Lg7GWJxVgHr4yeV1uKJy5I0NwhU3O2lVIBSlNM4COhCn7YZRoA5awTr
 dWHxJghguK42t9EVhUS2grDDs3SHAMTAkPHBUsGUvnWTLe8oxyAmVv2UiHkccUenLEB6
 FG+3++5YnfS59Rkv+AogcunAuNFK5XRtjKfkzJX3P1rbr2PBSLCnZsVQMJiwar0Hyp1j
 +SiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h/6BrMw2
Subject: [Buildroot] [PATCH 01/10] package/freescale-imx: add i.MX95 support
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Introduce support for the i.MX95 SoC, which has 3 revisions:
A0, A1, and B0. For now, this includes support solely for the B0
revision.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 package/freescale-imx/Config.in | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 77d6547cec..c885b4fc23 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -70,6 +70,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 	bool "imx93"
 
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95
+	bool "imx95"
+
 endchoice
 
 choice
@@ -126,6 +129,21 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
 
 endchoice
 
+choice
+	prompt "i.MX95 Silicon Revision"
+	default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95B0
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95
+	help
+	  Some packages related to the selected i.MX platform need to
+	  know the silicon revision of the platform they will run on.
+
+	  Note - mismatches may result in a failure to boot!
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95B0
+	bool "imx95b0"
+
+endchoice
+
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	string
 	default "IMX25_3STACK" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
@@ -178,7 +196,8 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_ELE
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_UPOWER
 	bool
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
