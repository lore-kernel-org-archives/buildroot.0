Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D838C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 17:10:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30D946113B
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 17:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30D946113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0922583B23;
	Thu,  5 Aug 2021 17:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jypOwhYf4QRR; Thu,  5 Aug 2021 17:10:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD20083AB2;
	Thu,  5 Aug 2021 17:10:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50B731BF3D7
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 17:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40305600B9
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 17:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eONby4Bx7cLa for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 17:10:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D76D60A3B
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 17:10:24 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id b11so7521332wrx.6
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ybID84KAYw0lOfmL9rw7JsnW7TDNuBrNSAREc8pztHw=;
 b=lKlNhzXwyqFir67X7l/khBXYYlwPmVbDRiRXz9EPymnH1OLICSNk2ndq9PwlYHqvXe
 ew+jBwrklGAcyyA+CQDWMX3IAciBDL1DF6y2OACtQReUQxzyrwYHw8TxmEEaj0ffEywj
 iwud+LuEt/TQKhEh26TpShFNOFhY5nzubfyxQuhNanj1UdTEySW/lrY+s/v9897cLgw/
 sbWYrMMKSF+WS4+9phpTm3I7tPHPCXq2ImQ1340WIHxyE8Xx+72zFNw5djTRqAzdRARU
 nQVSBxIRZXOTpqzgH+J9CqiJ0CrgD5s4OQ+DTlyAtoSsZO70N506m2AzVAOsLamvGQ8W
 Qs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ybID84KAYw0lOfmL9rw7JsnW7TDNuBrNSAREc8pztHw=;
 b=XemC3F9BOlLvsEppIgLttXY0p7nJYg3DYLK2ZxA1mk3X9qob/wpOv48v4yEUd0InfS
 D3H6qlaSl5at4sWqkro/AE7mgPQfHiHlhCq0kHtas/KQIb72CHdDJx6VLp9jMDl+swtE
 ger49wDgc0xGNQ5lkezQ6Z5gxrdT49+dLi4tsMDpMk/6oyjdjDIamr7g08FQJHRsl84c
 PxU8n9cHIhn0GQqeNYZgcO1C6xUc5Vc3+xzqGySINcR48cbkhmHUTy2jlUTNKZIUaqym
 YhhjbYaV2WPgK2iT1XHs8HbLcNhpDuaNmN+B6DtaOunWWwkGpPNsjyRboEcHQOtvsFqy
 Fiqw==
X-Gm-Message-State: AOAM533gAjUdP0/pmEraFp3jyqx82/FIYe/W0zbwVqTMeYBfKTllcyAD
 JT5u48oD8IEpnps3G8X/UFTDp4OKkmUYAQ==
X-Google-Smtp-Source: ABdhPJwKUwKAwVzVvueEIBC4+C9rZpyJmR8acfol+hVMMXHD5g5+OyXZ3MUPvcqlq0blhGkiYZRXKA==
X-Received: by 2002:adf:ef50:: with SMTP id c16mr6308966wrp.190.1628183422276; 
 Thu, 05 Aug 2021 10:10:22 -0700 (PDT)
Received: from kali.home (pop.92-184-97-158.mobile.abo.orange.fr.
 [92.184.97.158])
 by smtp.gmail.com with ESMTPSA id h11sm9035503wmq.34.2021.08.05.10.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 10:10:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 19:10:14 +0200
Message-Id: <20210805171014.2658548-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pistache: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

In file included from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/async.h:10,
                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/client.h:9,
                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/client/client.cc:7:
/tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/typeid.h:26:12: error: expected type-specifier before 'size_t'
   26 |   operator size_t() const { return reinterpret_cast<size_t>(id_); }
      |            ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2443559df8c2357476e4cbdbebb08280cbb80a3b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-pistache-typeid.h-include-stddef.h.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/pistache/0003-include-pistache-typeid.h-include-stddef.h.patch

diff --git a/package/pistache/0003-include-pistache-typeid.h-include-stddef.h.patch b/package/pistache/0003-include-pistache-typeid.h-include-stddef.h.patch
new file mode 100644
index 0000000000..d8495045fb
--- /dev/null
+++ b/package/pistache/0003-include-pistache-typeid.h-include-stddef.h.patch
@@ -0,0 +1,38 @@
+From 58ffdf35c51e6df3d4d3934eaec685d7a372bcf2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 5 Aug 2021 19:02:56 +0200
+Subject: [PATCH] include/pistache/typeid.h: include stddef.h
+
+Include stddef.h to avoid the following build failure with gcc 11:
+
+In file included from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/async.h:10,
+                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/client.h:9,
+                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/client/client.cc:7:
+/tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/typeid.h:26:12: error: expected type-specifier before 'size_t'
+   26 |   operator size_t() const { return reinterpret_cast<size_t>(id_); }
+      |            ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2443559df8c2357476e4cbdbebb08280cbb80a3b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/pistacheio/pistache/pull/965]
+---
+ include/pistache/typeid.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/pistache/typeid.h b/include/pistache/typeid.h
+index 10353ca..4fcaf11 100644
+--- a/include/pistache/typeid.h
++++ b/include/pistache/typeid.h
+@@ -8,6 +8,7 @@
+ #pragma once
+ 
+ #include <functional>
++#include <stddef.h>
+ 
+ namespace Pistache
+ {
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
