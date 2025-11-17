Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01238CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC3B34129D;
	Mon, 17 Nov 2025 20:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-klCX4CYdlG; Mon, 17 Nov 2025 20:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0949941309
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0949941309;
	Mon, 17 Nov 2025 20:16:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E70B1BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 646FE41309
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yyb2H65_qy4 for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 892404129D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 892404129D
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 892404129D
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:16:52 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b7277324204so641312866b.0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 12:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763410610; x=1764015410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OiC5g069pM4zZwkeyHgoMMBPZitqyEbNUlIAAXE2Nqc=;
 b=s/6N4tpdwFHSn8+oh6Mb8PzAXgivZjj+j+AEgPN1qE6jBm6PekkL6y4ZjpIA+uvNiA
 2uT4KugZ/PZYIU17nzIfMRnz1U352rzJ+R/BUKJAO31HDdWHRUy05WwNj/hRFJ/FWsjX
 EdXCEcR6XFs7MKoPSnhpVH60F+joc4RnyiUZl8MgEeKHnnYKEVeha0R0xYbRJ6Gprrxx
 ZIFe5RUk3vImpyJHkjJfQnoSTJUt69FgdDCgZ6iNO51BY0nxuxXyd15rSBhGbvfJr79/
 U7jaDug7pgjxjmOWstFviMJHqXjIfWnFYW1t89cMKV1D2GXf1KKRb/fjZu4m/mvX++Qx
 ZMTQ==
X-Gm-Message-State: AOJu0Yx3+BDzWCy7EVASOVWOb2TUFg9xMgPXo/fRVDl1iYz7AfIgnRSj
 w05Ornam9bEqIdT+LlVpHt963/WC0+yBQvNd713X8N6eNaeqtS29SJw5TaXkuwBKhMKUqQasUqF
 hcQs4
X-Gm-Gg: ASbGncvGmPExOdmnHFzMwv30RjLZdWhZ8vPYiiTxp7M4O8lEigpvAjTpjCDUVEzW2RK
 RR36UIAJhz5zgXQadjOyOtqJzq+NYWs6uxGc3fY6wNRmueMjmfZzu1dCGFEKMI5/pbY6KoB39EA
 /eaWzOKATDZ6bbYlXoTAq727+MVKDGu6dQNP2UfostYPGkzYA6rT2DLB7oihIiVi5VjGKIdJNdi
 H7YePKHWQoOGJcNhvEnIHMlxT0ZGIFFFylEIO/QKTzGtDwyqNOsd3F2YPoHgr4I3anMkUi88hNz
 vgEFr43WgnY5GOqcOLgt6mRm2rXVoJb/2Nhh70qePpCvem1ebobEwwb5qDkLY3s6FGRfiHqU+lx
 2vv5o5X5Xu4Uzg7a39P08bXapxe3HrXAodSYZNH0h2BfCBVv1Z72sFdrRIenuOv+L4gJ3YwVdy/
 Zebbpgwc7JUjciIzP7pbnYksMjFF8n0PhW1hkkiwTBEX9fKF+KkrHvY+sdp6WdAg5d0y5xH8YwG
 zk4XgcZGk0ICDU7r+MH9yiOt6Xqvg1AWptrB8Ynsbn8UFXBimj8/lj0C2FXOM4E7Q==
X-Google-Smtp-Source: AGHT+IGhbgVnpdfiimvTscXdbtdwYKgm6cWVIAqDrM2JRbN2zZt0gTgJcPSEKvOuOuYF/VKN+T3PPw==
X-Received: by 2002:a17:907:3c93:b0:b70:c190:62e1 with SMTP id
 a640c23a62f3a-b736793d2eamr1429850766b.35.1763410610230; 
 Mon, 17 Nov 2025 12:16:50 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-54-71-163.retail.telecomitalia.it. [79.54.71.163])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fed90c0sm1167690066b.65.2025.11.17.12.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 12:16:49 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 17 Nov 2025 21:16:44 +0100
Message-ID: <20251117201644.3299491-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1763410610; x=1764015410;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OiC5g069pM4zZwkeyHgoMMBPZitqyEbNUlIAAXE2Nqc=;
 b=UnRIuD8jGTeU7QlHUbtEgLvkmapWcf81gy+SHjM4zQtOgzdutAwKSMCY7LQOjUVpSY
 WQsqPb62Sddi/l5SdIufPeW3Xf1SWT3S2NDbNrNx79jkiYRKsAo70iB8b9FiqWVtdWXy
 Q4x4L4DIkhhVH2gBVBNDNlJt2nuBTYD9TKsSo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UnRIuD8j
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.239
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
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.239

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index b7d5c06f7e25..fa691255eeb9 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  aadd7edb9494fe1768f7d2964aa470931da15bd83f82a1829d786f8ec80ca169  uuu_source-uuu_1.5.233.tar.gz
+sha256  4eab6647c9e75e5900ee8981c80750b26493fe54d99708989c0e7ce08067484e  uuu_source-uuu_1.5.239.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index bdfd00581a9c..6ee06dab880b 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.233
+UUU_VERSION = 1.5.239
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
