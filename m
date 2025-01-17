Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF73C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B57607D0;
	Fri, 17 Jan 2025 10:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCLTpc_5nD7R; Fri, 17 Jan 2025 10:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE3606FB15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE3606FB15;
	Fri, 17 Jan 2025 10:54:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69030B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56F5440173
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4e_0WeAdAAT for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41BF74013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41BF74013C
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41BF74013C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:11 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53e3c47434eso2082709e87.3
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111249; x=1737716049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=09Md7Pm2dDtKy84Bkb8uJ+tlcZz4ViHreYPTrNYeUgE=;
 b=uQarhKnZNSkkwUdm0opt4GQl1R3CUVnPxJ1TJzWn9iTgk2Hh4p183/RZUFtNGe/q4X
 vqy7kqG/k5kFTlZzW5Bv1OVs0fetJXScxLiRrz9fCMJOc/m465nuKNzhl6syF/SiPHed
 WC4Q66QvSPBjepz8TCn9HL/OImkp6lVafiegRiYEBmxNum6D07SIeOO3cTigDTMmCVU4
 6OVSgqZxStX3v6Wn9XosRyTKIpzVUSWAbfm6fY1zjfvaktTK+73hBQSf6rCmz9YtaENO
 pHngqUYGDqKzLFVS2esDnu+fb7F+OIeydDOqwbgpDUxtstfU+6E2Hd4HbCvUtHtJb+fy
 kjfQ==
X-Gm-Message-State: AOJu0YyTRjooOzjL6dPSHNAy6p4QHVCjoof9fTrIWsYE4OwxK7VAyAub
 fzHcx6MAqtTMLiBuzoym+uyd12UCl0FPlijfmHAfRid9Yw991CIFJc9P1w==
X-Gm-Gg: ASbGncu/C/zQ9if+HUYkIlYdGhnV7jubBTml0sWb/qXEmfSA6zueHniLFvkutWbxCdP
 MDjw+dL9wH7HgEQJAjqVjMeglxK9IwVpD3RaJCpNwcujRyD8mHUvEH+GnS1EirMslzMb5Um4f7n
 2m8Tp4rgXf+pzXe+67VNvjHbet+P7NcowY5U2ndnbDAjtdAUrG2ZIoBjJtUHpxz1+awxJ2iWOmk
 MXsPUI5Bcb3NlD9s72h1fHP9d1DBu5++B2j/SDtxZwhxi/SWzJUTPPdxa3aW4Oz5bxZj8GYTxj8
 hRrdElUeQiM=
X-Google-Smtp-Source: AGHT+IHERMetnzyCfdvBOpEL0pKegoFTaOtc61KMkXnVCdNnmX484+KP4rL/PKreZre29XrieacymQ==
X-Received: by 2002:ac2:4c24:0:b0:540:5253:6af2 with SMTP id
 2adb3069b0e04-5439c22148amr541298e87.12.1737111248942; 
 Fri, 17 Jan 2025 02:54:08 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:07 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:27 +0100
Message-ID: <20250117105354.618220-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111249; x=1737716049; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09Md7Pm2dDtKy84Bkb8uJ+tlcZz4ViHreYPTrNYeUgE=;
 b=ivorLcpvoYw/rHEf8Vkp6KyEJI0XMJMDUXO42W7rMmlSJ2a6/yVxcs05z5/KdnTTHY
 7NZjklKqqF91VvOSExoW+9Zj3JrHgehrSy2TtCdLSMNPPeqntNIWuC3MzF0r6MIAUCu8
 Z54va7gDRcYf5JqFNjYke+pYrrxZERcfQybKbFZsHi2ZqOvW9beprmELz0EbGas1COjQ
 fMqUqe8c5nNntwGTcjTnqdWq/LSaEjkXw+L4XhwF/rCpmlsd4kCLPgyAhhbA0fjzAmfZ
 i4aCzaP0rEBPhAFyYUXRGoluEWtM7xzW1d7x0njyTKLEmMWSgdXOftt3sBoS210Nu6Fq
 oJsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ivorLcpv
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
