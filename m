Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC23C369DC
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 09:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37C2D60773;
	Thu,  1 May 2025 09:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9H5VK6cD9_B; Thu,  1 May 2025 09:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E975608AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E975608AE;
	Thu,  1 May 2025 09:26:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C658C22D
 for <buildroot@buildroot.org>; Thu,  1 May 2025 09:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC51F40A82
 for <buildroot@buildroot.org>; Thu,  1 May 2025 09:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2Um1TuFRP72 for <buildroot@buildroot.org>;
 Thu,  1 May 2025 09:26:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA6A340146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA6A340146
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA6A340146
 for <buildroot@buildroot.org>; Thu,  1 May 2025 09:26:40 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22c33677183so7209785ad.2
 for <buildroot@buildroot.org>; Thu, 01 May 2025 02:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746091600; x=1746696400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/J5Vg7bTx6p+CWYfBa7be9k/nbOVocY3eDVYRa7myCk=;
 b=jnRucUNOeYjdSwAOL++E0osg9DJqEyOS7DEXN/SNYQnmxhOYgAt+HSSbSE3ZpgJJxm
 FN+oOrbLBuiMqrNjBUKdnazjOW7WV/+cbAx3Tl+UivC1MlpP20OrzxP18dfo15keOekL
 BSWm6hUanod2p7kMgWp3Ja6Q3OGHolh3e3ngBQWOgttNtKTBIPGbIzxBJ3JjKB2kdrPQ
 izKB50XXdbhPyLZDuhJ6A1k8RcxfXZenSxiDECy/bGQWsqLYHk9P8zQo9btJuafuIKTL
 Zwmaka1zHmEAAsk0JDFLN5K1WXWUaxSLdrtQY5UrLUNNU9OwrEZOvREdfm2kIJq6KN2g
 o69Q==
X-Gm-Message-State: AOJu0YxBOyAFF9BTqwLagvSxfhw2uHpj6Z+aSf6i7NUh2k1DEKzP1tKb
 rrO8YIrPf3YWGHmiFcCJIVoecEmLQq4mLCTdc/purn+ISG/kvlOzyudERscb
X-Gm-Gg: ASbGncuWnI0ZuK83RoJqhoJj0QXBd0+yZXEYFoeTL4W1qaASOZ5lB1aDaUQdP/dexkM
 a/N5EB62qpIbfZH2wIfsKUjXF8AnzENXz2nAcPOgO7nt1S17vwP9JNv3CaaokQIuedMRIRXhzSp
 64HWmT7nXwjhT6Q57QbPpwHz6BTo8Op9w3PqHa2GSHogZLr6zNAuW6UXYMi/hr7lxZQv90yimT/
 yhS/i1m3lpdLp1PzmrcUDGOq1nsR8tLZFY6OyTAP64Q4/u1P8QiJMf38UnpFrDI0Pg/j2TmmR4+
 FtQHMaOyQg5A784wMdBcL3kcmdBwefXYdLunKymFhY9L1FFFg0Yx1K4jOFb3kx9qYNv9GrHRVmg
 LBtOAGlq83qytvR9zEXXjuPWWMn4=
X-Google-Smtp-Source: AGHT+IGDXxzp+W9vypGUuwbIcOVfm1ULkcJsuPkKH8dSbzeBJxNdINlmczwxC+NahJpmDN1ruj+gmg==
X-Received: by 2002:a17:902:c94c:b0:21f:85d0:828 with SMTP id
 d9443c01a7336-22e0413385amr36751505ad.41.1746091599588; 
 Thu, 01 May 2025 02:26:39 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e0bb05196sm2917445ad.30.2025.05.01.02.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 02:26:38 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Thu,  1 May 2025 02:26:33 -0700
Message-Id: <20250501092633.84651-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746091600; x=1746696400; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/J5Vg7bTx6p+CWYfBa7be9k/nbOVocY3eDVYRa7myCk=;
 b=Q3yMcMuV3fWhns4HFJtGZq7UYhsNl8Pq2m1HhN7VX3XSq38Mm+mJzZyg7FTVKTxFGX
 pD9m8f8lzLxJaNsSeKYqmWht26/ZeixcywrF4hxyJvDspSXy6wi1HKrixaczrvDY/2uF
 88i+7+EmLegdiBCKFvMOBQrmS2YzmIytyQyYa9j8MQ9rwPwXYBsPP8i3voEI9mRpenI6
 l0S+wyijhaZPT68Sbxw7JKGei0T8ITUGCGHsJizqYEVZ9sE7BYpUZp1NJDM/WInOks/9
 D/0gytz/XByPlGz770iHtqSneoCYPkbqRaA4z/b+usCv9Gu2h3Xjt2E0fxKJKygg5Pgf
 YLAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q3yMcMuV
Subject: [Buildroot] [PATCH 1/1] package/xz: security bump to version 5.8.1
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

This fixes the following CVE:
CVE-2025-31115: Threaded .xz decoder frees memory too early

Update hash of the COPYING file. (Notes about old releases was removed)

Release notes:
https://github.com/tukaani-project/xz/releases/tag/v5.8.1
https://github.com/tukaani-project/xz/releases/tag/v5.8.0

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/xz/xz.hash | 6 +++---
 package/xz/xz.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 5ed714273f..0e0618ec02 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,10 +1,10 @@
 # Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.6.4/xz-5.6.4.tar.bz2.sig
+# https://github.com/tukaani-project/xz/releases/download/v5.8.1/xz-5.8.1.tar.bz2.sig
 # using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
-sha256  176d510c30d80a23b8050bbc048f2ecaacb823ae48b6821727ed6591f0df9200  xz-5.6.4.tar.bz2
+sha256  5965c692c4c8800cd4b33ce6d0f6ac9ac9d6ab227b17c512b6561bce4f08d47e  xz-5.8.1.tar.bz2
 
 # Hash for license files
-sha256  ee3b35b82f7bb0ba5fd9f13ca34ebbe757a59c05bfde5ab9d50ff4188ed33396  COPYING
+sha256  616a3ad264ce29b8f1cb97e53037b139d406899ca8d1f799651e17bfa09830b8  COPYING
 sha256  0b01625d853911cd0e2e088dcfb743261034a091bb379246cb25a14cc4c74bf1  COPYING.0BSD
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 4a54f93a76..b1e210a172 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.6.4
+XZ_VERSION = 5.8.1
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
