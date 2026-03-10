Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E786FD2D90
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 13:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B502260B48;
	Tue, 10 Mar 2026 13:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXUhe69So84H; Tue, 10 Mar 2026 13:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 989F060B23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773150100;
	bh=gD2WNPYmCdTz+7x1/OGs5CVvHEpq1KyeQE3dbXT1f4Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A/Fp4FNg74iKNwoBgOu0jBoXzyAPcgdpF4YnJByupEnTYIgu8lT8ANJJYJYzBZrvV
	 Mq9dor2djjBiyLbCiCq3ezgu1o4sXCuawThPUbaUX8DH9105wC8AjMu5krItoDHrcq
	 pSs/vJeDuhAI4pyCPp2tmdnPC8ZV1M0Q5euchhYNDFU0PgsJqoHytD0jKL9Rfd9wrr
	 gQOPzKha7lJIg1tk/VhRGKYJSv9pQIsSUGhwS4/U6lWffxvCLOM+VXI75oKt2ZFMTS
	 fauBw+/0hC3da5THocVypF05qG/JRD7H+3vXhMGofoiD+zObFkNo0GIO3S8inFigf5
	 LiiN0ZamDJV4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 989F060B23;
	Tue, 10 Mar 2026 13:41:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7A69B8
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 13:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A94CC40189
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 13:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4XqgH0HNxZn for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 13:41:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1329; helo=mail-dy1-x1329.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5B9F40061
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5B9F40061
Received: from mail-dy1-x1329.google.com (mail-dy1-x1329.google.com
 [IPv6:2607:f8b0:4864:20::1329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5B9F40061
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 13:41:38 +0000 (UTC)
Received: by mail-dy1-x1329.google.com with SMTP id
 5a478bee46e88-2be4781d2baso309755eec.0
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773150097; x=1773754897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/ho1afjZ9OlThCjrMOMXLpidAa+FwsFtoPfjKQ3aN8=;
 b=gzdJPOK3lpt7PjmWfGUvQS2LUDF1E0kDsy5W524WVw6Soukxe8zMckBTpReVPXretZ
 ykUCNfMCtB7imDknM3W7Qz2OA+TsfeD5BQBNuLpm5Yb8YvHYPqjxA7+POC2xF76wPHsn
 G6Fdg7IaQivzq6nh6ubiZyJ8upDGMiAdBGTJOKmFe+WwWJOWhjACstY1G9foMPia0S/4
 Lr/CVgLcp9bqbJhzgCLo97R1Ep8zRjriTrR1/mloLFByuvsWca5Uf0Qp9zqPG4fm+gmw
 VIxPW94BmVCIMkFS7fGiJxM4txu7wnul6iO+dALOAR7vgXFk1YkWvPTl+/QwzYo4KeDQ
 OkTA==
X-Gm-Message-State: AOJu0Yytae7WC7ZbS8hikZIq1Ls3i0WbusQ3oS0d4bEkE2Nh2QCJKTrI
 wZwwj+IvubmWQ+fJzsD0Ybi8k+S0+pokKngZpJ/sl/S8uvbsW09BbY6ZE7eRig==
X-Gm-Gg: ATEYQzwoxZOWiBM9ZBAGGmgVwLie+3R2VmYW+XFgMQRSrYYeh6bjvvUQLd4Mc9Whk2j
 0SA+m5lcc0FA6+L2WFrMVxs1rBpam4eTjuWgfnj8YqIHInNNMTaXrsxbqD33JgMkCEoL6NVtdPx
 1vvHgY8QQdnXB/+j55Z+lSzOkTE6xTYyS5EAH2PrHWXOYGbdy29ar+axr0vSyKzvE0pqeV23/E7
 vwJY2gnKJFEalUzb8CGBp2Ku7GZeL/jGSJN+T2x9kvQ31hjIwQXY9UL0b8747Po9GLrnKw+7esd
 nEdyHBiuS00auWgH+syACSCfXTppm7ERI1r0Kq1HEnfvcrcwdm9AC9Xrcx25F4AhnO1gcIw7E+q
 WeRsRpICQNe9mGP+2luFHv2Zti2tpUCq4Cv8x8862TdSKSLnmOOd4dSGLOau9xXzC4iHJ2VghJK
 iKPZacOOJGkJ711PcqF5N7SgJU6fFLQA==
X-Received: by 2002:a05:7300:a883:b0:2be:522:2edf with SMTP id
 5a478bee46e88-2be4e0d0aafmr6458547eec.39.1773150097094; 
 Tue, 10 Mar 2026 06:41:37 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be4f948324sm14930992eec.17.2026.03.10.06.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 06:41:36 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Date: Tue, 10 Mar 2026 21:41:28 +0800
Message-ID: <20260310134131.418353-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773150097; x=1773754897; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m/ho1afjZ9OlThCjrMOMXLpidAa+FwsFtoPfjKQ3aN8=;
 b=Mzbyiuj5VLTpxE/lbmyh+Q9SrlcBkh9AoY2kQObzFLLmGiuFR9iV2uNjeR/bpE+NSa
 9urnar6MG6F5+E3ni5PorTITit6+mWvaamYXYWv6OUcRzP74L3WQ2AimJpoKUf1UOwal
 vY6cU485tKRQn12zVQGQfdiP8gymgQ6kfKKej+8ydtS7E9es0dCk/6b6tIwZycz/ITiT
 5Z/takaAoPBIw7FhJMXDB/B4+URKMBBMKFMUqSkEHiN8rlM/H1idZQBudMZEKcujFq0j
 mTtWTx8FxqgufneW5ViIVypeAWkdS2MM0iwmLI4ILOKRPdnvc4JI4x2gGwD7ONVb8XJQ
 uQNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Mzbyiuj5
Subject: [Buildroot] [PATCH 1/2] package/paho-mqtt-c: bump version to 1.3.16
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

Release notes:
https://github.com/eclipse-paho/paho.mqtt.c/releases/tag/v1.3.16

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 8ca597c4f9..59c74cd044 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  60ce2cfdc146fcb81c621cb8b45874d2eb1d4693105d048f60e31b8f3468be90  paho-mqtt-c-1.3.15.tar.gz
+sha256  8b960f51edc7e03507637d987882bc486d8f4be6e79431bf99e2763344fd14c5  paho-mqtt-c-1.3.16.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index acff7d5cc3..3a6a4e4b31 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.15
+PAHO_MQTT_C_VERSION = 1.3.16
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
