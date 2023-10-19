Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D290CCDB482
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 07:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 793A3424B0;
	Thu, 19 Oct 2023 07:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 793A3424B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSqDa0QNatfR; Thu, 19 Oct 2023 07:46:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B356424AA;
	Thu, 19 Oct 2023 07:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B356424AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5A0C1BF45A
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF26842856
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF26842856
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7b6nC07ubqW for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 07:46:27 +0000 (UTC)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0151742855
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 07:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0151742855
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-40572aeb673so70637095e9.0
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 00:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697701584; x=1698306384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FoDaz5/XxMzKmK9rbTP6vNgiQTwTU2TI3Hn34IjxW94=;
 b=qhEoYtyrfrmeAqrxVMW3EAKSFLTYCS3vFUlsv2D+aaHx4/7Rz1UrapuThUNZ4LETCG
 AsXJ8g23MJWnNFccI/aq01b97TslgP0fMPEQnUUIMnH6DSTeW91bMBjTfpc/CApppJwl
 KhMt68HKhXHnABgXbWcgkXCmueoahNypgFJYDTOFPp4rZzg7NI4+kMIt3FqYYG+gdH5D
 RokdWAQYkck08QzeoTanbHCv8t7NN7ImFhymKjjVK9VJsZ9VomSrCa8/ayz81dWaTAPh
 e7d9SfP+BSI/o+Tw6+SFfKpPLW6SjVBx/PWZUUQ/BJGZPnFaFfL73hsASMM35tncQgwn
 m5aQ==
X-Gm-Message-State: AOJu0Yw1lY5ZhC6tkAFw6dIEYewfAgxyQ1JXs50ijrFdkyOfKXZ1uH5j
 fXyXHfmg+hJUOn9UinBk6Y3seIF+87zbnogfZaRd4y9DYP8=
X-Google-Smtp-Source: AGHT+IGS+VmYQ0dRiiXl/KWSCa9aBI/6qeuoPnoaRLnTP+xzG7JSPcW5X8BUMJ7DyZ8+yFQKNqQgnA==
X-Received: by 2002:a05:600c:1d0e:b0:402:ea83:45cf with SMTP id
 l14-20020a05600c1d0e00b00402ea8345cfmr1283361wms.2.1697701584733; 
 Thu, 19 Oct 2023 00:46:24 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 fc8-20020a05600c524800b0040535648639sm3739268wmb.36.2023.10.19.00.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 00:46:24 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 09:46:12 +0200
Message-ID: <20231019074615.1672645-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019074615.1672645-1-adam.duskett@amarulasolutions.com>
References: <20231019074615.1672645-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697701584; x=1698306384;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FoDaz5/XxMzKmK9rbTP6vNgiQTwTU2TI3Hn34IjxW94=;
 b=lWIjklLdKuC3Hvlg7A6maD3k35Dx73VP7iZL2wEORD6BNiH8Q08+wi9ACyAA5Qg7x2
 b3rEgYuvi8XEQXWEnwgrwHB5KuoQlNniPJJINj508A1EuoqcwU8p7rR2Npfb77MXS6AB
 +BdAg6vH9VfyW5126Cd+Dn2iqFHg1MO1x4U4g=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lWIjklLd
Subject: [Buildroot] [PATCH 2/5] package/flutter-engine: bump version to
 3.13.8
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 942b07786b..dba9f71c4d 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.13.4
+FLUTTER_ENGINE_VERSION = 3.13.8
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
