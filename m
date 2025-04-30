Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2925C369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 12:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BDE2402F3;
	Wed, 30 Apr 2025 12:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGgGrYQUhTzl; Wed, 30 Apr 2025 12:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6773402FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6773402FD;
	Wed, 30 Apr 2025 12:21:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F38E943
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 12:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0564340162
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 12:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2sMWykJ2bv2 for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 12:21:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E0B5F404CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0B5F404CF
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0B5F404CF
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 12:21:43 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5f861d16622so2753654a12.2
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 05:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746015701; x=1746620501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WowrPBvc5IVDq9eOqpB1lSiRMaJ3g9UJH2dGJ5rFuAs=;
 b=jaUwgi9R72W6CUcB+pOm9nm/OiHIf7mBf4LNOVolUs852BRkZ1owmsDpZ3AiaMjzN8
 hg0R7fzSvK/k9tbOk5BD8ekPTmQ2Z6ymgf5M6Dt2TkVRATEn38u3e1F3rr0gF+NTnra4
 90DkkbG0hvkVqCXiocm+o2gEbcJMokJ/8zBVpS/AMPDBX81aESdAMicPHrshcR6TOrOD
 JFUSGpeW9CZnpx6VIWJmRInCZA+DL/l14HMfzPMlB2NRKYji2mGP4Dww9tt7DzdziNuL
 h/MPUtvzBo4josTKlyUIuDvuiM5fhI5fgXTgm4ZV2wa6i4XCcmYQlkFFYQUpiyWB5rGa
 wA9Q==
X-Gm-Message-State: AOJu0YxZI1YEvbVZSk4N2vlYXM+hG1emFU/dPopouWILQ1zFk8RRSWl2
 lVlwcKus8a+KgQYlYll0C6i3M9gl73ElTdG7lqDJiQ6cfW2tM/GyWv7olXBfGG/4BuhlZ1BUT7J
 z
X-Gm-Gg: ASbGncsUJP51L9RlOw0vs7gfA6wjpyXHa/VYmVb8IYEC+NAuRwzcBDMsiV0tmqgowZz
 Cgw3kQfIx+WO6cdI14iIAMojV5l6o5GkQQ0hT2A00k8t57FzrYsokVisfRyVk98cjRq2JlViTIQ
 TGMN4bpwfLODDuC7jrVFe4+LAbTHtDW8YOqtaTC1HUEgU7Vn3cxv9ErdksMkpmbDkwfT93D85hR
 tnBCPK1OYw/lYZJ5r15GZx/94g2Jr43Yzxqc4WSUErG4mE7PpVBpGi/+C0NZg2rXagAaZf/XFYv
 ZHqB1/Z6CTlFVly8XFU9/QAZcqx/dFgA0Np7E8dy4TkZHcK4MaBJNVwRE5qC7/18bRpOix5QKGB
 qklKi
X-Google-Smtp-Source: AGHT+IH8vvKvc88452DzJTvTtX1iUDlmnxhX/xCvWO7YEYtBIoxP6jGKE2kg8uETEGSimw5g4EdvUA==
X-Received: by 2002:a17:907:6d15:b0:acb:4cd7:2963 with SMTP id
 a640c23a62f3a-acee241c417mr256414866b.33.1746015701430; 
 Wed, 30 Apr 2025 05:21:41 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.66])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e41b2fcsm913975166b.26.2025.04.30.05.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 05:21:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Wed, 30 Apr 2025 14:21:31 +0200
Message-ID: <20250430122131.2795844-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1746015701; x=1746620501;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WowrPBvc5IVDq9eOqpB1lSiRMaJ3g9UJH2dGJ5rFuAs=;
 b=d05gDbfmeTkX3cGXb3bJSZ6+NGxuCyqcHLbZXzU/r+HYFZoTUrQ3kN20S9lggl00pL
 AkqZtS62MjW76Tb5ZIOyqAUn6znG4C7+qYZdYFNx3pK6VWQtc36ZMsCOxTHwqu70SSJV
 N4ZAK5p0bF5zK/VrcrEA+HduUzqW38HTaJmic=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=d05gDbfm
Subject: [Buildroot] [PATCH 1/1] package/ufs-utils: bump to version 6.13.11
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
https://github.com/SanDisk-Open-Source/ufs-utils/releases/tag/v6.13.11

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/ufs-utils/ufs-utils.hash | 2 +-
 package/ufs-utils/ufs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ufs-utils/ufs-utils.hash b/package/ufs-utils/ufs-utils.hash
index c6ef91a025b1..f825bf5af7c9 100644
--- a/package/ufs-utils/ufs-utils.hash
+++ b/package/ufs-utils/ufs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  66259581b13e33edeccb08edd2389627121adf9b425ba4545f6a84d7292ef4fa  ufs-utils-4.13.5.tar.gz
+sha256  e79c879a80936c497fd41a61b6da5e34fb848625453e3ca9e0f6e2398f3609bf  ufs-utils-6.13.11.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ufs-utils/ufs-utils.mk b/package/ufs-utils/ufs-utils.mk
index 504f87f375d6..60fb2f56ea26 100644
--- a/package/ufs-utils/ufs-utils.mk
+++ b/package/ufs-utils/ufs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFS_UTILS_VERSION = 4.13.5
+UFS_UTILS_VERSION = 6.13.11
 UFS_UTILS_SITE = $(call github,SanDisk-Open-Source,ufs-utils,v$(UFS_UTILS_VERSION))
 UFS_UTILS_LICENSE = GPL-2.0
 UFS_UTILS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
