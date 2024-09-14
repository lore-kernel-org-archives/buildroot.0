Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E1BC021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 23:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8F20605D5;
	Sat, 14 Sep 2024 23:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5bVhE78Yutg; Sat, 14 Sep 2024 23:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B08126076D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B08126076D;
	Sat, 14 Sep 2024 23:01:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3096F1BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 23:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EF2340686
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 23:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNUCmoUlEnmN for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 23:01:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD61440679
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD61440679
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD61440679
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 23:01:11 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82a109bc459so142031839f.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726354870; x=1726959670;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cz3LmxdhVWOJLECoX52uPLMhZG4SOXhuUoPrjgXZY/g=;
 b=wzIA2aB3+lfcyzOouzcDlSncLmXyy1DfmCHgK5cE1fyKqxdjLHUdTvRf8MX+zfbCwQ
 caHWhAxlvIRJ4iN/Y3bIWrAqy1FtGcs461LFEYDAflRHKQ581VhluWsfDN9wklnWZEJw
 4kZ+MX4DnEWmleoF/4DIK6XK3fVdTh0Bs6pSEA1HyHMd5EFuBrWu7C82j8Fjvseyi8WE
 09GPPBBB0WVb5cKKl6ieR7GY+cK14IUZRmj1x227vR9lkHbVpPmlk6z5RyPXetZPzm3J
 SCLKaFBa0YbgRd01hXprAZwZ3Fs76WjeXUM6UJ5wujc9idP6L29+Qroc+UTPK17MdQsO
 zcLw==
X-Gm-Message-State: AOJu0YypqjlZWsuQFMZpxEjs6/LE400kgOZNzTE0FoxcqYh5hCBhx34T
 lUrg5tBnn2CDtsQm2dEFO+XBZcUPOVIYkyQj+gEqAbHWoMP8fV5FZpYUtg==
X-Google-Smtp-Source: AGHT+IGgc2WqtiLuudrKCc5ztaQbQDmSjY2x/F0Q+kVli3J3ozqUV5P/o0FVad5wfH83ewMJz6vqnA==
X-Received: by 2002:a05:6e02:1fc2:b0:39f:507a:6170 with SMTP id
 e9e14a558f8ab-3a084645daamr100543695ab.8.1726354870116; 
 Sat, 14 Sep 2024 16:01:10 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092dfe1d8sm6696005ab.13.2024.09.14.16.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 16:01:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 17:01:08 -0600
Message-Id: <20240914230108.1373494-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726354870; x=1726959670; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cz3LmxdhVWOJLECoX52uPLMhZG4SOXhuUoPrjgXZY/g=;
 b=NMnsw0CiYMDl2qM5DtWS0cWXa5CxavylU1gQ28Pm9oYQMKVxxeure2M5cOZKEv6gUJ
 2jpdw8/tCaxPfDK7jThgaA3weJPx0Bhm5H5Pv+shlcZeRTP3waWsgvwpiMN7IlP7jemZ
 DB8zl9rSnknDBcIaBKRl/NmvOKK0LMOqxDch4FRqeg4d+44b1kabtk3KKUWnniJRIhJQ
 sL5MMf3wChxyWfkW58AJvDrBGPnf97zFYoE3OQxQVLSLzAnkN1IozF7Bn5ZUr52ON/cH
 edoisbomiOIG1z5lQaU95m9hk5kKk3DXhaDajFrZHhJ7oUD+d/o435MgaoTXGYIVCT2/
 xqRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NMnsw0Ci
Subject: [Buildroot] [PATCH 1/1] package/python-channels: bump to verison
 4.1.0
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
 package/python-channels/python-channels.hash | 4 ++--
 package/python-channels/python-channels.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-channels/python-channels.hash b/package/python-channels/python-channels.hash
index ea643f1589..8f0a529460 100644
--- a/package/python-channels/python-channels.hash
+++ b/package/python-channels/python-channels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels/json
-md5  b145f0623bf1bad8ceb534c306ad2f2a  channels-4.0.0.tar.gz
-sha256  0ce53507a7da7b148eaa454526e0e05f7da5e5d1c23440e4886cf146981d8420  channels-4.0.0.tar.gz
+md5  bfbc466f2e0a06a8834a4be10856ce8c  channels-4.1.0.tar.gz
+sha256  e0ed375719f5c1851861f05ed4ce78b0166f9245ca0ecd836cb77d4bb531489d  channels-4.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels/python-channels.mk b/package/python-channels/python-channels.mk
index 40f17cb114..0e00e7ea4e 100644
--- a/package/python-channels/python-channels.mk
+++ b/package/python-channels/python-channels.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_VERSION = 4.0.0
+PYTHON_CHANNELS_VERSION = 4.1.0
 PYTHON_CHANNELS_SOURCE = channels-$(PYTHON_CHANNELS_VERSION).tar.gz
-PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/8e/cb/6fedd9df5972b893a04c8e5d7748873d6480a813e74b0797945bee1f4282
+PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/7d/73/da9e496657b242308d68cf79c937be125fcca4af61a620d98adfdde66fab
 PYTHON_CHANNELS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
