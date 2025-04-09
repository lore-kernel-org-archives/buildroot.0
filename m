Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41B5C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 16:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AB23605FC;
	Wed,  9 Apr 2025 16:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9M3rpb5ElcjS; Wed,  9 Apr 2025 16:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A83361026
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A83361026;
	Wed,  9 Apr 2025 16:37:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 464F9108
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 16:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37223605FC
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 16:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfVVnSL_e9Ng for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 16:37:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3CCC2612AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CCC2612AD
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CCC2612AD
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 16:37:04 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so41016905e9.2
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 09:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744216622; x=1744821422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J0XjuEV4z7lMMqcS8Wf78zNGB/wO+AAQyhQttt5/Ow8=;
 b=teAZunhI3wPeVJ5LG0OsH1EF0CIO/7fJMFJ5cia/zo+K68Q3vJzNN9FwSEaMgF9TzH
 H+sgkiTOuVis81cRJXIDtypjMlNeSMbWOT8FiGvSFqlyHpqfQzF3heMXI3FVzom/sPyr
 tLmzG2Tj3s8uBP+zctmnHl9CiMYPzZoDtaRUmfcYZ6FFHMlkj8kfXnPDUECtcKRxf9Du
 U92iceyeFPTShA+kn8WBv38gHUIVTsmt91PcpZhCYs91yyzJPtlOw8TH3vYoroCzRM9u
 8VH3qJ2CYq3V5W6+zDuRu4frURttGsehiWiKKCgPxxpQazAsKj+WQXjeKMqUw2EV2VHe
 r+cg==
X-Gm-Message-State: AOJu0Yzetm/ZQboC7H0tZitTR+RO9TqqZp35lHlEI/0Vp+ahzitKpNIw
 VlbT5m+WDPYi5chLtuB67fKh13YA5ge8GKYn6p1ITtCupReLNPtHTiFXLRnEEJOgS5VALSr5iYJ
 O
X-Gm-Gg: ASbGncsgIguqOcUKoR1wMJyL2LKzredT7EnqYcLtzrJrAWuDi7uKBGqnJDoeMtWvNvI
 xY+OX1xy58cVs6Q8eS0wlqhWxHH73FrxLa84TmFK5xpkkybUkC69CD+v8eKcARUbdVRwgEonkpn
 iL4zbaGwY0x8tq73eAs8HUPjkvMYqyJYOsM9F1hMi37rycoUp/0dOmwv7x+9wd4MYAzDrYrI75l
 mJhgwk2YpqWjizrbcTsete9HNXOFJ4SPcRpzkhTBonQOb69ppux6d1Yogx0Ryknu0WWjWOIfcMm
 xigqsmo1zJ81ylUiBO0xfryK+IY9v+bffXplP4a0qZosxzGNbuS2eokOl80eqTFaKw==
X-Google-Smtp-Source: AGHT+IGoC92CxS7XVt6lLG/fTRZ1VxpK/gNstzAGz6qK8dFmYMXIlgJtnTWZtmvZs6gRZD88iDKQ4Q==
X-Received: by 2002:a05:600c:154a:b0:43d:300f:fa51 with SMTP id
 5b1f17b1804b1-43f1eca7bcemr33882915e9.9.1744216622492; 
 Wed, 09 Apr 2025 09:37:02 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c8224sm20978895e9.22.2025.04.09.09.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 09:37:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 18:36:43 +0200
Message-ID: <20250409163643.688984-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744216622; x=1744821422; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J0XjuEV4z7lMMqcS8Wf78zNGB/wO+AAQyhQttt5/Ow8=;
 b=Et7H+3lQjSPuUMrglW2/npgU2rQCf3IlcKBxr5J4l1VSTnM6Jb76KpzV0yoAaVbT+R
 lOIlBHS5KNxS7ShOFVIo3/Q7AQGfHrYGO+sdyesieuqcMMAdeujQHt9ZjYzfVOPDAKJI
 p8WlxpZtAKzCJe8USACPTiWV4vpPJV3pdxKbfeTGFO6LoyBruczFB1QYq+kRXOSmob7L
 Thgx2uUPG4BBTGRMFCEYL2IQvDDpuquU7lYYh5miuj0z5mXsZuJ4pqKUIxtiany3IblH
 dnQRXfOpSs9igjqbsCYVXHCVLomwfimvXgYSxJgXzC2mtf+Bjit9J288F7KPvSvMnMsT
 ISuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Et7H+3lQ
Subject: [Buildroot] [PATCH 1/1] package/python-jinja2: security bump to
 version 3.1.6
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue:

- CVE-2025-27516: Prior to 3.1.6, an oversight in how the Jinja
    sandboxed environment interacts with the |attr filter allows
    an attacker that controls the content of a template to execute
    arbitrary Python code.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-27516
  - https://github.com/pallets/jinja/commit/90457bbf33b8662926ae65cdde4c4c32e756e403

For more details on the version bump, see the release notes:

https://github.com/pallets/jinja/releases/tag/3.1.6

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-jinja2/python-jinja2.hash | 4 ++--
 package/python-jinja2/python-jinja2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index a89c63a0f4..793dde5c8d 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5  083d64f070f6f1b5f75971ae60240785  jinja2-3.1.5.tar.gz
-sha256  8fefff8dc3034e27bb80d67c671eb8a9bc424c0ef4c0826edbff304cceff43bb  jinja2-3.1.5.tar.gz
+md5  66d4c25ff43d1deaf9637ccda523dec8  jinja2-3.1.6.tar.gz
+sha256  dfbff7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b  jinja2-3.1.6.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 9b95b3212c..fe03bc30b8 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 3.1.5
+PYTHON_JINJA2_VERSION = 3.1.6
 PYTHON_JINJA2_SOURCE = jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
 PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/af/92/b3130cbbf5591acf9ade8708c365f3238046ac7cb8ccba6e81abccb0ccff
 PYTHON_JINJA2_SETUP_TYPE = flit
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
