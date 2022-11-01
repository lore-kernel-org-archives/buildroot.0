Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABED1C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 21:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E25AC4157B;
	Tue,  1 Nov 2022 21:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E25AC4157B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRzBvlYNv5pS; Tue,  1 Nov 2022 21:57:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCDB7415AB;
	Tue,  1 Nov 2022 21:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCDB7415AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D704F1BF5DE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 21:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B93964035D
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 21:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B93964035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OROhrGLCgx3w for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 21:57:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C48FE40166
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C48FE40166
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 21:57:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id t1so5928223wmi.4
 for <buildroot@buildroot.org>; Tue, 01 Nov 2022 14:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gfCIPocTxg3kEeFMaNLQpSoWM00hIf8gfguSyxLCztY=;
 b=54BOExU2LTpN+0vjXjAStT9iVanfqk6LCK1fSLzJsucHwe4WuKV8hUQyZ8vEE8PjwX
 KhAa5c+6HWFMS6X0Qc3F7nlcOzQSbPviAGNfrr3LnO0EqDlMzTL1/tzq82qYPHc/I9MO
 phdlEWfdDBpOGjZCNJIufUrSqsuEtltqPVk+2b7nkAXZNOK0QTFzxSaXS/CqBbbY0nJS
 o/r+2jaPHqj/1kO/srb4kuq/nCy2mgQdFBVqPbaic7JUA0zUm5Cgwf19mcE48U3edfIW
 /6D05uBpHWw1K3/Qv7OjMCgfDekBwk6Mw7ptNIVbSEhvM4QbMwYfljGnj81eoNijlEeD
 7EgQ==
X-Gm-Message-State: ACrzQf2wJDMCOkqXl62sVcbu11b5haBoYU8CvbvlllP/pjdBUWlXCrDx
 7fna3Um/TupFuRSuCXyWJ44pK1M4bmo=
X-Google-Smtp-Source: AMsMyM5O5YkqxFQfNA7JX+2A443XmYOO3nhZWnK0BqIMGXX4NSt9hu2w1cwct9qx5n0xfGyWApIFow==
X-Received: by 2002:a05:600c:46ce:b0:3c6:f274:33b2 with SMTP id
 q14-20020a05600c46ce00b003c6f27433b2mr13286798wmo.27.1667339867527; 
 Tue, 01 Nov 2022 14:57:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003b435c41103sm64907wmq.0.2022.11.01.14.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 14:57:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 22:57:45 +0100
Message-Id: <20221101215745.58044-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gfCIPocTxg3kEeFMaNLQpSoWM00hIf8gfguSyxLCztY=;
 b=JFzR1+HxjsykmUC8z2ZsSnXpL9eTBIjlsTydBVYm+Szj3fU78brUzgNWJsF1yKyvF1
 02tLFMM8+/6mncvZ3jsTZ7w6fiN4xARfnHeTcybp4Kcnn95KYqaQasQ81t5+sq4KMP0g
 b2AOSbX0YraTtoNFDZtXeA5Ttwdu3e39NfLtj/7qtUxtJbrhmmR9JO5yTxiPVikfZbcH
 tF8HWpQOugzdwaj6KjuVA2lcGihn8YsX8bSsARm2C/JxrfYesyoCiFgD4ExE7QQ+7Duj
 tfdQ+AIcjVXozSoyVNimydYEAjqFISICWGFl/dzjbhZ8nH5LM72XlpDkIslqtaEMemSb
 HGzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JFzR1+Hx
Subject: [Buildroot] [PATCH 1/1] package/xl2tp: bump to version 1.3.18
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/xelerance/xl2tpd/releases/tag/v1.3.18

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xl2tp/xl2tp.hash | 2 +-
 package/xl2tp/xl2tp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xl2tp/xl2tp.hash b/package/xl2tp/xl2tp.hash
index eca918bc83..64db273a71 100644
--- a/package/xl2tp/xl2tp.hash
+++ b/package/xl2tp/xl2tp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  898d9b6a374c78dea5f20d80fd50fac13428ad746fefb16ff5f6bec449affe67  xl2tp-1.3.17.tar.gz
+sha256  47f52b9c56cabe77766533bca3736a8198581ff38443eb4b4c8971c885ac9329  xl2tp-1.3.18.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index 4a2bd66308..404a934562 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XL2TP_VERSION = 1.3.17
+XL2TP_VERSION = 1.3.18
 XL2TP_SITE = $(call github,xelerance,xl2tpd,v$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
 XL2TP_LICENSE = GPL-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
