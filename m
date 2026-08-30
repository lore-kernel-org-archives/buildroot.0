Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5D3C61DE1
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 15:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92ADF80D62;
	Sun, 30 Aug 2026 15:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmhe_uVm0PxT; Sun, 30 Aug 2026 15:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788104903;
	bh=EoDfLbFUi3NbXGhIk0jLP+zw6DFcH5q13ft7PS4ThTY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=smhp/Ej2SDLRu44Hzzr5HibspG6E20pOFDTySuTvHa51+8dVWxhw+84TTFb33oGIP
	 5OfiX7S0G7OQRNuPkYDzRGq2WBW8JGVMlV9ED7/1izW5ZsYWMCobWpLSljvYXPsOAW
	 A5uCCfIEPL8ibCmCSjFGgNTxWIQ22FPWzM94KWkDtV0IMnEYViEGA1ncTChO0mh3hO
	 TWeUUupC35rb9Blvad2N+wD495rg5Yno5o1AAchDrA0iZMJv06pmKngfLZIQnOYBz3
	 i8Bn2nF914+NucGcBY2Nj0eXnKGS9zdY6n5WzAjr2GwROCjOJ3Bc2W9xCXU9FRPQxf
	 o6isvbubeMunw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DA1780D3F;
	Sun, 30 Aug 2026 15:48:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC06623E
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 15:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C59E640077
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 15:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sMM7UQ3zvl4 for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 15:48:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=okmEvwKF
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A28FE4005B
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 15:48:20 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so22277585e9.0
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1788104898; x=1788709698;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dTZc16nq/NXW3PvoAeTPJy00cxxjLPdxYQKaVCYuB24=;
 b=okmEvwKF6fuTawpBPkLPxsHa1X6WOduekgdpFpJXcQTuSfQ9GV/+LhjXv2hARsGcpL
 rZGOtEqRA1McxHJEgq4SjUGKhX1kL2C6M5MPyBQ74LuRzmED0O8ta2Z6Tygm6ueiYBzt
 2VmXRoKmOdaflUqbCyX3rRw0MRK1VkrHTpyTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788104898; x=1788709698;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dTZc16nq/NXW3PvoAeTPJy00cxxjLPdxYQKaVCYuB24=;
 b=sjyxLRLgffkvX/HZl7vqVnpOzLDV70xAgdM51nazW9cq3CuFgxRTmWZXXbXqdMu02i
 9z8kprgYZnvGaft+f1ZMrt4r79VAMKtGRyiIC/O2gTtu0jGVHFwi6P6VjDGsMuJ7IhQ3
 dE7J6u/PqMs9Y9+Q6aStQSHzeYQt05hyfxkGf3ofYPyEvb8i7qyF0CGKedYGaG/MRoeY
 H5sO2RddRipZo+tThZH/difJMGar2hnGS4Dw7WIipBFCUB/XZV0jmq/0SysT1+N5V7Gw
 BSGo4m3Nio5cLlINGKnpP+ZFzITLo7PBAmM33uaatq9MYFdrI2/DfUcYJVCCeXwrIuzJ
 YouQ==
X-Gm-Message-State: AFuF++mQNg6Du2qcT19nsQjHP50bHZ0CXjb108Ddr6cTkBi5SXIWdVGA
 /9LtDfP/9V8uFCOEL2+2VIA3EkZAc4C6dm5nwUFkcHGB0+ILC4k+MgS2nhTyO1GyUjDl1jMVRWX
 EpsXmq/w=
X-Gm-Gg: AR+sD12QdyFWsRBRuDmiadGG/RI84WpZclbLQLI+WgOD/Tn+nXMN0pYepjnYQK/97Je
 OizMmZYsNmCm1n1O5ccbAkGwGXPc8fGZXqCzXyKgnbfl4EYTkS/SOw9WFKbkR3wU6q/w2r7oeHw
 PXgVdfem/gpbDGXu1BaatyOAffPGkk6+bayEtLOnqKLT0f9oqWdQo0lJD4++ajT3hTmIKPF0SZs
 URRRf/2Sf5BXME24zPc1dC+9SVpFjuzEjmc+gxDkQW5RD1BWeT+U4DjWAE5G8Bk+d5ZBiCaedpx
 1FaJVoI74vpzCV+cY5fyPMrTIFFYrY4HZWCriP9f+dkad+eAOEeJyyC9l1PE+LUgDf4dDB+f1Ij
 KFsfWDEHRbcF9yGwF2sxaXfSUDNu60L70kfQuSlgfVdaFunAGx42UAgHLGo3vDMcs2TGcq/MW6J
 /TzJsSdJtypWYFTMu2D3T6vGyd7guKxrsTejW5hG7xqEmF2gDCvlqeLbhIiDnbkKAc2X272Zcas
 bkFU6xVcaSwxlxg588LbQqRXHpSuLAOxKIPzdPqVH1SpEFdF14zmSa+0KmNmUX8/DM9UndY3CQm
 YGmcC218nxwAmBOUnj2gOXG//2pTHlII/oYapkN5qWNO/iG8THPC+XVUgnFh
X-Received: by 2002:a05:600c:3549:b0:496:bffb:fb7b with SMTP id
 5b1f17b1804b1-49b91c57464mr276989235e9.10.1788104897996; 
 Sun, 30 Aug 2026 08:48:17 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b9500c80asm250048385e9.9.2026.08.30.08.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 08:48:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sun, 30 Aug 2026 17:48:11 +0200
Message-ID: <20260830154811.455436-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/drogon: Fix incomplete 'struct tm'
 type on uClibc
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

Add a patch including <time.h> in Date.h to fix the following build
failure:

  Date.cc:98:28: error: return type 'struct trantor::tm' is incomplete
     98 | struct tm Date::tmStruct() const
        |                            ^~~~~

Fixes:
- https://autobuild.buildroot.org/results/e48e0fc1b95a8ad5de964b1e6d12bc45ac39f0b4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...-incomplete-struct-tm-type-on-uClibc.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/drogon/0002-Fix-incomplete-struct-tm-type-on-uClibc.patch

diff --git a/package/drogon/0002-Fix-incomplete-struct-tm-type-on-uClibc.patch b/package/drogon/0002-Fix-incomplete-struct-tm-type-on-uClibc.patch
new file mode 100644
index 000000000000..4fad84664cb9
--- /dev/null
+++ b/package/drogon/0002-Fix-incomplete-struct-tm-type-on-uClibc.patch
@@ -0,0 +1,36 @@
+From cd29aa61d299c82d82d3285215fc4fc65e4d4fb9 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sun, 30 Aug 2026 12:00:00 +0200
+Subject: [PATCH] Fix incomplete 'struct tm' type on uClibc
+
+Fix a build failure [1] reported by Buildroot autobuild for the
+mips/uClibc configuration:
+
+  Date.cc:98:28: error: return type 'struct trantor::tm' is incomplete
+     98 | struct tm Date::tmStruct() const
+        |                            ^~~~~
+
+Add the missing include to Date.h.
+
+[1] https://autobuild.buildroot.org/results/e48e0fc1b95a8ad5de964b1e6d12bc45ac39f0b4/
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/an-tao/trantor/pull/415
+---
+ trantor/utils/Date.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/trantor/trantor/utils/Date.h b/trantor/trantor/utils/Date.h
+index 4367d76e0305..41b02d355d14 100644
+--- a/trantor/trantor/utils/Date.h
++++ b/trantor/trantor/utils/Date.h
+@@ -16,6 +16,7 @@
+ 
+ #include <trantor/exports.h>
+ #include <stdint.h>
++#include <time.h>
+ #include <string>
+ 
+ namespace trantor
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
