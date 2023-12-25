Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B069C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 19:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CD5E81440;
	Mon, 25 Dec 2023 19:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CD5E81440
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wm8NheOpnAFr; Mon, 25 Dec 2023 19:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FAAF81430;
	Mon, 25 Dec 2023 19:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FAAF81430
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A5251BF28C
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 19:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2200581442
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 19:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2200581442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LrqtOSHs56tG for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 19:39:06 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DB1181440
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 19:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DB1181440
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d352c826eso53898625e9.0
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 11:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703533144; x=1704137944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=voTzJ1ieT4f9M0qs7+XKSQXGlT2ezGCjNnh4iTXFBxY=;
 b=EkJvXLFLPdyu8H2GOFMoW944qx8mS5aTuNap+RL44oL7Ii7nOJImcLt6sOaIfdKeWS
 tfpZAwVmGcWXjn9ywy1mQq6cnr+AYnQSmv3ts90bM7UXd+pov7Lxmw1QfaETs5gnRJgi
 koR0kKOjbRPuqlodzpB4C/5+Hifxp4GCW0J1VvQaYY5lTKlJYWQ8g7l2Wr2Ok+a2umTP
 I9M6WMeQ/b4gfG0Ry/bZj38TCMG2oYGZdiCwpe/WFiF49J0+c2PGscLUjG6SHQY9CXU4
 eej7nvhNWqvN9FGH2nbKI+WzkeQsVEZI/Stk8gCIDYDSy4rO8L9O6KouWkGUE/PXGk9x
 45eg==
X-Gm-Message-State: AOJu0YweoZeG617ZLvmirUIKjJ0iZKe3MlPBO5Y8iYo2vXmJefrPy6m1
 61cp9GvQZyAlg25hKfyLlGl2cv+ijno=
X-Google-Smtp-Source: AGHT+IFN/4m4q4qCcDGYhRgjPs5DHdHPavIylgiLWQ0ttFdziriHV1YpPy3hPkpdAYutGSBF//gV/w==
X-Received: by 2002:a05:600c:4f8d:b0:40d:4eee:7972 with SMTP id
 n13-20020a05600c4f8d00b0040d4eee7972mr2228534wmq.7.1703533144383; 
 Mon, 25 Dec 2023 11:39:04 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 n35-20020a05600c3ba300b0040c6dd9e7aesm18164301wms.34.2023.12.25.11.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Dec 2023 11:39:04 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 25 Dec 2023 20:39:01 +0100
Message-Id: <20231225193901.88004-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703533144; x=1704137944; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=voTzJ1ieT4f9M0qs7+XKSQXGlT2ezGCjNnh4iTXFBxY=;
 b=cSGEu+XES5F9gk+JMfCGdUdpBS2bZMyvMOST/4jigrTVDxTG+nriHtyS79ndOeShAg
 7kjBgjogh61c3wLqS2ffm1v51OvkCV7f3nJy9rkKmWQ3Fnc5u4s/ZyppTt57TyvORelD
 3M7w6QwfYBXaGK6riu3VV0stdWd6VjpIDDwM9pucHED5iL6DRwkQzXOopcr8JOPFTI44
 em0Wp12LmOfbF8U8Q9iKWIIzfNhx03+5cM+5s+Xv9nfb3Gj2991nzngAMlVuWnHBu7O0
 Osf1WAljQA3uS8nkc7y0nZjuO4KFhTrU0AL1WoAN/BC4k2hLkiaOfnkPJ4exJPSvuQ0l
 iV8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cSGEu+XE
Subject: [Buildroot] [PATCH] package/lsof: bump to version 4.99.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lsof/lsof.hash | 2 +-
 package/lsof/lsof.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index d9e85ac15..90d8aede9 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  80308a614508814ac70eb2ae1ed2c4344dcf6076fa60afc7734d6b1a79e62b16  lsof-4.98.0.tar.gz
+sha256  b9c56468b927d9691ab168c0b1e9f8f1f835694a35ff898c549d383bd8d09bd4  lsof-4.99.3.tar.gz
 sha256  225222ff9bf38abc2cef7205e9b05c60935efa9ec28d1fd01e503c9316088718  COPYING
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 303622d11..bb6eacb69 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.98.0
+LSOF_VERSION = 4.99.3
 LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
 LSOF_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
