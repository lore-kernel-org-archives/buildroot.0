Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC55C35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 189B580F63;
	Sun, 15 Sep 2024 07:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjri1YE4fDBk; Sun, 15 Sep 2024 07:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B1B780FEF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B1B780FEF;
	Sun, 15 Sep 2024 07:55:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E2191BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C5DC405BE
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UjiztFNu35s for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:55:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EFC31405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFC31405A1
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFC31405A1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:55:19 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-82ade877fbeso144615239f.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 00:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726386918; x=1726991718;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xCApRFgAMQz0lVSR7ESrpuQKX6mdFEWM5jY9P4SYiZg=;
 b=avwcGnyyymYanBAVeA+dbm/7jb2w+NDSl4/L946png6kwSV41H6Z1ju5Ge7VGvQv3E
 vZTkkh3uP/xStkLd/sTqCt0vYN4UcJKCyF7Js4a+q/7GXrf7T7bM5e2qDpAti8LOMeHQ
 GLuQIn3OLkWLefcKtOBbCyCQXe6W5k1+wkeiK5GWe5QNAarFAH0upcUwA5ZQAm0zUK4x
 VWKYtzdIz39pvlhnVc8mOnAn+LJANZLaRCHN/qRBAiohCgp2o5B+tVOIAFcH73y/f8wx
 h3iEMhBSHUq6V3YGKdi1Svo3wjfgLqJkFQycVFXqAOBBYAZ0QXH5trmzGN/Vks37HknA
 /1zA==
X-Gm-Message-State: AOJu0YyTbVjtF0PL62mmeX16WxoWsZBXBk2x0KV9E9r7fVV4EMbuLkvv
 zP+JoDwBmzYjMbxc8hSBFRV1Zg2uJCWybmO0QGphPkhlU1HfuKFlZgdZSQ==
X-Google-Smtp-Source: AGHT+IEPUmR+6k2y+bRCh/kGJ/THabNwkhlH94Q04FGotA/JldZBOPV2WAwiLZUPfRhmkf1wTtcxbA==
X-Received: by 2002:a05:6e02:2197:b0:39d:1dda:fe9 with SMTP id
 e9e14a558f8ab-3a08b6eaeecmr88376405ab.5.1726386918124; 
 Sun, 15 Sep 2024 00:55:18 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed1af3esm800652173.88.2024.09.15.00.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 00:55:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 01:55:09 -0600
Message-Id: <20240915075509.1563070-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726386918; x=1726991718; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xCApRFgAMQz0lVSR7ESrpuQKX6mdFEWM5jY9P4SYiZg=;
 b=TCMVRfCCVzFiWck1JldJXdZZ0qmmwrVNuw33IYbEVt6rUXm9ceN2bMGRFoBkpfufxv
 d6EThq4XJwj9kIqS5WTkBDHwAhzaBB/MbcrayiQU78CX1V1ydEisXDfn7QrNwh9xh+kR
 DCGqwzHjlX/X2jpcdbDtgwWqHW91NTsI0PRxq/C1ptllEDsxtBsh6/fDEHdpPHEP9W5Y
 a9W7Eg4R3m6D61E7qBUTX+GS82wuFCTPuWlChhq7JKF5cEGnxoB+wFZIu4Fmzr5ZcFqK
 wWv6KGS6XUy2JWiQp8K8tKjIC9MTecdZuDNUcgVsXoGNCkAkCF6/1edmfurrnp7AskHj
 t2og==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TCMVRfCC
Subject: [Buildroot] [PATCH 1/1] package/python-gunicorn: bump to version
 23.0.0
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/benoitc/gunicorn/commit/5b68c17b170c7b021a7a982a06c08e3898a5a640

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gunicorn/python-gunicorn.hash | 6 +++---
 package/python-gunicorn/python-gunicorn.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-gunicorn/python-gunicorn.hash b/package/python-gunicorn/python-gunicorn.hash
index bd4dc1b3ca..5639697c51 100644
--- a/package/python-gunicorn/python-gunicorn.hash
+++ b/package/python-gunicorn/python-gunicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gunicorn/json
-md5  cb41319d6929842c5af7003d48c513a2  gunicorn-21.2.0.tar.gz
-sha256  88ec8bff1d634f98e61b9f65bc4bf3cd918a90806c6f5c48bc5603849ec81033  gunicorn-21.2.0.tar.gz
+md5  18b666db62a890579170639961c5b064  gunicorn-23.0.0.tar.gz
+sha256  f014447a0101dc57e294f6c18ca6b40227a4c90e9bdb586042628030cba004ec  gunicorn-23.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  fc71b8f2ce774a47090c106ac5d1145359f5c0e25a0d9ab42acacd230f596936  LICENSE
+sha256  6646cdbba2e99e3421dd18c22173579a1fde347e831dae6adee80eefe331e951  LICENSE
diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
index effa93e5ef..8e3b87fd51 100644
--- a/package/python-gunicorn/python-gunicorn.mk
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GUNICORN_VERSION = 21.2.0
+PYTHON_GUNICORN_VERSION = 23.0.0
 PYTHON_GUNICORN_SOURCE = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
-PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/06/89/acd9879fa6a5309b4bf16a5a8855f1e58f26d38e0c18ede9b3a70996b021
+PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/34/72/9614c465dc206155d93eff0ca20d42e1e35afc533971379482de953521a4
 PYTHON_GUNICORN_SETUP_TYPE = setuptools
 PYTHON_GUNICORN_LICENSE = MIT
 PYTHON_GUNICORN_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
