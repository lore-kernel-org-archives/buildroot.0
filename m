Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60836ECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC19C610B2;
	Fri, 26 Aug 2022 06:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC19C610B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTYQrFaxK6vj; Fri, 26 Aug 2022 06:50:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B73610AE;
	Fri, 26 Aug 2022 06:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07B73610AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 867F21BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E13C83E8F
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E13C83E8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5a8migEkaggB for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA94683E85
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA94683E85
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:15 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id kk26so1350225ejc.11
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ezc8B4Y3+YCdxtBQx53kMjL0k4Yz53GcWnTCi1Boj2I=;
 b=PnW+cTEuPj1yextLO9FTaHdurEqVlrabc2nkApx5Uaf7kvLW7JmtOd4P6KSQArnnl2
 EHCBUHoAHrdUZ3Flxi2ScWeDmzjw/3b1CksOHUgQidDTeC5sisyM87N30zEUHCcJ4ngk
 t+cmaI+9mh5pdJLqJ9YcUYmi3dWFaYGmh3ph8x9yZLEK4fGvRNa6vJzZ7Cz0Fi8tLMsB
 rZx8WoOt9OfL0oJ0Sy3SwPX1SJ8MPLIS4m7dmQx8ZaXj/l9hmbfTe+ipDSF8XfU9ECuU
 4OkWeQeezb2Spke3ta/b3MkwNCoi32i6ghS+rXPMFPqG6P7xGSRCkfSPBQNkT7vK1DdH
 OtFg==
X-Gm-Message-State: ACgBeo2IdHi5cn/fgio5MnWpfv0hGKABGVimq0xlUEXdhMcdqXZFAtPC
 cKvmSxmbJfSo+hAPSwwJFSGVaMZCEaNPOtzM
X-Google-Smtp-Source: AA6agR6YKB6a7rtQtGnDTJDbl4l0qvcV/6kTn3aKAAOHexZUj9Scl/9x6SZMpJ6PjOUWhVKZ6KHEkg==
X-Received: by 2002:a17:907:948f:b0:731:3f2e:8916 with SMTP id
 dm15-20020a170907948f00b007313f2e8916mr4814786ejc.442.1661496493724; 
 Thu, 25 Aug 2022 23:48:13 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:13 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:41 +0200
Message-Id: <20220826064758.3968647-13-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ezc8B4Y3+YCdxtBQx53kMjL0k4Yz53GcWnTCi1Boj2I=;
 b=m5UEALJ83MoB1B5QKk7tyJUcsOxSvOlZ9lpAhG/FCk5xCvTyYje+t0jircGesJDqi1
 fd9vMKlqafud0VzZOhxLus/jiBODeVo7vTVVI6ChBRg4WwdnRuPkmqaf4bJruEQSjcxF
 8FVvoxTqDvD/FWi2W21pNApJ9RKkhhtY/bNG89TrMMtc6V2Je8BP39tlzbE1DKB3fK4I
 dK3mBk5uOH5zdm97bpdWWcmbBwzUVQSApn1B6n2SYfAJElx0kIZ7h8voWKEewATf7tjK
 RbH9cGBw1/r3ToNGP6mGHXn+vGCPGnPDTwlQu5st3YcrK+Xv9pVtz+2WRWQrrd9Bin9V
 92qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=m5UEALJ8
Subject: [Buildroot] [PATCH v2 12/29] package/qt6/qt6base: add qt support
 for SSE/AVX SIMD extensions
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/qt6base.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 440617ba74..5474a80302 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -35,6 +35,25 @@ QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_zlib=ON \
 	-DFEATURE_system_libb2=ON
 
+QT6BASE_CONF_OPTS += -DFEATURE_sse2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_sse3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_sse4_1=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_sse4_2=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_ssse3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_avx=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_avx2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF)
+# no buildroot BR2_X86_CPU_HAS_AVX512 option yet
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_avx512bw=OFF \
+	-DFEATURE_avx512cd=OFF \
+	-DFEATURE_avx512dq=OFF \
+	-DFEATURE_avx512er=OFF \
+	-DFEATURE_avx512f=OFF \
+	-DFEATURE_avx512ifma=OFF \
+	-DFEATURE_avx512pf=OFF \
+	-DFEATURE_avx512vbmi=OFF \
+	-DFEATURE_avx512vl=OFF
+
 define QT6BASE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6BASE_BUILDDIR)
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
