Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A039CDD55C
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D420E6123D;
	Wed, 18 Sep 2024 20:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8bzAXm930Gm; Wed, 18 Sep 2024 20:51:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D99D861248
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D99D861248;
	Wed, 18 Sep 2024 20:51:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61B571BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D9A361248
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXqkX4wy3gSm for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:51:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A2DF6123D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A2DF6123D
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A2DF6123D
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:51:09 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-70930972e19so55584a34.3
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 13:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726692668; x=1727297468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TB6R+TwXUgXqvEMDZIidCNq72Gh0BEJRnsvHYWloG0I=;
 b=PXv1qeEYTeVL57z73t3kSAm2zV/SX8+/Lf08A3T3Ecwx03spvlOfyE5T6FuFoCO9DJ
 lM6h6Hg3RTFMiZ+gbS+l1AeZhvV2tmpYDZNV4cwg1oaqPAbFWz/fqYBsHwS2d/t5B/Hq
 SJILps1wQriWpHvUL6RoCjBNKALpabyvQ5VCFmvS6fhxC0Uh/S8kWWFMdQheG2u3kj/T
 57l415aeGZMMwAWYTd+rAD3QWJWuUHADB5qFFsznGDjNzKPAS89w9qRZ2Cq11kEVXMu5
 03lAMVYp+5cYa6XFyk+bWPyGSRpB9E8CIEdJhjAaCDOzSFjmlZi5CanCktoyujgU9mJX
 XUFA==
X-Gm-Message-State: AOJu0YzbKws8b871SZWv4HdKpL/C1nVFHVttVohwbbSzm8AvJdFg6FK0
 Cni+gyAi8Wck8LXEQW2CkDV5/IK0fXwKdaxyHkLrc4+dLTiumM9PCs2XGB3A
X-Google-Smtp-Source: AGHT+IHkRqj/9HyAkELeboM87OHTTKUEIGUjXI2XYdp+wNx5sWk3AEVpKOd6Hx+bAK4IbSCpI+peqg==
X-Received: by 2002:a05:6830:65c6:b0:710:eb9a:f8d1 with SMTP id
 46e09a7af769-71109486190mr22332870a34.17.1726692668157; 
 Wed, 18 Sep 2024 13:51:08 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec1f268sm2601264173.70.2024.09.18.13.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 13:51:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 14:51:06 -0600
Message-Id: <20240918205106.440642-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726692668; x=1727297468; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TB6R+TwXUgXqvEMDZIidCNq72Gh0BEJRnsvHYWloG0I=;
 b=X2vRhSVJuUl7KGTI4Ku6vlG1HyxTBvWxuwTUKb+qk9760Sl4s60pm+DoQ6BE+ZavL1
 TlxsD+Z77yd+08trOIyXgP+S05emq52waH9L4xhI66XG/US1+Xsp24OggMmKTdJ2m3os
 EJLQHZFCAN4SoANh5pZxz6XfG22QBwK3EANQcW9iunD4fWfpD7wpM2gv28vIKNWz/aT1
 uBaBLsfdEEiIDPwFUzahTVGtW8jHu35O8QzOzhUnAggIlxnsKeshCoquJ4O94a2cHSew
 n23hZnBQUoj01HlM0jmpImf+v9Q6aPVxPJOLQdoRAOAPi7MIk2TIyn1QjXBKDLfQobzh
 NpDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X2vRhSVJ
Subject: [Buildroot] [PATCH 1/1] package/python-pytz: bump to version 2024.2
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
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index a8bfe67817..ca64cb7d79 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  b26bb090d1fe96064019bf7068eeb801  pytz-2024.1.tar.gz
-sha256  2a29735ea9c18baf14b448846bde5a48030ed267578472d8955cd0e7443a9812  pytz-2024.1.tar.gz
+md5  efcb554763a36b3e18acee074f44d1a5  pytz-2024.2.tar.gz
+sha256  2aa355083c50a0f93fa581709deac0c9ad65cca8a9e9beac660adcbd493c798a  pytz-2024.2.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 300e26befe..1d37d09ab1 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2024.1
+PYTHON_PYTZ_VERSION = 2024.2
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/90/26/9f1f00a5d021fff16dee3de13d43e5e978f3d58928e129c3a62cf7eb9738
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/3a/31/3c70bf7603cc2dca0f19bdc53b4537a797747a58875b552c8c413d963a3f
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
