Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CECC3DA44
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 21:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A7E2403F6;
	Sun,  7 Jul 2024 21:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBFZL_dfJexU; Sun,  7 Jul 2024 21:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5E5140493
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5E5140493;
	Sun,  7 Jul 2024 21:05:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B96361BF3EA
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 21:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A63E2400AC
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 21:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAblXOj8R0LH for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 21:05:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DFE24004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DFE24004A
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DFE24004A
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 21:05:04 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-376266a65c8so14116785ab.3
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 14:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720386303; x=1720991103;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NjofvZeUMEXh+taOpbeOsKSCOiJbHY1OIo/X97b/Lk4=;
 b=SF06Y4rOaC2tnCq0Tw5EjPaDAuSxq4OBIG3TMOZIb/dhMUka98ZMBrixmqmYfPBoAc
 SS8IGcjA+iFFXDHHmH3XsuonPzA+F8Vu5wIoz92bS9EqlgZ8RQQTv/sQ3Fb07VmhUTaq
 dEZYVbWky47Syg6kzFfwHbWEzaN+uYTBPTdZc+StsuReF0FGrQe7uACw5uZ14B0septy
 z/thNipfTmHN2tnmEu6vEWJ/lvYUpzjT+Of8/7/lV5wZBcOBF/AryTNjVSH6GosJsdZ5
 jHp7PnWMNFPReozovaLgTk4LmAiAPacaopAe0i7qcMKKZ3y+kTdWXlPv2RWEK8glVJ5D
 GVLg==
X-Gm-Message-State: AOJu0Yx6pAAUBdg+MIkaW9/rAqpyBTTuZmshw9VCNyXbgjVmAesJIXs4
 YB06t+fmbsA7BVk6xDmApbbe93XWuUDDjGFpHt4Kbs4bubZKf2e0POWaU+H2
X-Google-Smtp-Source: AGHT+IHZI5BbUK0Y3AqYgWHjsoT5yZ/V3Y2Ty55xDkRebyDLa2g4xCJGmn0OdZYL8Ly/NUscMxpnlw==
X-Received: by 2002:a05:6e02:b2c:b0:375:d40d:80cb with SMTP id
 e9e14a558f8ab-38398fce898mr134132845ab.16.1720386303021; 
 Sun, 07 Jul 2024 14:05:03 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-385339bb730sm14264435ab.15.2024.07.07.14.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 14:05:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 15:05:00 -0600
Message-Id: <20240707210500.2274543-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720386303; x=1720991103; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NjofvZeUMEXh+taOpbeOsKSCOiJbHY1OIo/X97b/Lk4=;
 b=EpdyIiDoRYJt6lEmoI2cvix0M9qCU9SmfqHvQhzoDBehTbS8PSO+dGHU4oYBZu87mI
 q/zyg/TcxBz/bzP8kA8NSx+Sah3HB0clfhpxi8fY6e+tAG3Bb5agFM/yiATq4gourzZm
 wNxH83NdUIWI4/uknM40gOLzbIsgO3ZlUPYx/xx1q4sv3ZbEm9khBw+8kiwF6fNixXEF
 uA7+1zju2lqkqV1C8wLLI2Vvrmvu8RVx1DrYTlLhYLik4qc+ySGx9va/m6LNkAwkPXqy
 mZJpaSdPNe7VlVuM+9hXGsYAWzrwtGu1WzE4qbKaoSj4xBVSa95yXxd+dJ2v+o9iSWvM
 lirA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EpdyIiDo
Subject: [Buildroot] [PATCH 1/1] package/python-pyproject-hooks: bump to
 version 1.1.0
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

Note LICENSE file is missing from this release but license has not
changed.

This will be fixed in the next release:
https://github.com/pypa/pyproject-hooks/commit/dfb13356a4a4bb24ae7060a45362d3b4d52ef0bf

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyproject-hooks/python-pyproject-hooks.hash | 6 ++----
 package/python-pyproject-hooks/python-pyproject-hooks.mk   | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.hash b/package/python-pyproject-hooks/python-pyproject-hooks.hash
index 9fdcd33596..7b7e86aabe 100644
--- a/package/python-pyproject-hooks/python-pyproject-hooks.hash
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.hash
@@ -1,5 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject_hooks/json
-md5  69b0b6de189bc04c3f9e304281765741  pyproject_hooks-1.0.0.tar.gz
-sha256  f271b298b97f5955d53fb12b72c1fb1948c22c1a6b70b315c54cedaca0264ef5  pyproject_hooks-1.0.0.tar.gz
-# Locally computed sha256 checksums
-sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
+md5  1963f68105b77c6d4be0a769c6d43779  pyproject_hooks-1.1.0.tar.gz
+sha256  4b37730834edbd6bd37f26ece6b44802fb1c1ee2ece0e54ddff8bfc06db86965  pyproject_hooks-1.1.0.tar.gz
diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.mk b/package/python-pyproject-hooks/python-pyproject-hooks.mk
index a42dbb0ab1..ad14494da5 100644
--- a/package/python-pyproject-hooks/python-pyproject-hooks.mk
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_HOOKS_VERSION = 1.0.0
+PYTHON_PYPROJECT_HOOKS_VERSION = 1.1.0
 PYTHON_PYPROJECT_HOOKS_SOURCE = pyproject_hooks-$(PYTHON_PYPROJECT_HOOKS_VERSION).tar.gz
-PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/25/c1/374304b8407d3818f7025457b7366c8e07768377ce12edfe2aa58aa0f64c
+PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/c7/07/6f63dda440d4abb191b91dc383b472dae3dd9f37e4c1e4a5c3db150531c6
 PYTHON_PYPROJECT_HOOKS_SETUP_TYPE = flit-bootstrap
 PYTHON_PYPROJECT_HOOKS_LICENSE = MIT
-PYTHON_PYPROJECT_HOOKS_LICENSE_FILES = LICENSE
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
