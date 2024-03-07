Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF8DC54E49
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 17:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFF13418D7;
	Thu,  7 Mar 2024 17:16:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7BnfBwvzAJV; Thu,  7 Mar 2024 17:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4A09418DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4A09418DE;
	Thu,  7 Mar 2024 17:16:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B716F1BF396
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A57F04090F
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omSAOylxYiTE for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 17:16:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD24440360
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD24440360
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD24440360
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 17:16:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4130e293686so8383755e9.3
 for <buildroot@buildroot.org>; Thu, 07 Mar 2024 09:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709831772; x=1710436572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gk+9paFs2jXU7+66HvJtL+DXSs0ZyHz+J2ZXRfV8/68=;
 b=A9H2/peJn+dXAR/Dd6hhQ6GVaPw7lKE4TF3hVyBkVyhiQXGwoVONf0ornbyIq4gZgc
 CWouBuRzlZ7NaalXK2+xGTK/iuXT+HggCR64EXYiC0Yq2nr4O406v9ROMky0DBIhTuD5
 IVU56iJAvgENlS+GSLPfrU33yN97lDegbQ687R5bs8q5cCjc1Str2swnhC52Y/FPL4wy
 l9BBxnCPb3WPnjO3XZ87fk9LGz1ZN1uqa++uo3rsEhH7ZPRTvuMG3k6hWMdO4z6iPgiR
 zuZf5rxJjrsUU7NJNfLdgb8Jiri99OHekpTY1BrYaHsuMEfW6SmblYaYUY7Uk/FcY7JB
 ACSA==
X-Gm-Message-State: AOJu0YxVEQFP4ECD58OVRrduCyGcWMkFpliHhNj2DNArbej3Hedfp7Sa
 qIAEOH2QyIATM+zGV6cW1TV74jmGqUq8duWQBz8G0NOnLweKI+9Oej2iSku+
X-Google-Smtp-Source: AGHT+IHusLoy2SaGqdz6c5+NuruXKxzHLpUBzCo2FItHJXAgY26IPC01cka3nst3Y8jFxdQ0NbeTEw==
X-Received: by 2002:a05:600c:a019:b0:413:15c9:43e5 with SMTP id
 jg25-20020a05600ca01900b0041315c943e5mr544607wmb.13.1709831772179; 
 Thu, 07 Mar 2024 09:16:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 gw6-20020a05600c850600b0041273fc463csm3295442wmb.17.2024.03.07.09.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 09:16:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 18:16:10 +0100
Message-ID: <20240307171610.47962-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709831772; x=1710436572; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gk+9paFs2jXU7+66HvJtL+DXSs0ZyHz+J2ZXRfV8/68=;
 b=Zjh7zBEe/cJDs0gUMkoxX5BmW5wQcMsWC9ODNuabKAy3QjvJeKj/Pxsp2wcpBIbdWE
 hs6G8EtxS3J4kDz8hkm3NKkOsAYefBUU23kSe4hRBApqHYkcSQEj8tYwl3w6uHho18zJ
 0aNq9BH8WfvXWDNjD0Tl1urgt+22fnf7N8/go2WKXtbFdoAy8zUnPa5tH4EW1J2dBDpb
 LxdK2BT1NmNkX3zpX0Xb5WCQcO2279yQI7T7v7BSDNSMo+DiiexCuarHqAdTc5ugun7e
 +bBXwNhZpvX5PI3eOwt4EZifs8EuPI3xkldKJKm+7N3iedhgq5she5cLqpEDFGO907By
 JmhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zjh7zBEe
Subject: [Buildroot] [PATCH 1/1] package/crucible: fix license
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

crucible is licensed under BSD-3-Clause since bump to version 2023.11.02
in commit be3f95ed14559f8a9739a12cff604add622b0416 and
https://github.com/usbarmory/crucible/commit/7fe0bb96da655b4e83031a99115d37f88a171e9f

Fixes: be3f95ed14559f8a9739a12cff604add622b0416
 - http://autobuild.buildroot.org/results/6183b11f1564bc07adfff2b02cb0607d0b1de54e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/crucible/crucible.hash | 2 +-
 package/crucible/crucible.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
index d5fee0068d..3a9a716732 100644
--- a/package/crucible/crucible.hash
+++ b/package/crucible/crucible.hash
@@ -1,2 +1,2 @@
 sha256  d21842f050163765269290d72fe79d3f95005038e865138d94e247cb455098da  crucible-2023.11.02.tar.gz
-sha256  d88514630470aec9fa7abdc990a1e0a8751a752321bffa868188c49009d64d59  LICENSE
+sha256  a89c50d83be30fe7ec75be69a07f6c1b5dfaae0a6b94a678d2394fff34acb69c  LICENSE
diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
index 2206663e24..5eedbca8ee 100644
--- a/package/crucible/crucible.mk
+++ b/package/crucible/crucible.mk
@@ -6,7 +6,7 @@
 
 CRUCIBLE_VERSION = 2023.11.02
 CRUCIBLE_SITE = $(call github,usbarmory,crucible,v$(CRUCIBLE_VERSION))
-CRUCIBLE_LICENSE = GPL-3.0
+CRUCIBLE_LICENSE = BSD-3-Clause
 CRUCIBLE_LICENSE_FILES = LICENSE
 CRUCIBLE_GOMOD = ./cmd/crucible
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
