Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD8CCF9C6B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 00:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D012E81B6D;
	Sun, 22 Sep 2024 00:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOLQMMDmqsg5; Sun, 22 Sep 2024 00:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5D9781B7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5D9781B7B;
	Sun, 22 Sep 2024 00:03:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C2581BF3C4
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A63760633
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJrbYBhZkD1S for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 00:03:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FB2C6060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FB2C6060E
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FB2C6060E
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:03:35 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a0c874547cso10026395ab.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726963414; x=1727568214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D1mClmPAriGC1OrQ4nPTvksQRNzgfZxufLSf+IlhAfY=;
 b=b+rQ7cn9AexvSs5AKtNyrIvCynRGJdKoIfjlS4aCCq3EY3rT0Xv9V0njil8S7lxO4Z
 fMODsBdBUd/otlMMFVSx57DYLcMgJ3K57WGih5X3m4l7yMZ1Dwd/m3DyfLzCv+6KFA2h
 178BnCjJEZAJYqRFRmPu6T7Rie+/a/D2cw+CVL0MW6zyCHvnOmNW55GP9EnwI+pngmwF
 XRimW3HLhwRpfMMzjq94I9XZqeSr+1MCXodYP4LBmmtQNolipyFey0mVB9SbGY/yGryt
 5/oN0jUhyyMZMv8EpJK09QWHq7WZnZ1LP3DlE4+owxp3bh8ZJfrbo/Z+hRH0dQvN09sH
 L3fw==
X-Gm-Message-State: AOJu0Yzy0z1nkTgGl3HGnZfn24UB/o6/sSnUgM5fJ6ftdWOD0VuKVanH
 AOQ94TGBtNki1Cc3MKAmy6qw6fVvNz1i33dMv0jRDPpWJ+4aDx9wZWjX3w==
X-Google-Smtp-Source: AGHT+IH6oEQFK+/VEkk0e3IV2Zku+wPgKk5x0fI0osZiTViWRfvGjuTojMcLe+cV2dQsIL2UzCfXNg==
X-Received: by 2002:a05:6e02:20eb:b0:3a0:9ef6:31b6 with SMTP id
 e9e14a558f8ab-3a0c8d160dcmr60836645ab.16.1726963414006; 
 Sat, 21 Sep 2024 17:03:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a0cbe31c6csm13188185ab.2.2024.09.21.17.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 17:03:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 18:03:31 -0600
Message-Id: <20240922000331.711610-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726963414; x=1727568214; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D1mClmPAriGC1OrQ4nPTvksQRNzgfZxufLSf+IlhAfY=;
 b=dzkq+Eo8jot8EXZPaDLfWGOgd6eeIrIHi1BAuzwv75JSqE9nHon7rVXWZgx2qEt/Mj
 hkTyiMY9kuWOc+9ie4xfRQK1+JU279chrYYo7XL6nKqD4mBEcDVDeBYbEiLRFfqBFmzy
 kVx7ihvIfTidKPDY57ChAE3V1fnnvSGFoI91XFArzs2zwvyse50h8yd71tCnym9YJmzv
 9yX/Qqxe2qk12zoDdipH2hHRfgw+mwfr6F3q67quXyt07R//rChh/9FL5obu0lt3aDrT
 kiTJzKml5+xp88LQr5zxzHm7iv5oex2zvAbHHH6z7j0rlksY22sv5bhynD5XNGrj9IuX
 1Nxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dzkq+Eo8
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 2.14.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 2c1bb6c698..3aa25dee92 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  d56d6bf0acd0bd0663b420199c9afc29  sentry_sdk-2.13.0.tar.gz
-sha256  8d4a576f7a98eb2fdb40e13106e41f330e5c79d72a68be1316e7852cf4995260  sentry_sdk-2.13.0.tar.gz
+md5  bd02d1eaf38597296340ccffdf56428e  sentry_sdk-2.14.0.tar.gz
+sha256  1e0e2eaf6dad918c7d1e0edac868a7bf20017b177f242cefe2a6bcd47955961d  sentry_sdk-2.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6d7ec62dc20e8b92cb88b89fb3b55ee8576505f3e1afa57952548f6eea5d008e  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index dcf2b2c420..334ae961f5 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.13.0
+PYTHON_SENTRY_SDK_VERSION = 2.14.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/bb/41/97f673384dae5ed81cc2a568cc5c28e76deee85f8ba50def862e86150a5a
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/3c/23/6527e56fb17817153c37d702d6b9ed0a2f75ed213fd98a176c1b8894ad20
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
