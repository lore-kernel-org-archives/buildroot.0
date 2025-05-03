Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A827C369D9
	for <buildroot@archiver.kernel.org>; Sat,  3 May 2025 11:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2F284039D;
	Sat,  3 May 2025 11:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uq5x_KQpVHtN; Sat,  3 May 2025 11:44:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17B1A40841
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17B1A40841;
	Sat,  3 May 2025 11:44:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E68E118
 for <buildroot@buildroot.org>; Sat,  3 May 2025 11:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F9DE6082E
 for <buildroot@buildroot.org>; Sat,  3 May 2025 11:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jv65eCdvJTNd for <buildroot@buildroot.org>;
 Sat,  3 May 2025 11:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D2B50607D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2B50607D7
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2B50607D7
 for <buildroot@buildroot.org>; Sat,  3 May 2025 11:44:33 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39123ad8a9fso75481f8f.2
 for <buildroot@buildroot.org>; Sat, 03 May 2025 04:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746272672; x=1746877472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=12zsYikGofKFAymZld53q2ORreOAb0v2FHYEmHjc7co=;
 b=FFMsGXvGeXqOYJMMcvcn1YDCEztKgtOI9zHB5n01O3Pi/lvAsHdgtz2MBKzml1Yjt0
 6oV0HGEeOvjHvFstRnNIkiL3ppmfzltI19fMGeC7eXCtKTtTEr7JQNhGvXdA8ezGwnJX
 xzPA7hXt0alua2QFpSfmxZp38idXUwP2NRiqwbkZBiJsFDkjAn6TGYITXNbgyQ2Px2mP
 M7BnVBl5JiNn+KULLCttUcRDA+JqkpQj9Ic8A6kmV4SCV1mPOf1yL2GfY8xSVXaEajP8
 3v46I+XwM3x3mi2HwS8cQ+90YX8uxm54C50DXdpWIWefCGf6ALHecZ3F8rNpimY0EoDm
 2lhw==
X-Gm-Message-State: AOJu0YwF9IntD3b23qDuFqbLmmsZeN941GWGmJd17veKRZpy51Fg/grR
 nLcTrw9Hat13Ukhv52TeREvfQC2+OuWBK3q5OIC+IMICxO2SYxUdDZ5wDmlu
X-Gm-Gg: ASbGncsim1Sunqk6uNc8sS3u9aNy/cP80JA/6xqNivb/vnLAxyqj6NgbzZ/9S394mq1
 ACe6oSy6xS8Iyo97lukacvbG5Y4ERDN3cjfdN8bM4+4a9dhbEb0sCI4CNnSjiVn3vqS7OSxTTSc
 Eme3mVcqg8tgoiGSiP5SEIpIHBZ/t171XaOspNaF0oOhU2pqvWReGmdRBfYPFTiRF/3rONdPqzk
 TaT3NE/OGaK+/z9P8GMS+Bgv9rRyL2N8Auh3Pn37PiiYisVW22fTDlnQSHZAVLeWAunwf5xq4g6
 QDKJKiEhJl1k7eIKnU0v/1wNKcPMZA==
X-Google-Smtp-Source: AGHT+IFAljBkqQLgFHTy4xJ0D5VxVTaFyYhTjbzm3AwH8kSsZ1xHsfwY0vvBjJu7+oPHr3zAHIpQrQ==
X-Received: by 2002:a05:6000:2c5:b0:39c:1efb:ee87 with SMTP id
 ffacd0b85a97d-3a099ae9b08mr1686757f8f.12.1746272671433; 
 Sat, 03 May 2025 04:44:31 -0700 (PDT)
Received: from kampala.. ([41.84.201.45]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b0ffb1sm4620732f8f.73.2025.05.03.04.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 04:44:30 -0700 (PDT)
From: "Joseph Zikusooka (ZIK)" <josephzik@gmail.com>
X-Google-Original-From: "Joseph Zikusooka (ZIK)" <zik@jambula.net>
To: buildroot@buildroot.org
Cc: luca.ceresoli@bootlin.com,
	"Joseph Zikusooka (ZIK)" <zik@jambula.net>
Date: Sat,  3 May 2025 14:43:39 +0300
Message-ID: <20250503114339.13240-1-zik@jambula.net>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746272672; x=1746877472; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=12zsYikGofKFAymZld53q2ORreOAb0v2FHYEmHjc7co=;
 b=ej0n3Lbr7XkuDRnA3n70WKWc+JTcE233ODVyVAkWAJXlPyPPLMe8SZ6IbHPzjFpGEk
 BIySm9i47yR0UeCxmvGopS20xjI73DUtNzGmSPFydHis9T+zXma1nTTYZTp8zpoitHQX
 O77WVdWVNNEAVIFBgsHuTX4jNKo1aB1PbxoAcJJhTGes8utNBpuFkok6nrISP0h/5upG
 My+4/xBDp6K6Jhm78ZKERTVrM2pT2PYgDIMlTQ3bQmSspNpmG63UqgyjtHZJd7gW5NeP
 Vj6GpeWL2k0GG7nec1vATF64zlxOder3LAKgiJC4BLhOvNUlJEyr7HexbotZw6mUqECk
 TwDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ej0n3Lbr
Subject: [Buildroot] [PATCH v2] package/m4: fix build failure with gcc 15
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

This is a temporary workaround to address build issues with host-m4 when using GCC 15, as encountered on
the recently released Fedora 42. The issue stems from stricter compiler behavior introduced in recent
versions of GCC.

A proper fix has already been committed upstream and will be included in the next release of GNU m4:
https://git.savannah.gnu.org/cgit/m4.git/commit/?h=branch-1.4&id=a22c9802dd7e724eaefb21dc21d84ac2d3a49c89

Until that version is available in buildroot, this patch ensures continued compatibility and successful
builds.

More context:
https://lists.buildroot.org/pipermail/buildroot/2025-April/776922.html

Signed-off-by: Joseph Zikusooka (ZIK) <zik@jambula.net>
---
 package/m4/m4.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 39ad898b10..ab8e194b06 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -10,4 +10,6 @@ M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING
 
+HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"
+
 $(eval $(host-autotools-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
