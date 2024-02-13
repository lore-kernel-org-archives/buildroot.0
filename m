Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF705C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E10441622;
	Tue, 13 Feb 2024 17:28:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfp_cFMF8mr6; Tue, 13 Feb 2024 17:28:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A5641691
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9A5641691;
	Tue, 13 Feb 2024 17:28:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BAAB1BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28DAE400D8
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqTTJR18ya9q for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD7284010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD7284010F
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD7284010F
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:25 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4114e0a2978so13954435e9.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845304; x=1708450104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KE70TaPuNFDYHaN0/bbrpq86gmDMVg2z4t+qRC8huiU=;
 b=pJNw3+nK0Q9ouQLF2t1TtWpYny3eGhSan7c8nfMTCscp/EUujw+v4UgG+Gwxmfml7n
 LjSYTt7I9FFMCUClNx+z7oyvKFvkIUU41euYwcUX9p0lIwqTiofLhH6nr93vCXaeKBTD
 u260FFV8jP36JH9vu6NO2yNR84AgFMeq1kuHXoEN8PIAiG7FRIfOZ2uwJWr45Yyd9MFG
 AE3QqCVInLu8J7egVjJ1y0JhcKd1OgpSo7Bnq0fgzCYzu0AOsR9o3RXBwOXnkWTMFHUT
 FeIqwrkm15mgAnQ/YHcLCBDzbYijz/ltqh9V1K5bPfA7eUYqNhUn5EPcw7LHdurgqrKx
 njGQ==
X-Gm-Message-State: AOJu0Yy87TI1XFX4DQcUelaQbi191fM68E6bWw4AnYkmZRR5XOWDGOzg
 VmRfqnD2TfqMJhtEHclcU3S07Z1lfuZgr3jiflv0F1VviHmdsgfTaEOT4qRtVP41RtP0nE9F0e7
 e
X-Google-Smtp-Source: AGHT+IHFxunEw0z+12RNF2F6WMtxEb7c5OZaPaD3Q/BkACmZ1TUQtSQlToi1jFN3crss0LwFra3rkQ==
X-Received: by 2002:a5d:5385:0:b0:33c:e2ff:f247 with SMTP id
 d5-20020a5d5385000000b0033ce2fff247mr630135wrv.63.1707845303943; 
 Tue, 13 Feb 2024 09:28:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUE8fj5eF0kyn8N105mxMx15nmISkaeRbMJVcXDBjOK4COWDVYvv8uwHp17Qqo5Huw4wFFQNEEMzYpHnHTN8Bnm3zRU7hPDYTyp36wrunrOIsLPJQTNPbOmtBai1mk73rGDAOM=
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:23 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:03 +0100
Message-ID: <20240213172817.2872849-8-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845304; x=1708450104;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KE70TaPuNFDYHaN0/bbrpq86gmDMVg2z4t+qRC8huiU=;
 b=xqOVrdgk13fRzAS+zCPHkhc/zGY2qS+1/KHrp7FYZjA3MiKtmizJ1HUA4ITrhGIf2V
 r6M3sZYVyiNoTQ3XG8kkgfbkSJjVTHJG/qaIY9soqZtfa5P/E8S+/NgSS9DXImezzd/q
 Ju1Bet9g+301SjLpb4Oanfe8x2TovQjlsSjbtlHa2H34cSJIeK3DdIovDGm1Hc/+Js0O
 JTMOG2FW2dGPcj78aGRR3BM3tXo/Hi/NIVCTdXiV+knzckAS3qdCINaix+yuLzWfk7mW
 9Ckh3lMLrLHh6NIUBjGaVK2scSeBxsVII9rO2zRSTc5Tjm0met9Dcn1O3tFVlBh3wFh+
 Xylg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=xqOVrdgk
Subject: [Buildroot] [PATCH 07/21] package/python-jsonschema-specifications:
 add host variant
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman.

On some plateforms (curently TI K3 SoC familly) binman uses
python-jsonschema [1] on the host that requires
host-python-jsonschema-specifications.

We don't have the concept of runtime dependencies for host packages,
so we must add them as build dependencies of the host variant.

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Romain:
  - extend commit log
  - add missing host runtime dependencies]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v4:
- extend commit log
- add missing host runtime dependencies
Changes in v3:
- Drop Config.in.host
---
 .../python-jsonschema-specifications.mk                | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 40879898c9..653c839bb4 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -14,4 +14,14 @@ PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
+HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+# This is a runtime dependency, but we don't have the concept of
+# runtime dependencies for host packages.
+HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES += \
+	host-python-referencing
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
