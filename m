Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D352CA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 09:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0639C60AEE;
	Tue,  2 Sep 2025 09:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITR3yUDNUBj4; Tue,  2 Sep 2025 09:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4347460BBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4347460BBA;
	Tue,  2 Sep 2025 09:22:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC199439
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 09:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D243240CC3
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 09:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1KJhnRBr1ym for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 09:22:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 06AD040CCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06AD040CCC
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06AD040CCC
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 09:22:19 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b0411b83aafso366567766b.1
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 02:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756804938; x=1757409738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o2w0FeKWU7YKhfBV82odWK3SCvZ0eR9fJ6LrXFLcjuQ=;
 b=aLTXZAxZP2Zt0gLYPkvNe2bFDXUm/tJxe3/cwnlhzj1otamT3R+zEx2o56/CRFn2ts
 W8WkHspf03kV597gu9hidb5Po9C15u/Ubf7bVBIb1Q9AsRtvAb4QpnW6D81XYazb3na7
 eOswy+9RR1lxgXTyohEekv+rUH79hzO6m6iDheOPf6Wa8kVkixswnYPgLGZUGuYUF5DW
 92r28xM0hK0kk6NSmHt2oj2wViyhut06vsvWS/Nhzxo4h9HQvMLJYvxsBgr1rgiqMZK3
 bNTpOVhIQA1aOOxtUpspEMIXTXMWkyG8emSn7iX8paiK+9vgC8C6KB1PHgTcg9DVom9o
 jmbQ==
X-Gm-Message-State: AOJu0YwEnlWrUQwCm7Mab19x0PPn/24FDH0YQJMQyJuzW8f8ytOdbEIS
 zQRW+GIyCWb8GePc557BdSYjKmOx+SAe+V2uQqThR+Gq71ZXqIyKWTQ7wY6rFO+O34z/esbG064
 et1AU4XQ=
X-Gm-Gg: ASbGncvbjxEB4ouC4XD70SEGuJp9VOS9KCIkYUkcFZyXkECk2mNGYKkHv2R1dpl7kOk
 mW1orQKbYdL1cuUGwRlh6jaBrYkkBI7vXnz/GSyuyopuSmTaaY+9uVYj7HnznVTm948DVaDeLYV
 BDH5mwg+kilPAu8A5jpK6bFR9vIaVt7yViOfktEicOe4TTMa8V+AvEfSvvjl2BxFQ/OCyD8Qcf1
 dQfH0rW0m+kiW90pm0zMJSJSBzJlfN3vgoCmCoJ717bsEPaoq05QEna46UIo1PoPHUF5eTqeWw4
 3aalRvfc57zwiI/yglIKgSz773fvxz3T2+xQTWyh/LqaRX57W8WW3RZGw8dJwYs0Fe8yzq+xVlj
 JkhPdfoOjN4JYgQ2Obb9QZne+V4O6xnf6wF/64KqwPpy6Yg+CqdRrj0qBK4tjbImLJATfwy0v9e
 K+dFzZElEEpTQ7DaHhenhR+tJx9TwoQ5jt7MpH+KNVxzGzkkaOTeKx/VyUqUOgh15WyUIa9vIBl
 Q==
X-Google-Smtp-Source: AGHT+IHf7JkUqT8z7DVTbcNlwqhQVR0VIt2lRSasAPxG5G2N1DxuyXqVbkff2o1fboTNlg1TtOSGQg==
X-Received: by 2002:a17:907:1ca0:b0:b04:286a:2fb8 with SMTP id
 a640c23a62f3a-b04286a4b87mr717470266b.56.1756804937622; 
 Tue, 02 Sep 2025 02:22:17 -0700 (PDT)
Received: from rcc-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (93-47-52-235.ip111.fastwebnet.it. [93.47.52.235])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0411bf1b09sm686172666b.79.2025.09.02.02.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:22:17 -0700 (PDT)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  2 Sep 2025 11:22:07 +0200
Message-ID: <20250902092208.28317-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756804938; x=1757409738;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o2w0FeKWU7YKhfBV82odWK3SCvZ0eR9fJ6LrXFLcjuQ=;
 b=XhVUeNQ3SckxgoI7+VC5zD41IY8H0rfrXhohrlNT1naFoEv3IbpPQXy7365WwCtZjc
 747guX+n3aUZae5toY3kD5OgGjsb8tLDhY6aZRI0NtDW0FzAgUS8w9jeMdAm7KFzhAxr
 SLQtwwgZI/7fe5h/eR+xFCAFzwW0c/fK+7kIg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XhVUeNQ3
Subject: [Buildroot] [PATCH 1/1] package/cutekeyboard: bump version to 1.4.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index 53b438cc1f..e4093dc4ef 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0f0af01ec99ad07607d2e58c2feee1fba37c9cb7118e8af309fa021f599aec86  cutekeyboard-v1.3.0.tar.gz
+sha256  7bb9094dc8792c897dcf81caca5dfbb509ed8a851b01542a84d631adf6c62b62  cutekeyboard-v1.4.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 775bed0fe9..e97eb9db2c 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = v1.3.0
+CUTEKEYBOARD_VERSION = v1.4.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
