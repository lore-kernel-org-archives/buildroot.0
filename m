Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE9ECF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DADD40635;
	Sun, 22 Sep 2024 09:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CP8brtE6-3xt; Sun, 22 Sep 2024 09:08:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCAB84063C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCAB84063C;
	Sun, 22 Sep 2024 09:08:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F16B81BF4D6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDD6C4063B
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Skg8WJ-cRFiy for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:08:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7E3140652
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7E3140652
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7E3140652
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:08:33 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a0c8c40560so14644205ab.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726996112; x=1727600912;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ofAaQyL5y9EglBXPLPeVJP9u25y+tqMsM3Jp325AVrM=;
 b=Khsx7ZcUO4EfMQQqIQoGJak8KH69evAaGYKvr/0WFJzVYujnj6qiZyBqGbCIkfJ/EC
 wJj12OsWZxRnD9pxxsRD/vPyXC7jMVusrmGZsCn/koBcu0jlly1PZICWx8hpkRVoKOuO
 wg5UBpR7yCvRMOAiW5zMlFS7l3wTt4eTvdk61pKoKAV+Ibaueh0G3Gpme08U5PCMFln/
 Pb/VxZumTOv4YG3SXQTZmhHbyYMdlGO4BGLcfeS9p0aD1HWQ+JPaEBkyvqCF51uyB8B5
 Tp4S349jVzJqPQwLYCwhkgem9N4+2f6IgZfsLvq0J8i4unuM2sekbpG4jzsidIzWxz2o
 YXDA==
X-Gm-Message-State: AOJu0YxETpN16LiKEpxLVxli4Z2pK54TQQuF2B8lGRDyJWrstxZCR+O+
 XiP3krKA2v8HPbl36MpjgsDTBSqD65NcBRVW3Wsf6TVlDPx0wzKlZE2SVg==
X-Google-Smtp-Source: AGHT+IHJ+TRlxQjm7RSR/0IHnAbq7XMAjq3/eIneMNTymIEG5pQECgTUbOe5uwx/a5pWXmKj2tZpdQ==
X-Received: by 2002:a92:c24e:0:b0:3a0:90d6:1f39 with SMTP id
 e9e14a558f8ab-3a0c8c6a341mr75896425ab.2.1726996112248; 
 Sun, 22 Sep 2024 02:08:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf4b78sm4542480173.25.2024.09.22.02.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 02:08:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 03:08:30 -0600
Message-Id: <20240922090830.1027683-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726996112; x=1727600912; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ofAaQyL5y9EglBXPLPeVJP9u25y+tqMsM3Jp325AVrM=;
 b=hbhQhCsN9MKVzVZ3g1/8ex3Ree8ab3v4s/NzKI9U61q1xHwNC64QOy3TqRnofWx/mo
 WNZdQyxwM4cPQZMkzMRgsA7SWF8FMi+XK8mEDH3bUU653KONyY/KarYDdxfBaFNBRzHh
 3MyO1ZVAlep4eGTwViKTj+RVUC47O/jM3Vpg1pYS17sNWSoTt8inheQxCGB/nLlvS1zh
 /4hWdzAYWZcFJb5xBu4gXNgdS3RuuZPZ2mqvyo14CEyK0cPBbIQ8D3Hmpwvp1nxMSuwo
 1oveqcnk+LFZz9Az1Tb9XTkP98CqxMe7P3t5sdAWMEGNXLce98CbYx7uVwjLNKaWg5NM
 AKjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hbhQhCsN
Subject: [Buildroot] [PATCH 1/1] package/python-multipart: bump to version
 0.0.10
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
 package/python-multipart/python-multipart.hash | 4 ++--
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index 29f7f2bc88..df4f8df193 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-multipart/json
-md5  0339000d92e78abbaac815954da6b826  python_multipart-0.0.9.tar.gz
-sha256  03f54688c663f1b7977105f021043b0793151e4cb1c1a9d4a11fc13d622c4026  python_multipart-0.0.9.tar.gz
+md5  151f86bc8501cd0f299c70ef1ed8a3b6  python_multipart-0.0.10.tar.gz
+sha256  46eb3c6ce6fdda5fb1a03c7e11d490e407c6930a2703fe7aef4da71c374688fa  python_multipart-0.0.10.tar.gz
 # Locally computed sha256 checksums
 sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 62ae37d749..925a72ebac 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.9
+PYTHON_MULTIPART_VERSION = 0.0.10
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/5c/0f/9c55ac6c84c0336e22a26fa84ca6c51d58d7ac3a2d78b0dfa8748826c883
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/f9/29/0e5c896ec896b4e501bafa80ab555bbf3bcb0d720e9e33f908179aeb1a61
 PYTHON_MULTIPART_SETUP_TYPE = pep517
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
