Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AB8C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 05:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A14E41E59;
	Fri, 12 Apr 2024 05:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMEhO_tkl8Tf; Fri, 12 Apr 2024 05:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFE4A41F90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFE4A41F90;
	Fri, 12 Apr 2024 05:46:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 613CF1BF23C
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 05:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C2E78135D
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 05:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZlxyHjJB94h for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 05:46:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49E398135C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49E398135C
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49E398135C
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 05:46:16 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so2733824a12.1
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 22:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712900773; x=1713505573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XrPo72cgVezp/HFrBvVmaLH/D/vLG7vzA9DIRJ02DF8=;
 b=hiCY38eghnTEcaDQFoTy1um+9mzi0p1voa8MyDI+RgykZKEF2zvTrpEatR/kM/APT5
 h1+UPmneBp0QGfaAzDVExD/P/JScX8JBajFOHOBS0bdCEX6CImXMKPKopxrZUO4YMnIf
 Y8IgxAFTdY1BBNPpQqyOJZYrZsdZlNly0jAG0ApzD36hZs1KdsEB5VqutHfk4lL21vke
 bGGKmguyM3Mqpp8RbOTqylLHbdJQjgYDobYeh2TmeAMjQvMYF4iODEf6Nf6Vp8GlGCt/
 m0GNc30UbSswWfQA8W9+Si0pd6FFNzL8doX2ZHzNrBk4hOCp7EAJ2ocR6H+xDmgd95XA
 6fCQ==
X-Gm-Message-State: AOJu0YxePm46P0wodQeS38S7OECg588/8BK/+bu0IMKgkin4EhdAjywk
 THKRI5MoRiA+iOxr3JqN1n4OqjOvy1uIS78uCfXook2FDTg/T+8IG2Ov5g==
X-Google-Smtp-Source: AGHT+IGAg0cgQwSMbVIX1PzpYIGDj+VuRJvnFi9j4r7CWzueQfX6QcQf8PzYva8NT/j/raItP72NAA==
X-Received: by 2002:a17:906:d0cb:b0:a52:2d38:f08 with SMTP id
 bq11-20020a170906d0cb00b00a522d380f08mr1071328ejb.38.1712900773224; 
 Thu, 11 Apr 2024 22:46:13 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a17090640c800b00a51a34eba63sm1424620ejk.85.2024.04.11.22.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 22:46:12 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 07:45:47 +0200
Message-Id: <20240412054546.1350700-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240412054546.1350700-1-heiko.thiery@gmail.com>
References: <20240412054546.1350700-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712900773; x=1713505573; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XrPo72cgVezp/HFrBvVmaLH/D/vLG7vzA9DIRJ02DF8=;
 b=X3JMU/9Yo/favkD/exxAXxzablHSMqaFSCbkoiPSg4eVv+jzzE9t2gtolO+kg5QBMw
 LgSY7dx3yZ9efcz/QI47LtysX7C5EaP4pSTAt4jY+7jkKZ4aG+ioqo/CutTT0T+caCrh
 y5UT8QXvmNuSSpLkyilDyYi6HrdXIlGA58XJj5Nudlu4W8k6EqSMDxuPTzXHynSXxOG/
 mbz0BNvXWlMpgUjnDD2cKg8Iv+EBIgRK0UPGfHhohK1KX3YryOQ+h86WGdYxXNbnM3Hw
 0P9ldU5J2Fj4BVRRkcTf3lrBXNJ4TpeEI1YuNB9PD+mjIFwlXCVy041YsGKHTtaOauWJ
 CE2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X3JMU/9Y
Subject: [Buildroot] [PATCH v2 2/3] boot/ti-k3-r5-loader: add dependency to
 yamllint
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Heiko Thiery <heiko.thiery@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since U-Boot 2024.04 [1] binman also uses yamllint as dependency [2].

[1] https://source.denx.de/u-boot/u-boot/-/commit/10fee88d42f
[2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v2:
 - update URLs in the comment

 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 0fb07f2d65..891783e40f 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -35,8 +35,8 @@ TI_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
 TI_K3_R5_LOADER_CPE_ID_VENDOR = denx
 TI_K3_R5_LOADER_CPE_ID_PRODUCT = u-boot
 TI_K3_R5_LOADER_INSTALL_IMAGES = YES
-# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/binman/binman.rst?plain=1#L377
-# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/binman/binman.rst?plain=1#L377
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
 # Make sure that all binman requirements are built before ti-k3-r5-loader.
 TI_K3_R5_LOADER_DEPENDENCIES = \
 	host-pkgconf \
@@ -49,6 +49,7 @@ TI_K3_R5_LOADER_DEPENDENCIES = \
 	host-python-pylibfdt \
 	host-python-pyyaml \
 	host-python-setuptools \
+	host-python-yamllint \
 	ti-k3-boot-firmware

 TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)
--
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
