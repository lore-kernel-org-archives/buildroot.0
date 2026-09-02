Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E2EC61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 11:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE85D40835;
	Wed,  2 Sep 2026 11:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pc1oQsGD1QhZ; Wed,  2 Sep 2026 11:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788348976;
	bh=/31c/plEvRBz7CxHpM3Jfk7D2L+bbZbf1PE3SEIDPT0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=g6Bvt6VQ4aSVGMVKOLDEfSG2TRGSdocf43W1PT3VK0Uh/Mchom6SWptaCaJoB4XPJ
	 Jjq9lry7IUzJRcqkeMOcAQdpfMoeBGMDWmEHblmIUseLPO2+zHRSblFDIe/mZEVFyI
	 sUqM3P6xjxnfRad2PdljV+M66OoSFxbHfIFTlmLzT6jaHCnsBWWkntNR2NGNhHZrtS
	 SVctezNsDv5EmYgp3+86sRtpxTTlI4A5z59fWU6WzRV8IpZmR3KjMXIZyuCq2xsjSE
	 qRdOkbBKSUNmdnNg2JVoLLUwSrpii7h226eM+Dl2t9QwUcSlbJd0FBLpBa8FrNgTMs
	 RdQJzrVyJ2YxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A231C40821;
	Wed,  2 Sep 2026 11:36:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 272CA363
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 11:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11A196072A
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 11:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARlpj5hC39PL for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 11:36:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E56A360726
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 11:36:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48436216a98so616384f8f.0
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 04:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788348971; x=1788953771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BDQdPmU9ySOw4GE7q2OCxYYfHVCz9KnBlVgPHTGX+1I=;
 b=c2ZeEj196ptRdAEFVrm+X2+a55CxGPWkMIIaa1wKuT8edDla0YiLAvKmPHYvTW2yQJ
 oEkGzrf8Ma+CmTg7VxxamXlmFGAhHORHkIv1yPXcM38BNtOASEm/StlFxOq52lZtTtJl
 4V6iZtLN4assOcykGzqEp3aM93A992gYUEOnoHIP+p41BQ8BsbT/vLrlYAiWrlGcyAte
 Nuza9JkeDdb/D0xCy+rL7erUU7XGjTEHzMZwSTJZNTudrQOZI64hg9S1ypIWwk+AN4Tf
 Vqanub4V6FiVYUUVXJ9pu2UXE0xUk1Y+1OqyAGPCF23bOTlKjINrDflHeeui7IzYQ9VS
 ygLg==
X-Gm-Message-State: AFuF++nFMksBw84crxomtM61zTgXbDx2GsZCovzYXXf30b9SWdjqcI3t
 Cl4THyYKMpj5L5tTdEOWgJ1IOZ2KDzRS06jdMXNn60VmXlxcoPXm7Kpap92PRxDOXGfATOwAOHO
 tagOqkqE=
X-Gm-Gg: AYBFou1QFqxCrkjlUrxl0ZPFkMghauxbadgt6sVvWCs1HtAhjc859ZnvSPPhq+5eOK8
 m4AIgpb35UeldLYWBsMxVGqvF1rdpUTxwkhJJn2wgJF42CsrVPtrM4/+qhgLN+GblObsEaZBFyK
 MHeCHUb93W1vPzWHpYMlXEQZeRlkdzD0q/H+5+eSILbq7kOiX6du/ajWwj/5lDjgVhGQDQV6/49
 3mfcqLbtplGJhAqq3SVsbI6yMy7svKZbEsxX9W3Y5ZRQCiB4VI9CkcfbkJL04NmFQQP2y1werDR
 miXuwhHVYCQiSCoq8ZhN0HtbCztqc+/g8jAz/YMQJFk3mKTHjeB41WaSJW+LnEnj21CM384QEAR
 CMWIEM337i9bFPQhDlFV3QTd81mzQsO4yO9OmgICiP9P06G4hEAvQmk614Zo56RjtlNbrYLJpeh
 5L20tg1MbcET4scl7e+RoJ09juoJwkeN3KV72+JJ8R8+BUVuTJxwYujAyvXSKxQDhyLx/UVkWdt
 dlqyw==
X-Received: by 2002:a5d:5f54:0:b0:482:e658:bb8e with SMTP id
 ffacd0b85a97d-48488f0dba5mr7886399f8f.12.1788348971062; 
 Wed, 02 Sep 2026 04:36:11 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ed3840sm6101877f8f.17.2026.09.02.04.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 04:36:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 13:35:53 +0200
Message-ID: <20260902113553.164630-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/glibc: security bump to
 v2.41-159
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

This fixes the following known vulnerabilities:
- CVE-2026-5435
- CVE-2026-6238
- CVE-2026-6791
- CVE-2026-6368
- CVE-2026-19499
- CVE-2026-77117
- CVE-2026-80489

(alternative to commit be382f6061216ca82a735d0992894c4e6fe5173a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/glibc/glibc.hash |  2 +-
 package/glibc/glibc.mk   | 24 +++++++++++++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 03e8722057..87dd8b67ac 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  130d77e16a08f7e52e14b49d8554997877a4fe82ac6b840a0202716146ac8fb5  glibc-2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363-git4.tar.gz
+sha256  e3550f6d074325ad8ee75fff96f16a967055e88f69e1455333ace515b8ac2067  glibc-2.41-159-g3d141c23899d90559741b5fe74db97ccf0ef5c29-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 7c64fea4a2..65a99b4a68 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363
+GLIBC_VERSION = 2.41-159-g3d141c23899d90559741b5fe74db97ccf0ef5c29
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -66,6 +66,28 @@ GLIBC_IGNORE_CVES += CVE-2026-5928
 # Fixed by glibc-2.41-142-g1a74f82eedaf0987eda1f522121e6a48fac502e7
 GLIBC_IGNORE_CVES += CVE-2026-5450
 
+# Fixed by glibc-2.41-149-g0e8c56b386d72ba2ddf15784423f2e894c63a241
+GLIBC_IGNORE_CVES += CVE-2026-5435
+
+# Fixed by glibc-2.41-150-g05e1eaea619072a92ff1f5fefe1ac2dd5758829c
+GLIBC_IGNORE_CVES += CVE-2026-6238
+
+# Fixed by glibc-2.41-152-g965b580070b8184b0dd390800d9194291a600e67
+GLIBC_IGNORE_CVES += CVE-2026-6791
+
+# Fixed by glibc-2.41-153-gdfc8ef388ef7856f318ade7dec501f92ce54f9e3
+GLIBC_IGNORE_CVES += CVE-2026-6368
+
+# Fixed by glibc-2.41-156-g5256941bc811248670eda4636dccd0a390d34dec
+GLIBC_IGNORE_CVES += CVE-2026-19499
+
+# Fixed by glibc-2.41-157-ge43e46f94398b3de446fec11da1e7633ea5202ec
+GLIBC_IGNORE_CVES += CVE-2026-77117
+
+# Fixed by glibc-2.41-158-gec116a0fbedcc860631e525e70b409cf295f27da
+GLIBC_IGNORE_CVES += CVE-2026-80489
+
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
