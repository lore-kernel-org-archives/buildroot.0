Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFD4C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD5EC41D6A;
	Fri, 17 Jan 2025 10:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTYqRb_zkr0X; Fri, 17 Jan 2025 10:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99C0641E18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99C0641E18;
	Fri, 17 Jan 2025 10:50:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5213DB89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 376B840417
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1sUectISWdvg for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:50:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D0634013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D0634013C
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D0634013C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:13 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53e399e3310so2069216e87.1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111011; x=1737715811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RfQXVVXHHRaZClapKvYvD0x+NWLl0dK2ZPHKPIepgmI=;
 b=hnXPPilHCYAxzF9cbbCdYSR4TPu2O7ChjrKshTmX/5iuBpFtjS57aqskpPWY3yA2dB
 3YC3zYXNJs79rNPmuJxqGLcfMpram/6qh6An7uuX4rJSFSRAHLukn3/C3On81XYkQ+SA
 XPTLBFDIGQFBwTOYVSVa94lumpgawyKt29Js9310Ux7kiEJB6QpZEZ6ERh6CaqfHB4Q1
 hAJEnunExsBr2Uwriyk9JDWCW0xX0uiyYd1TiE9eqR9bd8HftzUDsPQ1OQOZ3rr6Dlvp
 l/4U6JXiveJuTkFN2yCy0fNph2OE70EF+rnRsL1w8pHgJ28nl5GDvTElPsNG+6FnNl6a
 Mh5A==
X-Gm-Message-State: AOJu0YyTFUE5vwegSpFM/5cfRYWczy1jJ4wanloPY9IXlhYe16H04dkK
 4yKiIQFZ3YF6Du5XsJHA9WQLnroPTvWvmmketRki2bLfZAjRzq2A8GmI1Q==
X-Gm-Gg: ASbGncuTxxP1QwggIdIH7ozA3GVFpX7Pwb8oCTyaL3+EcmTLgFrEgY4m91GkzSR3D4+
 uU+azbGAqgFLXHf8733a7883y8VLKTlyyybYsa71JsGJsCtJJRDXJK6nyyW+EGEIz4UIOp5rvY9
 EvZmZoy2iV6T5Kx/USKqPO5ipaW4nnhvQKdUfnusIFWoo76PdFniDpG8IEttnNHfDbl/TLIxo6+
 3D/agKpPr+gJxuEGg3GRUEqjNkNFB63YqgayTT7zpat6a4T/FeiSsNn+QfNmcQBZam9Mr87IfMy
 Xh9luOUL8oI=
X-Google-Smtp-Source: AGHT+IG98ZV072MHRPVGy/ldIq58qrJ3WyiuvOAW0yU6qhYl3PTmq4d0xdDR66zI4+Po5xrJ7v3Lpg==
X-Received: by 2002:ac2:550a:0:b0:540:3579:c363 with SMTP id
 2adb3069b0e04-5439c218df8mr432305e87.9.1737111010914; 
 Fri, 17 Jan 2025 02:50:10 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:50:10 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:54 +0100
Message-ID: <20250117104911.613221-14-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111011; x=1737715811; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RfQXVVXHHRaZClapKvYvD0x+NWLl0dK2ZPHKPIepgmI=;
 b=RkgaeQ7699JOuX5eF7WLQ9ioQ9b+DTKvEW0QS3hHbY2M3+wFGrFSLRAIo14o1MuL9W
 oKTuI/ovhhS+299tWa58Fw9bF3PZOZ19g1wcapvMlUqB70RNoh3KLgV0xL7pvOt4uqIK
 vbE9VwWgVBb755bVsSS7XE/jlXV/xicnqbXT4BMYLwF17maXPPnnQqysO3G8BvMXpwlh
 cs1Av9PEUVJ6SPabVaDYlqeVTl9Mgkmc8Y9IO/zIgFmIo63wyaKzUCq3HCB+PsH/F+Xq
 FH0QJ208EtF7nIsqLls14d1QlHAKo9BmYH1vfIe69NfABZ6t954x2FXZ8fG7qHMNdLd3
 4ckQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RkgaeQ76
Subject: [Buildroot] [PATCH 14/19] package/qt6/qt6multimedia: split lists
 over multiple lines
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

Visually separating the elements in the lists to increase readability.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 032eadefa5..d4a1b8ec50 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -75,7 +75,9 @@ QT6MULTIMEDIA_CONF_OPTS += \
 	-DFEATURE_gstreamer=ON \
 	-DFEATURE_gstreamer_1_0=ON \
 	-DFEATURE_gstreamer_app=ON
-QT6MULTIMEDIA_DEPENDENCIES += gstreamer1 gst1-plugins-base
+QT6MULTIMEDIA_DEPENDENCIES += \
+	gst1-plugins-base \
+	gstreamer1
 else
 QT6MULTIMEDIA_CONF_OPTS += \
 	-DFEATURE_gstreamer=OFF \
@@ -92,7 +94,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_dmabuf=ON
-QT6MULTIMEDIA_DEPENDENCIES += libgbm libegl
+QT6MULTIMEDIA_DEPENDENCIES += \
+	libgbm \
+	libegl
 else
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_dmabuf=OFF
 endif
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
