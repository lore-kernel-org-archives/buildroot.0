Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55863E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 21:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F32660B02;
	Thu,  9 Jan 2025 21:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cib3HBIJS00s; Thu,  9 Jan 2025 21:22:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30F7E60B96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30F7E60B96;
	Thu,  9 Jan 2025 21:22:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A60E8942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 845C240FFE
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shUI3ZbaWSOe for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 21:22:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4EF694028C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EF694028C
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EF694028C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:22:38 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-84a1ce51187so39681639f.1
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 13:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736457757; x=1737062557;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QkBLQZUZoVCd6B+deV7dTTXWXuZ1VFVL9VBiKgCG2Lk=;
 b=DR5AG+SzEN4PvqqwSJALFVdVYtEtjwgZf4BKe0CMIwDetkeY68ct5U+t+Z1yT/HH2r
 /ubXz2TIokCYcz87sQsEKTOQm3ornAPklGASwRtWQcbbOODbl1bwyvuzqyEH5dTVC+XI
 J9aFPeLdA76osr4yYcgvDsvY7K6cmgsQYHwG2xJOQOZaoTyrD3/184aoEYta36Mywk/0
 0WgsovNDUDX/3N5vaJfhfz4uZBuqLEfYmlEtHVTinpFVExvzYeE50AqviQhdbsx13xpd
 MGkb3m/VOQAdPrcuqmrr26RlVVSTmU//xt1FIZtwfXkJLsne8PmX5OT5Tvsh4a2hOIqA
 5L8g==
X-Gm-Message-State: AOJu0YxmWSUBIYGQVb1ssnsfCbmPHUw5C/GHqb2Zv1I/EARrsTAKhuIH
 RnwRlU1aLk6783yhKPAUqs/B6qAtcJ2HYWZAotXQUBl5ngUusmhwKbYKIB2Mb4Q=
X-Gm-Gg: ASbGncs9jplZZhrrwujTF4ed5KwzDX7XPjpvIPjEneTJKbhjcdHnN3eeSaPlLZgmO4K
 Gz01io9Y+mwbqPa/9u4AwxygcKj8HZduGl4lPxTURA6F43dkRwXcHS4uVgALL8i+lUmyR4e9B2N
 HxZ8IMO93tfnz40sY2wTAuBCgCBrnENXtvNzSqNnD0i18gNI0UJPymf5+71VROvFA32ML0bVVAI
 O5n0tC0ac76Kl327OJDqqCyfFsQH5PmApSWsfCr6P3J27CFQceJt8sAsFfHTUDXjqiA+AkFaHpi
 5SVy0jKaSdRgYqf0OmlcKQnkn2qOhs8=
X-Google-Smtp-Source: AGHT+IHoaSMZptJ7/q3h/zRLv1DuvYe2/S4J/FmURxBLLT0mCokIEeiTnDnUJCfCSr3c8XbmxwXdww==
X-Received: by 2002:a92:c24f:0:b0:3a7:e592:55ee with SMTP id
 e9e14a558f8ab-3ce3aa746d1mr70673135ab.20.1736457757022; 
 Thu, 09 Jan 2025 13:22:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b629396sm515955173.72.2025.01.09.13.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:22:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 14:22:35 -0700
Message-Id: <20250109212235.2403294-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736457757; x=1737062557; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QkBLQZUZoVCd6B+deV7dTTXWXuZ1VFVL9VBiKgCG2Lk=;
 b=Efw0ETZmXnsKAFPYhJiL/bKVYqsR/4dxCKuGFmw/3q07MrdWGyyTCsdg1TmEyJdHdU
 A9egVFppLVSZCIfKWArRa3a7j9d5AQD5HpoDbd+Xwof4TPQBQLEtlnI12kuzLz2fHU6r
 oMlVTRd9Eu5I26CtyJjrGqA+yVvmTT3CaAggzmg7VnP4pZ1cnbhvY42rfLWwHDucszce
 Gl15g9WY30NIQTJxAyu+ovsLQHPNJDOqNrRtgCtHW63hVg0HccYnd24IvUhY6UZ+mvN4
 cWKVOfFK2Y9D2lmLm+pVxPPxvYlKfbLIHLmB3vy+ml3nVwCNyhKNT/nggVgtg5hMKFuF
 2DSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Efw0ETZm
Subject: [Buildroot] [PATCH 1/1] package/python-immutabledict: bump to
 version 4.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-immutabledict/python-immutabledict.hash | 4 ++--
 package/python-immutabledict/python-immutabledict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-immutabledict/python-immutabledict.hash b/package/python-immutabledict/python-immutabledict.hash
index 8232bc6e0e..1dd4a79597 100644
--- a/package/python-immutabledict/python-immutabledict.hash
+++ b/package/python-immutabledict/python-immutabledict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/immutabledict/json
-md5  6796be00860cc5cf45ae839b9ed2de52  immutabledict-4.2.0.tar.gz
-sha256  e003fd81aad2377a5a758bf7e1086cf3b70b63e9a5cc2f46bce8d0a2b4727c5f  immutabledict-4.2.0.tar.gz
+md5  ac3ce87a7507d3e7d44a24a6b6bdb4a7  immutabledict-4.2.1.tar.gz
+sha256  d91017248981c72eb66c8ff9834e99c2f53562346f23e7f51e7a5ebcf66a3bcc  immutabledict-4.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  347f918d37d4e0556a0695d34b9fb87fa9bbe808d54949851789c6c1fc91c61f  LICENSE
diff --git a/package/python-immutabledict/python-immutabledict.mk b/package/python-immutabledict/python-immutabledict.mk
index 99089f0d6a..902352a5d0 100644
--- a/package/python-immutabledict/python-immutabledict.mk
+++ b/package/python-immutabledict/python-immutabledict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IMMUTABLEDICT_VERSION = 4.2.0
+PYTHON_IMMUTABLEDICT_VERSION = 4.2.1
 PYTHON_IMMUTABLEDICT_SOURCE = immutabledict-$(PYTHON_IMMUTABLEDICT_VERSION).tar.gz
-PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/55/f4/710c84db4d77767176342913ac6b25f43aaed6d0a0bdb9168a8d2936d9c7
+PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/e0/c5/4240186fbabc58fba41bbe17c5f0cd37ffd4c0b85a5029ab104f946df175
 PYTHON_IMMUTABLEDICT_SETUP_TYPE = poetry
 PYTHON_IMMUTABLEDICT_LICENSE = MIT
 PYTHON_IMMUTABLEDICT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
