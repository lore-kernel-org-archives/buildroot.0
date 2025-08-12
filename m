Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1F4C87FCB
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 06:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8D0B613B4;
	Tue, 12 Aug 2025 06:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YL0k1vZhRjy; Tue, 12 Aug 2025 06:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8448613BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8448613BC;
	Tue, 12 Aug 2025 06:32:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6CD4183
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCF57842AA
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5y-x0n_qBmDo for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 06:32:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFB09842AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFB09842AF
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFB09842AF
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:32:52 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76a3818eb9bso4684264b3a.3
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 23:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754980372; x=1755585172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PK2ALl5sVNxs8UVPkruBAZGCWzTDlKG+Ov+dcDpKATI=;
 b=aEqDYEko8wphnYJhKdRK7Zs4LrWGTmq+nMCjWaJRjvKqmOVH3jaJy/WcGJ7ljeOHkF
 N3dw1r5WWW2aHsu/HZQef6YkRQI87rCC80XNSTHrUMaIJ42+RdnLpe9sHuZCadTrzWhz
 tQ1qk7tjJlDSNKM8erb74ckMu3P1SFqm1k8oyDflaLKdyeoI0GLXwhrKWt/KBg9iN/hH
 vP9PB+/JoddA3HRBJ3vSuBVzVFgD1+yD/IVofsft8EnELtG2yCxVgIKVFDRCULpgbrrs
 ch6k/iCz4xcECmLI+lDYh+BBqCdco69j08gFfalUkNrNJHBmUk2ZYfq+D7g7arWwI9ne
 Iywg==
X-Gm-Message-State: AOJu0YzgqXrctkw068lX1YRJowaX/Zf5jPSCnUIFCfjy6zCsSGYmIRQE
 npFDWGsoRi2jyUG6Jz/8tYdnNf74PZbQBS1DNRnO32NDc00UXVhTiTlxDaui77YI
X-Gm-Gg: ASbGncule2AoStvvnG2Cox3H1aKBSZ19Bdxpad9ti9HtbcAcyjrVC4soG8qLAFyIREA
 FAij1vaS0og4Wxd+yMiXNmrmi4T59OaEi+pr3qoiIyCtG4hsyasZ5oROdBBZ+2PZzbQroNzhTTR
 C3kG0m9lrU40nRK15lm9CiK9gkA9i+J6onNXCbM45K004SXzPo+6jg3j1zOItaBzDEB7AWbtOot
 x3AlNvDKv+ChFPUxVLwU5XEcVCwOTOAqgQRqgBUl1BxTNDb47Uuen/71mTj7aO491FmiWohpTuE
 95D8luECcw6oUSyxdBItcs3npl3MfCzmau08sF0HEzvmmJSS6ym65Y+cbOq+CVCfmFkP1UkdoNL
 qizivIqo2T1O9CXsJQsg+zHS+EPBHdXucArspnLeqd4gEY51UYRIuqRXIVN4kdJXEx+SkCM2Lfk
 klvExgJg==
X-Google-Smtp-Source: AGHT+IFx9CQYhsiX6Lq8U3xG2r4gjh0JrjrfzDduyr3OWQrBBHgEpK2G+PV1Z7r2J1HgCaCziMBAmQ==
X-Received: by 2002:a17:902:e74d:b0:23f:dc56:66e2 with SMTP id
 d9443c01a7336-242c223c8d8mr233251085ad.38.1754980371778; 
 Mon, 11 Aug 2025 23:32:51 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d272sm288392185ad.135.2025.08.11.23.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 23:32:51 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 23:32:48 -0700
Message-Id: <20250812063248.1197760-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754980372; x=1755585172; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PK2ALl5sVNxs8UVPkruBAZGCWzTDlKG+Ov+dcDpKATI=;
 b=XGxXRmOnRWO6BDlnPtq+OsAUv4U2sMpxixQQg8J+2D585VF9vR9pv+XzNVPJ1UdwIb
 GkSbEyckFpwixfEnSCQM0Mz1cTsT5WWB8zG8C+/mSGwwcWYKcMZ7P8CMFzi2wRP5Zwxw
 Ut6tJGztzQEd3LwCPmZqwKlc27QZouC+4IvYkV60nfFHVRjgrDqsk5zLG20cysg4WbQ3
 GZxKdhbALL45MSOWYg5YosqzCMybIq+6xdylqiYiZMPCGV2kdKiLydjzFd/mIwlYI2OQ
 JEKg/2SwzzzjWXw1xlvHbBpWnRA+VL+eEPub7H+hep64DicIQPnraL5WN/I2UpU5vgCJ
 OWKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XGxXRmOn
Subject: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.16
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/strace/strace/releases/tag/v6.16

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 9bccae7108..515d1d296c 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.15/strace-6.15.tar.xz.asc
-sha256  8552dfab08abc22a0f2048c98fd9541fd4d71b6882507952780dab7c7c512f51  strace-6.15.tar.xz
+# https://strace.io/files/6.16/strace-6.16.tar.xz.asc
+sha256  3d7aee7e4f044b2f67f3d51a8a76eda18076e9fb2774de54ac351d777d4ebffa  strace-6.16.tar.xz
 sha256  ca2a0994c57e48b16828008c80cdb626e471b6b59116a8443b2ce4e3c77ddc3b  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index bd7d73c78c..aaa1b5b830 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.15
+STRACE_VERSION = 6.16
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
