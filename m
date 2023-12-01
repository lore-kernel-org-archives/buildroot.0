Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DB2C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13CD140158;
	Fri,  1 Dec 2023 20:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13CD140158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_hK6WekMOFS; Fri,  1 Dec 2023 20:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1860240448;
	Fri,  1 Dec 2023 20:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1860240448
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E46D1BF2BF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 271B160739
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 271B160739
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BozjMWYnHXTW for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:38:28 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48FAF606D3
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48FAF606D3
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b552deba0so26233895e9.1
 for <buildroot@buildroot.org>; Fri, 01 Dec 2023 12:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701463106; x=1702067906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jIulTrxvNUcQgiRHbuvlw79CEYO0BJ2M2XUXsI4ZCh4=;
 b=HbE+Q6B2TgDrgv97Zms4S4lK4PkGSsK8GZCFNiiV09j4UzRowjQe3ADqRT3xeELVc4
 Q3x/AXIccih6Or8XfYNLFhW8v2fJREi1Wa+N13A/rbFTtfvc0/BQupSjAJRTEbdGW295
 Q/XVKHzWbrkjKdjYp3nSPh07+QraSEb4RE8x3vcX3Jfp+0vOgMnnWhH5lbFlZ3y2+nfO
 7czBbIAe25Ap4P16dCk1e3+mdnHNe3PQKpmBn05QqUccQepwHPOhnzZQpfJwvAt/Spta
 FhTfNbuH7XLKZjeHAqDa/GYA+Aht2bIViadYf/wMlojtY4XHBb5PHgDf4prcSDSqtf4R
 vOeQ==
X-Gm-Message-State: AOJu0YzGLE/Ej6lLtDMauCnaZCSxHK0T1GRuatXF21dT/m1qQzV7O0kH
 Na0cmjBjPWzjlLh/2+LELH6x8VyhuVc=
X-Google-Smtp-Source: AGHT+IE+Jxz+T7dCaDRap4Qx8MHFbkjM1Q9MFfYfmcBFfRkR02zaBZ1pJsXFAbD3Ap4TTf+tIY/Cqw==
X-Received: by 2002:a05:600c:5d5:b0:40b:5e1d:8399 with SMTP id
 p21-20020a05600c05d500b0040b5e1d8399mr648511wmd.45.1701463105702; 
 Fri, 01 Dec 2023 12:38:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b0040b36ad5413sm6402950wmq.46.2023.12.01.12.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 12:38:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Dec 2023 21:38:22 +0100
Message-ID: <20231201203822.615354-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701463106; x=1702067906; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jIulTrxvNUcQgiRHbuvlw79CEYO0BJ2M2XUXsI4ZCh4=;
 b=idtOdqHH6nrzDw7s7n2stgG3Xz5/L/RzgIlUGYSmxTSlatSe8DyrLmSTTqXbJjSl9G
 5ukV3LuZZ9jUniXBzcaXiW8qMdbVUSvgci5qNr3S16uRsziU579zATZ0YzATEFnc08Vq
 +86tJGISkJJg9/ck6pgk3GYhxOj4H8dmhUHgRx2uXMPFKwP3HOZXSAd/aIHfcVVXq8V2
 bumXgJkD5Vre+9Nq5YMalmZbr7sShDb/6df1qwDXCeA+O/Dnq+chr4rKy+qrpZRMRNI+
 y4AccfDt3QwO8q3IN9kc77UjR8NYyGhZVFv8iVgfWfaXgs4A2v11F3hnWHuVW7DATgaM
 NOzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=idtOdqHH
Subject: [Buildroot] [PATCH 1/1] package/putty: fix static build
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
Cc: Alexander Dahl <post@lespocky.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure raised since bump to version 0.78
in commit 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4:

In file included from /home/buildroot/autobuild/instance-0/output-1/build/putty-0.78/putty.h:8,
                 from /home/buildroot/autobuild/instance-0/output-1/build/putty-0.78/callback.c:8:
/home/buildroot/autobuild/instance-0/output-1/build/putty-0.78/unix/platform.h:11:10: fatal error: dlfcn.h: No such file or directory
   11 | #include <dlfcn.h>                     /* Dynamic library loading */
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/06f0b14bd0414f97b06070198e290fb3253348c5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/putty/putty.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index d3c8d923f0..529edd51c8 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -17,4 +17,8 @@ else ifeq ($(BR2_PACKAGE_LIBGTK2),y)
 PUTTY_DEPENDENCIES += libgtk2
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+PUTTY_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -DNO_LIBDL"
+endif
+
 $(eval $(cmake-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
