Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ECACD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3A7141561;
	Sun,  7 Apr 2024 10:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYyink-3y2cP; Sun,  7 Apr 2024 10:34:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6703E415AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6703E415AB;
	Sun,  7 Apr 2024 10:34:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3AE51BF575
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFDF041561
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNQdicdF-SEM for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:34:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E37B415AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E37B415AB
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E37B415AB
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:34:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-343b92e54f5so2680511f8f.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486081; x=1713090881;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A65Ot3wSHnRaPnLodN7hU/l4NalIUfkoLlX5Goyn9ek=;
 b=jLUsrU2HZ9oUo/PofqaXIBTc3vyM9Gm+QOLxZeRijsG887ABT+W3p8mnAZZkarKwYd
 AwjBxbYAkOYKkECO1uhCMmJbm/3+NhffGiBq6DTkWVkmgAuZnkOqns+IZS12niIgHugS
 hGBJzRaagRU1fT8Tvl4gF5KHE0mr70WOzI/Ltz6xph4mNu3tFPWMCW6bu+4a/8e9v0s2
 oaPO9S92jCk2dFL3wq1M/codFR30W9iz+ZWYjNMXJ1uJfI6PcPtcYsjuqAjLVDAHSNFv
 fQ7IrxTULLrnJDlw0z1YyUZnhXgZdjUgahwHHrMcVZEEQ7s+yxl7/MULVMEPAzZf03R9
 PTCQ==
X-Gm-Message-State: AOJu0Yybcm9dLBl3gf7onjJu6Rajhd6nDH8VoxxAqe08cnWyKBLf7Iu9
 Qzdh6qFjmstShSNXBGHg0vvP1zMgGb0nGC+KlsRI+Pn/TvhQK32zIMEeZD7B
X-Google-Smtp-Source: AGHT+IEYtawhXKB02TZqcocViKRtdshhK3fp5079WG19iJTXhm9U4aggMMg1IOh86LQrJjpcGbBIlQ==
X-Received: by 2002:a05:600c:3108:b0:416:4973:4d59 with SMTP id
 g8-20020a05600c310800b0041649734d59mr2059380wmo.12.1712486080933; 
 Sun, 07 Apr 2024 03:34:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b00416290b3e1dsm9671827wmp.24.2024.04.07.03.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:34:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:34:35 +0200
Message-ID: <20240407103436.796428-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712486081; x=1713090881; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A65Ot3wSHnRaPnLodN7hU/l4NalIUfkoLlX5Goyn9ek=;
 b=C0TBoDKNbDc3expzkcJD/v+lFCFNMCGwx2Qbs+3ESvBDEvrsBzs7dkFfGXTImewexQ
 QOSDD3D/Nr3icYjDFwCoboy1DHl/6KfjdTEbhRMOx3ueEmd/BuHCSph+6M2Uw4F5dayI
 SLdrwC7ZR1zjorahu5SwifzxksdEnzxGkvsAW6xDj/nvLjqMmME4SUh0v4u6eRKCDTrZ
 9Zb5qkoeOSSjRKv6ZfMF+G66JCrDhV6WykbrsnMe1467VA3ahO7gUvhYxOHfKTOcKnLs
 EAPT6xd4aML+poiQbUVPTd7aPECchOmmx7BxbdF6jlXbDWKv63xGzwBRJ+46JIuFuzGz
 OqLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=C0TBoDKN
Subject: [Buildroot] [PATCH 1/2] package/python-urwid: bump to version 2.6.10
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://urwid.org/changelog.html#release-2-6-10

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index 3d7be017a7..aad6f6f672 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  f7f4e6bed9ba38965dbd619520f39287  urwid-2.1.2.tar.gz
-sha256  588bee9c1cb208d0906a9f73c613d2bd32c3ed3702012f51efe318a3f2127eae  urwid-2.1.2.tar.gz
+md5  324cf0f877a5bc7b7d2de7d7f36b13ee  urwid-2.6.10.tar.gz
+sha256  ae33355c414c13214e541d3634f3c8a0bfb373914e62ffbcf2fa863527706321  urwid-2.6.10.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index 78b369ef86..d7943a8b5c 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 2.1.2
+PYTHON_URWID_VERSION = 2.6.10
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/94/3f/e3010f4a11c08a5690540f7ebd0b0d251cc8a456895b7e49be201f73540c
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/8e/74/8c2082f2b07a72ff5d2438447c13a70f0cbede73584e0a262c166a30785c
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
+PYTHON_URWID_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
