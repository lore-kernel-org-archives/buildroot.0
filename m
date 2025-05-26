Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22F9C5B543
	for <buildroot@archiver.kernel.org>; Mon, 26 May 2025 14:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2965A808D1;
	Mon, 26 May 2025 14:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDJ0yN0ZmHuz; Mon, 26 May 2025 14:24:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9768E80C6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9768E80C6F;
	Mon, 26 May 2025 14:24:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0652A19D
 for <buildroot@buildroot.org>; Mon, 26 May 2025 14:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0F2C80C6F
 for <buildroot@buildroot.org>; Mon, 26 May 2025 14:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9of47o1apgNr for <buildroot@buildroot.org>;
 Mon, 26 May 2025 14:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9143980C66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9143980C66
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9143980C66
 for <buildroot@buildroot.org>; Mon, 26 May 2025 14:24:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a374f727dbso231541f8f.0
 for <buildroot@buildroot.org>; Mon, 26 May 2025 07:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748269490; x=1748874290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EIw7WLaKC2QmY4SaRQGvHNaHbiOlYSoK3SH32xiqI/w=;
 b=DR567WGPBXbPlAzGd75UXu4YVv158h85oHg17ktYbZ+j9ZyME/zIyKL32uSnQoNbs9
 3z6GkcnaS738sUgs90THkm0bOAyyo+TnCKBzMqqoUQd1ojO9q1rtP70apJSxakjPY26q
 da+Zq25i2SkzU+x5Wm3/P1nZrMHBDyFMyCvzaLmAxBiJD5cB/w7Fus9HtsA2w7hFPrjB
 zx06jcQ6QXXGvejRs5zBo4vf5g2pyM847fdW2plrOJSflHtW57pDNGNaT6sdVk7GF5L7
 60EoQwIQasrniuJE9qD2JsKgWvM2M5JlXiXZLStU1gxpOOMOSaVcRnSMHm0ufdIRlU+d
 Hbwg==
X-Gm-Message-State: AOJu0YwEgDlCYl652RoDpTk+pJ3dfQuaaDG34Gm1lhOnooZLlovMnJ7o
 2YgwHm+rZWz8DuB1LxY9h/8YvvikPWP7vGCWxMO6rkkSbF81dNVzc9c+DFgNV8989FRxuXSf6Lo
 AdbCdcCs=
X-Gm-Gg: ASbGncuqoQ/Knmo59I0053+Bf8b1DT8UB5I0InyjEVCrs+xJP+ZmHm98F9wusGOw01H
 j/xiilZKh9/4yJE3+sRcBesltgt65ec4tIcI2REYIAY1aIFg2Gz61OmkkAjNK/DNWvFPTLak1Ni
 5t5QcuHcZB1aRMAvnpY1tOk5sGpAp2hDm2j5xwA7X9e1I70g9j1yw4OQRIG96jfSxFYGrhvxrDd
 4GIO9mfnnsWEk+XYTGOTScWn2shdkHfJYF+0+FH81UxECY6MzuHtIJbg0JgCWhYcUcfwEt6qANi
 LEFV4Bgt7jhQIEvhQVG7HGMJUJQcbyM9mksKhY0m9oKRqCA9B/dgT9Rk2TilMshAnWTOq0LgIV6
 4vcSVcQWUxLDVy1Hl9mTufoSUKljPAeU/OusPO0eGd+c24CVv4LmDNw==
X-Google-Smtp-Source: AGHT+IHYMnSmrPO+RfcKo7GdVcjELcgpW2UCwCblivqDMtqjeWOMMtZKcPL5y1UMtiwRYF/LOGnD4w==
X-Received: by 2002:a05:6000:2f88:b0:3a4:d0fe:42b3 with SMTP id
 ffacd0b85a97d-3a4d0fe4f1dmr6508798f8f.26.1748269490283; 
 Mon, 26 May 2025 07:24:50 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f3dd9c21sm244558515e9.38.2025.05.26.07.24.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 07:24:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 16:24:13 +0200
Message-ID: <20250526142413.29398-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1748269490; x=1748874290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=EIw7WLaKC2QmY4SaRQGvHNaHbiOlYSoK3SH32xiqI/w=;
 b=eBREX0qrNvhVh2c9clFHJplebCySr6N7fZJ7y/59J65sud5aDuo/LNeU2mY2VtpTmK
 efvfjQ4N70e9Z24gpgURSA6aoohq3ZBUPsDcxvnYJ49duaeh+DAZh5UllfzD5tHqUjQa
 Pv1laEOcriyxkVDnGzNPU/6cXkyC8hbUTw+P01K4RB6CTKktul0xX56wU3CboHkVRwlm
 DKUOmw/VB1Ry6VAOzsPJyXLDV1RLfZ6oHi5b67PhlqJqhcmmFVKrP0vMx91fZIMhN9T8
 XHBOpxx8IZGbnF4Ud6EkqnPXp5noLn4SuLZm+ltDVejVwBpdNOD7liv5ppIjEFFCTp1K
 Xn4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eBREX0qr
Subject: [Buildroot] [PATCH] package/assimp: apply security patches for
 CVE-2025-3015, 3016
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following CVEs:
- CVE-2025-3015: A vulnerability classified as critical has been found in
                 Open Asset Import Library Assimp 5.4.3. This affects the
                 function Assimp::ASEImporter::BuildUniqueRepresentation of
                 the file code/AssetLib/ASE/ASELoader.cpp of the component
                 ASE File Handler. The manipulation of the argument mIndices
                 leads to out-of-bounds read. It is possible to initiate the
                 attack remotely. The exploit has been disclosed to the
                 public and may be used.
    See: https://www.cve.org/CVERecord?id=CVE-2025-3015

- CVE-2025-3016: A vulnerability classified as problematic was found in
                 Open Asset Import Library Assimp 5.4.3. This vulnerability
                 affects the function Assimp::MDLImporter::ParseTextureColorData
                 of the file code/AssetLib/MDL/MDLMaterialLoader.cpp of the
                 component MDL File Handler. The manipulation of the argument
                 mWidth/mHeight leads to resource consumption.
                 The attack can be initiated remotely
    See: https://www.cve.org/CVERecord?id=CVE-2025-3016

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...ASE-fix-possible-out-of-bound-access.patch | 29 +++++++++++++
 .../0004-MDL-limit-max-texture-sizes.patch    | 41 +++++++++++++++++++
 package/assimp/assimp.mk                      |  6 +++
 3 files changed, 76 insertions(+)
 create mode 100644 package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
 create mode 100644 package/assimp/0004-MDL-limit-max-texture-sizes.patch

diff --git a/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch b/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
new file mode 100644
index 0000000000..427b7a4888
--- /dev/null
+++ b/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
@@ -0,0 +1,29 @@
+From 65c95bf3207b81fe522811d45780d72ed41d9c1e Mon Sep 17 00:00:00 2001
+From: Kim Kulling <kim.kulling@googlemail.com>
+Date: Wed, 12 Mar 2025 20:17:38 +0100
+Subject: [PATCH] ASE: Fix possible out of bound access.
+
+Upstream: https://github.com/assimp/assimp/pull/6045
+
+CVE: CVE-2025-3015
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ code/AssetLib/ASE/ASELoader.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/code/AssetLib/ASE/ASELoader.cpp b/code/AssetLib/ASE/ASELoader.cpp
+index eb6b37dc9b..c63edcf6bf 100644
+--- a/code/AssetLib/ASE/ASELoader.cpp
++++ b/code/AssetLib/ASE/ASELoader.cpp
+@@ -731,6 +731,10 @@ void ASEImporter::BuildUniqueRepresentation(ASE::Mesh &mesh) {
+     unsigned int iCurrent = 0, fi = 0;
+     for (std::vector<ASE::Face>::iterator i = mesh.mFaces.begin(); i != mesh.mFaces.end(); ++i, ++fi) {
+         for (unsigned int n = 0; n < 3; ++n, ++iCurrent) {
++            const uint32_t curIndex = (*i).mIndices[n];
++            if (curIndex >= mesh.mPositions.size()) {
++                throw DeadlyImportError("ASE: Invalid vertex index in face ", fi, ".");
++            }
+             mPositions[iCurrent] = mesh.mPositions[(*i).mIndices[n]];
+ 
+             // add texture coordinates
diff --git a/package/assimp/0004-MDL-limit-max-texture-sizes.patch b/package/assimp/0004-MDL-limit-max-texture-sizes.patch
new file mode 100644
index 0000000000..ae7e54f35d
--- /dev/null
+++ b/package/assimp/0004-MDL-limit-max-texture-sizes.patch
@@ -0,0 +1,41 @@
+From 5d2a7482312db2e866439a8c05a07ce1e718bed1 Mon Sep 17 00:00:00 2001
+From: Kim Kulling <kimkulling@users.noreply.github.com>
+Date: Wed, 12 Mar 2025 21:29:33 +0100
+Subject: [PATCH] MDL: Limit max texture sizes
+
+- closes https://github.com/assimp/assimp/issues/6022
+
+Upstream: https://github.com/assimp/assimp/pull/6046
+
+CVE: CVE-2025-3016
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ code/AssetLib/MDL/MDLMaterialLoader.cpp | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/code/AssetLib/MDL/MDLMaterialLoader.cpp b/code/AssetLib/MDL/MDLMaterialLoader.cpp
+index 2cac8a1e26..2e09992e89 100644
+--- a/code/AssetLib/MDL/MDLMaterialLoader.cpp
++++ b/code/AssetLib/MDL/MDLMaterialLoader.cpp
+@@ -209,6 +209,8 @@ void MDLImporter::CreateTexture_3DGS_MDL4(const unsigned char *szData,
+     return;
+ }
+ 
++static const uint32_t MaxTextureSize = 4096;
++
+ // ------------------------------------------------------------------------------------------------
+ // Load color data of a texture and convert it to our output format
+ void MDLImporter::ParseTextureColorData(const unsigned char *szData,
+@@ -219,6 +221,11 @@ void MDLImporter::ParseTextureColorData(const unsigned char *szData,
+ 
+     // allocate storage for the texture image
+     if (do_read) {
++        // check for max texture sizes
++        if (pcNew->mWidth > MaxTextureSize || pcNew->mHeight > MaxTextureSize) {
++            throw DeadlyImportError("Invalid MDL file. A texture is too big.");
++        }
++      
+         if(pcNew->mWidth != 0 && pcNew->mHeight > UINT_MAX/pcNew->mWidth) {
+             throw DeadlyImportError("Invalid MDL file. A texture is too big.");
+         }
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index a4614a01a2..39ad234546 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -16,6 +16,12 @@ ASSIMP_INSTALL_STAGING = YES
 # 0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
 ASSIMP_IGNORE_CVES += CVE-2024-48423
 
+# 0003-ASE-fix-possible-out-of-bound-access.patch
+ASSIMP_IGNORE_CVES += CVE-2025-3015
+
+# 0004-MDL-limit-max-texture-sizes.patch
+ASSIMP_IGNORE_CVES += CVE-2025-3016
+
 # relocation truncated to fit: R_68K_GOT16O. We also need to disable
 # optimizations to not run into "Error: value -43420 out of range"
 # assembler issues.
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
