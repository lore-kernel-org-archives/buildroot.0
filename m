Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83463C30658
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 07:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15CED84546;
	Fri,  5 Jul 2024 07:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snCXXTvg50CP; Fri,  5 Jul 2024 07:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D22584552
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D22584552;
	Fri,  5 Jul 2024 07:35:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5ABE31BF28C
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 07:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51B5940462
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 07:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fvCq0u4pr9e for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 07:35:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BAF5B400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAF5B400F6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAF5B400F6
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 07:35:32 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a724958f118so156417766b.0
 for <buildroot@buildroot.org>; Fri, 05 Jul 2024 00:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720164930; x=1720769730;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B/bRK17Fxh1kpeVbWkMDE+z+bDwdivk7fM9T8tV6KH0=;
 b=CjXwM94KI7TooFdtPwgNe0MqocubhnIRtMhfSttu/mRvrf8MdS40h1yT16uwChcSoj
 rRlctYWaP2VLo7oXe/I4n2gh0Tv16u5sSqFaZHXxzz5/qgT7WJooqa1bRbe7KPAUqPU2
 2cDAtFBIPde/pVbR90T76qO938XcllXvLeHLLperyJPRNuYTxhfU2N2b3GoFwMECdNMd
 iDIkPdPSzlDehAPI1hKkH+O4TIzK6MgOy7R1o9LYqbVih9SkOOjW4a1mBDEDcPeo3YHV
 sfZfTAxt4fPbpH/+KPQgP0/6gYRPHPidByUVfZk81qKNCn3BwlIDW4Txe6UXAIlhngwx
 SFSw==
X-Gm-Message-State: AOJu0YwZIQXszqKykBIBA8uAicm4hw+Jlm+IHIk5fuUpMK/Xj18Vj/br
 8YiMKmiUjHvHiO+tCyfrbD6+XKl1e9BAe2nulyXhhHiqT9dyzZbF3eI3cLrsETWEUaMTPtTKOo3
 3gZA=
X-Google-Smtp-Source: AGHT+IERG+mIj7QQUndL2W2fgwvt9zmLWEtUxXME/aGfdLKSOnSucxxrUs6+hNUDg+at+zGYAmctsw==
X-Received: by 2002:a17:906:6a02:b0:a72:548a:6f42 with SMTP id
 a640c23a62f3a-a77ba46bce0mr289935466b.18.1720164930424; 
 Fri, 05 Jul 2024 00:35:30 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:f8c9:214d:f5ce:3e55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77cc73d48asm32894366b.21.2024.07.05.00.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 00:35:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 09:35:27 +0200
Message-ID: <20240705073527.3254389-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720164930; x=1720769730;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B/bRK17Fxh1kpeVbWkMDE+z+bDwdivk7fM9T8tV6KH0=;
 b=hmJAPqP/kA00mwnSw0+GLX6NlwS8UItkw/d4QveRLOcIKsRDlzIBaNK2em1EbC2oEF
 r30+Cz7Wkz8JD81sHZrWjhdX0dZUxRfMM4oXjakBjQJZKM3+BuAk8TRd2CVVJ2wuGOLP
 y5TX+bUjOUHFYTX4fTh5nYSGvTS2qhFfXZgc8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hmJAPqP/
Subject: [Buildroot] [PATCH 1/1] package/oatpp: update the patches to be
 applied with fuzz 0
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
Cc: Alessandro Partesotti <a.partesotti@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, oatpp fails to build with output:

    Applying 0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch using patch:
    patching file src/oatpp/core/base/Environment.hpp
    Hunk #1 FAILED at 29.
    1 out of 1 hunk FAILED -- saving rejects to file src/oatpp/core/base/Environment.hpp.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...re-base-Environment.hpp-include-cstdarg.patch | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch b/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
index e9b78328375f..33fa04a2f2a9 100644
--- a/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
+++ b/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
@@ -1,4 +1,4 @@
-From b3e8930ccbaeeb77a4cd8b0fffbe52a208aa9a29 Mon Sep 17 00:00:00 2001
+From 6ac376cec5c9573abf3ee3b82e71bd2b7e410dad Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Thu, 23 Nov 2023 22:45:56 +0100
 Subject: [PATCH] src/oatpp/core/base/Environment.hpp: include cstdarg
@@ -16,22 +16,24 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: https://github.com/oatpp/oatpp/commit/1d11558e2cbbabc0db02a233bf00d651ce5ea758
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/oatpp/core/base/Environment.hpp | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/oatpp/core/base/Environment.hpp b/src/oatpp/core/base/Environment.hpp
-index fd77a5c6..05d5c949 100644
+index 984afdf2a7f5..2eb18be3e196 100644
 --- a/src/oatpp/core/base/Environment.hpp
 +++ b/src/oatpp/core/base/Environment.hpp
-@@ -29,6 +29,7 @@
- #include "./Compiler.hpp"
+@@ -28,6 +28,7 @@
+ 
  #include "./Config.hpp"
-
+ 
 +#include <cstdarg>
  #include <cstdio>
  #include <atomic>
  #include <mutex>
---
-2.42.0
+-- 
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
