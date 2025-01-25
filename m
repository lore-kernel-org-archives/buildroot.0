Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDC0C02182
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 05:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30B336FB05;
	Sat, 25 Jan 2025 05:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdXOJgVmNmsE; Sat, 25 Jan 2025 05:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 317A06FB11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 317A06FB11;
	Sat, 25 Jan 2025 05:25:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00B15941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 05:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1FF140F97
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 05:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGGSk6FFdXV4 for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 05:25:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB02340EC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB02340EC3
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB02340EC3
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 05:25:24 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2163dc5155fso50768035ad.0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:25:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737782724; x=1738387524;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QUgs0qBpP6ByJf4MZxroV5+c4cFomGD9tzLKkGGuZNI=;
 b=ZEfgrg65FBcQaUKpFQSOP2VlEvI2Jb2Sps11qEMbCXAq3laBWEeglbi5/BxQ1GckSv
 xFKZd4+wiZFk2OQuWb9AIy/XXnpqZhS3nur9KKDlZrhaCS6ehVih15howeFKg0Xzxix7
 P1pya+rPkR2S8KJcFR0wZeaFfLM15uiSORRRrmvf10qUZHoICIQdcOuTHqB3viemq4sj
 j4lV1P66ZmSHKP30kKUcZXvLWKqQT8lJqrzwMi++YpQncsdKA+RIVZRXKjpy9uQzrkxs
 g10ZVeY+7bV8LhRSY+oxtX5Er2jGnJ6IVrLb00aO4ux/eArcpH+pw7wZQ9XJzBsmLVLD
 Et/g==
X-Gm-Message-State: AOJu0YxWNav4iP7SPwAzwt0es6DFg7FUG2ZlnLBtQsRFd2MHAAbLEJzT
 EKHPholHzY6H6djVVy/BuXt6ChNU1B3wSiM2HGK3asxDh6/B8xSmeNh05HHF
X-Gm-Gg: ASbGncuLaE0SD/foFJyaJc8PURctZBOD2973iFD75hcQuJmnkMblvbbsTs+NCDsb1Q7
 qG1WeaODvc7bCz5rpeDXeOwnIqAaO8Md0G48oR0q0kJUBEz8cAON5l5rV2r4C6zsAa5Zk5LMQ33
 kXCubcX4o6m/ktYl7D+gC0jUotRkO4/E9NpWGJJ0YO4ewLO946KW5z7nPz4SZz3+/jYaa2JfdAk
 yFXKV3z3Pw1oIqE3n3uVaNdNQWDQo4lZ/6yB0culunouAqZcAXGT35wadElUxN/veQK7ERfSkj+
 mtI5j20hmMm2B/Am79ZoYhKJjcpqdvuooFb5NOlmpJyd99WmJCjCarFLkXw7uUoK
X-Google-Smtp-Source: AGHT+IENffOsnYVfbORmBFCZ7KhrEYj5fKxo0Xbn+maftCJfdTxvWivFYm5Yqf0q4Nvg23poFLNRyQ==
X-Received: by 2002:a05:6a21:7882:b0:1ea:ddd1:2fda with SMTP id
 adf61e73a8af0-1eb215683b7mr51133138637.26.1737782723655; 
 Fri, 24 Jan 2025 21:25:23 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a6b51e7sm2961642b3a.69.2025.01.24.21.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 21:25:23 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 21:25:20 -0800
Message-Id: <20250125052520.86158-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737782724; x=1738387524; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QUgs0qBpP6ByJf4MZxroV5+c4cFomGD9tzLKkGGuZNI=;
 b=Tjqj1kFzDiM7P/NwMAdiWuvqhQy9/6thIARFtu7l+OPp0pe3Qn2jchwecUKLAPt0qo
 lOteVtH9cveUzjjZ3ieYwA+8ECpho+4V/oiR9+nO8PyCHpe84dhZz4vwnsMa06Z/3rOn
 CvrnYB4qyjBY+TPA0sfz7UNT8ngPuU/eFyKoorxzhIqJe78Sk97I3P2qN9902K56SWl3
 FT3R+KjPKuQxxfhrmosDsqV5eeehKnMFyDXtQ6uTFwkSDPWNimysNhuelHMKjsu4fmwo
 zk6iQyke5fdZK+HXFFQTWX2520Ku0p8aKsJoonbcSybmvSJpfEw9KesrVtuSMWNRHLyZ
 or4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Tjqj1kFz
Subject: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.13
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/strace/strace/releases/tag/v6.13

- Updated hash of the COPYING file (copyright year bump)

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/strace/strace.hash | 6 +++---
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index b5a53c62e8..9ab5715e32 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.12/strace-6.12.tar.xz.asc
-sha256  c47da93be45b6055f4dc741d7f20efaf50ca10160a5b100c109b294fd9c0bdfe  strace-6.12.tar.xz
-sha256  1988d0e1aa101d68855e8c4f940aacf2531051b82f6b608eb026c5fad1f33df1  COPYING
+# https://strace.io/files/6.13/strace-6.13.tar.xz.asc
+sha256  e209daf0ee038ca5adcc4c277e9273b4d51f46a2ff86da575d36742ac3508a17  strace-6.13.tar.xz
+sha256  ca2a0994c57e48b16828008c80cdb626e471b6b59116a8443b2ce4e3c77ddc3b  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 5ada18c655..7bf1c24c1a 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.12
+STRACE_VERSION = 6.13
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
