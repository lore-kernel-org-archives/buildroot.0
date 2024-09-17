Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A1FCAC595
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9943608C4;
	Tue, 17 Sep 2024 18:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXrZApb7_jLY; Tue, 17 Sep 2024 18:27:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3676608E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3676608E6;
	Tue, 17 Sep 2024 18:27:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECA911BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8FBC401ED
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8CG59kXH5Cw for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C7E1840139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7E1840139
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7E1840139
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:27:33 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82aa8c36eefso277063539f.3
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 11:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726597652; x=1727202452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JSSS4JcZXsseD5dHSwdpiBfP9w/Wu69DNw9E/WM5dfA=;
 b=cJj3cUKGdUFmwz5rFudVsdwayM8Iijm98i+FJMCClEXIa0u8GlSfjik7zlYS6vhGOr
 gd4Z0jhNxy2zZTfo+rXRuxeFkl5if1B0ciuU+LYSl61dYcCBDt7fzLMR/C5CY0qTH659
 IEwOUJaOSPxClT9bDtDiTXTm1VK4RRnRANMVhkFpwc79IqNwh35VgPKz7Iyu5hP02yNX
 WMVVtsqhoJnPg3VvjcSsRyb6wK822nfvQwkl7U/KlaPrmTGoG1raiT4bB6D1Eptl/wZB
 ijd9NEXL0AyrqEA/GHKZw3EMY/Mmmo7aR29cX0i7gwO/xTChwf0TV+KOMfJJPgv0F2rv
 S+Xg==
X-Gm-Message-State: AOJu0Yz4OBf/B3P6mKhbkfz4O4VhaDS6Hq30stB2PwtTnk+M+pB9l2aL
 ADZkDBcijazppIJRSJtLDwMlY8JLLORwhQ2fgA1Uh8I811eoQzOxjuCnnQ==
X-Google-Smtp-Source: AGHT+IFJwKnRqrtIejYJq1iNGa1+uxvAfuBcydorFhclIIFVc4ZJjeRu4VXwUorXbCJm6JIGJX9BEQ==
X-Received: by 2002:a05:6602:6d03:b0:7f6:8303:ba80 with SMTP id
 ca18e2360f4ac-82d3780c296mr1322104539f.11.1726597652616; 
 Tue, 17 Sep 2024 11:27:32 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3d032sm2080887173.79.2024.09.17.11.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 11:27:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 12:27:30 -0600
Message-Id: <20240917182730.3874226-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726597652; x=1727202452; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JSSS4JcZXsseD5dHSwdpiBfP9w/Wu69DNw9E/WM5dfA=;
 b=h2B7sEbtx8q+kiKnjNr5ThhpACr6EUyy6LeVQlQWa7U/lY7iOgOSHQwaHcxqpW4PuU
 32VsJuVRrTIlS/QQBu9siF4yRTHOk8UcUP1scP1yHqL7tBrquRY2PxE4nCqQFAt4Jlcq
 DOr7WjVeUTHXfboP74lryHnOx4JkCpuaZO0bhGuMuZLE0vMgXdXlgOzyn84pU09a2eh5
 q5kvSsw/l1f9pdZ59zn/6/kmt9iZbUP33QWfwiaLY9fQaWCRlziaINGcpKNtHPvr2Tr/
 yauEQcIT37e4SRtH1J3rugKMaUlWMohnOl0mnOaIdLUcHV/sM7seQ9wXlSXqtnv66RDO
 VHHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h2B7sEbt
Subject: [Buildroot] [PATCH 1/1] package/python-pbr: bump to version 6.1.0
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
 package/python-pbr/python-pbr.hash | 4 ++--
 package/python-pbr/python-pbr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pbr/python-pbr.hash b/package/python-pbr/python-pbr.hash
index cfeef9419d..02db9aca02 100644
--- a/package/python-pbr/python-pbr.hash
+++ b/package/python-pbr/python-pbr.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pbr/json
-md5  e01bcc0e9154d513ecad3e766f9582d7  pbr-6.0.0.tar.gz
-sha256  d1377122a5a00e2f940ee482999518efe16d745d423a670c27773dfbc3c9a7d9  pbr-6.0.0.tar.gz
+md5  06361b83d178fb62dcd1b4ba9a9b418c  pbr-6.1.0.tar.gz
+sha256  788183e382e3d1d7707db08978239965e8b9e4e5ed42669bf4758186734d5f24  pbr-6.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
 sha256  eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
diff --git a/package/python-pbr/python-pbr.mk b/package/python-pbr/python-pbr.mk
index aaea80d389..993e748a2b 100644
--- a/package/python-pbr/python-pbr.mk
+++ b/package/python-pbr/python-pbr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PBR_VERSION = 6.0.0
+PYTHON_PBR_VERSION = 6.1.0
 PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
-PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/8d/c2/ee43b3b11bf2b40e56536183fc9f22afbb04e882720332b6276ee2454c24
+PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/b2/35/80cf8f6a4f34017a7fe28242dc45161a1baa55c41563c354d8147e8358b2
 PYTHON_PBR_SETUP_TYPE = setuptools
 PYTHON_PBR_LICENSE = Apache-2.0 (module), BSD-3-Clause (test package)
 PYTHON_PBR_LICENSE_FILES = LICENSE pbr/tests/testpackage/LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
