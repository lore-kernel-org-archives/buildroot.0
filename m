Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B19EC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF9C860A7D;
	Sat, 30 Dec 2023 18:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF9C860A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4xneMd7QC2b; Sat, 30 Dec 2023 18:13:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28D7B6073E;
	Sat, 30 Dec 2023 18:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28D7B6073E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BDFA1BF29F
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D3DE6073E
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D3DE6073E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gn0D0YSGVqlW for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:13:35 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0930605B3
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0930605B3
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d5b159497so40627325e9.1
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 10:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703960011; x=1704564811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5p0CC7WSeMRneQDDliTucEZNYBCeF5Jfp7+jHbF9mrc=;
 b=fWI61q04HkBOOeepVPfuIF/Bksu0Ias7AJ/XnAFE5h/FmbRXRpyaAwTydT8TUVB7e5
 +piVWFLUFisxyKrPkyR3VLEZFiGBOIIZlbIxS2nZHDfjAGxLvKG000sxhwIdmmQVnlZy
 8uC043mxQPTjPzHZ2/oK2S+0DnAJhBvjQ4GHfTooahPOOeJKl/fmpBoCn1rZ0nKF6YFn
 5Ye/9W+b+bL8Z2Suknq01+FwmCoXknraIaHzix1s+lxX/Uxg/3wvoqBr0+JPbxrw+I3W
 BeGfIf9rdpx2utd0Mq2r+0guqpHlJUOqB9aYEq8Xl1YM/SjoO09PmkF2ni/VeoPD3stR
 WZAQ==
X-Gm-Message-State: AOJu0Yy82KdzJFP77A+ey+AxOweXzFNGH4vaE20z0aLeicIgynlg8oeV
 z7a2Jx29BnsFGsja9GZ/erlSsyr4qek=
X-Google-Smtp-Source: AGHT+IHacIM/5E76qX99QO+XmBmkWY0REZKqXlg2K3BjGBOmon2MRAYz1u2LhKOZ5gvjChVtPL7QLQ==
X-Received: by 2002:a05:600c:4c1a:b0:40d:3afc:9263 with SMTP id
 d26-20020a05600c4c1a00b0040d3afc9263mr4313778wmp.104.1703960011516; 
 Sat, 30 Dec 2023 10:13:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5d5311000000b0033672cfca96sm21930828wrv.89.2023.12.30.10.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 10:13:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 19:13:19 +0100
Message-ID: <20231230181320.982102-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703960011; x=1704564811; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5p0CC7WSeMRneQDDliTucEZNYBCeF5Jfp7+jHbF9mrc=;
 b=R85L3VAnzM0AfK4CizvfUXqI0N1S1zSp8kBfHCpurEOIFnAtV/+jtq0xCOSKrGon7A
 R2rWB2hckw4sy2NLniakZPvyRytmWr/n8iHVcJZowX27MxSRs0yvGSB1wlmSDS0xk/9D
 sZxwGeRvZE1Tp5W5JAWqMtlMIArZfRWMhpBbVkwvzU6zNPQt2Y5QsECbpMJY8YOdmmnU
 eqymqW5GVg0dzSCp34EGaeAp8yTax79Ag3sJLsnvIFzy2cvimIBjx3524Spt9e6ODEt+
 hb3EqErgoJIizi8LTdqidw14nKg7SmgQRiMQzDzaljQ1otW22vnuqIJ7Y2pAi+JyMAlj
 /5JQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R85L3VAn
Subject: [Buildroot] [PATCH 1/2] package/libiec61850: add mbedtls optional
 dependency
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mbedtls is an optional dependency since bump to version 1.5.0 in
commit a42e0e4600be785fa750c6b481c41a76d041df03 and
https://github.com/mz-automation/libiec61850/commit/19f2cbf0e7066753476ff8c38c07a6f0df73a622

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiec61850/libiec61850.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 4b61e40c6d..a3cfb74b03 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -15,4 +15,11 @@ LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
 # https://github.com/mz-automation/libiec61850/issues/442
 LIBIEC61850_IGNORE_CVES += CVE-2023-27772
 
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBIEC61850_DEPENDENCIES += mbedtls
+LIBIEC61850_CONF_OPTS += -DCONFIG_USE_EXTERNAL_MBEDTLS_DYNLIB=ON
+else
+LIBIEC61850_CONF_OPTS += -DCONFIG_USE_EXTERNAL_MBEDTLS_DYNLIB=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
