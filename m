Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35035C3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 11:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75C2981B04;
	Tue, 20 May 2025 11:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wolO0COBhXTH; Tue, 20 May 2025 11:34:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9A4281AAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9A4281AAB;
	Tue, 20 May 2025 11:34:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C24D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F003400D6
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIjLJN2Tb2Oi for <buildroot@buildroot.org>;
 Tue, 20 May 2025 11:34:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39D34400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39D34400C8
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39D34400C8
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:08 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-327ff195303so46268381fa.1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747740846; x=1748345646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ZOr6HnStibVQJlq4qCvRcLAiesuj8rbA43HWeB/xm8=;
 b=O6olGH0akvY3jowPSnnL2EB83I0jYOlT5d25V3wWICD1IYetRdCH9NR92Eu/Uwz03Z
 17pvN3C8CGnGbkzy9V3kcaYNBzPBczwTWo0PXb8dFDvuDKUG0Q5QCh3mjDuM17WNYOAU
 ophPbXRWGJwD0ADkoZRBiBp9/7ELsh7ubzixUfB7aNP3kZp1k0SuYYjF2Y21sG729Obk
 HFsPaQkh/H1UL6TDzEx2gOjLUap+ZF42C57QHCdZubcA2Ni/zUH5H59hQGSsxjdjrgzV
 WvcSEsu6+DVBkKyOWFbSVF2zj4+4kRafsfI1AuX0rv53CZ/p2AFj7Z3K2IB1OMzKncny
 wzyw==
X-Gm-Message-State: AOJu0Yzr4Qvhknp233t72NzPKpag8sQ+9wv6cz3NcHDDrd/QjCWumqms
 Qdf6IGukphBtVahFNaGet7suQXP+FVGpR/ul5SEJw65afey3iAHuuPFo9akvcg==
X-Gm-Gg: ASbGncvVwKzZ1eHCzVK/xxjzV1FA9OjjL3MlPZzJ8RrRHL2yFGMIEE53woB5jVVTdC2
 Oc5cvb0fPXF9HaH9oabmjyWCm1GyN0Lt7jKhxFudyL85NiiuInHGXRp12e+phQlf3QiNoFjCubT
 /2bw9xOe1HO7rdoSIh85xvSqj7LPmvr69xVnqeExRsT4dP8B1NBumXTjDj6lGznu5y8q4oweIWC
 MURPiRMM5EZ92IrmkyHiOln+K+HikCc9INjS776qtANIfO8lo8gqYzbMcRGHVp2N9ClGJFlTQLS
 louRhhPMcA2sySBbHYDEq+Lvm7nmjCsklvBwZAOIcxjkSfnaxugGqnGGPSIDdVTJAAEsZXHWxzA
 SHktlXm0qjk97jsq/
X-Google-Smtp-Source: AGHT+IE24w/6kHPOv5BY+nSCGYLKYUW2nSkzNkzpNcWKyCXme9CpOB1N9gA6KbdRntVrFOpcxziiHA==
X-Received: by 2002:a05:651c:1554:b0:30a:4484:3ee1 with SMTP id
 38308e7fff4ca-3280773e691mr57892681fa.23.1747740845858; 
 Tue, 20 May 2025 04:34:05 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085b8bdfsm23324841fa.76.2025.05.20.04.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:34:05 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 13:33:31 +0200
Message-ID: <20250520113339.2525537-13-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
References: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747740846; x=1748345646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ZOr6HnStibVQJlq4qCvRcLAiesuj8rbA43HWeB/xm8=;
 b=jnSGpmd1qANGbtqd5BgLg4864N4w4anvIGSDduxDA2fRDh3VMPDJw5Pc2WRXI4hDKz
 WMuZGt7M9qsRw1RoG9hff2NmP20iL/H6M84R3RuffMUuOLQv6fMovwG/FpuL2vgQMZVi
 g1i+yeJP+RjnKD4zZYVS7SbSBsTsoBYaIXkGfOa9/NUX9bwdbbSTB9F3ehM1BDCmvaaB
 OBabsrNteho4SQgHqcZXF79POTQ0ToYEwgG9FwORmTV77NwVMPgs5ZxkCOH5n+I2iZDW
 puOq5jXdy2RxGQKIkJjQBjHfKZRNS/VDeeXdJFM61DmdpYsCo3L6fbouu0meD3o3By+q
 lRdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jnSGpmd1
Subject: [Buildroot] [PATCH v3 12/12] package/qt6/qt6tools: build without
 clang support
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
Cc: Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
If external clang is available on the host system, the buildsystem tries
to use it. The result will be unpredictable. We can't use the version of
clang that is shipped with buildroot either, because it is too old. See:
https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.9.0. So we
disable clang support in qt6tools for now.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/qt6tools.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index 2e3268558e..0270575455 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -33,6 +33,12 @@ QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
+# Disable clang support in qt6tools for now, as version 17 is needed:
+# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.9.0
+# This also prevents qt6tools from using a random external clang if i
+# finds one on the host system.
+QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
+
 QT6TOOLS_DEPENDENCIES = \
 	qt6base \
 	host-qt6tools
@@ -63,6 +69,10 @@ HOST_QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
+# Disable clang support in qt6tools for now, as version 17 is needed:
+# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.9.0
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
+
 HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
 
 ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT),y)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
