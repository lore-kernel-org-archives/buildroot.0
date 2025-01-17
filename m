Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24170C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC56A61286;
	Fri, 17 Jan 2025 10:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpMv7EQWFZNj; Fri, 17 Jan 2025 10:55:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 616E3607D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 616E3607D0;
	Fri, 17 Jan 2025 10:55:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D71EB89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E02E40173
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jiIdnmzgzN2 for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 316284013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 316284013C
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 316284013C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:54 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so1870589e87.0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111292; x=1737716092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3Z6+o01USfPg9Ugu2N1k+5xeedMQj+ot4wXvlOaLVE=;
 b=pMZdZwZmRs+EPF9P5JA2Kvhu7/WE+tZGtLfwyU+EM0I+JaJCtbcNnG2BvSWB9N9z02
 UG/SHxBWwBaYEFIeLjm9+0LYar13Jr1LUQgRdHBaQiZ9Mk0X5/qMb+smQPIwc98J5goB
 Wdb9ftSNwpC796AGXpkbvPVAdNBos1WoflJeaJBKWdQFCnLwZGWwgCg6jJzT3NpoXt2m
 pm+VrD/rGVx2aB6dyaUSLDgs/yUYhfHbq27lAIV1Cg159eZtOJfcBC2TzgKj106LWbSl
 iSxCDphnqtAvS5yh+ZS8TzGuqVgIwUxvqEb7D29kXHJx3zKxFBlUkKW6X/h/21QgvMCz
 4h5w==
X-Gm-Message-State: AOJu0Ywxd3S8TDqUll8vgnYIO6pqP1L5Gb2u1HZoJqQ9T/WzI4yBZN2p
 /fCkQNk5LO6+hCsdzqWA5RK3vLPHJSnWGTx/V4QTttPMxTpYuZCskk0Yxg==
X-Gm-Gg: ASbGnctpBDKhHOcdHSZkJAwaqCwfjsINAkBk/5/NpAmLsFal/9wL7o5kCmvW26ItXHu
 lBxEYEq/oF8/zvarpR8AF/JpgAmt934M+n+dXLqJ3SBqYo6gYTGF06gQMyeqLyWHVaFrtP4k11k
 1RV4tZCw9069HfMbjlOauIs/Si+g8nO7afUvbo9Q41s4zAA30fRfm7oNstfQQrdcgNQBT1dPASW
 0lykv5USsWWtN01w+aijzBFvxiN79ux2B9I0F4sCQkuCVCb3JdWg/MF1342y6/KVHetaYHdG1yh
 PX39sVLdSQc=
X-Google-Smtp-Source: AGHT+IExAmEylYj673lRA/c0nsY8qEgaL7XXdHcQC6Uf2k59XzWtDDZ6k3s8UVsPt4q1V5aBdr5Xpg==
X-Received: by 2002:ac2:4e12:0:b0:542:9987:6ea1 with SMTP id
 2adb3069b0e04-5439c268010mr780506e87.34.1737111291899; 
 Fri, 17 Jan 2025 02:54:51 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:50 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:42 +0100
Message-ID: <20250117105354.618220-19-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111292; x=1737716092; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e3Z6+o01USfPg9Ugu2N1k+5xeedMQj+ot4wXvlOaLVE=;
 b=S4YfWFwXqTVEsj7m5b1F98Bde0c7GgK0rWs0FknP/+saYJO7lMoGyjMRn8lzsvbsvK
 4ke9DQ7+CBb7CxnUptNs+BBsA1mBc1IGvlFT3lZWefVxMH3cXKqinzZiFrgO2zz5Mumc
 V9kCqGYlXcgQ35IcXNSTUmLHCVeS2hShJaRM7abXeAX654I46Ffb6s5ZUH9DYwPmiJBs
 YCPy7y3g3+IqOij+0YnVS71HrHQcRbgErEjBlnzIMd84yRVokNVIuyL7tIgef5Z//Znq
 ad50h3YZe3OwQ/Yfl9ydREmWrbzpd6DNyG8rHopVMvAJOuZH5KaK+LmneJlC8dic53Np
 hILA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S4YfWFwX
Subject: [Buildroot] [PATCH 19/19] package/qt6/qt6multimedia: improve
 'spatial audio module' help text
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index 70acbca8e6..0eddfa644e 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -106,6 +106,8 @@ config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 config BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO
 	bool "spatial audio module"
 	help
-	  This option enables the Qt6SpatialAudio library.
+	  This option enables the Qt6 Spatial Audio module.
+
+	  https://doc.qt.io/qt-6/qtspatialaudio-index.html
 
 endif
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
