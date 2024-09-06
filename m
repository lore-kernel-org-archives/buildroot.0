Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A770E6FE2F
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 16:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 072708127C;
	Fri,  6 Sep 2024 16:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFaYiR2iTWYW; Fri,  6 Sep 2024 16:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AC0C812D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AC0C812D3;
	Fri,  6 Sep 2024 16:57:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88A7A1BF97A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 16:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7659881375
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 16:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvXubZhIBt_F for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 16:57:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B3D781367
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B3D781367
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B3D781367
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 16:57:42 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-82a1dadc2d2so97671539f.1
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 09:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725641861; x=1726246661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UlG3xSiSANMq5Kq/7JlhuI2UZW5LZgIETIGpCUkfB8M=;
 b=alyNA6Bop17IFjwUN1Xn76Jl0dszyKk1ju5FOdx+numLgFLrDbDopU1Fj0jn80c2QP
 C5a5lPEv/Nn/lS2hSx9+ehFed1KwrTj7TwyieaRW6RYay9FyDijIi01UuFXdBm+7u4EC
 iQkHXvhUZp0ulv5Ya/Tpqv5Bli9L2OtbVBylv4r1Uw+XEWVSCa8u0MhGlcSlSCZ4lOmu
 yR3Qy3lw6FE/WbFk3XPbJ55x78iBQJ3M6NNHKnfAhy4qEhA9GIshv1p1Kk6dNkH7eovC
 c/3iDvDb9tjSUVjOz3rrydeC1BcurmxXhU/CI7f+MVR08EsUVKb5lNV1x/wHXvhm5pp6
 A/Dg==
X-Gm-Message-State: AOJu0Yx1DqoIobB5HavqONOdI9eLBEvoAKqp6QeEo+HtgR8xhyMFXmMO
 5IQpk8kf1KWSKfeH9aQvKK3CU2NlpkLl8rPLQAm5Wi6rjXql8ATJ0BRcyQ==
X-Google-Smtp-Source: AGHT+IGiI9XF6+mZDexXYtveN4uu4uQ9Fjue9w2M8QJT121dv+dL7/2m3rld26pPRv1XfTsr8GqWzQ==
X-Received: by 2002:a05:6602:1595:b0:81f:9b2d:e824 with SMTP id
 ca18e2360f4ac-82a96194954mr314809539f.5.1725641861404; 
 Fri, 06 Sep 2024 09:57:41 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d08fc1e2cfsm67156173.14.2024.09.06.09.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 09:57:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 10:57:39 -0600
Message-Id: <20240906165739.1368361-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725641861; x=1726246661; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UlG3xSiSANMq5Kq/7JlhuI2UZW5LZgIETIGpCUkfB8M=;
 b=VmGYU4o1vR3cX879c1ecmygvlAG2E8lzfpxcRdlNrpgFLhvFuewXY4s2M1IDUY7m+Z
 6Pi9DZIXzo27ZHXDvV9BjU4kpd+0w0THzgzcMgTjFhE6C8S8GuLwJMHY8dJw4dED6oLm
 RphPpbU2L9SvZq00cTd9L8CgZId+PGBrJXiwEJwEf81aGvXB1UxgY2Rrjvptzlt4Uk/x
 5ZnIlZOb71pBQfxFarhpxcIopSbQ6lhYz14aF4o/gJgCE0c8DwWwiZ61t6IBTxB9szU/
 ITg0J6o/LxlxOoZNze7z5vLSQeir7La6pz0Zzc/INHqoDHEB1DuugSdSobBlHL6lPmHQ
 csMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VmGYU4o1
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2024.8.30
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
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 0bb4a4fbc4..6f8e0241b5 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  d138c6217784e19cda28770b003ab23b  certifi-2024.6.2.tar.gz
-sha256  3cd43f1c6fa7dedc5899d69d3ad0398fd018ad1a17fba83ddaf78aa46c747516  certifi-2024.6.2.tar.gz
+md5  f842fc7a8ef562539e07873475eed593  certifi-2024.8.30.tar.gz
+sha256  bec941d2aa8195e248a60b31ff9f0558284cf01a52591ceda73ea9afffd69fd9  certifi-2024.8.30.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 1c5d4d262d..7cdd65941a 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2024.6.2
+PYTHON_CERTIFI_VERSION = 2024.8.30
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/07/b3/e02f4f397c81077ffc52a538e0aec464016f1860c472ed33bd2a1d220cc5
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/b0/ee/9b19140fe824b367c04c5e1b369942dd754c4c5462d5674002f75c4dedc1
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
