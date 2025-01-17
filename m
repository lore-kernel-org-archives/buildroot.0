Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DD9C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 835AE61286;
	Fri, 17 Jan 2025 10:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tx-tA1fL18lX; Fri, 17 Jan 2025 10:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9490B6FAE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9490B6FAE2;
	Fri, 17 Jan 2025 10:49:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D32D6B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B39B941A15
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_GLL2cc7wNx for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:49:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A39C841A10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A39C841A10
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A39C841A10
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:43 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-542af38ecd6so2118287e87.0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:49:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737110981; x=1737715781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=09Md7Pm2dDtKy84Bkb8uJ+tlcZz4ViHreYPTrNYeUgE=;
 b=ClFfibxgYvx/xmJ3lbo4SiFolN9MCqG2M5WFsZx/QG4xEs/eGIzCDzGrcCDcjsVOzY
 3PqXFcxqkFrUkktcF8Wab+lrjxdt+nVA17a+NST2M0Qe8G17cx7ej8cbUrdftJO0rEE2
 UnQnErNho3ORl8bnZ4LHOx1JiJNQHW6G0xTfSU3MvIf6NMYO9LxiALK72HYgZ69LZTK+
 8NvhJrl1sPC6O7h6ntrQFpT8dnqmyH3rN0pDZrlUDgSlAxYMp3VT3fBbQbgrgpL/47We
 oxwsLNO0tDSf/afB+Ekg1BhfE/caUl8Q83dtGT+z+9ZmCT6P+w6k1esoM1bvK/qxwu9F
 7TNg==
X-Gm-Message-State: AOJu0Yy71gsK9gmhacKXI7M0Az3Kj5gUsQy80DLvK/Bqb2f/XYW6BmIX
 f8a83qZczB/FRf1A1QHamIS3Dj5YptRKgToMfyZdXERjtOT/g40vfoDmqQ==
X-Gm-Gg: ASbGncuZWeArecBYWR8G+N3GVy1ahOxrFcg730Jnr6rch9CCUPA8BVJ6Pc+c7EDeB3L
 pDTpGk7j5MfF0f5IvQmBV0bvrAnadsL+q0SaT9v0fD4sQwWJF6p4tv2K7LKQmtP8TPcHjliNG5t
 5b3tVW7DHpFXqGe6stEOsZqxZohFShxrLVR+bSolIgApIfXNVWQOKOJTw7TsX0PVFwmgwH433fD
 Cu2d+1Ml4ZwNwYsJgsxkPVyC8kafUpwn5oVQ6PFvBfHTH0ENfE8MGU8y8b3mNnf/+ucpXXzp6Yz
 14C7URDRJ00=
X-Google-Smtp-Source: AGHT+IFox8ylvzVVB63SgsZ13yXeVpkn4HQ96yhEnRiwq1ro9YnPLaS1FO+T8aj+MvlHDtx8d0+RmA==
X-Received: by 2002:a05:6512:3e03:b0:541:1c49:26a with SMTP id
 2adb3069b0e04-5439c2875fdmr841371e87.43.1737110981268; 
 Fri, 17 Jan 2025 02:49:41 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:49:39 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:44 +0100
Message-ID: <20250117104911.613221-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737110981; x=1737715781; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09Md7Pm2dDtKy84Bkb8uJ+tlcZz4ViHreYPTrNYeUgE=;
 b=gIgWrwfASIVqtIdrvvDenc1qy7zzEPAnlF71ak6ZiL8goOnABnKWBIKWGetoXlmRIi
 czGgW8wSn85rpR2TreTGAJvLL7n780isEDCFEHvc6K3kx+SCbomFoCccfNjXcBcfT2G1
 kMnH9k1RnTW/1Mo/jFnXpZG3zrud31sbO+XjFteSiFjDHQttuoHJjnsBSFdNUDulo5M2
 a8d8keR/Fws8jgk0bTc5UGvogUhUNiwa5o7muMned60IkfePUKOcRcSkgWaBdiZK7FeX
 vvD8GZKNGwIQHa0KqvvL1OamqWXWtZKqik8+fsKP/ilkaoONhiBLyxAHJDeM/jmovTaC
 IKeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gIgWrwfA
Subject: [Buildroot] [PATCH 04/19] package/qt6/qt6multimedia: remove some
 irrelevant license files
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
 package/qt6/qt6multimedia/qt6multimedia.hash | 2 --
 package/qt6/qt6multimedia/qt6multimedia.mk   | 4 +---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index 434a9d9700..cddafb56a8 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -22,5 +22,3 @@ sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  src/3r
 sha256  8b69cf3ac3ddd34df478c4ae6eaacf5e6c63ea7ee6403c8dad97e4d1438bc3c4  src/3rdparty/eigen/COPYRIGHTS
 sha256  b522f821df94da3bad917e98ef04817b3af421c3b8c23e8247ae7e517b289934  src/3rdparty/pffft/COPYRIGHTS
 sha256  a46200592eb193853527250da098e6bb0c75424e7a2c7db8da526c4f301c3d88  src/3rdparty/pffft/LICENSE
-sha256  2513c5ad87ce9e7feed2c9a159d336f0a0d12ff93adcd411f7a15a1ab678f7ac  src/3rdparty/resonance-audio/COPYRIGHTS
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/resonance-audio/LICENSE
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 69f4520cec..af50612e1c 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -118,9 +118,7 @@ QT6MULTIMEDIA_LICENSE_FILES += \
 	src/3rdparty/eigen/COPYING.MPL2 \
 	src/3rdparty/eigen/COPYRIGHTS \
 	src/3rdparty/pffft/COPYRIGHTS \
-	src/3rdparty/pffft/LICENSE \
-	src/3rdparty/resonance-audio/COPYRIGHTS \
-	src/3rdparty/resonance-audio/LICENSE
+	src/3rdparty/pffft/LICENSE
 
 # for spatialaudio quick3d module
 ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
