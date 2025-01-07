Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC5BE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 06:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2260D40269;
	Tue,  7 Jan 2025 06:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_sdCek_ve2L; Tue,  7 Jan 2025 06:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DE684026F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DE684026F;
	Tue,  7 Jan 2025 06:18:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDD687AA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB78580B0C
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfQuHWbsw3bg for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 06:18:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3DFE280AF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DFE280AF1
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DFE280AF1
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:18:06 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-21670dce0a7so41811585ad.1
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 22:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736230685; x=1736835485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MfZl1Hrzj5A2ZcxUN6BkOQkBu3hZyMGzA5G9BAzr6Ts=;
 b=S1EUyzgckciDXJ9NQFmKnZDCz+WcO3RJxgYdoNOOmROn8oO8gRNAAsnWJWhaf7oCC2
 LrSO4D6qvX5uK1uit6enGspxh6qn/JlhWcf/wwJVLGlWqJJhC2TvS5WwO+3bK81xYf+j
 g+h+ASAe7m7hgMUpsQYhP1YIXKSRhIrp5Qg6cgdMmaMAivbl/PfmTs6+zuqMbbK6eWhM
 MtBMZSMRV/pccdFYbMr5gTYHNIX86ltmZHlQlum2Q4LdfWcAQtXl7TgRyaUGU5zVYZ1A
 MQwjaupd2DCx5VTQlV+7mL9fETpxhNv4LzSt4GRouJSjcTJ498DVCDvCRLoUAMuingNo
 dx1Q==
X-Gm-Message-State: AOJu0Yz8vgPPxgNBycicaA3EOEzBiX6pw8MsyprYkxko+0O/aeM8W6FD
 /ysVuqPdZxoFpSX5AEJZUEeKI1CPNpeOoJdj7+LbVMkLhl2iRq6CbykJEg==
X-Gm-Gg: ASbGnctwftZ4Xzhzca3rmcFkylPBgOVOAfzZd1uZcT5zSWtJRzXX6g1IWq3E2RnEylN
 tauU2HK8+xHuRwri2gOj4i/IZiG/3DFj+tdQVCqm8me07O1g7N7T7/OGiPCUXwEBt9Dn2wfhCMs
 yI/BDiHqDrHlSw9M59d7b1L4VjFTvAzqgBYkZzbXAeMabW8MUn7CNpNEhqLdxTG7PeyKsvXIKnO
 0JA+bLS/ll/G2l8snYHMBSQ22Uk+VaTtyVjSKM1H06sP3Nk5H2ZVmdeKzHZtHVQR7TTe1irr/qO
 d+QeNlrAr0hm8ksPq0lnEFFX0Q+DSK7zcGl9ck3C
X-Google-Smtp-Source: AGHT+IGcQJ139QrAggK3/1ptfmhlrc0KmISmQTIJrPEebsAnkIGx6hkT+b4kEskjy95aNFtVA+jvkg==
X-Received: by 2002:a17:903:41c8:b0:215:a80b:f6f9 with SMTP id
 d9443c01a7336-219e6e8926dmr826695265ad.8.1736230685158; 
 Mon, 06 Jan 2025 22:18:05 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9d948fsm302908635ad.150.2025.01.06.22.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 22:18:04 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon,  6 Jan 2025 22:18:01 -0800
Message-Id: <20250107061801.196165-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736230685; x=1736835485; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MfZl1Hrzj5A2ZcxUN6BkOQkBu3hZyMGzA5G9BAzr6Ts=;
 b=QTRttFki4BBeiPhwpaYkKjTNDHDhe+3ubOFW1Lj8sBKGFHAvWOBAnv2+C+dcakwLKA
 RCkTB2fbri8+AemRNF9gEpJEUx+CUYl2UwsF8r54Tc22awOE0sNeuwle9OvoENBr1YeD
 NqMnodoYO/GQgVqbmHHPl2lka5gmNw7VMHnkrnVpXfcVGrv+wwSA1xkmw+Y/anNFEw3U
 Kn67s7BkHrdTv/s22GaqELFARNOra+CdO+lk5TVpWw6osRkzOJKZZJaAg8GKWjg0MsI3
 6H9zkqAfSRZcsZCEbxI7tPYMTdZEs4MikNN5U2LGGi0Yx9TZM5SYfZtG9zMy3aObqQ45
 iBPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QTRttFki
Subject: [Buildroot] [PATCH 1/1] package/mtools: bump version to 4.0.46
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
https://lists.gnu.org/archive/html/info-mtools/2024-11/msg00002.html

Changelog:
https://svn.savannah.gnu.org/viewvc/mtools/tags/4.0.46/NEWS?view=markup

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index 0cad06ce58..1a10afdbeb 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  32ca85dfc1674c536143d4e0da60e3134039eb9552e0fecfa110e9c8736093ce  mtools-4.0.45.tar.lz
+sha256  8241b370d2337968c1d1314cbdbd5d5d188ddc905f2eb1198373a2bd90c70fab  mtools-4.0.46.tar.lz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 7089af339e..1e98880058 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.45
+MTOOLS_VERSION = 4.0.46
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
