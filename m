Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A38AC3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 18:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09FBB60AED;
	Mon,  1 Jul 2024 18:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HR8hxbkhjVNw; Mon,  1 Jul 2024 18:11:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA0A360AC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA0A360AC4;
	Mon,  1 Jul 2024 18:11:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 074511BF33C
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E882581E56
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2W8yJvo8CeAv for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 18:11:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E42AA81E28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E42AA81E28
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E42AA81E28
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 18:11:00 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7e21dfbc310so123180539f.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 11:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719857459; x=1720462259;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jYraibhNuAlC1wQ0gk2zfc0wTYX6QhpGdlVQ44J9Hfk=;
 b=lCP6uA22lANROILhaoOGF8OMnAC5cGyZIJTEcpQmln+qybTxgvPvCkcJB/wF0iSRNg
 HbAvV/ngM2Xb/EgOgQNZwRNUn1ripnE2CSxkcmsjJFkZ3DrleBSS9SLwvI1xxN59Ubl7
 WIbEI3Uc3eEV6AjCFXTM2GU9plfgTtIq2Xp4qUe/vPTn+yjOGY9mZ8DVCyogdT7GsK8z
 MJgs7InGHt/LYXWkOczNHT+JTBjgC6Fh2yVgZeJZOI9Kb/U8uen+rBM4Rwmk/kKTiKuk
 XoeT9IhO+o2ZseBHaZjUW8h6qIJzRKlqjke1HPEWRkfumTV3Vuey8JxRCFT7R/UJok6d
 DvgQ==
X-Gm-Message-State: AOJu0YxbF7i56N1x12RPfesEJapmgk9jdLbEfQyCm0o0geACv3Xz33hV
 mRS2tcBhnIOtJedNERV7WD8pu+6zw26xuJstM44Ah+mIiIDA/BTSvFcyUQ==
X-Google-Smtp-Source: AGHT+IHXeDncozhLxGt5CaWOWls35zh2NvXZU+56MpwvQy9b8zeMCwmXVlUVo0K5P/3htorJ4bmGpw==
X-Received: by 2002:a6b:7f02:0:b0:7f6:1b9f:8939 with SMTP id
 ca18e2360f4ac-7f62ee0c85bmr633843539f.7.1719857459490; 
 Mon, 01 Jul 2024 11:10:59 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73fa190asm2322765173.109.2024.07.01.11.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:10:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 12:10:57 -0600
Message-Id: <20240701181057.1736031-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719857459; x=1720462259; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jYraibhNuAlC1wQ0gk2zfc0wTYX6QhpGdlVQ44J9Hfk=;
 b=AHfiJHNCzDyHRwSXJR9GKyYQS5+YwRJaC31XOC3tsAzDc75lwfUgBWFV4SKsBrvoH6
 /R0sUhp0AK08BtmTDvRBu8gOp4fcpC90U93nbTAvWvGP8+YrgYe6jrKuWCqk+ZuUGxoy
 wIBlJZxjTkwcBAIs3BKnaDZXcpH1MXbdakWTGM1xFTrs+YprbSwYqpQPztAmuLCz8MJ4
 hXZ/9q9xkM20QZ209E37LpGjVNA0H2+9rV4hEvdNQr+8IAZzEQZA5bXZ/QsL0P7ZpJ3r
 LC821Ar+x48k5fb1K1qJaooERl+0MqmMlgQC316yzYBBlvG2yaH5icqQskL7jVjMgEaW
 /f2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AHfiJHNC
Subject: [Buildroot] [PATCH 1/1] package/python-aiosqlite: bump to version
 0.20.0
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
 package/python-aiosqlite/python-aiosqlite.hash | 4 ++--
 package/python-aiosqlite/python-aiosqlite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiosqlite/python-aiosqlite.hash b/package/python-aiosqlite/python-aiosqlite.hash
index e06061346c..52c78a7630 100644
--- a/package/python-aiosqlite/python-aiosqlite.hash
+++ b/package/python-aiosqlite/python-aiosqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiosqlite/json
-md5  e829bf8f641ab115c1a9ca0494d35278  aiosqlite-0.19.0.tar.gz
-sha256  95ee77b91c8d2808bd08a59fbebf66270e9090c3d92ffbf260dc0db0b979577d  aiosqlite-0.19.0.tar.gz
+md5  22620fe09bc9d9df3bffef19919eed7f  aiosqlite-0.20.0.tar.gz
+sha256  6d35c8c256637f4672f843c31021464090805bf925385ac39473fb16eaaca3d7  aiosqlite-0.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ab0c171dc3ef8bf325a84bb77d855421f2611335ddf6e08816b2922c4edc0f76  LICENSE
diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
index e513d53c02..a48d676c69 100644
--- a/package/python-aiosqlite/python-aiosqlite.mk
+++ b/package/python-aiosqlite/python-aiosqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOSQLITE_VERSION = 0.19.0
+PYTHON_AIOSQLITE_VERSION = 0.20.0
 PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
-PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/ea/51/060efa10a814145acd4e42c6e5ed540b8714cad52ca026c5930e7c473049
+PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/0d/3a/22ff5415bf4d296c1e92b07fd746ad42c96781f13295a074d58e77747848
 PYTHON_AIOSQLITE_SETUP_TYPE = flit
 PYTHON_AIOSQLITE_LICENSE = MIT
 PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
