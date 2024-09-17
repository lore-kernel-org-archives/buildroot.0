Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED80CAC590
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 23:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FFCF61165;
	Tue, 17 Sep 2024 23:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWpYewJq48OW; Tue, 17 Sep 2024 23:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1814E611AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1814E611AB;
	Tue, 17 Sep 2024 23:38:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E5241BF2FF
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C11740636
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pImg-FEd3nav for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 23:38:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDCC64062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDCC64062F
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDCC64062F
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 23:37:59 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a09dd37ceaso10309415ab.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 16:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726616278; x=1727221078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9/lUS6hUkDMbQhphjt2YlCyzP/7icDfdNqsbBnqPsp0=;
 b=PTqGnieus98kMyMnwaeTxsPwn7AG717jZxSVhBk/r0OjyxZYRMft+SyEgT6GDvOlhk
 scT8FGXdyRSMOg8w1j0caFos7tPMlCrjz6+Io4NNbg+PNdvg3kUwGYFoXc2sVmM6eeT6
 cBPl/U4PgVp6xGWvyemaxYyJva7U0BzYR5ZDBREWwGhnOgWkDW2Q9vI4bk5tGUZSqKd1
 RVHlaCjrDBsDGJsfbfchRpRk2xP5vTA1ocVZ/zFuA/hxAw3GWrJRGGbVcIf1Zuoots64
 cnZGzGtmwxkNVMTMo8/P4cz8DkuCpX3/Uucv/dDeL140Z7VtU2Gh03iWw28auSW/WHL+
 cSnQ==
X-Gm-Message-State: AOJu0YyjkBykahuFCebq0T9PmOvXOkG/vCH9q++V6enLD7no+P+Su5sz
 gSNJv+5Qt8SjFdR0nFCJVvu7gcYzjZV7aDMJwdWIjHh+PtBfs6NqbciqM4go
X-Google-Smtp-Source: AGHT+IHCyiBozxOU8Ly/wfk8eVaAEUVvLZhLjU9Ajgn/hTOH+iEO6hiRC4wzAxyvFgz60r7OM7T9yQ==
X-Received: by 2002:a05:6e02:216a:b0:3a0:a08a:a0d3 with SMTP id
 e9e14a558f8ab-3a0a08aa209mr77888145ab.18.1726616278011; 
 Tue, 17 Sep 2024 16:37:58 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e71a64sm24665295ab.59.2024.09.17.16.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 16:37:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 17:37:56 -0600
Message-Id: <20240917233756.402079-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726616278; x=1727221078; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9/lUS6hUkDMbQhphjt2YlCyzP/7icDfdNqsbBnqPsp0=;
 b=GJvZE3bmpLiS4kELdRuU8CVR5xB19+0NwpzLY3zzMfE38ktHpCv03Gf/2DLe3gD3tj
 7I99iNfwn4TdtHCC8lBbId2LnDgtMS8lYSFqXEVVQnZi4RDiq+bAQHff+TGlYs0O9S49
 f0ZD90SIJOI4aiPL1e7e3+tdZGAdkfncD1BkXBdKWspUSq8aopKuVIYvQwhaI3oR51gN
 fI9Pcihp9VIh1xmkFI/0DwHqX1P10B58j5LYU8oGfeUfImosNoTCq9jDiAXmBqY9oMlN
 0NF3rxhHcJk7Ktj8FsGNrOvM+0xNkAg+Ka3++n4aQZC+SEwcD44bfsy4EbpO663rpGTe
 6EfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GJvZE3bm
Subject: [Buildroot] [PATCH 1/1] package/python-pyphen: bump to version
 0.16.0
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

License hash changed due to repo location update:
https://github.com/Kozea/Pyphen/commit/e0623add350259636af451eb79e37e1b08aebba9

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyphen/python-pyphen.hash | 6 +++---
 package/python-pyphen/python-pyphen.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index 47b9009ea1..57028efd4b 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,8 +1,8 @@
 # md5, sha256 from https://pypi.org/pypi/Pyphen/json
-md5  19e799bbf459ac675698c37c5fae34a8  pyphen-0.14.0.tar.gz
-sha256  596c8b3be1c1a70411ba5f6517d9ccfe3083c758ae2b94a45f2707346d8e66fa  pyphen-0.14.0.tar.gz
+md5  6307e0e89f71a8252fb6abecc372d251  pyphen-0.16.0.tar.gz
+sha256  2c006b3ddf072c9571ab97606d9ab3c26a92eaced4c0d59fd1d26988f308f413  pyphen-0.16.0.tar.gz
 # Locally computed sha256 checksums
-sha256  9f0bffde4fbbbbc61c46f6577b6f472919dba9fdffabe74e8a7e44ac5dbef7a2  LICENSE
+sha256  4fd1c78fcec632bc872ba7b42ba04be330029cfffa411039b48a4f2262bb8240  LICENSE
 sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING.LGPL
 sha256  ad192a67649aa23ac9681939840f4f241643a98da9cd8aec8de28c3b8c6ee854  COPYING.MPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index 9baa2e7b98..84560f8a7f 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPHEN_VERSION = 0.14.0
+PYTHON_PYPHEN_VERSION = 0.16.0
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/4b/52/46b119f94b3f68e4193ada36941606d8e26852b67bb6e099b0e310540b41
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/33/87/493fc9e2597923a2b02a1facc376a3bf8e682698ae177b340c0c5fd1fdec
 PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
