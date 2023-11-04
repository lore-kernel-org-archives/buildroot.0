Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F056AC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 23:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8902960D7B;
	Sat,  4 Nov 2023 23:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8902960D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZx5Gy2xSU3I; Sat,  4 Nov 2023 23:34:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C125560BCE;
	Sat,  4 Nov 2023 23:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C125560BCE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE9301BF5B5
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F766403C6
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F766403C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYtOWye2J1XT for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 23:34:23 +0000 (UTC)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9819F403C4
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 23:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9819F403C4
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3576e74ae9dso11868825ab.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 16:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699140862; x=1699745662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+v7nk1hJkC70YaHOgBDbTBTtAJeh4gfEoexd5emG6c8=;
 b=vJ+XnHMqNa4/fBKe2pFlXsfY1OHcl9yoCFEiCnN2rAoQ6THEf83MzdI1gguksPGDZo
 MJ71QBSqlflNamBM3G/1wbOctHqEQgfmdqRif3/9W7HKxk/OyvQXKIwVIqhkYV0uOxEw
 EFvYVqsimnYdqUjFKqIiB++qYpLFtBwD0dp1EVMqlqAyGzdTyRS+LiYZ/WKGKCl6a4M4
 S7eec3UKm6VeGnr4Vug7pjjV8O7pyqZjtH7ok8jypzJjpEI+l2xRjZzTeA/forUSsBiZ
 NTDU6CxMoTr0ibeqdmSDkI+5oU+rXvCjKIZncFfGT6zGyg1uQ8RAeosEk/lHVZ1d9sHU
 vRjw==
X-Gm-Message-State: AOJu0YypgE3OR4kXK4PraWxUf4xEJRbwFAxkKNsvBZqB8mCnbUGQ74Mo
 vkpaEvozwIACtBqY+TTK/AP/s/69UXc=
X-Google-Smtp-Source: AGHT+IHBduc2LVHYnf9ra6Cwu8iLJfKq+QmDufsacBizJfUC2zKAzmLdinxfKCi3DP7Gexwcq6ZB1g==
X-Received: by 2002:a05:6e02:ec3:b0:359:417b:50dd with SMTP id
 i3-20020a056e020ec300b00359417b50ddmr10889609ilk.20.1699140862208; 
 Sat, 04 Nov 2023 16:34:22 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 g14-20020a92d7ce000000b0035797ea96f7sm1537970ilq.9.2023.11.04.16.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 16:34:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 17:34:18 -0600
Message-Id: <20231104233418.2678749-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699140862; x=1699745662; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+v7nk1hJkC70YaHOgBDbTBTtAJeh4gfEoexd5emG6c8=;
 b=bjdO3DQayzBhMcP3AusGVj5oaJAi7feBti4/hdN0FCNBvayxB+K+imTuRsLIIa2Z5Y
 soDgpIZvl7XIeTLbXAgbRpOG24NLc0rT3XzdjynK82BrmolPrtTv3VKlonbDBkFBvfuj
 AGt3PhI760UGTH7CuhDP8yEZKw8ZiZZUCrIQTlb+E6/ki831TnXjpUwIuQVad3Wn5DDX
 LtFZz0HP/8JelTowDJ4IrGUGZLw7l0iLZrXkPtLH3hEMOOAOlBXzXCp1Lm210kKH0NLE
 hB35PCKvS806c+VKr28YrugxSj8eu2pqkd/smYfAfiCbYRYqgR3Z2FaidIkI4pofqj0o
 bmtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bjdO3DQa
Subject: [Buildroot] [PATCH 1/1] package/python-aiojobs: bump to version
 1.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiojobs/python-aiojobs.hash | 4 ++--
 package/python-aiojobs/python-aiojobs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiojobs/python-aiojobs.hash b/package/python-aiojobs/python-aiojobs.hash
index 511953713b..8920e3aecd 100644
--- a/package/python-aiojobs/python-aiojobs.hash
+++ b/package/python-aiojobs/python-aiojobs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiojobs/json
-md5  18a5b38cc13b2d59a91fdfec64588b4c  aiojobs-1.1.0.tar.gz
-sha256  f0c43dfc4de359052a67df309b593732c32028deef1bb787c7a363da29accde3  aiojobs-1.1.0.tar.gz
+md5  529a4367f9bc63a482a2962ba54bfd51  aiojobs-1.2.0.tar.gz
+sha256  a4bcfb6a2d21ad08dea904e9f73040b37657d0c33cc8d77e683e47de5fcf0b12  aiojobs-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1803dc89455114eefad3b827543343edc2452432fdac29b5edc66c8b66d4cbf3  LICENSE
diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
index 075d807d8b..be0acd3fbc 100644
--- a/package/python-aiojobs/python-aiojobs.mk
+++ b/package/python-aiojobs/python-aiojobs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOJOBS_VERSION = 1.1.0
+PYTHON_AIOJOBS_VERSION = 1.2.0
 PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
-PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/99/75/b6d3678d804fffda81ebbac6214c35a4417d5ddbd70ffe7958ad951e64d2
+PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/c4/e0/4685393810a267c09edef41ddafd0dd28108d95e1b91019b1843fc6e5b83
 PYTHON_AIOJOBS_SETUP_TYPE = setuptools
 PYTHON_AIOJOBS_LICENSE = Apache-2.0
 PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
