Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781C6C369CF
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 11:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CF524065C;
	Sun, 20 Apr 2025 11:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqIZrztyBOvt; Sun, 20 Apr 2025 11:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5627740689
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5627740689;
	Sun, 20 Apr 2025 11:40:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36C591C0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 11:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D17C40690
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 11:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6r5GqlIV60c for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 11:40:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.54;
 helo=mail-wm1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 094C8405DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 094C8405DE
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 094C8405DE
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 11:39:59 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so23748865e9.2
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 04:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745149198; x=1745753998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uyMe6+wtERfH3Thk1BuSaNhRgvFzpMdz9JRDLqcA+7A=;
 b=g8hmwUJY5m/2/UTg1xnFcnw/2FFM/uQ3WFnAiVLUPsWNKydHf+Wj5/JZM0f0WttdBB
 6pOgQC/0B8rbCfJ+efHfrCMRbEplo4IACUmwy5WHarR7u0gQTNJvRAtYpQ1iAdd2kp8x
 c+WBJaacJfc93fMaSntozRarDzb/Qdy5WjR8TjqVWyuTFAWu2kAVN7yFkGN80iNjcF+T
 akp94Zq4TnL80XkK3bqcaJufO2sMfGIu9/T3qSLxnIjM8dBM6g0s55Lk1c6Jcuydg/D3
 umwGdbntkIy1Ft00rCRE738os5h2XfBOS636Ts2zj7GbLK1Zea4sTaUllAx9/KmwuuoL
 LZIA==
X-Gm-Message-State: AOJu0YyOgF1Wvwj4lxtLvDiewDHAnjkicW+elHQUgOtk6pAjEzSr+KW7
 ziHMujL2MI1NPA3z7s480/9E3AIIWqrF1Ey/lsNcbV0440Ya5ivBDBVVRbWC
X-Gm-Gg: ASbGncvPUqmjDJ4qnZ7ufgOScUFBeZB+mQg8LtqSuHSfAvtt9f+ZV2MYKN0+D7OLmGp
 563EH7hrgm1G7I8pPxnB2FHiRQQ5mXjFhwkVVUcMdXkIr7nEtg2jLP2nAU5znWsigM6EcROy7RS
 JY2/FV9aHxX5WAwTbwdFoWeyhH1j6JrWtO1WrH7P5GcpfnWz2hVtomwX+nNzjT/IbzIsv4m4ZHE
 8zMoWENxFQB+1Mn95v46IP4YrM/tVCUGNb6Jqro0Bwz3fOsfZpioiCkMA2/RGU9lFzI4Lcz5g2z
 IAcnIA/Cl9Fb2DqLYixFtWWyMKl5sMNtU03sp6y9uSmHP/WV3ZXIJqYCmTAaFrk=
X-Google-Smtp-Source: AGHT+IHxruzCgD86Z9JE+2ygCXwOIgzChBTmNS6Q9UGxf19xO05YZ74BR7qSY+jYiLGyxf0c+tM0LQ==
X-Received: by 2002:a05:600c:3154:b0:43c:f513:9585 with SMTP id
 5b1f17b1804b1-4406ab9432fmr79736525e9.13.1745149197586; 
 Sun, 20 Apr 2025 04:39:57 -0700 (PDT)
Received: from localhost.localdomain ([87.66.230.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d6e05d6sm97494385e9.40.2025.04.20.04.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Apr 2025 04:39:57 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun, 20 Apr 2025 13:39:55 +0200
Message-ID: <20250420113955.1143070-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/lighttpd: bump to 1.4.79
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

News:
- https://www.lighttpd.net/2025/4/4/1.4.79/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 4834e2e947..4adbd08648 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.78.sha512sum
-sha512  40559e676da38b7b4742d7140ab1afe6b69a10ececc5ab1e18c1ea0e4b1c3f13f8058e8e005cbad3df8c008b6b80511afbd0bde9c8094848f3db4d5a29961181  lighttpd-1.4.78.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.78.sha256sum
-sha256  3c0739e8bc75c9e9fc1cfa89e1c304dd4b0e4abb87adc646a1d20bc6a2db2a3e  lighttpd-1.4.78.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.79.sha512sum
+sha512  e0f1bb2cfca5e81001ea30d13f088425dfc7acbec924ecddf438eb6326ab3158a61c6c4aaee0b68a90666d1cb987ce94b1f6a48afd92485cc995db5b58265f83  lighttpd-1.4.79.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.79.sha256sum
+sha256  3b29a625b3ad88702d1fea4f5f42bb7d87488f2e4efc977d7f185329ca6084bd  lighttpd-1.4.79.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 5f38637857..5337042340 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).78
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).79
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
